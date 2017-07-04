From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:59 +0200
Subject: [Buildroot] [PATCH 079/100] util-linux: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-80-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in     | 1 -
 package/util-linux/util-linux.mk | 8 ++------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 6ba239e..cba590c 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_PACKAGE_UTIL_LINUX
 	bool "util-linux"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Various useful/essential linux libraries and utilities.
 
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d55ee7c..61e3e63 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -17,7 +17,7 @@ UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid)
 UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3
 UTIL_LINUX_INSTALL_STAGING = YES
-UTIL_LINUX_DEPENDENCIES = host-pkgconf
+UTIL_LINUX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 # uClibc needs NTP_LEGACY for sys/timex.h -> ntp_gettime() support
 # (used in logger.c), and the common default is N.
 UTIL_LINUX_CONF_ENV = scanf_cv_type_modifier=no \
@@ -25,6 +25,7 @@ UTIL_LINUX_CONF_ENV = scanf_cv_type_modifier=no \
 UTIL_LINUX_CONF_OPTS += \
 	--disable-rpath \
 	--disable-makeinstall-chown
+UTIL_LINUX_LIBS = $(TARGET_NLS_LIBS)
 
 # system depends on util-linux so we enable systemd support
 # (which needs systemd to be installed)
@@ -62,11 +63,6 @@ endif
 UTIL_LINUX_CONF_OPTS += --without-ncursesw --without-ncurses
 endif
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-UTIL_LINUX_DEPENDENCIES += gettext
-UTIL_LINUX_LIBS += -lintl
-endif
-
 ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
 UTIL_LINUX_DEPENDENCIES += libcap-ng
 endif
-- 
2.9.4
