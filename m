From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 25 Jul 2009 21:08:55 +0200
Subject: [Buildroot] [git commit] target/: remove hurd kernel placeholder
Message-ID: <20090725191957.479897639E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b6192fb9752ae5434f518f458d47514044dd6bba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Incomplete and unlikely to get completed in the near future - Pretty
much like hurd itself.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Config.in        |    7 -------
 target/hurd/Config.in   |   11 -----------
 target/hurd/Makefile.in |   38 --------------------------------------
 3 files changed, 0 insertions(+), 56 deletions(-)
 delete mode 100644 target/hurd/Config.in
 delete mode 100644 target/hurd/Makefile.in

diff --git a/target/Config.in b/target/Config.in
index 4bd76c5..a25581b 100644
--- a/target/Config.in
+++ b/target/Config.in
@@ -74,10 +74,6 @@ config BR2_KERNEL_LINUX
 
 endif
 
-config BR2_KERNEL_HURD
-	bool "hurd"
-	help
-	  GNU/Hurd kernel
 endchoice
 
 config BR2_PACKAGE_LINUX
@@ -88,7 +84,4 @@ source "target/linux/Config.in"
 source "target/linux/Config.in.advanced"
 endif
 
-if BR2_KERNEL_HURD
-source "target/hurd/Config.in"
-endif
 endmenu
diff --git a/target/hurd/Config.in b/target/hurd/Config.in
deleted file mode 100644
index 08b9ff7..0000000
--- a/target/hurd/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_HURD
-	bool "Hurd kernel (see helptext)"
-	depends on BR2_KERNEL_HURD
-	default y
-	help
-	  The GNU/Hurd kernel.
-	  http://www.gnu.org/software/hurd/
-
-	  FIXME: Currently not implemented.
-
-
diff --git a/target/hurd/Makefile.in b/target/hurd/Makefile.in
deleted file mode 100644
index 9bd7d9b..0000000
--- a/target/hurd/Makefile.in
+++ /dev/null
@@ -1,38 +0,0 @@
-# GNU Hurd kernel
-#
-ifeq ($(BR2_KERNEL_HURD),y)
-
-HURD_MODULE_SITE:= -d:pserver:anonymous at cvs.savannah.gnu.org:/sources/hurd
-MIG_MODULE_NAME:=mig
-MIG_MODULE_VERSION:=cvs
-HURD_MODULE_NAME:=hurd
-HURD_MODULE_VERSION:=cvs
-HURD_CMD_CO=cvs -z3 $(HURD_MODULE_SITE) co
-HURD_CMD_UP:=cvs up -PA -d
-HURD_SRC_DIR:=hurd-$(HURD_MODULE_VERSION)
-MIG_SRC_DIR:=mig-$(MIG_MODULE_VERSION)
-
-$(TOOL_BUILD_DIR)/$(HURD_SRC_DIR)/.unpacked:
-	mkdir -p $(@D)
-	(cd $(TOOL_BUILD_DIR) && \
-	 $(HURD_CMD_CO) -d $(HURD_SRC_DIR) $(HURD_MODULE_NAME); \
-	)
-	touch $@
-
-$(TOOL_BUILD_DIR)/$(MIG_SRC_DIR)/.unpacked:
-	mkdir -p $(@D)
-	(cd $(TOOL_BUILD_DIR) && \
-	 $(HURD_CMD_CO) -d $(MIG_SRC_DIR) $(MIG_MODULE_NAME); \
-	)
-	touch $@
-
-$(TOOL_BUILD_DIR)/$(HURD_SRC_DIR)/.updated: $(TOOL_BUILD_DIR)/$(HURD_SRC_DIR)/.unpacked
-	(cd $(@D) && $(HURD_CMD_UP))
-
-$(TOOL_BUILD_DIR)/$(MIG_SRC_DIR)/.updated: $(TOOL_BUILD_DIR)/$(MIG_SRC_DIR)/.unpacked
-	(cd $(@D) && $(HURD_CMD_UP))
-
-hurd-source: $(TOOL_BUILD_DIR)/$(HURD_SRC_DIR)/.updated \
-	$(TOOL_BUILD_DIR)/$(MIG_SRC_DIR)/.updated
-
-endif
-- 
1.6.3.3
