From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 09 Aug 2011 11:50:49 +0200
Subject: [Buildroot] util-linux compile problems
In-Reply-To: <87y5z3k92i.fsf@macbook.be.48ers.dk>
References: <1312804690-21977-1-git-send-email-s.neumann@raumfeld.com>
 <87fwlblqxr.fsf@macbook.be.48ers.dk> <87y5z3k92i.fsf@macbook.be.48ers.dk>
Message-ID: <1312883451.1593.3.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, 2011-08-08 at 21:16 +0200, Peter Korsgaard wrote:
> >>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:
> 
> Hi,
> 
>  Peter> We already pass --disable-nls unless you have locales enabled,
>  Peter> so perhaps it needs similar handling as libglib2 for uClibc
>  Peter> (select LIBINTIL if BR2_NEEDS_GETTEXT). Thomas also mentioned
>  Peter> something about that, but I haven't done a locale build lately
>  Peter> to test. Will do so now.
> 
> It seems to work fine here with:
> 
> BR2_arm=y
> BR2_arm926t=y
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> BR2_PACKAGE_UTIL_LINUX=y
> BR2_PACKAGE_UTIL_LINUX_MOUNT=y
> BR2_PACKAGE_UTIL_LINUX_FSCK=y
> BR2_PACKAGE_UTIL_LINUX_LIBMOUNT=y
> BR2_PACKAGE_UTIL_LINUX_UUIDD=y
> BR2_PACKAGE_UTIL_LINUX_AGETTY=y
> BR2_PACKAGE_UTIL_LINUX_CRAMFS=y
> BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT=y
> BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT=y
> BR2_PACKAGE_UTIL_LINUX_FALLOCATE=y
> BR2_PACKAGE_UTIL_LINUX_UNSHARE=y
> BR2_PACKAGE_UTIL_LINUX_RENAME=y
> BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS=y
> BR2_PACKAGE_UTIL_LINUX_WALL=y
> BR2_PACKAGE_UTIL_LINUX_ARCH=y
> BR2_PACKAGE_UTIL_LINUX_INIT=y
> BR2_PACKAGE_UTIL_LINUX_KILL=y
> BR2_PACKAGE_UTIL_LINUX_LAST=y
> BR2_PACKAGE_UTIL_LINUX_MESG=y
> BR2_PACKAGE_UTIL_LINUX_PARTX=y
> BR2_PACKAGE_UTIL_LINUX_RAW=y
> BR2_PACKAGE_UTIL_LINUX_RESET=y
> BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS=y
> BR2_PACKAGE_UTIL_LINUX_WRITE=y
> 
> E.G. locale support and all util-linux options enabled, but no
> gettext/libintl.

Well, it works for me in that configuration as well. But it doesn't work
for the configuration that has locale support enabled and
gettext/libintl:


BR2_ENABLE_LOCALE=y
BR2_NEEDS_GETTEXT=y
BR2_NEEDS_GETTEXT_IF_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_LIBINTL=y


I've tried the following patch, but it doesn't seem to help:


diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 816130d..ed0ba8b 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_UTIL_LINUX
        bool "util-linux"
+       select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+       select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
        depends on BR2_LARGEFILE
        depends on BR2_USE_WCHAR
        help
diff --git a/package/util-linux/util-linux.mk
b/package/util-linux/util-linux.mk
index d34759b..c124256 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -9,7 +9,7 @@ UTIL_LINUX_SOURCE =
util-linux-$(UTIL_LINUX_VERSION).tar.bz2
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v
$(UTIL_LINUX_VER
 UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_INSTALL_STAGING = YES
-UTIL_LINUX_DEPENDENCIES = host-pkg-config
+UTIL_LINUX_DEPENDENCIES = host-pkg-config $(if
$(BR2_NEEDS_GETTEXT_IF_LOCALE),g
 
 UTIL_LINUX_CONF_OPT += --disable-rpath --disable-makeinstall-chown
 
