From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 17:14:33 +0100
Subject: [Buildroot] How to include lsblk from linux-utils?
In-Reply-To: <05f401d16fdf$4ddcc840$e99658c0$@chordia.co.uk>
References: <05f401d16fdf$4ddcc840$e99658c0$@chordia.co.uk>
Message-ID: <20160225171433.7e200dfc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jerry,

On Thu, 25 Feb 2016 15:15:04 -0000, jerry at chordia.co.uk wrote:
> Using BR 2016-02 how do I get lsblk installed? 
> 
> The source package is present but the utilities are not being built. I've
> got System Tools >> install utilities selected but no lsblk is visible.

You need to add a patch like the below to be able to select lsblk in
your build:

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 3f9a7db..d4f9a3d 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -139,6 +139,11 @@ config BR2_PACKAGE_UTIL_LINUX_LOSETUP
        help
          Set up and control loop devices
 
+config BR2_PACKAGE_UTIL_LINUX_LSBLK
+       bool "lsblk"
+       help
+         List block devices.
+
 config BR2_PACKAGE_UTIL_LINUX_MESG
        bool "mesg"
        help
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 7342174..141dffd 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -85,6 +85,7 @@ UTIL_LINUX_CONF_OPTS += \
        $(if $(BR2_PACKAGE_UTIL_LINUX_LINE),--enable-line,--disable-line) \
        $(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-runuser --enable-su --enable-sulogin,--disable-last --disable-login --disable-runuser --disable-su --disable-sulogin) \
        $(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
+       $(if $(BR2_PACKAGE_UTIL_LINUX_LSBLK),--enable-lsblk,--disable-lsblk) \
        $(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
        $(if $(BR2_PACKAGE_UTIL_LINUX_MINIX),--enable-minix,--disable-minix) \
        $(if $(BR2_PACKAGE_UTIL_LINUX_MORE),--enable-more,--disable-more) \

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
