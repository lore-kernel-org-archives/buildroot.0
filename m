From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 24 Jun 2016 17:32:07 -0400
Subject: [Buildroot] [PATCH 5/7] libsemanage: bump to version 2.5
In-Reply-To: <1466803929-5513-1-git-send-email-Aduskett@gmail.com>
References: <1466803929-5513-1-git-send-email-Aduskett@gmail.com>
Message-ID: <1466803929-5513-5-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition to bumping the version to 2.5, the new version requires audit (as far as I can tell, it fails compilation without it while compilaining it can't find audit.h)
Also the new version of libsemanage already has the fix provided by 0001-execption-lib-path-fix.patch and therefor I removed it.
Because of the removal of that patch, I renamed 0002-workaround-blackfin-issue.patch to 0001-workaround-blackfin-issue.patch

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libsemanage/0001-execption-lib-path-fix.patch      | 14 --------------
 ...in-issue.patch => 0001-workaround-blackfin-issue.patch} |  4 ++--
 package/libsemanage/libsemanage.hash                       |  2 +-
 package/libsemanage/libsemanage.mk                         |  6 +++---
 4 files changed, 6 insertions(+), 20 deletions(-)
 delete mode 100644 package/libsemanage/0001-execption-lib-path-fix.patch
 rename package/libsemanage/{0002-workaround-blackfin-issue.patch => 0001-workaround-blackfin-issue.patch} (94%)

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
similarity index 94%
rename from package/libsemanage/0002-workaround-blackfin-issue.patch
rename to package/libsemanage/0001-workaround-blackfin-issue.patch
index 5d00c69..af28a63 100644
--- a/package/libsemanage/0002-workaround-blackfin-issue.patch
+++ b/package/libsemanage/0001-workaround-blackfin-issue.patch
@@ -14,8 +14,8 @@ Index: b/src/dso.h
 --- a/src/dso.h
 +++ b/src/dso.h
 @@ -1,7 +1,7 @@
- #ifndef _SELINUX_DSO_H
- #define _SELINUX_DSO_H	1
+ #ifndef _SEPOL_DSO_H
+ #define _SEPOL_DSO_H	1
  
 -#ifdef SHARED
 +#if defined(SHARED) && !defined(__bfin__)
diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index d4204d1..69f7c8d 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 de2e8077245581e94576276f54e80a53c23c28d6961d2dfbe2f004eaba452e91 libsemanage-2.1.10.tar.gz
+sha256 46e2f36254369b6e91d1eea0460c262b139361b055a3a67d3ceea2d8ef72e006 libsemanage-2.5.tar.gz
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 197c14e..fead50d 100644
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
+LIBSEMANAGE_DEPENDENCIES = host-bison host-flex host-audit libselinux ustr bzip2
 LIBSEMANAGE_INSTALL_STAGING = YES
 
 LIBSEMANAGE_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
-- 
2.7.4
