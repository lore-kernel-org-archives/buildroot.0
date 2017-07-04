From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:06 +0200
Subject: [Buildroot] [PATCH 026/100] elfutils: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-27-thomas.petazzoni@free-electrons.com>
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
 package/elfutils/Config.in   |  1 -
 package/elfutils/elfutils.mk | 11 +++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 3228319..ad86c31 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -14,7 +14,6 @@ config BR2_PACKAGE_ELFUTILS
 	depends on !BR2_bfin
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  Libraries/utilities to handle ELF objects (drop in
 	  replacement for libelf).
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index e43d036..5570a3b 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -10,7 +10,7 @@ ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
 ELFUTILS_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 ELFUTILS_LICENSE_FILES = COPYING-GPLV2 COPYING-LGPLV3
-ELFUTILS_DEPENDENCIES = zlib
+ELFUTILS_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
 HOST_ELFUTILS_DEPENDENCIES = host-zlib host-bzip2 host-xz
 
 # We patch configure.ac
@@ -40,13 +40,8 @@ ELFUTILS_CONF_ENV += \
 	CFLAGS="$(ELFUTILS_CFLAGS)" \
 	CPPFLAGS="$(ELFUTILS_CPPFLAGS)"
 
-ELFUTILS_LDFLAGS = $(TARGET_LDFLAGS)
-
-# Unconditionnally requires gettext.
-ifeq ($(BR2_NEEDS_GETTEXT),y)
-ELFUTILS_DEPENDENCIES += gettext
-ELFUTILS_LDFLAGS += -lintl
-endif
+ELFUTILS_LDFLAGS = $(TARGET_LDFLAGS) \
+	$(TARGET_NLS_LIBS)
 
 ELFUTILS_CONF_ENV += \
 	LDFLAGS="$(ELFUTILS_LDFLAGS)"
-- 
2.9.4
