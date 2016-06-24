From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 23 Jun 2016 22:43:21 -0400
Subject: [Buildroot] [PATCH 6/6] libsemanage: bump to version 2.5
In-Reply-To: <1466736201-17310-1-git-send-email-Aduskett@gmail.com>
References: <1466736201-17310-1-git-send-email-Aduskett@gmail.com>
Message-ID: <1466736201-17310-6-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .../libsemanage/0001-execption-lib-path-fix.patch  | 14 -------------
 .../0001-workaround-blackfin-issue.patch           | 13 ++++++++++++
 .../0002-workaround-blackfin-issue.patch           | 24 ----------------------
 package/libsemanage/Config.in                      |  6 +++---
 package/libsemanage/libsemanage.hash               |  2 +-
 package/libsemanage/libsemanage.mk                 |  4 ++--
 6 files changed, 19 insertions(+), 44 deletions(-)
 delete mode 100644 package/libsemanage/0001-execption-lib-path-fix.patch
 create mode 100644 package/libsemanage/0001-workaround-blackfin-issue.patch
 delete mode 100644 package/libsemanage/0002-workaround-blackfin-issue.patch

diff --git a/package/libsemanage/0001-execption-lib-path-fix.patch b/package/libsemanage/0001-execption-lib-path-fix.patch
deleted file mode 100644
index cbcbea5..0000000
--- a/package/libsemanage/0001-execption-lib-path-fix.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Patch to correct a missing header file issue.
-
-Signed-off-by Clayton Shotwell <clshotwe@rockwellcollins.com>
-
---- a/src/exception.sh	2011-12-21 11:46:04.000000000 -0600
-+++ b/src/exception.sh	2012-08-27 11:29:58.000000000 -0500
-@@ -9,6 +9,6 @@
- }
- "
- }
--gcc -x c -c - -aux-info temp.aux < ../include/semanage/semanage.h
-+gcc -x c -c - -aux-info temp.aux -I../include < ../include/semanage/semanage.h
- for i in `awk '/extern int/ { print $6 }' temp.aux`; do except $i ; done
- rm -f -- temp.aux -.o
diff --git a/package/libsemanage/0001-workaround-blackfin-issue.patch b/package/libsemanage/0001-workaround-blackfin-issue.patch
new file mode 100644
index 0000000..6208ee7
--- /dev/null
+++ b/package/libsemanage/0001-workaround-blackfin-issue.patch
@@ -0,0 +1,13 @@
+diff --git a/src/dso.h b/src/dso.h
+index 5c69aae..90ba3bf 100644
+--- a/src/dso.h
++++ b/src/dso.h
+@@ -1,7 +1,7 @@
+ #ifndef _SEPOL_DSO_H
+ #define _SEPOL_DSO_H	1
+ 
+-#ifdef SHARED
++#if defined(SHARED) && !defined(__bfin__)
+ # define hidden __attribute__ ((visibility ("hidden")))
+ # define hidden_proto(fct) __hidden_proto (fct, fct##_internal)
+ # define __hidden_proto(fct, internal)	\
diff --git a/package/libsemanage/0002-workaround-blackfin-issue.patch b/package/libsemanage/0002-workaround-blackfin-issue.patch
deleted file mode 100644
index 5d00c69..0000000
--- a/package/libsemanage/0002-workaround-blackfin-issue.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Do not make symbols hidden on Blackfin
-
-The libselinux logic to hide internal symbols from the DSO doesn't
-work properly on Blackfin due to the USER_LABEL_PREFIX not being
-handled properly. A real fix is not that simple, so this patch simply
-disables the internal symbol hiding mechanism. This means that those
-symbols are visible in the final DSO, which is not a problem for
-proper execution, it just isn't as clean.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/dso.h
-===================================================================
---- a/src/dso.h
-+++ b/src/dso.h
-@@ -1,7 +1,7 @@
- #ifndef _SELINUX_DSO_H
- #define _SELINUX_DSO_H	1
- 
--#ifdef SHARED
-+#if defined(SHARED) && !defined(__bfin__)
- # define hidden __attribute__ ((visibility ("hidden")))
- # define hidden_proto(fct) __hidden_proto (fct, fct##_internal)
- # define __hidden_proto(fct, internal)	\
diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index 5e9ad8f..cff4c07 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_LIBSEMANAGE
 	bool "libsemanage"
-	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_USTR
 	select BR2_PACKAGE_BZIP2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_LIBSELINUX
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # getpwent_r()
 	depends on !BR2_arc
@@ -18,7 +18,7 @@ config BR2_PACKAGE_LIBSEMANAGE
 
 	  http://selinuxproject.org/page/Main_Page
 
-comment "libsemanage needs a toolchain w/ threads, dynamic library"
+comment "libsemanage needs a toolchain w/ threads, dynamic library, libselinux"
 	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_USES_MUSL
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_PACKAGE_LIBSELINUX
diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index d4204d1..69f7c8d 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 de2e8077245581e94576276f54e80a53c23c28d6961d2dfbe2f004eaba452e91 libsemanage-2.1.10.tar.gz
+sha256 46e2f36254369b6e91d1eea0460c262b139361b055a3a67d3ceea2d8ef72e006 libsemanage-2.5.tar.gz
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 197c14e..35bbdcf 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 2.1.10
-LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
+LIBSEMANAGE_VERSION = 2.5
+LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
 LIBSEMANAGE_LICENSE = LGPLv2.1+
 LIBSEMANAGE_LICENSE_FILES = COPYING
 LIBSEMANAGE_DEPENDENCIES = host-bison host-flex libselinux ustr bzip2
-- 
2.7.4
