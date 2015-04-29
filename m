From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Apr 2015 12:28:19 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix rebuild/reinstall for
	Linaro toolchains
Message-ID: <1430303299-24519-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For Linaro toolchains, a special post install staging hook is used to
create two symlinks needed for the dynamic loader to find the
libraries. However, the way the link is created prevents a 'make
toolchain-external-reinstall' from succeeding, because the symlink
already exists and points to a directory:

ln -sf . /home/thomas/projets/outputs/training/target/lib/arm-linux-gnueabihf
ln: '/home/thomas/projets/outputs/training/target/lib/arm-linux-gnueabihf/.': cannot overwrite directory

This commit adjust the hook to pass the '-n' option so that the link
name is treated as a normal file if it is a symbolic link to a
directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index fd796a0..35bba31 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -239,18 +239,18 @@ endif
 # {/usr,}/lib/arm-linux-gnueabihf, but Buildroot copies them to
 # {/usr,}/lib, so we need to create a symbolic link.
 define TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
-	ln -sf . $(TARGET_DIR)/lib/arm-linux-gnueabihf
-	ln -sf . $(TARGET_DIR)/usr/lib/arm-linux-gnueabihf
+	ln -snf . $(TARGET_DIR)/lib/arm-linux-gnueabihf
+	ln -snf . $(TARGET_DIR)/usr/lib/arm-linux-gnueabihf
 endef
 
 define TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
-	ln -sf . $(TARGET_DIR)/lib/armeb-linux-gnueabihf
-	ln -sf . $(TARGET_DIR)/usr/lib/armeb-linux-gnueabihf
+	ln -snf . $(TARGET_DIR)/lib/armeb-linux-gnueabihf
+	ln -snf . $(TARGET_DIR)/usr/lib/armeb-linux-gnueabihf
 endef
 
 define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
-	ln -sf . $(TARGET_DIR)/lib/aarch64-linux-gnu
-	ln -sf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
+	ln -snf . $(TARGET_DIR)/lib/aarch64-linux-gnu
+	ln -snf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
 endef
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
-- 
2.1.0
