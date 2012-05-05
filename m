From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  5 May 2012 10:30:23 -0300
Subject: [Buildroot] [PATCHv2 1/2] ocf-linux: new package
Message-ID: <1336224624-32528-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the ocf-linux package and linux kernel extension.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/Config.ext.in            |   12 ++++++++++++
 linux/linux-ext-ocf-linux.mk   |   23 +++++++++++++++++++++++
 package/Config.in              |    1 +
 package/ocf-linux/Config.in    |   12 ++++++++++++
 package/ocf-linux/ocf-linux.mk |   21 +++++++++++++++++++++
 5 files changed, 69 insertions(+), 0 deletions(-)
 create mode 100644 linux/linux-ext-ocf-linux.mk
 create mode 100644 package/ocf-linux/Config.in
 create mode 100644 package/ocf-linux/ocf-linux.mk

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 172fa76..a68cbe9 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -23,6 +23,18 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
 	  Download it at http://download.gna.org/adeos/patches/v2.6/$(ARCH)/
 	  and verify that your kernel version in buildroot matches.
 
+# ocf-linux
+config BR2_LINUX_KERNEL_EXT_OCF_LINUX
+	bool "Open Cryptographic Framework (OCF)"
+	select BR2_PACKAGE_OCF_LINUX
+	help
+	  OCF-Linux Kernel part.
+
+	  Select this option to patch your kernel with OCF for
+	  hardware-accelerated crypto support for available drivers.
+	  Some libraries need to also have OCF enabled for them,
+	  for example OpenSSL.
+
 # RTAI
 config BR2_LINUX_KERNEL_EXT_RTAI
        bool "RTAI Real-time patch"
diff --git a/linux/linux-ext-ocf-linux.mk b/linux/linux-ext-ocf-linux.mk
new file mode 100644
index 0000000..faf7360
--- /dev/null
+++ b/linux/linux-ext-ocf-linux.mk
@@ -0,0 +1,23 @@
+##################################################
+# Linux OCF extension
+#
+# Patch the linux kernel with OCF
+##################################################
+
+ifeq ($(BR2_LINUX_KERNEL_EXT_OCF_LINUX),y)
+LINUX_DEPENDENCIES += ocf-linux
+
+# Prepare kernel patch
+# The linux-3.2.1.patch is just the main inclusion, most of the code
+# resides in the ocf/ subdir.
+# It works for older kernel versions.
+# Run tested from 2.6.38+ and build tested from 2.6.35+
+define OCF_LINUX_PREPARE_KERNEL
+	support/scripts/apply-patches.sh $(LINUX_DIR) \
+		$(OCF_LINUX_DIR)/patches/ linux-3.2.1-ocf.patch ; \
+	cp -rf $(OCF_LINUX_DIR)/ocf $(LINUX_DIR)/crypto/ocf ;
+endef
+
+LINUX_PRE_PATCH_HOOKS += OCF_LINUX_PREPARE_KERNEL
+
+endif #BR2_LINUX_EXT_OCF_LINUX
diff --git a/package/Config.in b/package/Config.in
index 70fc6f0..7116202 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -299,6 +299,7 @@ source "package/gnutls/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
 source "package/libnss/Config.in"
+source "package/ocf-linux/Config.in"
 source "package/openssl/Config.in"
 source "package/polarssl/Config.in"
 endmenu
diff --git a/package/ocf-linux/Config.in b/package/ocf-linux/Config.in
new file mode 100644
index 0000000..9dc5766
--- /dev/null
+++ b/package/ocf-linux/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_OCF_LINUX
+	bool "ocf-linux"
+	help
+	  OCF-Linux is a Linux port of the OpenBSD/FreeBSD Cryptographic
+	  Framework (OCF). This port aims to bring full asynchronous HW/SW
+	  crypto acceleration to the Linux kernel and applications
+	  running under Linux.
+
+	  You need to enable the OCF linux kernel extension or provide
+	  a prepatched kernel to make this option useful.
+
+	  http://ocf-linux.sourceforge.net/
diff --git a/package/ocf-linux/ocf-linux.mk b/package/ocf-linux/ocf-linux.mk
new file mode 100644
index 0000000..e615225
--- /dev/null
+++ b/package/ocf-linux/ocf-linux.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# ocf-linux
+#
+#############################################################
+
+OCF_LINUX_VERSION = 20120127
+OCF_LINUX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/ocf-linux/ocf-linux/$(OCF_LINUX_VERSION)
+OCF_LINUX_INSTALL_STAGING = YES
+
+define OCF_LINUX_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 644 $(@D)/ocf/cryptodev.h \
+		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
+endef
+
+define OCF_LINUX_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 644 $(@D)/ocf/cryptodev.h \
+		$(TARGET_DIR)/usr/include/crypto/cryptodev.h
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.3.4
