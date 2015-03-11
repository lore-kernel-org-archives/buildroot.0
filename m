From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Mar 2015 23:01:26 +0100
Subject: [Buildroot] [PATCHv2 3/5] uclibc: remove version from the uclibc-ng
	config option
In-Reply-To: <1426111288-20529-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1426111288-20529-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1426111288-20529-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the moment, we probably don't want to have several versions of
uClibc-ng supported at the same time. In preparation to the bump of
uClibc-ng to 1.0.1, this commit gets rid of the version number from
the uclibc-ng config option so that we don't have to rename this
option over and over again each time a new uClibc-ng release is
made. This would be annoying in terms of Config.in.legacy handling.

Since the option BR2_UCLIBC_NG_VERSION_1_0_0 has never been part of
any Buildroot release, we don't have to add anything to
Config.in.legacy.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in                                    | 8 ++++----
 package/uclibc/{uClibc-ng-1.0.0.config => uClibc-ng.config} | 0
 package/uclibc/uclibc.mk                                    | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename package/uclibc/{uClibc-ng-1.0.0.config => uClibc-ng.config} (100%)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 329e1f1..c65277b 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -37,8 +37,8 @@ choice
 		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
 		depends on BR2_arc
 
-	config BR2_UCLIBC_NG_VERSION_1_0_0
-		bool "uClibc-ng 1.0.0"
+	config BR2_UCLIBC_VERSION_NG
+		bool "uClibc-ng"
 		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS \
 		       if BR2_bfin || BR2_m68k
 		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD \
@@ -72,14 +72,14 @@ config BR2_UCLIBC_VERSION_STRING
 	string
 	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
 	default "arc-2014.12" if BR2_UCLIBC_VERSION_ARC_GIT
-	default 1.0.0		if BR2_UCLIBC_NG_VERSION_1_0_0
+	default 1.0.0		if BR2_UCLIBC_VERSION_NG
 	default "7bf35c8b7d4a1f97174eb49f47f33946b282114c" if BR2_UCLIBC_VERSION_XTENSA_GIT
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
 	string "uClibc configuration file to use?"
 	default "package/uclibc/uClibc-0.9.33.config" if BR2_UCLIBC_VERSION_0_9_33
-	default "package/uclibc/uClibc-ng-1.0.0.config" if BR2_UCLIBC_NG_VERSION_1_0_0
+	default "package/uclibc/uClibc-ng.config" if BR2_UCLIBC_VERSION_NG
 	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_ARC_GIT
 	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
 	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_XTENSA_GIT
diff --git a/package/uclibc/uClibc-ng-1.0.0.config b/package/uclibc/uClibc-ng.config
similarity index 100%
rename from package/uclibc/uClibc-ng-1.0.0.config
rename to package/uclibc/uClibc-ng.config
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index feca77b..3a8f191 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -11,7 +11,7 @@ UCLIBC_LICENSE_FILES = COPYING.LIB
 
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 UCLIBC_SITE = http://www.uclibc.org/downloads/snapshots
-else ifeq ($(BR2_UCLIBC_NG_VERSION_1_0_0),y)
+else ifeq ($(BR2_UCLIBC_VERSION_NG),y)
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 else ifeq ($(BR2_UCLIBC_VERSION_ARC_GIT),y)
@@ -482,7 +482,7 @@ endif
 # interpreter, but since uClibc-ng version is 1.0.0, it generates
 # ld{64,}-uClibc.so.1. In order to avoid changing gcc, we simply
 # create the necessary symbolic links here.
-ifeq ($(BR2_UCLIBC_NG_VERSION_1_0_0),y)
+ifeq ($(BR2_UCLIBC_VERSION_NG),y)
 define UCLIBC_INSTALL_LDSO_SYMLINKS
 	if [ -e $(TARGET_DIR)/lib/ld64-uClibc.so.1 ]; then \
 		(cd $(TARGET_DIR)/lib;ln -sf ld64-uClibc.so.1 ld64-uClibc.so.0) \
-- 
2.1.0
