From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 19:42:26 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] linux: run depmod only if
 modules directory exists
Message-ID: <20200829173720.6CC8386A94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=332e245792a1f54a17e75c2bc3646ddd712d3a73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

If the modules directory that corresponds to the version of the kernel
being built has been deleted, don't try to run depmod, which will
obviously fail.

This can happen for instance when the modules are stripped from the main
root filesystem, and placed into a separate filesystem image, so that
the root filesystem and the kernel can be updated separately.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 532fe9fb5788b0b2a2f25b2fd72e63f7c8c490d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index c963f2f47f..010ed3497e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -532,7 +532,8 @@ endef
 # Run depmod in a target-finalize hook, to encompass modules installed by
 # packages.
 define LINUX_RUN_DEPMOD
-	if grep -q "CONFIG_MODULES=y" $(LINUX_DIR)/.config; then \
+	if test -d $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED) \
+		&& grep -q "CONFIG_MODULES=y" $(LINUX_DIR)/.config; then \
 		$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED); \
 	fi
 endef
