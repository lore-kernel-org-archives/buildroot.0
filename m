From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Mon, 18 Jul 2011 10:15:53 +0100
Subject: [Buildroot] [PATCH 2/2] Add top-level rebuild target.
In-Reply-To: <1310980553-20754-1-git-send-email-quotientvremainder@gmail.com>
References: <1310980553-20754-1-git-send-email-quotientvremainder@gmail.com>
Message-ID: <1310980553-20754-3-git-send-email-quotientvremainder@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This runs the rebuild command for all enabled targets and runs the RFS
packaging commands.

Signed-off-by: Quotient Remainder <quotientvremainder@gmail.com>
---
 Makefile                   |   10 ++++++++++
 fs/common.mk               |    2 ++
 target/generic/Makefile.in |    6 ++++++
 3 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 2f3802c..1c846ff 100644
--- a/Makefile
+++ b/Makefile
@@ -316,17 +316,21 @@ include target/Makefile.in
 include linux/linux.mk
 
 TARGETS+=target-finalize
+TARGETS_NOREBUILD+=target-finalize
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 TARGETS+=target-purgelocales
+TARGETS_NOREBUILD += target-purgelocales
 endif
 
 include fs/common.mk
 
 TARGETS+=erase-fakeroots
+TARGETS_NOREBUILD+=erase-fakeroots
 
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
+TARGETS_REBUILD:=$(patsubst %,%-rebuild,$(filter-out $(TARGETS_NOREBUILD),$(TARGETS)))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
 TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS))
 
@@ -497,6 +501,9 @@ external-deps:
 show-targets:
 	@echo $(TARGETS)
 
+show-rebuild-targets:
+	@echo $(TARGETS_REBUILD)
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
@@ -628,6 +635,8 @@ endif
 
 cross: $(BASE_TARGETS)
 
+rebuild: $(TARGETS_REBUILD) $(TARGETS_NOREBUILD)
+
 help:
 	@echo 'Cleaning:'
 	@echo '  clean                  - delete all files created by build'
@@ -635,6 +644,7 @@ help:
 	@echo
 	@echo 'Build:'
 	@echo '  all                    - make world'
+	@echo '  rebuild                - rerun build commands for all enabled targets'
 	@echo
 	@echo 'Configuration:'
 	@echo '  menuconfig             - interactive curses-based configurator'
diff --git a/fs/common.mk b/fs/common.mk
index 4d50514..594ca5e 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -71,6 +71,8 @@ rootfs-$(1)-show-depends:
 
 rootfs-$(1): $(BINARIES_DIR)/rootfs.$(1) $(ROOTFS_$(2)_POST_TARGETS)
 
+$(1)-root-rebuild: $(1)-root
+
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS += rootfs-$(1)
 endif
diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index 4185202..8a29174 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -33,21 +33,27 @@ target-generic-dont-remount-rw:
 
 ifneq ($(TARGET_GENERIC_HOSTNAME),)
 TARGETS += target-generic-hostname
+TARGETS_NOREBUILD += target-generic-hostname
 endif
 
 ifneq ($(TARGET_GENERIC_ISSUE),)
 TARGETS += target-generic-issue
+TARGETS_NOREBUILD += target-generic-issue
 endif
 
 ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
 ifeq ($(BR2_PACKAGE_SYSVINIT),y)
 TARGETS += target-generic-getty-sysvinit
+TARGETS_NOREBUILD += target-generic-getty-sysvinit
 else
 TARGETS += target-generic-getty-busybox
+TARGETS_NOREBUILD += target-generic-getty-busybox
 endif
 ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 TARGETS += target-generic-do-remount-rw
+TARGETS_NOREBUILD += target-generic-do-remount-rw
 else
 TARGETS += target-generic-dont-remount-rw
+TARGETS_NOREBUILD += target-generic-dont-remount-rw
 endif
 endif
-- 
1.7.6
