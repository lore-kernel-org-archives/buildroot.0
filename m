From: Jens Scheidemann <nobodyman@gmx.de>
Date: Sat, 10 Mar 2018 21:39:50 +0100
Subject: [Buildroot] [PATCH 1/5] New package golang-embed
Message-ID: <1520714394-2918-1-git-send-email-nobodyman@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is needed for example to compile gosdm630.

Signed-off-by: Jens Scheidemann <nobodyman@gmx.de>
---
 package/golang-embed/Config.in.host  |  7 +++++++
 package/golang-embed/golang-embed.mk | 24 ++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 package/golang-embed/Config.in.host
 create mode 100644 package/golang-embed/golang-embed.mk

diff --git a/package/golang-embed/Config.in.host b/package/golang-embed/Config.in.host
new file mode 100644
index 0000000..d9449d0
--- /dev/null
+++ b/package/golang-embed/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_GOLANG_EMBED
+	bool "golang-embed"
+	depends on BR2_PACKAGE_HOST_GOLANG
+	help
+          Static content embedding for Golang.
+
+	  https://github.com/aprice/embed
diff --git a/package/golang-embed/golang-embed.mk b/package/golang-embed/golang-embed.mk
new file mode 100644
index 0000000..49faeb1
--- /dev/null
+++ b/package/golang-embed/golang-embed.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# golang-embed
+#
+################################################################################
+
+GOLANG_EMBED_SITE_METHOD = local
+
+GOLANG_EMBED_DEPENDENCIES = host-go
+
+GOLANG_EMBED_GOPATH = "$(@D)"
+
+GOLANG_EMBED_MAKE_ENV = GOPATH=$(GOLANG_EMBED_GOPATH)
+
+define HOST_GOLANG_EMBED_BUILD_CMDS
+	cd $(@D) && $(GOLANG_EMBED_MAKE_ENV) $(HOST_DIR)/bin/go get github.com/aprice/embed/cmd/embed
+endef
+
+define HOST_GOLANG_EMBED_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(GOLANG_EMBED_GOPATH)/bin/embed $(HOST_GO_ROOT)/bin/embed
+	ln -sf ../lib/go/bin/embed $(HOST_DIR)/bin
+endef
+
+$(eval $(host-generic-package))
-- 
2.7.4
