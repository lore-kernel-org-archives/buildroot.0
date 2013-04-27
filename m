From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 27 Apr 2013 17:09:45 -0300
Subject: [Buildroot] [PATCH 2/6] cryptodev-linux: new package
In-Reply-To: <1367093389-23877-1-git-send-email-gustavo@zacarias.com.ar>
References: <1367093389-23877-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1367093389-23877-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cryptodev-linux is an alternative implementation to ocf-linux.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cryptodev-linux/cryptodev-linux.mk | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/cryptodev-linux/cryptodev-linux.mk

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
-- 
1.8.1.5
