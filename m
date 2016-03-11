From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:41:38 +0100
Subject: [Buildroot] [PATCH 9/9 v2] [RFC] core: finalise target in its own
	location
In-Reply-To: <cover.1457721607.git.yann.morin.1998@free.fr>
References: <cover.1457721607.git.yann.morin.1998@free.fr>
Message-ID: <8892913385099f562cba138ac3b4f762d8cc4d49.1457721607.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, after all packages have been installed into target/ , we run
a sanitising pass called 'target-finalize' on that directory, to:
  - apply overlays
  - remove unnecessary files (man, .h, .a ...)
  - strip files
as well as a few other miscellanous cleanups.

This means that target/ no longer contains only package-installed files,
and that target-finalize might not be idempotent (i.e. sucessive runs of
target-finalize may yield different results in target/ ). We're trying
pretty hard that all the internal target-finalize hooks are idempotent,
whether they are from the core (e.g. installing glibc locales) or
provided by packages (e.g. cleaning up perl files).

However, that might not be the case for packages from br2-external for
example, or under complex situations where a combination of packages
does not yield an idempotent sequence (quoting Wikipedia: "a combination
of idempotent methods or subroutines is not necessrily idempotent"; see:
https://en.wikipedia.org/wiki/Idempotence#Examples ).

Address this issue by copying target/ to a "landing" area where the
finalising takes place.

This keeps the user-visible target/ directory to contain only what
packages have installed, helps keeping target-finalize be idempotent by
allowing packages to provide simpler target-finalize hooks.

For simplicity for packages, we have to allow them to use $(TARGET_DIR)
everywhere, be it in target install commands or target finalize
commands, without requiring them to know whether to use $(TARGET_DIR)
or $(FINAL_TARGET_DIR). $(TARGET_DIR) always points to the directory in
which to act.

So, for target-finalize, we override TARGET_DIR to point to the landing
area. But since packages are dependencies of target-finalize, they
would also inherit from this override. So, we over-override TARGET_DIR
for packages, to point to the usual and currently used $(O)/target/
directory.

Finally, filesystem images are generated from that landing area, of
course. Similarly, we need to override TARGET_DIR for them.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Note: Thomas already express his dislike about that patch. Yet, for
posterity, here it goes updated to current master and tagged as RFC...
---
 Makefile     | 28 +++++++++++++++++++++++++++-
 fs/common.mk |  4 ++--
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 0f16976..a401788 100644
--- a/Makefile
+++ b/Makefile
@@ -183,7 +183,9 @@ BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
 
 BUILD_DIR := $(BASE_DIR)/build
 BINARIES_DIR := $(BASE_DIR)/images
-TARGET_DIR := $(BASE_DIR)/target
+BUILD_TARGET_DIR := $(BASE_DIR)/target
+TARGET_DIR := $(BUILD_TARGET_DIR)
+FINAL_TARGET_DIR := $(BUILD_DIR)/target-finalize
 # initial definition so that 'make clean' works for most users, even without
 # .config. HOST_DIR will be overwritten later when .config is included.
 HOST_DIR := $(BASE_DIR)/host
@@ -606,8 +608,32 @@ $(TARGETS_ROOTFS): target-finalize
 # multiple times in the list returned by show-target.
 PACKAGES := $(sort $(PACKAGES))
 
+# Finalizing the target directory involves:
+#  - applying overlays,
+#  - removing unecessary files (man, .h, .a ...)
+#  - tweaking files installed by packages (like stripping)
+# and miscellanous cleanups.
+#
+# We want to keep the $(O)/target/ directory as a perfect image of
+# what packages have actually installed, so we copy it to a landing
+# location where we'll do those cleanups.
+#
+# Still, we only document $(TARGET_DIR) so packages that want to provide
+# target-finalize hooks will be using that. Thus, we just override that
+# variable with the landing location just for target-finalize.
+#
+# However, since rule-overriden variables are inherited by the dependencies
+# of that rule, we must re-override TARGET_DIR with its original location
+# for packages.
+#
+$(PACKAGES): TARGET_DIR=$(BUILD_TARGET_DIR)
+target-finalize: TARGET_DIR=$(FINAL_TARGET_DIR)
+
 target-finalize: $(PACKAGES)
 	@$(call MESSAGE,"Finalizing target directory")
+	$(Q)rm -rf $(TARGET_DIR)
+	$(Q)cp -a $(BUILD_TARGET_DIR) $(TARGET_DIR)
+	$(Q)rm -f $(TARGET_DIR_WARNING_FILE)
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
diff --git a/fs/common.mk b/fs/common.mk
index d3733b5..197bee4 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -36,6 +36,7 @@ USERS_TABLE = $(FS_DIR)/users_table.txt
 ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 
 .PHONY: rootfs-common
+rootfs-common: TARGET_DIR=$(FINAL_TARGET_DIR)
 rootfs-common: target-finalize
 	mkdir -p "$(FS_DIR)"
 	rm -f $(FAKEROOT_SCRIPT)
@@ -91,14 +92,13 @@ endif
 
 ROOTFS_$(2)_FAKEROOT_SCRIPT = $$(FS_DIR)/fakeroot.$(1)
 
+$$(BINARIES_DIR)/rootfs.$(1): TARGET_DIR=$(FINAL_TARGET_DIR)
 $$(BINARIES_DIR)/rootfs.$(1): rootfs-common $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
 	$$(INSTALL) -D -m 0755 $$(FAKEROOT_SCRIPT) $$(ROOTFS_$(2)_FAKEROOT_SCRIPT)
 	echo "$$(ROOTFS_$(2)_CMD)" >> $$(ROOTFS_$(2)_FAKEROOT_SCRIPT)
-	rm -f $$(TARGET_DIR_WARNING_FILE)
 	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(ROOTFS_$(2)_FAKEROOT_SCRIPT)
-	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
 	PATH=$$(BR_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
 endif
-- 
1.9.1
