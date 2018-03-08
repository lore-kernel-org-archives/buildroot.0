From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  8 Mar 2018 22:15:29 +0100
Subject: [Buildroot] [PATCH 05/15 v3] fs: set per-rootfs variable name
In-Reply-To: <cover.1520543724.git.yann.morin.1998@free.fr>
References: <cover.1520543724.git.yann.morin.1998@free.fr>
Message-ID: <e938c5e1988d895c1fc86818bd545341a7e14e79.1520543724.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like we do for packages with the PKG variable, set ROOTFS to contain the
upper-case name of the rootfs currently being generated.

This will be usefull in later patches, when we need more per-rootfs
variables, like a per-rootfs TARGET_DIR for example.

In Makefiles, per-rule variables trickle down the dependency chain, to
all dependencies of that rule, so we have to stop ROOTFS as soone as
we're not in a rootfs. This means we have to stop it at target-finalize
(which is a dependency of all filesystems), and for each package
individually, since some packages (host or target) can be direct
dependencies of filesystems as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile               | 3 +++
 fs/common.mk           | 3 +++
 package/pkg-generic.mk | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/Makefile b/Makefile
index 1c451eca45..439aaa9cb0 100644
--- a/Makefile
+++ b/Makefile
@@ -693,6 +693,9 @@ endif
 
 $(TARGETS_ROOTFS): target-finalize
 
+# Avoid the rootfs name leaking down the dependency chain
+target-finalize: ROOTFS=
+
 .PHONY: target-finalize
 target-finalize: $(PACKAGES)
 	@$(call MESSAGE,"Finalizing target directory")
diff --git a/fs/common.mk b/fs/common.mk
index 274a3e9c7b..af6799bb83 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -39,6 +39,8 @@ ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 # all variable references except the arguments must be $$-quoted.
 define inner-rootfs
 
+ROOTFS_$(2)_NAME = $(1)
+
 # extra deps
 ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
 	$$(if $$(PACKAGES_USERS)$$(ROOTFS_USERS_TABLES),host-mkpasswd)
@@ -72,6 +74,7 @@ ROOTFS_$(2)_COMPRESS_EXT = .xz
 ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
 endif
 
+$$(BINARIES_DIR)/rootfs.$(1): ROOTFS=$(2)
 $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	rm -rf $(FS_DIR)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9eddaeee57..1a637ea288 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -411,6 +411,10 @@ endef
 
 define inner-generic-package
 
+# When doing a package, we're definitely not doing a rootfs, but we
+# may inherit it via the dependency chain, so we reset it.
+$(1): ROOTFS=
+
 # Ensure the package is only declared once, i.e. do not accept that a
 # package be re-defined by a br2-external tree
 ifneq ($(call strip,$(filter $(1),$(PACKAGES_ALL))),)
-- 
2.14.1
