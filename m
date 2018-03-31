From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 20:53:06 +0200
Subject: [Buildroot] [git commit] fs: introduce per-rootfs TARGET_DIR
 variable
Message-ID: <20180331185352.280FF84BBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6e425729e5db04676df4e81cf4d48bafefb0942
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... which for now still points to the base target directory, but this is
a step forward.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile     | 4 +++-
 fs/common.mk | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6cfe83072e..b34dd78c73 100644
--- a/Makefile
+++ b/Makefile
@@ -215,8 +215,10 @@ BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
 
 BUILD_DIR := $(BASE_DIR)/build
 BINARIES_DIR := $(BASE_DIR)/images
+# The target directory is common to all packages,
+# but there is one that is specific to each filesystem.
 BASE_TARGET_DIR := $(BASE_DIR)/target
-TARGET_DIR = $(BASE_TARGET_DIR)
+TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(BASE_TARGET_DIR))
 # initial definition so that 'make clean' works for most users, even without
 # .config. HOST_DIR will be overwritten later when .config is included.
 HOST_DIR := $(BASE_DIR)/host
diff --git a/fs/common.mk b/fs/common.mk
index ab42beb7be..22e18d1eff 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -39,6 +39,7 @@ ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 define inner-rootfs
 
 ROOTFS_$(2)_DIR = $$(FS_DIR)/$(1)
+ROOTFS_$(2)_TARGET_DIR = $$(BASE_TARGET_DIR)
 
 # extra deps
 ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
