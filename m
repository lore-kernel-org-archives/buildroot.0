From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:46 +0200
Subject: [Buildroot] [PATCH 066/100] procps-ng: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-67-thomas.petazzoni@free-electrons.com>
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
 package/procps-ng/Config.in    | 1 -
 package/procps-ng/procps-ng.mk | 8 ++------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/procps-ng/Config.in b/package/procps-ng/Config.in
index 553bea1..6ff8983 100644
--- a/package/procps-ng/Config.in
+++ b/package/procps-ng/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_PROCPS_NG
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Standard informational utilities and process-handling tools.
 	  Provides things like kill, ps, uptime, free, top, etc...
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 0ab3139..22ebc1a 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -10,7 +10,8 @@ PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPL-2.0+, LGPL-2.0+ (libproc and libps)
 PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
 PROCPS_NG_INSTALL_STAGING = YES
-PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf
+PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf $(TARGET_NLS_DEPENDENCIES)
+PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
 # For 0002-use-pkgconfig-for-ncursesw-cflags.patch
 PROCPS_NG_AUTORECONF = YES
 PROCPS_NG_GETTEXTIZE = YES
@@ -21,11 +22,6 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 PROCPS_NG_DEPENDENCIES += busybox
 endif
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-PROCPS_NG_DEPENDENCIES += gettext
-PROCPS_NG_CONF_OPTS += LIBS=-lintl
-endif
-
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 PROCPS_NG_DEPENDENCIES += systemd
 PROCPS_NG_CONF_OPTS += --with-systemd
-- 
2.9.4
