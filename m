From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Sep 2020 14:03:47 +0200
Subject: [Buildroot] [PATCH 1/1] support/gnuconfig: bump version
In-Reply-To: <20200927084612.1488420-1-fontaine.fabrice@gmail.com>
References: <20200927084612.1488420-1-fontaine.fabrice@gmail.com>
Message-ID: <20200927120347.GJ11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-09-27 10:46 +0200, Fabrice Fontaine spake thusly:
> Build with uclinux-uclibc toolchains are broken since commit
> cf8162ce518449be6a311dd21167aeee83a1ed82 so bump version to get
> https://git.savannah.gnu.org/cgit/config.git/commit/?id=d7a4dee7cc25e332b990d0a6d9f0ddd42cb33cf5

Actually, this is not what this patch does.

Running ./support/gnuconfig/update will give a different content for
config.sub. So it looks like you had local modifications that you
comitted to Buildroot, or that upstream did not apply exactly the patch
you submitted them...

Could you please check whether d7a4dee7cc25e3 is correct or not?

Regards,
Yann E. MORIN.

> Fixes:
>  - http://autobuild.buildroot.org/results/f8528d568de0dad751129900ae38ae292d7567b9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  support/gnuconfig/README.buildroot |  2 +-
>  support/gnuconfig/config.guess     | 14 ++++++--------
>  support/gnuconfig/config.sub       |  4 +++-
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/support/gnuconfig/README.buildroot b/support/gnuconfig/README.buildroot
> index 979edf32d9..952eea8b10 100644
> --- a/support/gnuconfig/README.buildroot
> +++ b/support/gnuconfig/README.buildroot
> @@ -18,4 +18,4 @@ Run the script 'update' in this directory, and commit the result.
>  The current Buildroot version is based on this commit of the config.git
>  repository (leave alone on its own line, the script updates it):
>  
> -e072cc210e5d0584396f6c13ba34cb9c7bd8538d
> +d7a4dee7cc25e332b990d0a6d9f0ddd42cb33cf5
> diff --git a/support/gnuconfig/config.guess b/support/gnuconfig/config.guess
> index 9aff91cfd0..8d70ec2b26 100755
> --- a/support/gnuconfig/config.guess
> +++ b/support/gnuconfig/config.guess
> @@ -2,7 +2,7 @@
>  # Attempt to guess a canonical system name.
>  #   Copyright 1992-2020 Free Software Foundation, Inc.
>  
> -timestamp='2020-08-17'
> +timestamp='2020-09-19'
>  
>  # This file is free software; you can redistribute it and/or modify it
>  # under the terms of the GNU General Public License as published by
> @@ -150,17 +150,15 @@ Linux|GNU|GNU/*)
>  	#elif defined(__dietlibc__)
>  	LIBC=dietlibc
>  	#else
> +	#include <stdarg.h>
> +	#ifdef __DEFINED_va_list
> +	LIBC=musl
> +	#else
>  	LIBC=gnu
>  	#endif
> +	#endif
>  	EOF
>  	eval "`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/null | grep '^LIBC' | sed 's, ,,g'`"
> -
> -	# If ldd exists, use it to detect musl libc.
> -	if command -v ldd >/dev/null && \
> -		ldd --version 2>&1 | grep -q ^musl
> -	then
> -	    LIBC=musl
> -	fi
>  	;;
>  esac
>  
> diff --git a/support/gnuconfig/config.sub b/support/gnuconfig/config.sub
> index 780c2bbaa0..2df66beeb0 100755
> --- a/support/gnuconfig/config.sub
> +++ b/support/gnuconfig/config.sub
> @@ -1733,7 +1733,9 @@ esac
>  # As a final step for OS-related things, validate the OS-kernel combination
>  # (given a valid OS), if there is a kernel.
>  case $kernel-$os in
> -	linux-gnu* | linux-dietlibc* | linux-android* | linux-newlib* | linux-musl* | linux-uclibc* )
> +	linux-gnu* | linux-dietlibc* | linux-android* | linux-newlib* | linux-musl* | linux-uclibc* | uclinux-gnu* |?uclinux-uclibc* )
> +		;;
> +	uclinux-uclibc* )
>  		;;
>  	-dietlibc* | -newlib* | -musl* | -uclibc* )
>  		# These are just libc implementations, not actual OSes, and thus
> -- 
> 2.28.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
