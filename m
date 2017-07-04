From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:51 +0200
Subject: [Buildroot] [PATCH 071/100] rhash: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-72-thomas.petazzoni@free-electrons.com>
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
 package/rhash/Config.in | 1 -
 package/rhash/rhash.mk  | 9 +++------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/rhash/Config.in b/package/rhash/Config.in
index 46f6ca7..2ddcb00 100644
--- a/package/rhash/Config.in
+++ b/package/rhash/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_RHASH
 	bool "rhash"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  LibRHash is a professional, portable, thread-safe C library
 	  for computing a wide variety of hash sums, such as CRC32,
diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 6cfc271..53f49d8 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -10,12 +10,9 @@ RHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(RHASH_VERSION)
 RHASH_LICENSE = MIT
 RHASH_LICENSE_FILES = COPYING
 RHASH_INSTALL_STAGING = YES
-
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-RHASH_DEPENDENCIES += gettext
-RHASH_ADDCFLAGS += -DUSE_GETTEXT
-RHASH_ADDLDFLAGS += -lintl
-endif
+RHASH_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+RHASH_ADDLDFLAGS = $(TARGET_NLS_LIBS)
+RHASH_ADDCFLAGS = $(if $(BR2_SYSTEM_ENABLE_NLS),-DUSE_GETTEXT)
 
 ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
 RHASH_DEPENDENCIES += openssl
-- 
2.9.4
