From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 11:06:23 +0200
Subject: [Buildroot] [git commit] libsemanage: bump to version 2.5
Message-ID: <20160701091149.3C50C82193@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6d6a9d2b3051d4381496cc107942e6bf36267fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 0001-execption-lib-path-fix.patch is also no longer needed, as the
new version of libsemanage includes the fix provided by the patch.
As such, the patch was removed, and 0002 was renamed to 0001.

Audit was added as a dependency as the new version of libsemanage
will fail to compile searching for audit.h

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: add the select on audit + propagate the dependencies.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsemanage/0001-execption-lib-path-fix.patch      | 14 --------------
 ...in-issue.patch => 0001-workaround-blackfin-issue.patch} |  5 +++--
 package/libsemanage/Config.in                              |  8 ++++++--
 package/libsemanage/libsemanage.hash                       |  2 +-
 package/libsemanage/libsemanage.mk                         |  6 +++---
 5 files changed, 13 insertions(+), 22 deletions(-)

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
diff --git a/package/libsemanage/0002-workaround-blackfin-issue.patch b/package/libsemanage/0001-workaround-blackfin-issue.patch
similarity index 89%
rename from package/libsemanage/0002-workaround-blackfin-issue.patch
rename to package/libsemanage/0001-workaround-blackfin-issue.patch
index 5d00c69..7ce9606 100644
--- a/package/libsemanage/0002-workaround-blackfin-issue.patch
+++ b/package/libsemanage/0001-workaround-blackfin-issue.patch
@@ -8,14 +8,15 @@ symbols are visible in the final DSO, which is not a problem for
 proper execution, it just isn't as clean.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 
 Index: b/src/dso.h
 ===================================================================
 --- a/src/dso.h
 +++ b/src/dso.h
 @@ -1,7 +1,7 @@
- #ifndef _SELINUX_DSO_H
- #define _SELINUX_DSO_H	1
+ #ifndef _SEPOL_DSO_H
+ #define _SEPOL_DSO_H	1
  
 -#ifdef SHARED
 +#if defined(SHARED) && !defined(__bfin__)
diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index 4465ef4..4318dbf 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -1,12 +1,15 @@
 config BR2_PACKAGE_LIBSEMANAGE
 	bool "libsemanage"
+	select BR2_PACKAGE_AUDIT
 	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_USTR
 	select BR2_PACKAGE_BZIP2
+	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	# libselinux needs fts.h (not available in uClibc/musl) and
-	# libsemanage itself needs getpwent_r() not available in musl
+	# - libselinux needs fts.h (not available in uClibc/musl)
+	# - libsemanage itself needs getpwent_r() not available in musl
+	# - audit is not available on musl
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_arc
 	help
@@ -22,5 +25,6 @@ config BR2_PACKAGE_LIBSEMANAGE
 
 comment "libsemanage needs a glibc toolchain w/ threads, dynamic library"
 	depends on !BR2_arc
+	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index d4204d1..69f7c8d 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 de2e8077245581e94576276f54e80a53c23c28d6961d2dfbe2f004eaba452e91 libsemanage-2.1.10.tar.gz
+sha256 46e2f36254369b6e91d1eea0460c262b139361b055a3a67d3ceea2d8ef72e006 libsemanage-2.5.tar.gz
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 197c14e..a60d018 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 2.1.10
-LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
+LIBSEMANAGE_VERSION = 2.5
+LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
 LIBSEMANAGE_LICENSE = LGPLv2.1+
 LIBSEMANAGE_LICENSE_FILES = COPYING
-LIBSEMANAGE_DEPENDENCIES = host-bison host-flex libselinux ustr bzip2
+LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux ustr bzip2
 LIBSEMANAGE_INSTALL_STAGING = YES
 
 LIBSEMANAGE_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
