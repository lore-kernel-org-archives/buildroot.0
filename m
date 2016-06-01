From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 1 Jun 2016 20:40:25 +0200
Subject: [Buildroot] [PATCH v2] uclibc: update to 1.0.15
Message-ID: <20160601184025.GA21509@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Linuxthreads support got reorganized.
LT.new is removed, LT.old is the default for
Linuxthreads.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
  - add Config.in.legacy entry for BR2_PTHREADS_OLD as requested
    by Thomas Petazzoni
---
 Config.in.legacy           |  7 +++++++
 package/uclibc/Config.in   |  9 ++-------
 package/uclibc/uclibc.hash |  2 +-
 package/uclibc/uclibc.mk   | 18 ++++--------------
 4 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9bb9b62..b73603b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.08"
 
+config BR2_PTHREADS_OLD
+	bool "linuxthreads (stable/old)"
+	select BR2_LEGACY
+	help
+	  Linuxthreads have been reworked, BR2_PTHREADS_OLD is now
+	  BR2_PTHREADS and the old BR2_PTHREADS - LT.new got removed.
+
 config BR2_BINUTILS_VERSION_2_23_X
 	bool "binutils 2.23 removed"
 	select BR2_LEGACY
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index efa84e9..1aad9a0 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -48,7 +48,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
 choice
 	prompt "Thread library implementation"
 	default BR2_PTHREADS_NATIVE
-	default BR2_PTHREADS_OLD if !BR2_USE_MMU
+	default BR2_PTHREADS if !BR2_USE_MMU
 	help
 	  Use this option to select the thread library implementation
 	  that should be used in your toolchain.
@@ -59,11 +59,6 @@ choice
 	config BR2_PTHREADS
 		bool "linuxthreads"
 		select BR2_TOOLCHAIN_HAS_THREADS
-		depends on BR2_m68k
-
-	config BR2_PTHREADS_OLD
-		bool "linuxthreads (stable/old)"
-		select BR2_TOOLCHAIN_HAS_THREADS
 		depends on BR2_m68k || BR2_arm || BR2_armeb || BR2_xtensa
 
 	config BR2_PTHREADS_NATIVE
@@ -76,7 +71,7 @@ endchoice
 
 config BR2_PTHREAD_DEBUG
 	bool "Thread library debugging"
-	depends on BR2_PTHREADS || BR2_PTHREADS_OLD || BR2_PTHREADS_NATIVE
+	depends on BR2_PTHREADS || BR2_PTHREADS_NATIVE
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	help
 	  Build the thread library with debugging enabled.
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index eccce34..01a6b80 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,2 @@
 # From http://www.uclibc-ng.org/
-sha256  3c63d9f8c8b98b65fa5c4040d1c8ab1b36e99a16e1093810cedad51ac15c9a9e        uClibc-ng-1.0.14.tar.xz
+sha256  0f62f35217d9a0b5eb3810dd6de16ab3dd4323f3224c6b95423250ac1e19ee49        uClibc-ng-1.0.15.tar.xz
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 1e12896..cf343a4 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.14
+UCLIBC_VERSION = 1.0.15
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPLv2.1+
@@ -328,29 +328,19 @@ endif
 ifeq ($(BR2_PTHREADS_NONE),y)
 define UCLIBC_THREAD_CONFIG
 	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_THREADS,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,LINUXTHREADS,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,LINUXTHREADS_OLD,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_LINUXTHREADS,$(@D)/.config)
 	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_THREADS_NATIVE,$(@D)/.config)
 endef
 else ifeq ($(BR2_PTHREADS),y)
 define UCLIBC_THREAD_CONFIG
 	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_THREADS,$(@D)/.config)
-	$(call KCONFIG_ENABLE_OPT,LINUXTHREADS_NEW,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,LINUXTHREADS_OLD,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_THREADS_NATIVE,$(@D)/.config)
-endef
-else ifeq ($(BR2_PTHREADS_OLD),y)
-define UCLIBC_THREAD_CONFIG
-	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_THREADS,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,LINUXTHREADS_NEW,$(@D)/.config)
-	$(call KCONFIG_ENABLE_OPT,LINUXTHREADS_OLD,$(@D)/.config)
+	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_LINUXTHREADS,$(@D)/.config)
 	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_THREADS_NATIVE,$(@D)/.config)
 endef
 else ifeq ($(BR2_PTHREADS_NATIVE),y)
 define UCLIBC_THREAD_CONFIG
 	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_THREADS,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,LINUXTHREADS_NEW,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,LINUXTHREADS_OLD,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_LINUXTHREADS,$(@D)/.config)
 	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_THREADS_NATIVE,$(@D)/.config)
 endef
 endif
-- 
2.1.4
