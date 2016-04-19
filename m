From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 22:24:43 +0200
Subject: [Buildroot] [PATCHv2 2/4] Add package tegrarcm
In-Reply-To: <1458227038-16383-3-git-send-email-julian@jusst.de>
References: <1458227038-16383-1-git-send-email-julian@jusst.de>
 <1458227038-16383-3-git-send-email-julian@jusst.de>
Message-ID: <20160419222443.72658e5d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The commit title should have been:

	tegrarcm: new package

On Thu, 17 Mar 2016 16:03:56 +0100, Julian Scheel wrote:

> diff --git a/package/tegrarcm/0001-Make-cryptopp-include-crosscompile-compatible.patch b/package/tegrarcm/0001-Make-cryptopp-include-crosscompile-compatible.patch
> new file mode 100644
> index 0000000..ed0d1fc
> --- /dev/null
> +++ b/package/tegrarcm/0001-Make-cryptopp-include-crosscompile-compatible.patch
> @@ -0,0 +1,27 @@
> +From 0e60af53fa76aa2f274ade98da7ba543147e82c7 Mon Sep 17 00:00:00 2001
> +From: Julian Scheel <julian@jusst.de>
> +Date: Thu, 17 Mar 2016 12:37:04 +0100
> +Subject: [PATCH] Make cryptopp include crosscompile compatible
> +
> +Allows user to set a SYSROOT variable for building against a specific root
> +filesystem.
> +
> +Signed-off-by: Julian Scheel <julian@jusst.de>
> +---
> + src/Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 3dad0e6..7678dd4 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -1,5 +1,5 @@
> + AM_CFLAGS = -Wall -std=c99
> +-AM_CPPFLAGS = -isystem /usr/include/$(CRYPTOLIB) $(LIBUSB_CFLAGS)
> ++AM_CPPFLAGS = -isystem $(SYSROOT)/usr/include/$(CRYPTOLIB) $(LIBUSB_CFLAGS)

This is not really the recommended autoconf/automake solution. I've
done a larger patch, but that I believe is more correct, as it relies
on the normal compiler include path logic, and simply makes the source
code include <cryptopp/foobar.h>, where of course cryptopp can also be
crypto++ depending on the library being used.

I've also submitted my patch upstream:

  https://github.com/NVIDIA/tegrarcm/pull/2

> diff --git a/package/tegrarcm/tegrarcm.mk b/package/tegrarcm/tegrarcm.mk
> new file mode 100644
> index 0000000..5dbc483
> --- /dev/null
> +++ b/package/tegrarcm/tegrarcm.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# tegrarcm
> +#
> +################################################################################
> +
> +TEGRARCM_VERSION = v1.7
> +TEGRARCM_SITE = $(call github,NVIDIA,tegrarcm,$(TEGRARCM_VERSION))
> +TEGRARCM_LICENSE = BSD-3c / NVIDIA Software License (src/miniloader)
> +TEGRARCM_LICENSE_FILE = LICENSE
> +TEGRARCM_AUTORECONF = YES
> +HOST_TEGRARCM_DEPENDENCIES = host-libusb host-pkgconf host-cryptopp
> +HOST_TEGRARCM_MAKE_OPTS = SYSROOT=$(HOST_DIR)

Due to the patch being changed, I've removed this last line, and
applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
