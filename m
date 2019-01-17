From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Jan 2019 22:38:52 +0100
Subject: [Buildroot] [git commit] Makefile: move definition of TARGET_DIR
 inside .config condition
Message-ID: <20190117213835.817A18434C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a86b626b5b0e3416f2b84c666adf9cb2d00e6596
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In a follow-up commit introducing per-package directory support, we
will need to define TARGET_DIR in a different way depending on the
value of a Config.in option. To make this possible, the definition of
TARGET_DIR should be moved inside the BR2_HAVE_DOT_CONFIG condition.

We have verified that $(TARGET_DIR) is only used within the
BR2_HAVE_DOT_CONFIG condition. Outside of this condition, such as in
the "clean" target, $(BASE_TARGET_DIR) is used.

Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 9f4d037cca..a382a5defb 100644
--- a/Makefile
+++ b/Makefile
@@ -204,10 +204,7 @@ BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
 
 BUILD_DIR := $(BASE_DIR)/build
 BINARIES_DIR := $(BASE_DIR)/images
-# The target directory is common to all packages,
-# but there is one that is specific to each filesystem.
 BASE_TARGET_DIR := $(BASE_DIR)/target
-TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(BASE_TARGET_DIR))
 # initial definition so that 'make clean' works for most users, even without
 # .config. HOST_DIR will be overwritten later when .config is included.
 HOST_DIR := $(BASE_DIR)/host
@@ -457,6 +454,10 @@ TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 # packages compiled for the host go here
 HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
 
+# The target directory is common to all packages,
+# but there is one that is specific to each filesystem.
+TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(BASE_TARGET_DIR))
+
 ifneq ($(HOST_DIR),$(BASE_DIR)/host)
 HOST_DIR_SYMLINK = $(BASE_DIR)/host
 $(HOST_DIR_SYMLINK): $(BASE_DIR)
