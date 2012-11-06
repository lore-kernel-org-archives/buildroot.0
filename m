From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Nov 2012 08:20:17 +0100
Subject: [Buildroot] [git commit] lmbench: add support to use libtirpc when
	available
Message-ID: <20121106072424.93A5499BFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80f7a4b6797d11fbf3808a8af8b5e5f58048f117
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lmbench/Config.in  |    6 +-----
 package/lmbench/lmbench.mk |   11 ++++++++++-
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
index 70449b6..d710e1f 100644
--- a/package/lmbench/Config.in
+++ b/package/lmbench/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_LMBENCH
 	bool "lmbench"
-	# Uses pmap_set, pmap__unset, pmap_getport, etc.
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  LMbench is a suite of simple, portable,
 	  ANSI/C microbenchmarks for UNIX/POSIX.
 
 	  http://sourceforge.net/projects/lmbench/
-
-comment "lmbench requires a toolchain with RPC support"
-	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index d3d0f8f..1932adb 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -9,6 +9,15 @@ LMBENCH_SITE:=http://downloads.sourceforge.net/project/lmbench/development/lmben
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
