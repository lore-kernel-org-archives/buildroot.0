From: Jens Scheidemann <nobodyman@gmx.de>
Date: Sat, 10 Mar 2018 21:39:51 +0100
Subject: [Buildroot] [PATCH 2/5] New package golang-gb
In-Reply-To: <1520714394-2918-1-git-send-email-nobodyman@gmx.de>
References: <1520714394-2918-1-git-send-email-nobodyman@gmx.de>
Message-ID: <1520714394-2918-2-git-send-email-nobodyman@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is needed for example to compile gosdm630.

Signed-off-by: Jens Scheidemann <nobodyman@gmx.de>
---
 package/golang-gb/Config.in.host |  7 +++++++
 package/golang-gb/golang-gb.mk   | 24 ++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 package/golang-gb/Config.in.host
 create mode 100644 package/golang-gb/golang-gb.mk

diff --git a/package/golang-gb/Config.in.host b/package/golang-gb/Config.in.host
new file mode 100644
index 0000000..663b0ad
--- /dev/null
+++ b/package/golang-gb/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_GOLANG_GB
+	bool "golang-gb"
+	depends on BR2_PACKAGE_HOST_GOLANG
+	help
+          gb is an alternative build tool for the Go programming language.
+
+	  https://getgb.io
diff --git a/package/golang-gb/golang-gb.mk b/package/golang-gb/golang-gb.mk
new file mode 100644
index 0000000..a528ec8
--- /dev/null
+++ b/package/golang-gb/golang-gb.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# golang-gb
+#
+################################################################################
+
+GOLANG_GB_SITE_METHOD = local
+
+GOLANG_GB_DEPENDENCIES = host-go
+
+GOLANG_GB_GOPATH = "$(@D)"
+
+GOLANG_GB_MAKE_ENV = GOPATH=$(GOLANG_GB_GOPATH)
+
+define HOST_GOLANG_GB_BUILD_CMDS
+	cd $(@D) && $(GOLANG_GB_MAKE_ENV) $(HOST_DIR)/bin/go get github.com/constabulary/gb/...
+endef
+
+define HOST_GOLANG_GB_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(GOLANG_GB_GOPATH)/bin/gb $(HOST_GO_ROOT)/bin/gb
+	ln -sf ../lib/go/bin/gb $(HOST_DIR)/bin
+endef
+
+$(eval $(host-generic-package))
-- 
2.7.4
