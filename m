From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Jun 2012 22:32:19 +0200
Subject: [Buildroot] [PATCH v3 1/1] libnfc: make example build optional
In-Reply-To: <1339357423-30891-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 10 Jun 2012 21:43:43 +0200")
References: <1339357423-30891-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87pq96hprg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed with minor changes, see below.


 Samuel>  create mode 100644 package/libnfc/libnfc-build-systems-make-example-build-optional.patch

You somehow are missing the --- delimiter, so this line becomes part of
the commit message.

 Samuel> +++ b/package/libnfc/libnfc-build-systems-make-example-build-optional.patch
 Samuel> @@ -0,0 +1,121 @@
 Samuel> +From 40a4871b171293d98acb40cf54be9ee9b78a3244 Mon Sep 17 00:00:00 2001
 Samuel> +From: Samuel Martin <s.martin49@gmail.com>
 Samuel> +Date: Wed, 6 Jun 2012 00:49:25 +0200
 Samuel> +Subject: [PATCH 1/1] build systems: make example build optional
 Samuel> +
 Samuel> +This patch makes example build optional for both cmake and autotools build
 Samuel> +systems.
 Samuel> +
 Samuel> +In order to keep the former behavior, example build is enabled by default.
 Samuel> +
 Samuel> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Samuel> +
 Samuel> +diff --git a/configure.ac b/configure.ac
 Samuel> +index 0a222a8..6988164 100644
 Samuel> +--- a/configure.ac
 Samuel> ++++ b/configure.ac
 Samuel> +@@ -71,11 +71,11 @@ AC_SUBST(LIBNFC_CFLAGS)
 Samuel> + 
 Samuel> + # Debug support (default:no)
 Samuel> + AC_ARG_ENABLE([debug],AS_HELP_STRING([--enable-debug],[Enable debug output]),[enable_debug=$enableval],[enable_debug="no"])
 Samuel> +- 
 Samuel> ++


Unneeded whitespace changes.


 Samuel> + AC_MSG_CHECKING(for debug flag)
 Samuel> + AC_MSG_RESULT($enable_debug)
 Samuel> + AM_CONDITIONAL([WITH_DEBUG], [test "$enable_debug" != "no"])
 Samuel> +- 
 Samuel> ++

Here as well.


 Samuel> + if test x"$enable_debug" = "xyes"
 Samuel> + then
 Samuel> +   CFLAGS="$CFLAGS -g -DDEBUG -O0 -ggdb"
 Samuel> +@@ -86,7 +86,7 @@ LIBNFC_ARG_WITH_DRIVERS
 Samuel> + 
 Samuel> + # Serial autoprobing support (default:no)
 Samuel> + AC_ARG_ENABLE([serial-autoprobe],AS_HELP_STRING([--enable-serial-autoprobe],[Allow serial ports to be probed (can seriously disturb connected serial devices)]),[enable_serial_autoprobe=$enableval],[enable_serial_autoprobe="no"])
 Samuel> +- 
 Samuel> ++


And here.

 Samuel> diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
 Samuel> index f1028b1..687aee8 100644
 Samuel> --- a/package/libnfc/libnfc.mk
 Samuel> +++ b/package/libnfc/libnfc.mk
 Samuel> @@ -13,4 +13,11 @@ LIBNFC_DEPENDENCIES = host-pkg-config libusb libusb-compat
 Samuel>  # N.B. The acr122 driver requires pcsc-lite.
 Samuel>  LIBNFC_CONF_OPT = --with-drivers=arygon,pn53x_usb
 
 Samuel> +ifeq ($(BR2_PACKAGE_LIBNFC_EXAMPLES),y)
 Samuel> +LIBNFC_CONF_OPT += --enable-example
 Samuel> +LIBNFC_DEPENDENCIES += readline
 Samuel> +else
 Samuel> +LIBNFC_CONF_OPT += --disable-example
 Samuel> +endif
 Samuel> +

You're modifying configure.ac / Makefile.am so we need LIBNFC_AUTORECONF
= YES

-- 
Bye, Peter Korsgaard
