From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 14:07:02 +0200
Subject: [Buildroot] [git commit] package/valgrind: bump version to 3.17.0
Message-ID: <20210404114144.7AD888B679@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09a542c15231d796d87d94e4d5696cca7de70f1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- bump version to 3.17.0
- adjust tool remove hooks according to the change to libexec
- fix massive remove hook, ms_script vs. ms_print
- add additional sha256 source package hash

For details see [1].

[1] https://www.valgrind.org/docs/manual/dist.news.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/valgrind/valgrind.hash |  4 +++-
 package/valgrind/valgrind.mk   | 26 +++++++++++++-------------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 2b24ac44b6..648a590ca3 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,5 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-md5  d1b153f1ab17cf1f311705e7a83ef589  valgrind-3.16.1.tar.bz2
+md5  afe11b5572c3121a781433b7c0ab741b  valgrind-3.17.0.tar.bz2
+# locally computed
+sha256  ad3aec668e813e40f238995f60796d9590eee64a16dff88421430630e69285a2  valgrind-3.17.0.tar.bz2
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index a1b4d97ee6..b87e1e518f 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.16.1
+VALGRIND_VERSION = 3.17.0
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
@@ -64,7 +64,7 @@ VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_INSTALL_UCLIBC_SUPP
 
 ifeq ($(BR2_PACKAGE_VALGRIND_MEMCHECK),)
 define VALGRIND_REMOVE_MEMCHECK
-	rm -f $(TARGET_DIR)/usr/lib/valgrind/*memcheck*
+	rm -f $(TARGET_DIR)/usr/libexec/valgrind/*memcheck*
 endef
 
 VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_MEMCHECK
@@ -72,7 +72,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_VALGRIND_CACHEGRIND),)
 define VALGRIND_REMOVE_CACHEGRIND
-	rm -f $(TARGET_DIR)/usr/lib/valgrind/*cachegrind*
+	rm -f $(TARGET_DIR)/usr/libexec/valgrind/*cachegrind*
 	for i in cg_annotate cg_diff cg_merge; do \
 		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
 	done
@@ -83,7 +83,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_VALGRIND_CALLGRIND),)
 define VALGRIND_REMOVE_CALLGRIND
-	rm -f $(TARGET_DIR)/usr/lib/valgrind/*callgrind*
+	rm -f $(TARGET_DIR)/usr/libexec/valgrind/*callgrind*
 	for i in callgrind_annotate callgrind_control ; do \
 		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
 	done
@@ -94,7 +94,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_VALGRIND_HELGRIND),)
 define VALGRIND_REMOVE_HELGRIND
-	rm -f $(TARGET_DIR)/usr/lib/valgrind/*helgrind*
+	rm -f $(TARGET_DIR)/usr/libexec/valgrind/*helgrind*
 endef
 
 VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_HELGRIND
@@ -102,7 +102,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_VALGRIND_DRD),)
 define VALGRIND_REMOVE_DRD
-	rm -f $(TARGET_DIR)/usr/lib/valgrind/*drd*
+	rm -f $(TARGET_DIR)/usr/libexec/valgrind/*drd*
 endef
 
 VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_DRD
@@ -110,8 +110,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_VALGRIND_MASSIF),)
 define VALGRIND_REMOVE_MASSIF
-	rm -f $(TARGET_DIR)/usr/lib/valgrind/*massif*
-	rm -f $(TARGET_DIR)/usr/bin/ms_script
+	rm -f $(TARGET_DIR)/usr/libexec/valgrind/*massif*
+	rm -f $(TARGET_DIR)/usr/bin/ms_print
 endef
 
 VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_MASSIF
@@ -119,7 +119,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_VALGRIND_DHAT),)
 define VALGRIND_REMOVE_DHAT
-	rm -f $(TARGET_DIR)/usr/lib/valgrind/*dhat*
+	rm -f $(TARGET_DIR)/usr/libexec/valgrind/*dhat*
 endef
 
 VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_DHAT
@@ -127,7 +127,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_VALGRIND_SGCHECK),)
 define VALGRIND_REMOVE_SGCHECK
-	rm -f $(TARGET_DIR)/usr/lib/valgrind/*sgcheck*
+	rm -f $(TARGET_DIR)/usr/libexec/valgrind/*sgcheck*
 endef
 
 VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_SGCHECK
@@ -135,7 +135,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_VALGRIND_BBV),)
 define VALGRIND_REMOVE_BBV
-	rm -f $(TARGET_DIR)/usr/lib/valgrind/*bbv*
+	rm -f $(TARGET_DIR)/usr/libexec/valgrind/*bbv*
 endef
 
 VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_BBV
@@ -143,7 +143,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_VALGRIND_LACKEY),)
 define VALGRIND_REMOVE_LACKEY
-	rm -f $(TARGET_DIR)/usr/lib/valgrind/*lackey*
+	rm -f $(TARGET_DIR)/usr/libexec/valgrind/*lackey*
 endef
 
 VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_LACKEY
@@ -151,7 +151,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_VALGRIND_NULGRIND),)
 define VALGRIND_REMOVE_NULGRIND
-	rm -f $(TARGET_DIR)/usr/lib/valgrind/*none*
+	rm -f $(TARGET_DIR)/usr/libexec/valgrind/*none*
 endef
 
 VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_NULGRIND
