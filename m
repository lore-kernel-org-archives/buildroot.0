From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Mar 2012 16:03:12 +0100
Subject: [Buildroot] [git commit] kmod: add option to install module
	utilities
Message-ID: <20120322150326.7CEA39693E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=78f5ac2908b30aa6f67583a355e058d6703755ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And ensure optional zlib+xz dependencies gets picked up.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/Config.in |    6 ++++++
 package/kmod/kmod.mk   |   26 ++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/kmod/Config.in b/package/kmod/Config.in
index c5e8ca8..6fdd92c 100644
--- a/package/kmod/Config.in
+++ b/package/kmod/Config.in
@@ -4,3 +4,9 @@ config BR2_PACKAGE_KMOD
 	  handle kernel modules
 
 	  http://git.kernel.org/?p=utils/kernel/kmod/kmod.git
+
+config BR2_PACKAGE_KMOD_TOOLS
+	bool "kmod utilities"
+	help
+	  Install kmod module utilities (depmod, insmod, lsmod,
+	  modinfo, modprobe, rmmod).
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index f71087c..55cbdbb 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,4 +4,30 @@ KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
 KMOD_INSTALL_STAGING = YES
 KMOD_DEPENDENCIES = host-pkg-config
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+KMOD_DEPENDENCIES += zlib
+KMOD_CONF_OPT += --with-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+KMOD_DEPENDENCIES += xz
+KMOD_CONF_OPT += --with-xz
+endif
+
+ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
+# take precedence over busybox / module-init-tools implementations
+KMOD_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_BUSYBOX),busybox) \
+	$(if $(BR2_PACKAGE_MODULE_INIT_TOOLS),module-init-tools)
+
+define KMOD_INSTALL_TOOLS
+	for i in depmod insmod lsmod modinfo modprobe rmmod; \
+	do ln -sf ../usr/bin/kmod $(TARGET_DIR)/sbin/$$i; done
+endef
+
+KMOD_POST_INSTALL_TARGET_HOOKS += KMOD_INSTALL_TOOLS
+else
+KMOD_CONF_OPT += --disable-tools
+endif
+
 $(eval $(call AUTOTARGETS))
