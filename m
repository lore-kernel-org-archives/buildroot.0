From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  7 Jul 2013 20:43:43 +0200
Subject: [Buildroot] [PATCH 1/3] infra: make possible to run 'make
	*-menuconfig' from a clean output dir
Message-ID: <1373222625-9013-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes #5678

This patch allows to run:

$ make clean menuconfig
$ make {barebox,busybox,ctng,linux,uclibc}-menuconfig

with ccache enabled or not.

This patch introduce a new make variable BASE_PKGS for packages like
host-ccache that need to be handled beforehand.

These packages are added to the dependency list of any packages, except
for those from the BASE_PKGS list.

This also implies that if there are some dependency relationships between
two packages from the BASE_PKGS list, then these dependencies should be
manually handled.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 Makefile               | 6 ++++--
 package/pkg-generic.mk | 3 +++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 955e684..015fbdf 100644
--- a/Makefile
+++ b/Makefile
@@ -220,7 +220,7 @@ GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
 ################################################################################
 
 ifeq ($(BR2_CCACHE),y)
-BASE_TARGETS += host-ccache
+BASE_PKGS += host-ccache
 endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
@@ -361,7 +361,7 @@ include fs/common.mk
 TARGETS+=target-post-image
 
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
-TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
+TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS) $(BASE_PKGS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
 TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS))
 
@@ -397,6 +397,8 @@ $(BASE_TARGETS): dirs $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BUILDROOT_CONFIG)
 	$(MAKE) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
 
+BASE_TARGETS += $(BASE_PKGS)
+
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 toolchain: prepare dirs dependencies $(BASE_TARGETS)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 668f011..282ce99 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -303,6 +303,9 @@ $(2)_REDISTRIBUTE		?= YES
 
 
 $(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+ifeq ($(filter $(1),$(BASE_PKGS)),)
+$(2)_DEPENDENCIES += $(BASE_PKGS)
+endif
 
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
-- 
1.8.3.2
