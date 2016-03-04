From: Geoff Levand <geoff@infradead.org>
Date: Fri, 04 Mar 2016 18:22:15 +0000
Subject: [Buildroot] [PATCH v2 1/3] go-bootstrap: new host package
In-Reply-To: <cover.1457115561.git.geoff@infradead.org>
References: <cover.1457115561.git.geoff@infradead.org>
Message-ID: <7ebd708e6690bf169298057a02fef3e1666ef40f.1457115561.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new package go-bootstrap which builds a bootstrap compiler for the
go programming language.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/go-bootstrap/go-bootstrap.hash |  2 ++
 package/go-bootstrap/go-bootstrap.mk   | 38 ++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 package/go-bootstrap/go-bootstrap.hash
 create mode 100644 package/go-bootstrap/go-bootstrap.mk

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
index 0000000..ccb932d
--- /dev/null
+++ b/package/go-bootstrap/go-bootstrap.mk
@@ -0,0 +1,38 @@
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
+	cp -a $(@D)/pkg $(GO_BOOTSTRAP_FINAL)/
+
+	# There is a known issue which requires the go sources to be installed
+	# https://golang.org/issue/2775
+	cp -a $(@D)/src $(GO_BOOTSTRAP_FINAL)/
+endef
+
+$(eval $(host-generic-package))
-- 
2.5.0
