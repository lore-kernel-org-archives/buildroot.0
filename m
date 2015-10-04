From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 4 Oct 2015 16:24:56 +0200
Subject: [Buildroot] [PATCH v2 16/18] toolchain-wrapper: support change
 of BR2_CCACHE
In-Reply-To: <1443961738-12149-17-git-send-email-arnout@mind.be>
References: <1443961738-12149-1-git-send-email-arnout@mind.be>
 <1443961738-12149-17-git-send-email-arnout@mind.be>
Message-ID: <561136B8.8010200@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Le 04/10/2015 14:28, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> By moving the ccache call to the toolchain wrapper, the following
> scenario no longer works:
> 
> make foo-dirclean all BR2_CCACHE=
> 
> That's a sometimes useful call to check if some failure is perhaps
> caused by ccache.
> 
> We can enable this scenario again by exporting BR_NO_CCACHE when
> BR2_CCACHE is not set, and by handling this in the toolchain wrapper.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I tried this patch with the whole series applied (I removed the hash to ease the
reading)

$ make O=test/ccache/ busybox BR2_DEBUG_WRAPPER=2

Toolchain wrapper executing:CCACHE_COMPILERCHECK=string:[hash]
    CCACHE_BASEDIR=/home/naourr/git/buildroot/test/ccache

    '/home/naourr/git/buildroot/test/ccache/host/usr/bin/ccache'

'/home/naourr/git/buildroot/test/ccache/host/usr/bin/i686-buildroot-linux-uclibc-gcc.real'
    '--sysroot'

'/home/naourr/git/buildroot/test/ccache/host/usr/i686-buildroot-linux-uclibc/sysroot'
    '-E'
    '-xc'
    '-'

$ make O=test/ccache/ busybox BR2_DEBUG_WRAPPER=2 BR2_CCACHE=

Toolchain wrapper executing:CCACHE_COMPILERCHECK=string:[hash]
    CCACHE_BASEDIR=/home/naourr/git/buildroot/test/ccache


'/home/naourr/git/buildroot/test/ccache/host/usr/bin/i686-buildroot-linux-uclibc-gcc.real'
    '--sysroot'

'/home/naourr/git/buildroot/test/ccache/host/usr/i686-buildroot-linux-uclibc/sysroot'
    '-E'
    '-xc'
    '-'

Tested-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain

> ---
> v2: No change, but no longer RFC.
> ---
>  Makefile                      |  2 ++
>  toolchain/toolchain-wrapper.c | 15 +++++++++++----
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index fdbca02..e8e2f02 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -375,6 +375,8 @@ BR_CACHE_DIR = $(call qstrip,$(BR2_CCACHE_DIR))
>  export BR_CACHE_DIR
>  HOSTCC := $(CCACHE) $(HOSTCC)
>  HOSTCXX := $(CCACHE) $(HOSTCXX)
> +else
> +export BR_NO_CCACHE
>  endif
>  
>  # Scripts in support/ or post-build scripts may need to reference
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index b5fe1d3..cf66fac 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -95,7 +95,7 @@ static void check_unsafe_path(const char *path, int paranoid)
>  
>  int main(int argc, char **argv)
>  {
> -	char **args, **cur;
> +	char **args, **cur, **exec_args;
>  	char *relbasedir, *absbasedir;
>  	char *progpath = argv[0];
>  	char *basename;
> @@ -237,6 +237,13 @@ int main(int argc, char **argv)
>  	/* finish with NULL termination */
>  	*cur = NULL;
>  
> +	exec_args = args;
> +#ifdef BR_CCACHE
> +	if (getenv("BR_NO_CCACHE"))
> +		/* Skip the ccache call */
> +		exec_args++;
> +#endif
> +
>  	/* Debug the wrapper to see actual arguments passed to
>  	 * the compiler:
>  	 * unset, empty, or 0: do not trace
> @@ -247,14 +254,14 @@ int main(int argc, char **argv)
>  		debug = atoi(env_debug);
>  		if (debug > 0) {
>  			fprintf(stderr, "Toolchain wrapper executing:");
> -			for (i = 0; args[i]; i++)
> +			for (i = 0; exec_args[i]; i++)
>  				fprintf(stderr, "%s'%s'",
> -					(debug == 2) ? "\n    " : " ", args[i]);
> +					(debug == 2) ? "\n    " : " ", exec_args[i]);
>  			fprintf(stderr, "\n");
>  		}
>  	}
>  
> -	if (execv(args[0], args))
> +	if (execv(exec_args[0], exec_args))
>  		perror(path);
>  
>  	free(args);
> 
