From: Ludovic Guegan <ludovic.guegan@gmail.com>
Date: Tue,  2 Feb 2016 00:30:59 +0100
Subject: [Buildroot] [PATCH 2/8 RFC] package/golang-gb: create gb package to
	build and fetch go packages
In-Reply-To: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
References: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
Message-ID: <1454369465-4804-3-git-send-email-ludovic.guegan@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ludovic Guegan <ludovic.guegan@gmail.com>
---
 package/Config.in.host           |  1 +
 package/golang-gb/Config.in.host |  8 ++++++++
 package/golang-gb/golang-gb.mk   | 30 ++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 package/golang-gb/Config.in.host
 create mode 100644 package/golang-gb/golang-gb.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 0625bd0..2d99d37 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -13,6 +13,7 @@ menu "Host utilities"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
 	source "package/golang/Config.in.host"
+	source "package/golang-gb/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jq/Config.in.host"
diff --git a/package/golang-gb/Config.in.host b/package/golang-gb/Config.in.host
new file mode 100644
index 0000000..b84a83f
--- /dev/null
+++ b/package/golang-gb/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_GOLANG_GB
+	bool "golang-gb"
+	depends on BR2_PACKAGE_HOST_GOLANG
+	help
+          gb is an alternative build tool for the Go programming language.
+
+	  https://getgb.io
+
diff --git a/package/golang-gb/golang-gb.mk b/package/golang-gb/golang-gb.mk
new file mode 100644
index 0000000..9ae9da7
--- /dev/null
+++ b/package/golang-gb/golang-gb.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# golang-gb
+#
+################################################################################
+
+GOLANG_GB_VERSION = 0.4.0
+GOLANG_GB_TAG = v$(GOLANG_GB_VERSION)
+GOLANG_GB_SITE = $(call github,constabulary,gb,$(GOLANG_GB_TAG))
+GOLANG_GB_LICENSE = MIT
+
+GOLANG_GB_ENV = GOPATH=$(@D)
+
+define HOST_GOLANG_GB_EXTRACT_CMDS
+	mkdir -p $(@D)/src/github.com/constabulary
+	tar xvaf $(DL_DIR)/golang-gb-$(GOLANG_GB_VERSION).tar.gz -C $(@D)
+	mv $(@D)/gb-$(GOLANG_GB_VERSION) $(@D)/src/github.com/constabulary/gb
+endef
+
+define HOST_GOLANG_GB_BUILD_CMDS
+	env -i $(GOLANG_GB_ENV) $(GO_HOST_BINARY) install -v github.com/constabulary/gb/cmd/gb
+	env -i $(GOLANG_GB_ENV) $(GO_HOST_BINARY) install -v github.com/constabulary/gb/cmd/gb-vendor
+endef
+
+define HOST_GOLANG_GB_INSTALL_CMDS
+	$(INSTALL) -m 755 $(@D)/bin/gb $(HOST_DIR)/usr/bin
+	$(INSTALL) -m 755 $(@D)/bin/gb-vendor $(HOST_DIR)/usr/bin
+endef
+
+$(eval $(host-generic-package))
-- 
2.7.0
