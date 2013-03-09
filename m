From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Mar 2013 19:30:47 +0100
Subject: [Buildroot] [PATCH] openobex: new package
In-Reply-To: <1355094387-22886-2-git-send-email-s.martin49@gmail.com>
References: <1355094387-22886-1-git-send-email-s.martin49@gmail.com>
 <1355094387-22886-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20130309193047.09e1730f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon, 10 Dec 2012 00:06:22 +0100, Samuel Martin wrote:


> diff --git a/package/openobex/Config.in b/package/openobex/Config.in
> new file mode 100644
> index 0000000..06f4c7d
> --- /dev/null
> +++ b/package/openobex/Config.in
> @@ -0,0 +1,28 @@
> +config BR2_PACKAGE_OPENOBEX
> +	bool "openobex"

Did you test if OpenOBEX really builds with a minimal uClibc toolchain?
If you want to save the build time, you can find a pre-compiled minimal
uClibc toolchain at
http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2012.11.1-1.tar.bz2.

> +if BR2_PACKAGE_OPENOBEX
> +config BR2_PACKAGE_OPENOBEX_BLUEZ
> +	bool "enable bluez support"
> +	select BR2_PACKAGE_BLUEZ_UTILS

Missing dependencies from bluez_utils.

Also ussp-push depends on OpenOBEX and bluez_utils. Maybe it depends on
bluez support to be enabled in OpenOBEX as well?

> +config BR2_PACKAGE_OPENOBEX_LIBUSB
> +	bool "enable libusb support"
> +	select BR2_PACKAGE_LIBUSB

Missing dependency from libusb (threads).

> +config BR2_PACKAGE_OPENOBEX_APPS
> +	bool "install test applications"
> +	help
> +	  Also install the openobex test applications on target.
> +
> +config BR2_PACKAGE_OPENOBEX_SYSLOG
> +	bool "enable debugging to the system logger"
> +
> +config BR2_PACKAGE_OPENOBEX_DUMP
> +	bool "enable protocol dumping for debugging"
> +endif

One empty line before endif (nitpicking).

> diff --git a/package/openobex/openobex-libusb_check_when_cross-compiling.patch b/package/openobex/openobex-libusb_check_when_cross-compiling.patch
> new file mode 100644
> index 0000000..7b8056a
> --- /dev/null
> +++ b/package/openobex/openobex-libusb_check_when_cross-compiling.patch
> @@ -0,0 +1,18 @@
> +Fix libusb check when cross-compiling.
> +
> +Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +
> +Index: openobex-1.5/acinclude.m4
> +===================================================================
> +--- openobex-1.5.orig/acinclude.m4	2010-06-16 10:32:47.000000000 +0200
> ++++ openobex-1.5/acinclude.m4	2010-06-16 10:35:33.000000000 +0200
> +@@ -158,7 +158,7 @@
> + 		;;
> + 	*)
> + 		PKG_CHECK_MODULES(USB, libusb, usb_lib_found=yes, AC_MSG_RESULT(no))
> +-		AC_CHECK_FILE(${prefix}/lib/pkgconfig/libusb.pc, REQUIRES="libusb")
> ++		REQUIRES="libusb"
> + 		;;
> + 	esac
> + 	AC_SUBST(USB_CFLAGS)
> diff --git a/package/openobex/openobex-replace_deprecated_functions.patch b/package/openobex/openobex-replace_deprecated_functions.patch
> new file mode 100644
> index 0000000..17274d3
> --- /dev/null
> +++ b/package/openobex/openobex-replace_deprecated_functions.patch
> @@ -0,0 +1,30 @@
> +obex_test_cable.c: avoid to use SuSv3 LEGACY APIs
> +
> +Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +
> +Index: openobex-1.5/apps/obex_test_cable.c
> +===================================================================
> +--- openobex-1.5.orig/apps/obex_test_cable.c	2009-02-08 19:30:22.000000000 +0100
> ++++ openobex-1.5/apps/obex_test_cable.c	2010-06-16 11:11:05.000000000 +0200
> +@@ -113,9 +113,9 @@
> + 			if(total == sizeof(tmpbuf))
> + 				return -1;
> + 
> +-			if( (answer = index(tmpbuf, '\n')) )	{
> ++			if( (answer = strchr(tmpbuf, '\n')) )	{
> + 				// Remove first line (echo)
> +-				if( (answer_end = index(answer+1, '\n')) )	{
> ++				if( (answer_end = strchr(answer+1, '\n')) )	{
> + 					// Found end of answer
> + 					done = 1;
> + 				}
> +@@ -178,7 +178,7 @@
> + 	}
> + 
> + 	tcgetattr(gt->ttyfd, &gt->oldtio);
> +-	bzero(&gt->newtio, sizeof(struct termios));
> ++	memset(&gt->newtio, 0, sizeof(struct termios));
> + 	gt->newtio.c_cflag = B115200 | CS8 | CREAD | CRTSCTS;
> + 	gt->newtio.c_iflag = IGNPAR;
> + 	gt->newtio.c_oflag = 0;

As usual, sending patches upstream would be good.

> diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
> new file mode 100644
> index 0000000..beac5ff
> --- /dev/null
> +++ b/package/openobex/openobex.mk
> @@ -0,0 +1,35 @@
> +#############################################################
> +#
> +# openobex
> +#
> +#############################################################
> +OPENOBEX_VERSION = 1.5

One empty line between header and first variable.

> +OPENOBEX_SITE = http://ftp.osuosl.org/pub/linux/bluetooth
> +# Libraries seems release under LGPLv2.1, while other material are undrer GPLv2

English fixes:

# Libraries seem to be released under LGPLv2.1, while other material is
# under GPLv2

> +OPENOBEX_LICENSE = GPLv2/LGPLv2.1

License is apparently GPLv2+ and LGPLv2.1+.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
