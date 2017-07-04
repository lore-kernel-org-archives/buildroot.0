From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:50 +0200
Subject: [Buildroot] [PATCH 070/100] quota: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-71-thomas.petazzoni@free-electrons.com>
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
 package/quota/Config.in | 1 -
 package/quota/quota.mk  | 8 ++------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/quota/Config.in b/package/quota/Config.in
index c8ab0d7..051a765 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_QUOTA
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Implementation of the disk quota system.
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index d3b8755..5bd9013 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -6,18 +6,14 @@
 
 QUOTA_VERSION = 4.01
 QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
-QUOTA_DEPENDENCIES = host-gettext
+QUOTA_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 QUOTA_AUTORECONF = YES
 QUOTA_LICENSE = GPL-2.0+
 QUOTA_CONF_OPTS = --disable-strip-binaries
+QUOTA_LIBS = $(TARGET_NLS_LIBS)
 
 QUOTA_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-QUOTA_DEPENDENCIES += gettext
-QUOTA_LIBS += -lintl
-endif
-
 ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
 QUOTA_DEPENDENCIES += e2fsprogs
 QUOTA_CONF_OPTS += --enable-ext2direct
-- 
2.9.4
