From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 06 Dec 2014 17:57:39 +0100
Subject: [Buildroot] [PATCHv2 01/12] toolchain-external: instrument
 wrapper to warn about unsafe paths
In-Reply-To: <1417470913-1280-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417470913-1280-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417470913-1280-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <54833583.4030700@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 01/12/2014 22:55, Thomas Petazzoni a ?crit :
> The CodeSourcery toolchains have a very interesting feature: they warn
> the user when an unsafe header or library path is used, i.e a path
> that will lead host headers or libraries to leak into the build.
> 
> This commit adds a similar functionality into our external toolchain
> wrapper, so that it can be used with all external toolchains, and can
> also be tuned as needed. By default, the external toolchain wrapper
> now gives warnings such as:
> 
>   arm-linux-gcc: WARNING: unsafe header/library path used in cross-compilation: '-I /usr/foo'
>   arm-linux-gcc: WARNING: unsafe header/library path used in cross-compilation: '-L /usr/bleh'
> 
> but the compilation continues successfully. One can then easily grep
> in his build log to search for occurences of this message.
> 
> Optionally, if BR_COMPILER_PARANOID_UNSAFE_PATH is defined in the
> environment to a non empty value, the external wrapper will instead
> error out and abort the compilation.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../toolchain-external/ext-toolchain-wrapper.c     | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> index f459a7e..846cb5b 100644
> --- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
> +++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> @@ -15,11 +15,13 @@
>   * kind, whether express or implied.
>   */
>  
> +#define _GNU_SOURCE
>  #include <stdio.h>
>  #include <string.h>
>  #include <limits.h>
>  #include <unistd.h>
>  #include <stdlib.h>
> +#include <errno.h>
>  
>  static char path[PATH_MAX];
>  static char sysroot[PATH_MAX];
> @@ -69,6 +71,25 @@ static char *predef_args[] = {
>  #endif
>  };
>  
> +static void check_unsafe_path(const char *path, int paranoid)
> +{
> +	char **c;
> +	static char *unsafe_paths[] = {
> +		"/lib", "/usr/include", "/usr/lib", "/usr/local/include", "/usr/local/lib", NULL,

We may add "/lib64", "/usr/lib64" and "/usr/local/lib64" too ?

> +	};
> +
> +	for (c = unsafe_paths; *c != NULL; c++) {
> +		if (!strncmp(path, *c, strlen(*c))) {
> +			fprintf(stderr, "%s: %s: unsafe header/library path used in cross-compilation: '%s'\n",
> +				program_invocation_short_name,
> +				paranoid ? "ERROR" : "WARNING", path);
> +			if (paranoid)
> +				exit(1);
> +			continue;
> +		}
> +	}
> +}
> +
>  int main(int argc, char **argv)
>  {
>  	char **args, **cur;
> @@ -76,6 +97,8 @@ int main(int argc, char **argv)
>  	char *progpath = argv[0];
>  	char *basename;
>  	char *env_debug;
> +	char *paranoid_wrapper;
> +	int paranoid;
>  	int ret, i, count = 0, debug;
>  
>  	/* Calculate the relative paths */
> @@ -172,6 +195,36 @@ int main(int argc, char **argv)
>  	}
>  #endif /* ARCH || CPU */
>  
> +	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
> +	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
> +		paranoid = 1;
> +	else
> +		paranoid = 0;
> +
> +

extra new line

> +	/* Check for unsafe library and header paths */
> +	for (i = 1; i < argc; i++) {
> +
> +		/* Skip options that do not start with -I and -L */
> +		if (strncmp(argv[i], "-I", 2) && strncmp(argv[i], "-L", 2))
> +			continue;
> +
> +		/* We handle two cases: first the case where -I/-L and
> +		 * the path are separated by one space and therefore
> +		 * visible as two separate options, and then the case
> +		 * where they are stuck together forming one single
> +		 * option.
> +		 */
> +		if (argv[i][2] == '\0') {
> +			i++;
> +			if (i == argc)
> +				continue;
> +			check_unsafe_path(argv[i], paranoid);
> +		} else {
> +			check_unsafe_path(argv[i] + 2, paranoid);
> +		}
> +	}
> +
>  	/* append forward args */
>  	memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
>  	cur += argc - 1;
> 

Otherwise:

Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>

Tested with an external x86 toolchain with iprutils package selected.

$ make O=test/paranoid  iprutils BR_COMPILER_PARANOID_UNSAFE_PATH=1

/home/naourr/git/buildroot/test/paranoid/host/usr/bin/i686-pc-linux-gnu-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -Wall -DIPR_MAJOR_RELEASE=2 -DIPR_MINOR_RELEASE=4 -DIPR_FIX_LEVEL=2 -DIPR_FIX_DATE='"(June 10, 2014)"' -DIPR_VERSION_STR='"2.4.2 (June 10, 2014)"' -DIPR_RELEASE=1 -I. -I/usr/include/ncurses -o iprlib.o -c iprlib.c
gzip -f -c iprinit.8 > iprinit.8.gz
i686-pc-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '/usr/include/ncurses'
make[1]: *** [iprlib.o] Erreur 1

Thanks,
-- 
Romain Naour

OPEN WIDE Ing?nierie - Paris
23/25, rue Daviel| 75013 PARIS
http://ingenierie.openwide.fr

Le blog des technologies libres et embarqu?es :
http://www.linuxembedded.fr
