From: Geoff Levand <geoff@infradead.org>
Date: Wed, 02 Mar 2016 19:23:33 +0000
Subject: [Buildroot] [PATCH 1/4] Add package go-bootstrap
In-Reply-To: <cover.1456946494.git.geoff@infradead.org>
References: <cover.1456946494.git.geoff@infradead.org>
Message-ID: <a316e4d5ff70594e8f4cccbb819ebf6d9a32e958.1456946494.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new package go-bootstrap which builds a bootstrap compiler for the
go programming language.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/Config.in.host                 |  1 +
 package/go-bootstrap/Config.in.host    |  6 ++++++
 package/go-bootstrap/go-bootstrap.hash |  2 ++
 package/go-bootstrap/go-bootstrap.mk   | 36 ++++++++++++++++++++++++++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 package/go-bootstrap/Config.in.host
 create mode 100644 package/go-bootstrap/go-bootstrap.hash
 create mode 100644 package/go-bootstrap/go-bootstrap.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 1c691a3..7cacef9 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -13,6 +13,7 @@ menu "Host utilities"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
+	source "package/go-bootstrap/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jq/Config.in.host"
diff --git a/package/go-bootstrap/Config.in.host b/package/go-bootstrap/Config.in.host
new file mode 100644
index 0000000..99cca79
--- /dev/null
+++ b/package/go-bootstrap/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_GO_BOOTSTRAP
+	bool
+	help
+	  Bootstrap compiler needed to build go1.5 and later versions.
+
+	  https://golang.org
diff --git a/package/go-bootstrap/go-bootstrap.hash b/package/go-bootstrap/go-bootstrap.hash
new file mode 100644
index 0000000..1d0566a
--- /dev/null
+++ b/package/go-bootstrap/go-bootstrap.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 299a6fd8f8adfdce15bc06bde926e7b252ae8e24dd5b16b7d8791ed79e7b5e9b go1.4.2.src.tar.gz
diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
new file mode 100644
index 0000000..464f95e
--- /dev/null
+++ b/package/go-bootstrap/go-bootstrap.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# go-bootstrap
+#
+################################################################################
+
+GO_BOOTSTRAP_VERSION = 1.4.2
+GO_BOOTSTRAP_SITE = https://storage.googleapis.com/golang
+GO_BOOTSTRAP_SOURCE = go$(GO_BOOTSTRAP_VERSION).src.tar.gz
+
+GO_BOOTSTRAP_LICENSE = BSD-3c
+GO_BOOTSTRAP_LICENSE_FILES = LICENSE
+
+GO_BOOTSTRAP_FINAL = $(HOST_DIR)/usr/lib/go-$(GO_BOOTSTRAP_VERSION)
+
+GO_BOOTSTRAP_MAKE_ENV = \
+	GOOS=linux \
+	GOROOT_FINAL="$(GO_BOOTSTRAP_FINAL)" \
+	GOROOT="$(@D)" \
+	GOBIN="$(@D)/bin"
+
+define HOST_GO_BOOTSTRAP_BUILD_CMDS
+	cd $(@D)/src && $(GO_BOOTSTRAP_MAKE_ENV) ./make.bash
+endef
+
+define HOST_GO_BOOTSTRAP_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/go $(GO_BOOTSTRAP_FINAL)/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(GO_BOOTSTRAP_FINAL)/bin/gofmt
+
+	cp -a $(@D)/lib $(GO_BOOTSTRAP_FINAL)/
+	cp -a $(@D)/src $(GO_BOOTSTRAP_FINAL)/
+	cp -a $(@D)/pkg $(GO_BOOTSTRAP_FINAL)/
+	chmod -R +x $(GO_BOOTSTRAP_FINAL)/pkg/tool
+endef
+
+$(eval $(host-generic-package))
-- 
2.5.0
