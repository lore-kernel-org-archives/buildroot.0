From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 14 Apr 2020 10:25:23 -0500
Subject: [Buildroot] [PATCH v3 3/8] package/libsepol: bump version to 3.0
In-Reply-To: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
References: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200414152528.20758-4-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@gmail.com>

Other changes:
  - Add policy version 32 as a default version of toolchains build with kernel
    headers 5.5 or later.

  - Add Help text for the above.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes v2 -> v3
 - Matt switched over the versioning to use dates
---
 package/libsepol/0001-support-static-only.patch | 6 +++---
 package/libsepol/Config.in                      | 3 ++-
 package/libsepol/libsepol.hash                  | 9 ++++-----
 package/libsepol/libsepol.mk                    | 8 +++++---
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/package/libsepol/0001-support-static-only.patch b/package/libsepol/0001-support-static-only.patch
index b3eb608f7b..f7051ee03e 100644
--- a/package/libsepol/0001-support-static-only.patch
+++ b/package/libsepol/0001-support-static-only.patch
@@ -17,9 +17,9 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  src/Makefile | 13 ++++++++++---
  1 file changed, 10 insertions(+), 3 deletions(-)
 
-diff -durNw libsepol-2.7.orig/src/Makefile libsepol-2.7/src/Makefile
---- libsepol-2.7.orig/src/Makefile	2018-01-15 21:07:51.285183415 +0100
-+++ libsepol-2.7/src/Makefile	2018-01-15 21:08:56.515182717 +0100
+diff -durNw libsepol-2.7.orig/libsepol/src/Makefile libsepol-2.7/libsepol/src/Makefile
+--- libsepol-2.7.orig/libsepol/src/Makefile	2018-01-15 21:07:51.285183415 +0100
++++ libsepol-2.7/libsepol/src/Makefile	2018-01-15 21:08:56.515182717 +0100
 @@ -39,7 +39,12 @@
  LN=gln
  endif
diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index 21d4d7865c..52c12bf290 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -11,6 +11,7 @@ if BR2_PACKAGE_LIBSEPOL
 
 config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
 	int "Policy version"
+	default 32 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 	default 31 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
 	default 30 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
 	default 29 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
@@ -27,7 +28,7 @@ config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
 	  > 3.5 <= 3.14    28 (27 and 28 were added@the same time)
 	  > 3.14 <= 4.3    29
 	  > 4.3 <= 4.13    30
-	  > 4.13           31
+	  > 4.13 <= 5.5    31
 
 endif
 
diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index 83eb63213e..b58cdb5c2a 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,5 +1,4 @@
-# From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 a34b12b038d121e3e459b1cbaca3c9202e983137819c16baf63658390e3f1d5d  libsepol-2.9.tar.gz
-
-# Hash for license file
-sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
+# Generated locally as upstream releases in artifact
+# files under a overall YYYYMMDD dated selinux release
+sha256 4cc134210d8cca6c410b7b8c91993e10c6d5b077102ed27e6976bb6d9e483f0d libsepol-20191204.tar.gz
+sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 libsepol/COPYING
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 62b0744aa3..6d0ef867d0 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,15 +4,17 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 2.9
-LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+LIBSEPOL_VERSION = $(LIBSELINUX_VERSION)
+LIBSEPOL_SITE = $(LIBSELINUX_SITE)
 LIBSEPOL_LICENSE = LGPL-2.1+
-LIBSEPOL_LICENSE_FILES = COPYING
+LIBSEPOL_LICENSE_FILES = $(LIBSEPOL_NAME)/COPYING
 
 LIBSEPOL_INSTALL_STAGING = YES
 LIBSEPOL_DEPENDENCIES = host-flex
 HOST_LIBSEPOL_DEPENDENCIES = $(BR2_COREUTILS_HOST_DEPENDENCY) host-flex
 
+LIBSEPOL_SUBDIR = $(@D)/$(LIBSEPOL_NAME)
+
 LIBSEPOL_MAKE_FLAGS = $(TARGET_CONFIGURE_OPTS)
 
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.17.1
