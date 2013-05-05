From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 May 2013 22:59:37 +0200
Subject: [Buildroot] [git commit] cryptodev-linux: new package
Message-ID: <20130505210147.890A399B60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c2d3183e2e75bd21bc4b7377e76be74ce6e1432
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cryptodev-linux is an alternative implementation to ocf-linux.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cryptodev-linux/cryptodev-linux.mk |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
new file mode 100644
index 0000000..1a78228
--- /dev/null
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# cryptodev-linux
+#
+#############################################################
+
+CRYPTODEV_LINUX_VERSION = 1.6
+CRYPTODEV_LINUX_SITE = http://download.gna.org/cryptodev-linux
+CRYPTODEV_LINUX_DEPENDENCIES = linux
+CRYPTODEV_LINUX_INSTALL_STAGING = YES
+CRYPTODEV_LICENSE = GPLv2+
+CRYPTODEV_LICENSE_FILES = COPYING
+
+define CRYPTODEV_LINUX_BUILD_CMDS
+	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_DIR=$(LINUX_DIR)
+endef
+
+define CRYPTODEV_LINUX_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_DIR=$(LINUX_DIR) \
+		PREFIX=$(TARGET_DIR) modules_install
+endef
+
+define CRYPTODEV_LINUX_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 644 $(@D)/crypto/cryptodev.h \
+		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
+endef
+
+$(eval $(generic-package))
