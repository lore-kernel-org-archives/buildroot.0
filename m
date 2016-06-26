From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 26 Jun 2016 18:26:13 -0400
Subject: [Buildroot] [PATCH v6 2/6] libsemanage: bump to version 2.5
In-Reply-To: <1466979977-32213-1-git-send-email-Aduskett@gmail.com>
References: <1466979977-32213-1-git-send-email-Aduskett@gmail.com>
Message-ID: <1466979977-32213-9-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 0001-execption-lib-path-fix.patch is also no longer needed, as the
new version of libsemanage includes the fix provided by the patch.
As such, the patch was removed, and 0002 was renamed to 0001.

Audit was added as a dependency as the new version of libsemanage
will fail to compile searching for audit.h

Changes v5 -> v6:
 - Removed check for policycoreutils

Changes v3 -> v5:
 - Patch series version bump.

Changes v2 -> v3:
 - Added better explination as to why host-audit is added.

Changes v1 -> v2:
 - Reverted changes to the select.
---
 .../libsemanage/0001-execption-lib-path-fix.patch  | 14 ------------
 .../0001-workaround-blackfin-issue.patch           | 25 ++++++++++++++++++++++
 .../0002-workaround-blackfin-issue.patch           | 24 ---------------------
 package/libsemanage/libsemanage.hash               |  2 +-
 package/libsemanage/libsemanage.mk                 |  6 +++---
 5 files changed, 29 insertions(+), 42 deletions(-)
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
index 0000000..7ce9606
--- /dev/null
+++ b/package/libsemanage/0001-workaround-blackfin-issue.patch
@@ -0,0 +1,25 @@
+Do not make symbols hidden on Blackfin
+
+The libselinux logic to hide internal symbols from the DSO doesn't
+work properly on Blackfin due to the USER_LABEL_PREFIX not being
+handled properly. A real fix is not that simple, so this patch simply
+disables the internal symbol hiding mechanism. This means that those
+symbols are visible in the final DSO, which is not a problem for
+proper execution, it just isn't as clean.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+
+Index: b/src/dso.h
+===================================================================
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
-- 
2.7.4
