From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Apr 2010 06:02:53 +0200
Subject: [Buildroot] [PATCH 1/6] cramfs: fix installation
In-Reply-To: <cover.1271476803.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271476803.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e5da1b85209d31044af7be529dfd355b836b4fad.1271476803.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The installation procedure of cramfs was broken when
$(HOST_DIR)/usr/bin didn't exist (i.e, cramfsck was installed as
$(HOST_DIR)/usr/bin directly). Use install -D with a proper
destination argument to make it work.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cramfs/cramfs.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 7b1924e..9073ae5 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -16,8 +16,8 @@ define CRAMFS_BUILD_CMDS
 endef
 
 define CRAMFS_INSTALL_TARGET_CMDS
- install -m 755 $(@D)/mkcramfs $(TARGET_DIR)/usr/bin
- install -m 755 $(@D)/cramfsck $(TARGET_DIR)/usr/bin
+ install -D -m 755 $(@D)/mkcramfs $(TARGET_DIR)/usr/bin/mkcramfs
+ install -D -m 755 $(@D)/cramfsck $(TARGET_DIR)/usr/bin/cramfsck
 endef
 
 define HOST_CRAMFS_BUILD_CMDS
@@ -25,8 +25,8 @@ define HOST_CRAMFS_BUILD_CMDS
 endef
 
 define HOST_CRAMFS_INSTALL_CMDS
- install -m 755 $(@D)/mkcramfs $(HOST_DIR)/usr/bin
- install -m 755 $(@D)/cramfsck $(HOST_DIR)/usr/bin
+ install -D -m 755 $(@D)/mkcramfs $(HOST_DIR)/usr/bin/mkcramfs
+ install -D -m 755 $(@D)/cramfsck $(HOST_DIR)/usr/bin/cramfsck
 endef
 
 $(eval $(call GENTARGETS,package,cramfs))
-- 
1.6.3.3
