From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Aug 2020 16:56:30 +0200
Subject: [Buildroot] [git commit] linux: run depmod only if modules
 directory exists
Message-ID: <20200829144904.1173083F7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=532fe9fb5788b0b2a2f25b2fd72e63f7c8c490d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the modules directory that corresponds to the version of the kernel
being built has been deleted, don't try to run depmod, which will
obviously fail.

This can happen for instance when the modules are stripped from the main
root filesystem, and placed into a separate filesystem image, so that
the root filesystem and the kernel can be updated separately.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 20c268b2f7..372fa51c72 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -491,7 +491,8 @@ endef
 # Run depmod in a target-finalize hook, to encompass modules installed by
 # packages.
 define LINUX_RUN_DEPMOD
-	if grep -q "CONFIG_MODULES=y" $(LINUX_DIR)/.config; then \
+	if test -d $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED) \
+		&& grep -q "CONFIG_MODULES=y" $(LINUX_DIR)/.config; then \
 		$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED); \
 	fi
 endef
