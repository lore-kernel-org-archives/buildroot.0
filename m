From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Sep 2014 21:42:39 +0200
Subject: [Buildroot] [PATCH 01/12] toolchain-external: instrument
 wrapper to warn about unsafe paths
In-Reply-To: <1408540005-26934-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408540005-26934-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140910194239.GB4155@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

At long last, here is a preliminary review of this series...

On 2014-08-20 15:06 +0200, Thomas Petazzoni spake thusly:
[--SNIP--]
> diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> index 8db4ac4..16faa5c 100644
> --- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
> +++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> @@ -70,6 +70,24 @@ static char *predef_args[] = {
>  #endif
>  };
>  
> +static void check_unsafe_path(const char *path, int paranoid)
> +{
> +	char **c;
> +	char *unsafe_paths[] = {
> +		"/usr/include", "/usr/lib", "/usr/local/include", "/usr/local/lib", NULL,

Make it a global variable, or at least a static one.

> +	};
> +
> +	for (c = unsafe_paths; *c != NULL; c++) {
> +		if (!strncmp(path, *c, strlen(*c))) {
> +			fprintf(stderr, "%s: unsafe header/library path used in cross-compilation: '%s'\n",
> +				paranoid ? "ERROR" : "WARNING", path);

It could be nice to also print the name of the executable that is
running, something like:

    fprintf(stderr,"%s: %s: unsafe....'%s'\n",
            program_invocation_short_name,
            paranoid ? "ERROR" : "WARNING", path);

program_invocation_short_name is a glibcism, so it would only work on
glibc, or Clibc with the option enabled. Also requires:
    #define _GNU_SOURCE
    #include <errno.h>

> @@ -178,6 +198,35 @@ int main(int argc, char **argv)
>  	}
>  #endif /* ARCH || TUNE || CPU */
>  
> +	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
> +	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
> +		paranoid = 1;
> +	else
> +		paranoid = 0;
> +
> +
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
> +		if (strlen(argv[i]) == 2) {

argv[*] are passed by the user, so better not trust them. What about:

    if (argv[i][2]!='\0') {
        ...;
    }

Regards,
Yann E. MORIN.

> +			if (i == argc)
> +				continue;

'i' can not be == argc, because 'i' is an array index, and argc is the
number of entries in the array. If you want to test whether that's the
last argument, you should do:

    if (i+1 == argc) { ...; }

or:
    i++;
    if (i == argc) { ...; }

I think the second option is better, since that way you also skip
re-testign that argv in the next loop.

Also, I'd use break instead of continue, since the loop is finished
anyway.

Regards,
Yann E. MORIN.

> +			check_unsafe_path(argv[i+1], paranoid);
> +		} else {
> +			check_unsafe_path(argv[i] + 2, paranoid);
> +		}
> +	}
> +
>  	/* append forward args */
>  	memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
>  	cur += argc - 1;
> -- 
> 2.0.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
