From: Tal Shorer <tal.shorer@gmail.com>
Date: Sun, 11 Dec 2016 21:44:42 +0200
Subject: [Buildroot] [PATCH] package/usbip: new package
In-Reply-To: <1481479965-26226-1-git-send-email-tal.shorer@gmail.com>
References: <1481479965-26226-1-git-send-email-tal.shorer@gmail.com>
Message-ID: <1481485482-19671-1-git-send-email-tal.shorer@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

usbip is part of the linux tree, so it should be part of the
linux-tools infra. However, it uses autotools, which are rather
difficult to use in the linux-tools infra.

So we make it a proper, separate autotools package. We only rely on
the kernel to be extracted and use that as the source.

Signed-off-by: Tal Shorer <tal.shorer@gmail.com>

---
Note: in order for the user-friendly error to appear when the source
directory is wrong (depends on a config item, was moved in linux-3.17),
it requires that the patch to fix the hook order in the
rsync command (https://patchwork.ozlabs.org/patch/704859/) goes
in first.
---
 package/linux-tools/Config.in |  2 ++
 package/usbip/Config.in       | 14 ++++++++++++++
 package/usbip/usbip.mk        | 29 +++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 package/usbip/Config.in
 create mode 100644 package/usbip/usbip.mk

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index db9ed9f..7fceca7 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -83,4 +83,6 @@ comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 
+source package/usbip/Config.in
+
 endmenu
diff --git a/package/usbip/Config.in b/package/usbip/Config.in
new file mode 100644
index 0000000..7cd6c29
--- /dev/null
+++ b/package/usbip/Config.in
@@ -0,0 +1,14 @@
+# Prompt in the linux-tools package
+# Here only for the menuconfig; it's a real package
+config BR2_PACKAGE_USBIP
+	bool"usbip"
+	help
+	  usbip is a set of tools that allows machines to share their
+	  usb devices over the network, to be driven by a remote client.
+
+if BR2_PACKAGE_USBIP
+
+config BR2_PACKAGE_USBIP_3_16_OR_EARLIER
+	bool "use old directory path for usbip (Linux kernel <= 3.16)"
+
+endif
diff --git a/package/usbip/usbip.mk b/package/usbip/usbip.mk
new file mode 100644
index 0000000..51c0480
--- /dev/null
+++ b/package/usbip/usbip.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# usbib
+#
+################################################################################
+
+ifeq ($(BR2_PACKAGE_USBIP_3_16_OR_EARLIER),y)
+USBIP_BASE_DIR = drivers/staging/usbip/userspace
+else
+USBIP_BASE_DIR = tools/usb/usbip
+endif
+USBIP_SITE = $(LINUX_DIR)/$(USBIP_BASE_DIR)
+USBIP_SITE_METHOD = local
+USBIP_LICENSE = GPLv2
+USBIP_LICENSE_FILES = COPYING
+USBIP_INSTALL_STAGING = YES
+USBIP_PATCH_DEPENDENCIES = linux
+
+USBIP_AUTORECONF = yes
+
+define USBIP_CHECK_SRC
+	@if [ ! -d $(USBIP_SITE) ]; then \
+	    echo "Your kernel does not have usbip in $(USBIP_BASE_DIR)" >&2; \
+	    exit 1; \
+	fi
+endef
+USBIP_PRE_RSYNC_HOOKS += USBIP_CHECK_SRC
+
+$(eval $(autotools-package))
-- 
2.7.4
