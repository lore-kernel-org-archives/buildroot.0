From: Tal Shorer <tal.shorer@gmail.com>
Date: Mon, 12 Dec 2016 19:09:19 +0200
Subject: [Buildroot] [PATCH v2 2/2] package: linux-tools: add usbip
In-Reply-To: <1481562559-12526-1-git-send-email-tal.shorer@gmail.com>
References: <CAFDyS3PkxwNSVxDRoK5Fe7fU+RxMrc126rUYYY9cGQXPrKSzBg@mail.gmail.com>
 <1481562559-12526-1-git-send-email-tal.shorer@gmail.com>
Message-ID: <1481562559-12526-2-git-send-email-tal.shorer@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

add the usbip package from the kernel source, allowing users to share
usb devices over a network connection

Signed-off-by: Tal Shorer <tal.shorer@gmail.com>
---
 package/linux-tools/Config.in           |  7 ++++++
 package/linux-tools/linux-tool-usbip.mk | 42 +++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-usbip.mk

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index db9ed9f..83b5ee0 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -83,4 +83,11 @@ comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 
+config BR2_PACKAGE_LINUX_TOOLS_USBIP
+	bool"usbip"
+	select BR2_PACKAGE_LINUX_TOOLS
+	help
+	  usbip is a set of tools that allows machines to share their
+	  usb devices over the network, to be driven by a remote client.
+
 endmenu
diff --git a/package/linux-tools/linux-tool-usbip.mk b/package/linux-tools/linux-tool-usbip.mk
new file mode 100644
index 0000000..1ec01b5
--- /dev/null
+++ b/package/linux-tools/linux-tool-usbip.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# usbip
+#
+################################################################################
+
+LINUX_TOOLS += usbip
+
+USBIP_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
+
+USBIP_DIR = $(wildcard \
+  $(LINUX_DIR)/tools/usb/usbip \
+  $(LINUX_DIR)/drivers/staging/usbip/userspace)
+
+define USBIP_CONFIGURE_CMDS
+	$(Q)if ! [[ -d $(USBIP_DIR) ]] >/dev/null 2>&1 ; then \
+		echo "Your kernel version is too old and does not have usbip." ; \
+		echo "At least kernel 3.0 must be used." ; \
+		exit 1 ; \
+	fi
+	cd $(USBIP_DIR) && $(AUTORECONF) && \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_ARGS) \
+	./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=$(TARGET_DIR)/usr \
+		$(SHARED_STATIC_LIBS_OPTS)
+
+endef
+
+define USBIP_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(USBIP_DIR) $(USBIP_MAKE_OPTS)
+endef
+
+define USBIP_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(USBIP_DIR) \
+		$(USBIP_MAKE_OPTS) \
+		INSTALL_ROOT=$(TARGET_DIR) \
+		install
+endef
-- 
2.7.4
