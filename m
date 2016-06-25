From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 24 Jun 2016 20:21:10 -0400
Subject: [Buildroot] [PATCH 4/8 v3] libsemanage: bump to version 2.5
In-Reply-To: <1466814074-4557-1-git-send-email-Aduskett@gmail.com>
References: <1466814074-4557-1-git-send-email-Aduskett@gmail.com>
Message-ID: <1466814074-4557-4-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition to bumping the version to 2.5, added a check in the make
file to see if BR2_PACKAGE_POLICYCOREUTILS is selected. If it is
host-audit is added as a dependency.

(Note that policycoreutils is not yet available, but is being worked on
by another contributor.)

The 0001-execption-lib-path-fix.patch is also no longer needed, as the
new version of libsemanage includes the fix provided by the patch.
As such, the patch was removed, and 0002 was renamed to 0001.

Changes v2 -> v3:
 - Added better explination as to why host-audit is added.

Changes v1 -> v2:
 - Reverted changes to the select.
 - Added explination as to why a patch was removed.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libsemanage/0001-execption-lib-path-fix.patch      | 14 --------------
 ...in-issue.patch => 0001-workaround-blackfin-issue.patch} |  5 +++--
 package/libsemanage/libsemanage.hash                       |  2 +-
 package/libsemanage/libsemanage.mk                         | 13 +++++++++----
 4 files changed, 13 insertions(+), 21 deletions(-)
 delete mode 100644 package/libsemanage/0001-execption-lib-path-fix.patch
 rename package/libsemanage/{0002-workaround-blackfin-issue.patch => 0001-workaround-blackfin-issue.patch} (89%)

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
diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index d4204d1..69f7c8d 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 de2e8077245581e94576276f54e80a53c23c28d6961d2dfbe2f004eaba452e91 libsemanage-2.1.10.tar.gz
+sha256 46e2f36254369b6e91d1eea0460c262b139361b055a3a67d3ceea2d8ef72e006 libsemanage-2.5.tar.gz
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 197c14e..562ae1a 100644
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
@@ -27,8 +27,13 @@ define LIBSEMANAGE_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 endef
 
-HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-libsepol host-libselinux \
+HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-audit host-libsepol host-libselinux \
 				host-ustr host-bzip2 host-swig
+
+ifeq ($(BR2_PACKAGE_POLICYCOREUTILS),y)
+HOST_LIBSEMANAGE_DEPENDENCIES += host-audit
+endif
+
 HOST_LIBSEMANAGE_MAKE_OPTS += $(HOST_CONFIGURE_OPTS) \
 	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
 
-- 
2.7.4
