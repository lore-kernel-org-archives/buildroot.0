From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  5 Feb 2018 09:42:27 +0100
Subject: [Buildroot] [PATCH 09/15 v2] fs: introduce per-rootfs TARGET_DIR
 variable
In-Reply-To: <cover.1517820133.git.yann.morin.1998@free.fr>
References: <cover.1517820133.git.yann.morin.1998@free.fr>
Message-ID: <5e0d23322a39f23977469f67e0890be2d41da0cb.1517820133.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... which for now still points to the base target directory, but this is
a step forward.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile     | 4 +++-
 fs/common.mk | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d513d65ccd..2822909aae 100644
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
index cd132cdbc7..363798bb20 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -40,6 +40,7 @@ define inner-rootfs
 
 ROOTFS_$(2)_NAME = $(1)
 ROOTFS_$(2)_DIR = $$(FS_DIR)/$(1)
+ROOTFS_$(2)_TARGET_DIR = $$(BASE_TARGET_DIR)
 
 # extra deps
 ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
-- 
2.14.1
