From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:03 +0200
Subject: [Buildroot] [PATCH 023/100] dos2unix: use new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-24-thomas.petazzoni@free-electrons.com>
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

In addition, we now use BR2_SYSTEM_ENABLE_NLS instead of
BR2_ENABLE_LOCALE to decide if NLS support should be enabled or
disabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dos2unix/Config.in   |  1 -
 package/dos2unix/dos2unix.mk | 15 +++++++--------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/dos2unix/Config.in b/package/dos2unix/Config.in
index 6945f52..cfb5ba4 100644
--- a/package/dos2unix/Config.in
+++ b/package/dos2unix/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_DOS2UNIX
 	bool "dos2unix"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  dos2unix converts text file line endings between CRLF and LF
 
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 3540ec8..87525fb 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -8,19 +8,18 @@ DOS2UNIX_VERSION = 7.3.4
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
-DOS2UNIX_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
+DOS2UNIX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_BUSYBOX),busybox) \
+	$(TARGET_NLS_DEPENDENCIES)
 
-ifeq ($(BR2_ENABLE_LOCALE),y)
-DOS2UNIX_DEPENDENCIES += host-gettext
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+DOS2UNIX_MAKE_OPTS += ENABLE_NLS=1
+DOS2UNIX_MAKE_OPTS += LIBS_EXTRA=$(TARGET_NLS_LIBS)
 else
+# Should be defined to empty to disable NLS support
 DOS2UNIX_MAKE_OPTS += ENABLE_NLS=
 endif
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-DOS2UNIX_DEPENDENCIES += gettext
-DOS2UNIX_MAKE_OPTS += LIBS_EXTRA=-lintl
-endif
-
 ifeq ($(BR2_USE_WCHAR),)
 DOS2UNIX_MAKE_OPTS += UCS=
 endif
-- 
2.9.4
