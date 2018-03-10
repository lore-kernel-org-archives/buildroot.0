From: Jens Scheidemann <nobodyman@gmx.de>
Date: Sat, 10 Mar 2018 21:39:53 +0100
Subject: [Buildroot] [PATCH 4/5] New package gosdm630
In-Reply-To: <1520714394-2918-1-git-send-email-nobodyman@gmx.de>
References: <1520714394-2918-1-git-send-email-nobodyman@gmx.de>
Message-ID: <1520714394-2918-4-git-send-email-nobodyman@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is useful to read data from energy meter SDM630.

Signed-off-by: Jens Scheidemann <nobodyman@gmx.de>
---
 package/gosdm630/Config.in   | 14 ++++++++++++++
 package/gosdm630/gosdm630.mk | 21 +++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 package/gosdm630/Config.in
 create mode 100644 package/gosdm630/gosdm630.mk

diff --git a/package/gosdm630/Config.in b/package/gosdm630/Config.in
new file mode 100644
index 0000000..6f29b3d
--- /dev/null
+++ b/package/gosdm630/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_GOSDM630
+	bool "gosdm630"
+	help
+	  A HTTP interface to MODBUS smart meters
+	  This project provides a http interface to smart meters
+	  with a MODBUS interface. Beside the EASTRON SDM series,
+	  the software also supports the Janitza B23 DIN-rail meters.
+	  The meters provide all measured values over an RS485
+	  connection. The software reads the measurements and wraps
+	  them into a HTTP interface, making it very easy to
+	  integrate it into your home automation system.
+	  Both a REST-style API and a streaming API are available.
+
+	  https://github.com/gonium/gosdm630
diff --git a/package/gosdm630/gosdm630.mk b/package/gosdm630/gosdm630.mk
new file mode 100644
index 0000000..6457bc0
--- /dev/null
+++ b/package/gosdm630/gosdm630.mk
@@ -0,0 +1,21 @@
+GOSDM630_VERSION = 7361b08a6bfe2629863875d4c871867ac0f75285
+GOSDM630_SITE = git://github.com/gonium/gosdm630
+
+GOSDM630_DEPENDENCIES = host-go host-golang-gb host-golang-embed
+
+GOSDM630_GOOS = linux
+GOSDM630_GOARCH = $(GO_GOARCH)
+
+GOSDM630_MAKE_ENV = GOOS=$(GOSDM630_GOOS) \
+        GOARCH=$(GOSDM630_GOARCH) \
+        $(if $(GO_GOARM),GOARM=$(GO_GOARM))
+
+define GOSDM630_BUILD_CMDS
+	cd $(@D) && $(GOSDM630_MAKE_ENV) $(HOST_DIR)/bin/gb build all
+endef
+
+define GOSDM630_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/*-$(GOSDM630_GOOS)-$(GOSDM630_GOARCH) $(TARGET_DIR)/usr/bin
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
