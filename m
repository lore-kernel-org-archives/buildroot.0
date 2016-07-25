From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 22:45:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server: add
 libdrm-specific cflags
In-Reply-To: <1469426956-23383-1-git-send-email-bernd.kuhls@t-online.de>
References: <1469426956-23383-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160725224512.09e8147d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jul 2016 08:09:15 +0200, Bernd Kuhls wrote:
> As described in
> http://lists.busybox.net/pipermail/buildroot/2015-February/119410.html
> xserver_xorg-server still uses PKG_CHECK_EXISTS to find libdrm but does
> not add libdrm-specific CFLAGS to Makefile causing the build to fail.

I am not convinced because the xserver is using PKG_CHECK_MODULES() to
check for libdrm:

if test "x$DRI" = xyes || test "x$DRI2" = xyes || test "x$DRI3" = xyes || test "x$CONFIG_UDEV_KMS" = xyes; then
        if test "x$DRM" = xyes; then
                AC_DEFINE(WITH_LIBDRM, 1, [Building with libdrm support])
                PKG_CHECK_MODULES([LIBDRM], $LIBDRM)
        fi
fi

and PKG_CHECK_MODULES() does fill in LIBDRM_CFLAGS.

PKG_CHECK_EXISTS() is only used for libdrm:

 * In a Solaris specific case, irrelevant;

 * To define XORG_DRIVER_MODESETTING to yes or no

So I'm not convinced by your explanation for this change.

Essentially, what I believe happens is that PKG_CHECK_MODULES() is only
called when DRI is enabled *or* DRI2 is enabled *or* DRI3 is enabled
*or* UDEV_KMS is enabled. Since none of these conditions are meant in
the configuration of
http://autobuild.buildroot.net/results/3b2/3b2b10314cde2ecacb7fd3949990a4cac2117f4c/,
the build fails.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
