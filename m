From: Jan Viktorin <viktorin@rehivetech.com>
Date: Mon, 19 Oct 2015 18:24:51 +0200
Subject: [Buildroot] [PATCH 1/4] mkpimage: new host package
In-Reply-To: <1445271894-22553-1-git-send-email-viktorin@rehivetech.com>
References: <1445271894-22553-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <1445271894-22553-2-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tool helps to create a working SPL to boot Altera
SoC FPGA boards.

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 package/mkpimage/mkpimage.mk | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/mkpimage/mkpimage.mk

diff --git a/package/mkpimage/mkpimage.mk b/package/mkpimage/mkpimage.mk
new file mode 100644
index 0000000..e21faf4
--- /dev/null
+++ b/package/mkpimage/mkpimage.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# mkpimage
+#
+################################################################################
+
+MKPIMAGE_VERSION = d64752876a6185853400498d3a43a5e18681cab7
+MKPIMAGE_SITE = $(call github,maximeh,mkpimage,$(MKPIMAGE_VERSION))
+MKPIMAGE_LICENSE = MIT
+
+ifndef HOSTGO
+HOSTGO := go
+HOSTGO := $(shell which $(HOSTGO) || type -p $(HOSTGO) || echo go)
+endif
+
+define HOST_MKPIMAGE_CONFIGURE_CMDS
+	$(MAKE) -C $(@D) GOPATH="$(dir $(HOSTGO))" deps
+endef
+
+define HOST_MKPIMAGE_BUILD_CMDS
+	$(MAKE) -C $(@D) GOPATH="$(dir $(HOSTGO))"
+endef
+
+define HOST_MKPIMAGE_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/mkpimage $(HOST_DIR)/usr/bin/mkpimage
+endef
+
+$(eval $(host-generic-package))
-- 
2.6.1
