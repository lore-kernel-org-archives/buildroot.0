From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 27 Dec 2019 15:43:23 +0100
Subject: [Buildroot] [PATCH 2/3] package/libnspr: enable building with xtensa
In-Reply-To: <20191227144324.84759-1-giulio.benetti@benettiengineering.com>
References: <20191227144324.84759-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191227144324.84759-3-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to support Xtensa architecture building.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
Patch pending upstream:
https://bugzilla.mozilla.org/show_bug.cgi?id=1606092
---
 ...6092_Add_support_for_building_xtensa.patch | 33 +++++++++++++++++++
 package/libnspr/Config.in                     |  1 -
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 package/libnspr/0001-Bug_1606092_Add_support_for_building_xtensa.patch

diff --git a/package/libnspr/0001-Bug_1606092_Add_support_for_building_xtensa.patch b/package/libnspr/0001-Bug_1606092_Add_support_for_building_xtensa.patch
new file mode 100644
index 0000000000..73a70277b6
--- /dev/null
+++ b/package/libnspr/0001-Bug_1606092_Add_support_for_building_xtensa.patch
@@ -0,0 +1,33 @@
+# HG changeset patch
+# User Giulio Benetti <giuliobenetti@micronovasrl.com>
+# Date 1577456724 -3600
+#      Fri Dec 27 15:25:24 2019 +0100
+# Node ID 1a3d96917971ea13432116f41ace8a9e19ef7f97
+# Parent  b9c2a7602ab0a1c0c890db6cf4c3b1f1e6e243c1
+Bug 1606092 - Add support for building Xtensa
+
+diff -r b9c2a7602ab0 -r 1a3d96917971 nspr/pr/include/md/_linux.cfg
+--- a/nspr/pr/include/md/_linux.cfg	Mon Dec 02 19:24:25 2019 +0100
++++ b/nspr/pr/include/md/_linux.cfg	Fri Dec 27 15:25:24 2019 +0100
+@@ -1157,7 +1157,8 @@
+ #define PR_BYTES_PER_WORD_LOG2   2
+ #define PR_BYTES_PER_DWORD_LOG2  3
+ 
+-#elif defined(__nios2__) || defined(__microblaze__) || defined(__nds32__)
++#elif defined(__nios2__) || defined(__microblaze__) || defined(__nds32__) || \
++      defined(__xtensa__)
+ 
+ #if defined(__microblaze__) && defined(__BIG_ENDIAN__)
+ #define IS_BIG_ENDIAN 1
+diff -r b9c2a7602ab0 -r 1a3d96917971 nspr/pr/include/md/_linux.h
+--- a/nspr/pr/include/md/_linux.h	Mon Dec 02 19:24:25 2019 +0100
++++ b/nspr/pr/include/md/_linux.h	Fri Dec 27 15:25:24 2019 +0100
+@@ -69,6 +69,8 @@
+ #define _PR_SI_ARCHITECTURE "microblaze"
+ #elif defined(__nds32__)
+ #define _PR_SI_ARCHITECTURE "nds32"
++#elif defined(__xtensa__)
++#define _PR_SI_ARCHITECTURE "xtensa"
+ #else
+ #error "Unknown CPU architecture"
+ #endif
diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index 57fcbdf6be..c1be7151e0 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	def_bool y
-	depends on !BR2_xtensa
 
 if BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 
-- 
2.20.1
