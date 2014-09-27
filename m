From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Sep 2014 19:09:30 +0200
Subject: [Buildroot] [PATCH] openssl: Add patch to fix compilation with
	musl libc
References: <1410399603-548-1-git-send-email-maarten@treewalker.org>
Message-ID: <XnsA3B5C2E3195D5berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maarten ter Huurne <maarten@treewalker.org> wrote 
in news:1410399603-548-1-git-send-email-maarten at treewalker.org:

> Signed-off-by: Maarten ter Huurne <maarten-
Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>
> ---
>  package/openssl/openssl-004-musl-termios.patch | 46 
++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/openssl/openssl-004-musl-termios.patch
> 
> diff --git a/package/openssl/openssl-004-musl-termios.patch 
b/package/openssl/openssl-004-musl-termios.patch
> new file mode 100644
> index 0000000..66631d1
> --- /dev/null
> +++ b/package/openssl/openssl-004-musl-termios.patch
> @@ -0,0 +1,46 @@
> +http://rt.openssl.org/Ticket/Display.html?id=3123
> +
> +From:      Kevin Bortis <pkgs@bortis.ch>
> +
> +The attached patch fixes issues with musl libc on linux. musl does
> +implement the POSIX 2008 standard termios.h on linux and does not
> +include the non standard interface termio.h.
> +
> +The problem with dlinfo does no longer exists, since musl has
> +implemented the required interface.
> +
> +This closes #2823 for me.
> +
> +Tested version:
> +musl libc: 0.9.13
> +openssl git: 1769dfab06dcf93a1c310ca7ea9531afcc448d0a
> +
> +Comparison of termios.h implementation on linux:
> +
> +glibc 2.17: does implement termios.h, passes make test
> +musl 0.9.13: does implement termios.h, passes make test
> +uClibc 0.9.33.2: does implement termios.h, not tested
> +dietlibc 0.33: does implement termios.h, not tested
> +
> +I don't know the reason why termio.h is prefered on linux, since
> +termios.h is generally prefered and implemented by all major libc
> +implementations.
> +
> +Regards
> +Kevin
> +
> +--- a/crypto/ui/ui_openssl.c     2013-09-08 11:00:10.130572803 +0200
> ++++ b/crypto/ui/ui_openssl.c     2013-09-08 11:29:35.806580447 +0200
> +@@ -190,9 +190,9 @@
> + # undef  SGTTY
> + #endif
> + 
> +-#if defined(linux) && !defined(TERMIO)
> +-# undef  TERMIOS
> +-# define TERMIO
> ++#if defined(linux)
> ++# define TERMIOS
> ++# undef  TERMIO
> + # undef  SGTTY
> + #endif
> + 

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
