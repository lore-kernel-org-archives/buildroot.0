From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Oct 2011 09:16:47 -0300
Subject: [Buildroot] [PATCHv2] ocf: new package
Message-ID: <1319199407-27477-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the OCF package and linux kernel extension.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/Config.ext.in    |    7 +++++++
 linux/linux-ext-ocf.mk |   21 +++++++++++++++++++++
 package/Config.in      |    1 +
 package/ocf/Config.in  |   12 ++++++++++++
 package/ocf/ocf.mk     |   30 ++++++++++++++++++++++++++++++
 5 files changed, 71 insertions(+), 0 deletions(-)
 create mode 100644 linux/linux-ext-ocf.mk
 create mode 100644 package/ocf/Config.in
 create mode 100644 package/ocf/ocf.mk

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 8a9f87e..dd26399 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -15,6 +15,13 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
 	  Download it at http://download.gna.org/adeos/patches/v2.6/$(ARCH)/
 	  and verify that your kernel version in buildroot matches.
 
+# OCF
+config BR2_LINUX_KERNEL_EXT_OCF
+	bool "Open Cryptographic Framework (OCF)"
+	select BR2_PACKAGE_OCF
+	help
+	  OCF Kernel part.
+
 # RTAI
 config BR2_LINUX_KERNEL_EXT_RTAI
        bool "RTAI Real-time patch"
diff --git a/linux/linux-ext-ocf.mk b/linux/linux-ext-ocf.mk
new file mode 100644
index 0000000..d31d77d
--- /dev/null
+++ b/linux/linux-ext-ocf.mk
@@ -0,0 +1,21 @@
+##################################################
+# Linux OCF extension
+#
+# Patch the linux kernel with OCF
+##################################################
+
+ifeq ($(BR2_LINUX_KERNEL_EXT_OCF),y)
+LINUX_DEPENDENCIES += ocf
+
+# Prepare kernel patch
+# The linux-2.6.38.patch is just the main inclusion, most of the code
+# resides in the ocf/ subdir.
+define OCF_PREPARE_KERNEL
+	support/scripts/apply-patches.sh $(LINUX_DIR) \
+		$(OCF_DIR)/patches/ linux-2.6.38-ocf.patch ; \
+	cp -rf $(OCF_DIR)/ocf $(LINUX_DIR)/crypto/ocf ;
+endef
+
+LINUX_PRE_PATCH_HOOKS += OCF_PREPARE_KERNEL
+
+endif #BR2_LINUX_EXT_OCF
diff --git a/package/Config.in b/package/Config.in
index c0ac493..4f2f41d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -250,6 +250,7 @@ source "package/gnutls/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
 source "package/libnss/Config.in"
+source "package/ocf/Config.in"
 source "package/openssl/Config.in"
 endmenu
 
diff --git a/package/ocf/Config.in b/package/ocf/Config.in
new file mode 100644
index 0000000..4cdb5c3
--- /dev/null
+++ b/package/ocf/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_OCF
+	bool "ocf"
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
diff --git a/package/ocf/ocf.mk b/package/ocf/ocf.mk
new file mode 100644
index 0000000..1ba01cf
--- /dev/null
+++ b/package/ocf/ocf.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# ocf
+#
+#############################################################
+
+OCF_VERSION = 20110720
+OCF_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ocf-linux
+OCF_SOURCE = ocf-linux-$(OCF_VERSION).tar.gz
+OCF_INSTALL_STAGING = YES
+
+define OCF_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 644 $(@D)/ocf/cryptodev.h \
+		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
+endef
+
+define OCF_UNINSTALL_STAGING_CMDS
+	rm -f $(STAGING_DIR)/usr/include/crypto/cryptodev.h
+endef
+
+define OCF_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 644 $(@D)/ocf/cryptodev.h \
+		$(TARGET_DIR)/usr/include/crypto/cryptodev.h
+endef
+
+define OCF_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/include/crypto/cryptodev.h
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.3.4
