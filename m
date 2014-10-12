From: Alexey Brodkin <alexey.brodkin@gmail.com>
Date: Sun, 12 Oct 2014 17:34:00 +0200
Subject: [Buildroot] [PATCH] infra: BR2_PREFER_STATIC_LIB now selects static
	building of packages
Message-ID: <1413128040-1860-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With time BR2_PREFER_STATIC_LIB option meaning changed from "prefer static
libs when possible" to "do not build dynamic libs and build statically linked
applications".

This patch changes variable description and takes care of uClibc settings so
it doesn't build shared libs.

Note that variable name is kept unchanged on purpose - it will be modified later
when real "prefer static" mode will be introduced.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in                             | 14 ++++++++------
 package/uclibc/uClibc-0.9.31.config   |  1 -
 package/uclibc/uClibc-0.9.33.config   |  1 -
 package/uclibc/uClibc-snapshot.config |  1 -
 package/uclibc/uclibc.mk              | 11 +++++++++++
 5 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/Config.in b/Config.in
index 24aa883..e58dae6 100644
--- a/Config.in
+++ b/Config.in
@@ -536,15 +536,17 @@ comment "enabling Stack Smashing Protection requires support in the toolchain"
 	depends on !BR2_TOOLCHAIN_HAS_SSP
 
 config BR2_PREFER_STATIC_LIB
-	bool "prefer static libraries"
+	bool "build statically linked applications, no dynamic libraries"
 	help
-	  Where possible, build and use static libraries for the target.
-	  This potentially increases your code size and should only be
+	  Build all application for the target statically linked.
+	  This potentially increases your filesystem size and should only be
 	  used if you know what you do.
-	  The default is to build dynamic libraries and use those on
-	  the target filesystem.
 
-	  WARNING: This is highly experimental at the moment.
+	  Note that some applications cannot be build statically and so are
+	  intentionally disabled.
+
+	  The default is to build dynamic libraries and dynamically linked
+	  applications to use those on the target filesystem.
 
 config BR2_PACKAGE_OVERRIDE_FILE
 	string "location of a package override file"
diff --git a/package/uclibc/uClibc-0.9.31.config b/package/uclibc/uClibc-0.9.31.config
index b23ba73..76772e8 100644
--- a/package/uclibc/uClibc-0.9.31.config
+++ b/package/uclibc/uClibc-0.9.31.config
@@ -61,7 +61,6 @@ HAVE_DOT_CONFIG=y
 DOPIC=y
 # ARCH_HAS_NO_SHARED is not set
 # ARCH_HAS_NO_LDSO is not set
-HAVE_SHARED=y
 # FORCE_SHAREABLE_TEXT_SEGMENTS is not set
 LDSO_LDD_SUPPORT=y
 # LDSO_CACHE_SUPPORT is not set
diff --git a/package/uclibc/uClibc-0.9.33.config b/package/uclibc/uClibc-0.9.33.config
index 0fbce19..1b07d4a 100644
--- a/package/uclibc/uClibc-0.9.33.config
+++ b/package/uclibc/uClibc-0.9.33.config
@@ -83,7 +83,6 @@ HAVE_DOT_CONFIG=y
 DOPIC=y
 # ARCH_HAS_NO_SHARED is not set
 # ARCH_HAS_NO_LDSO is not set
-HAVE_SHARED=y
 # FORCE_SHAREABLE_TEXT_SEGMENTS is not set
 LDSO_LDD_SUPPORT=y
 # LDSO_CACHE_SUPPORT is not set
diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
index 11dde03..1f04561 100644
--- a/package/uclibc/uClibc-snapshot.config
+++ b/package/uclibc/uClibc-snapshot.config
@@ -85,7 +85,6 @@ HAVE_DOT_CONFIG=y
 DOPIC=y
 # ARCH_HAS_NO_SHARED is not set
 # ARCH_HAS_NO_LDSO is not set
-HAVE_SHARED=y
 # FORCE_SHAREABLE_TEXT_SEGMENTS is not set
 LDSO_LDD_SUPPORT=y
 # LDSO_CACHE_SUPPORT is not set
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 4e09b31..5b83c74 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -395,6 +395,16 @@ UCLIBC_WCHAR_CONFIG = $(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_WCHAR,$(@D)/.config)
 endif
 
 #
+# static/shared libs
+#
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+UCLIBC_SHARED_LIBS_CONFIG = $(call KCONFIG_DISABLE_OPT,HAVE_SHARED,$(@D)/.config)
+else
+UCLIBC_SHARED_LIBS_CONFIG = $(call KCONFIG_ENABLE_OPT,HAVE_SHARED,$(@D)/.config)
+endif
+
+#
 # Commands
 #
 
@@ -434,6 +444,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_THREAD_DEBUG_CONFIG)
 	$(UCLIBC_LOCALE_CONFIG)
 	$(UCLIBC_WCHAR_CONFIG)
+	$(UCLIBC_SHARED_LIBS_CONFIG)
 endef
 
 ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
-- 
1.9.3
