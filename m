From: Tal Shorer <tal.shorer@gmail.com>
Date: Tue, 13 Dec 2016 00:21:43 +0200
Subject: [Buildroot] [PATCH v3] usbip: new package
In-Reply-To: <CAFDyS3P=SMKSnoBi5QFR=PrTTsNiOK05yeAEdw7OHVW-D5Z1qA@mail.gmail.com>
References: <CAFDyS3P=SMKSnoBi5QFR=PrTTsNiOK05yeAEdw7OHVW-D5Z1qA@mail.gmail.com>
Message-ID: <1481581303-28490-1-git-send-email-tal.shorer@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

add the usbip package from the kernel source, allowing users to share
usb devices over a network connection

Signed-off-by: Tal Shorer <tal.shorer@gmail.com>
---
 package/linux-tools/Config.in |  2 ++
 package/usbip/Config.in       |  5 +++++
 package/usbip/usbip.mk        | 21 +++++++++++++++++++++
 3 files changed, 28 insertions(+)
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
index 0000000..becc437
--- /dev/null
+++ b/package/usbip/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_USBIP
+	bool"usbip"
+	help
+	  usbip is a set of tools that allows machines to share their
+	  usb devices over the network, to be driven by a remote client.
diff --git a/package/usbip/usbip.mk b/package/usbip/usbip.mk
new file mode 100644
index 0000000..72c5c58
--- /dev/null
+++ b/package/usbip/usbip.mk
@@ -0,0 +1,21 @@
+###############
+# usbip
+###############
+
+# No USBIP_SITE, no USB_VERSION, we vampirise the code from the
+# linux kernel
+USBIP_PATCH_DEPENDENCIES = linux
+
+USBIP_SRC_DIR = $(wildcard \
+  $(LINUX_DIR)/tools/usb/usbip \
+  $(LINUX_DIR)/drivers/staging/usbip/userspace)
+
+define USBIP_EXTRACT_CMDS
+	if [[ -z "$(USBIP_SRC_DIR)" ]]; then \
+	    echo "No usbip source in your kernel tree" 2>&1; \
+	    exit 1; \
+	fi
+	rsync -a $(USBIP_SRC_DIR)/ $(@D)
+endef
+
+$(eval $(autotools-package))
-- 
2.7.4
