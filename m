From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Feb 2014 01:33:27 +0100
Subject: [Buildroot] [RFC PATCH] toolchain-external: instrument wrapper
 to warn about unsafe paths
In-Reply-To: <1392074881-12508-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392074881-12508-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140211003326.GH5239@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-11 00:28 +0100, Thomas Petazzoni spake thusly:
> The CodeSourcery toolchains have a very interesting feature: they warn
> the user when an unsafe header or library path is used, i.e a path
> that will lead host headers or libraries to leak into the build.
> 
> This commit adds a similar functionality into our external toolchain
> wrapper, so that it can be used with all external toolchains, and can
> also be tuned as needed. By default, the external toolchain wrapper
> now gives warnings such as:
> 
>   WARNING: unsafe header/library path used in cross-compilation: '-I /usr/foo'
>   WARNING: unsafe header/library path used in cross-compilation: '-L /usr/bleh'
> 
> but the compilation continues successfully. One can then easily grep
> in his build log to search for occurences of this message.
> 
> Optionally, if BR_PARANOID_WRAPPER is defined in the environment, the
> external wrapper will instead error out and abort the compilation. We
> could then one day imagine setting this BR_PARANOID_WRAPPER in the
> autobuilders.

I think I'd prefer we do as for BR_DEBUG_WRAPPER:
    BR2_PARANOID_WRAPPER undefined or empty: nothing
    BR2_PARANOID_WRAPPER=WARNING           : warning
    BR2_PARANOID_WRAPPER=ERROR             : error out

(or use numbers if you prefer)

Side-note: BR_DEBUG_WRAPPER should probably be renamed to
BR2_DEBUG_WRAPPER, to follow the newly-stated naming scheme, no?

> A similar change could be made to the internal toolchain backend
> either by making it use a wrapper like the external toolchain one, or
> by adding some patches to gcc, by borrowing the changes made by the
> CodeSourcery people.

Maybe it would be best to not duplicate this, and always use the
wrapper, even for the internal backend?

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../toolchain-external/ext-toolchain-wrapper.c     | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> index 81c6ed1..c8dcad5 100644
> --- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
> +++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> @@ -77,6 +77,7 @@ int main(int argc, char **argv)
>  	char *progpath = argv[0];
>  	char *basename;
>  	char *env_debug;
> +	char *paranoid_wrapper;
>  	int ret, i, count = 0, debug;
>  
>  	/* Calculate the relative paths */
> @@ -178,6 +179,32 @@ int main(int argc, char **argv)
>  	}
>  #endif /* ARCH || TUNE || CPU */
>  
> +	paranoid_wrapper = getenv("BR_PARANOID_WRAPPER");
> +
> +	/* Check for unsafe library and header paths */
> +	for (i = 1; i < argc; i++) {
> +		if (!strncmp(argv[i], "-I/usr", strlen("-I/usr")) ||
> +		    !strncmp(argv[i], "-L/usr", strlen("-L/usr"))) {

No need for strncmp: you're comparing to a constant, so it will not
overflow.

Also, using strlen on an argument of strncmp is flawed to begin with.
For  strncmp(a, b, strlen(b)) :
  - if 'b' is a constant, there's no need for strncmp to begin with
  - if 'b' is a user-supplied value, strlen will happily go west, and
    will not protect strncmp anyway.

> +			fprintf(stderr, "%s: unsafe header/library path used in cross-compilation: '%s'\n",
> +				paranoid_wrapper ? "ERROR" : "WARNING", argv[i]);
> +			if (paranoid_wrapper)
> +				exit(1);
> +			continue;
> +		}
> +
> +		if (!strcmp(argv[i], "-L") || !strcmp(argv[i], "-I")) {

And here you're using strcmp.

> +			if (i == argc)
> +				continue;
> +			if (!strncmp(argv[i+1], "/usr", strlen("/usr"))) {

Ditto strncmp.

> +				fprintf(stderr, "%s: unsafe header/library path used in cross-compilation: '%s %s'\n",
> +					paranoid_wrapper ? "ERROR" : "WARNING", argv[i], argv[i + 1]);
> +				if (paranoid_wrapper)
> +					exit(1);
> +				continue;
> +			}
> +		}
> +	}
> +
>  	/* append forward args */
>  	memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
>  	cur += argc - 1;

Otherwise, I like the idea pretty much! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
