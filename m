From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 19:40:43 +0200
Subject: [Buildroot] [PATCH 11/20] lmbench: add support to use libtirpc when
	available
In-Reply-To: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1a83bc1183a4c94e9dc21715028d3f164839fef4.1344706801.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lmbench/Config.in  |    6 +++---
 package/lmbench/lmbench.mk |   11 ++++++++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
index 70449b6..7f63a1a 100644
--- a/package/lmbench/Config.in
+++ b/package/lmbench/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_LMBENCH
 	bool "lmbench"
 	# Uses pmap_set, pmap__unset, pmap_getport, etc.
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_RPC_SUPPORT_AVAILABLE
 	help
 	  LMbench is a suite of simple, portable,
 	  ANSI/C microbenchmarks for UNIX/POSIX.
 
 	  http://sourceforge.net/projects/lmbench/
 
-comment "lmbench requires a toolchain with RPC support"
-	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+comment "lmbench requires RPC support (toolchain or libtirpc)"
+	depends on !BR2_RPC_SUPPORT_AVAILABLE
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 10f6d14..7d15154 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -9,6 +9,15 @@ LMBENCH_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/lmbenc
 LMBENCH_LICENSE =  lmbench license (based on GPLv2)
 LMBENCH_LICENSE_FILES = COPYING COPYING-2
 
+LMBENCH_CFLAGS = $(TARGET_CFLAGS)
+LMBENCH_LDLIBS = $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+LMBENCH_DEPENDENCIES += libtirpc
+LMBENCH_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
+LMBENCH_LDFLAGS += -ltirpc
+endif
+
 define LMBENCH_CONFIGURE_CMDS
 	$(call CONFIG_UPDATE,$(@D))
 	sed -i 's/CFLAGS=/CFLAGS+=/g' $(@D)/src/Makefile
@@ -18,7 +27,7 @@ define LMBENCH_CONFIGURE_CMDS
 endef
 
 define LMBENCH_BUILD_CMDS
-	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC="$(TARGET_CC)" -C $(@D)/src
+	$(MAKE) CFLAGS="$(LMBENCH_CFLAGS)" LDFLAGS="$(LMBENCH_LDFLAGS)" OS=$(ARCH) CC="$(TARGET_CC)" -C $(@D)/src
 endef
 
 define LMBENCH_INSTALL_TARGET_CMDS
-- 
1.7.9.5
