From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 22:28:43 +0200
Subject: [Buildroot] [git commit] go-bootstrap: new host package
Message-ID: <20160420210351.685F581E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7bc687e7d2b8ef7afd74d4d35c45e2a16f28513
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new package go-bootstrap which builds a bootstrap compiler for the
go programming language.

Signed-off-by: Geoff Levand <geoff@infradead.org>
[Thomas:
 - Rename GO_BOOTSTRAP_FINAL to HOST_GO_BOOTSTRAP_ROOT. Use the HOST_
   prefix because this variable is specific to the host variant. And
   it's not "final" at all, but rather the "root" of the Go Bootstrap
   installation.
 - Rename GO_BOOTSTRAP_MAKE_ENV to HOST_GO_BOOTSTRAP_MAKE_ENV, also to
   have the HOST_ prefix because it's a host package.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/go-bootstrap/go-bootstrap.hash |  2 ++
 package/go-bootstrap/go-bootstrap.mk   | 38 ++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

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
index 0000000..e404cb6
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
+HOST_GO_BOOTSTRAP_ROOT = $(HOST_DIR)/usr/lib/go-$(GO_BOOTSTRAP_VERSION)
+
+HOST_GO_BOOTSTRAP_MAKE_ENV = \
+	GOOS=linux \
+	GOROOT_FINAL="$(HOST_GO_BOOTSTRAP_ROOT)" \
+	GOROOT="$(@D)" \
+	GOBIN="$(@D)/bin"
+
+define HOST_GO_BOOTSTRAP_BUILD_CMDS
+	cd $(@D)/src && $(HOST_GO_BOOTSTRAP_MAKE_ENV) ./make.bash
+endef
+
+define HOST_GO_BOOTSTRAP_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_BOOTSTRAP_ROOT)/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_BOOTSTRAP_ROOT)/bin/gofmt
+
+	cp -a $(@D)/lib $(HOST_GO_BOOTSTRAP_ROOT)/
+	cp -a $(@D)/pkg $(HOST_GO_BOOTSTRAP_ROOT)/
+
+	# There is a known issue which requires the go sources to be installed
+	# https://golang.org/issue/2775
+	cp -a $(@D)/src $(HOST_GO_BOOTSTRAP_ROOT)/
+endef
+
+$(eval $(host-generic-package))
