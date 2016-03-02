From: Geoff Levand <geoff@infradead.org>
Date: Wed, 02 Mar 2016 19:23:33 +0000
Subject: [Buildroot] [PATCH 3/4] Add go target support
In-Reply-To: <cover.1456946494.git.geoff@infradead.org>
References: <cover.1456946494.git.geoff@infradead.org>
Message-ID: <22da8d19ae88ef56544a26541228319c78ae8dea.1456946494.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the needed bits to build a go compiler for the target.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/Config.in    |  1 +
 package/go/Config.in |  9 +++++++++
 package/go/go.mk     | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 package/go/Config.in

diff --git a/package/Config.in b/package/Config.in
index 529ad33..b9905cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -484,6 +484,7 @@ menu "Erlang libraries/modules"
 endmenu
 endif
 	source "package/gauche/Config.in"
+	source "package/go/Config.in"
 	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
 	source "package/jamvm/Config.in"
diff --git a/package/go/Config.in b/package/go/Config.in
new file mode 100644
index 0000000..69c4644
--- /dev/null
+++ b/package/go/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_GO
+	bool "go"
+	depends on BR2_PACKAGE_GO_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO_BOOTSTRAP
+	help
+	  The Go Programming Language.
+
+	  https://golang.org
+
diff --git a/package/go/go.mk b/package/go/go.mk
index 95168a7..aa354dd 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -70,4 +70,38 @@ define HOST_GO_INSTALL_CMDS
 	chmod -R +x $(GO_HOST_FINAL)/pkg/tool
 endef
 
+GO_DEPENDENCIES = host-go-bootstrap
+GO_FINAL = /usr/lib/go
+
+GO_MAKE_ENV = \
+	GOROOT_BOOTSTRAP=$(GO_BOOTSTRAP) \
+	GOROOT_FINAL=$(GO_FINAL) \
+	GOROOT="$(@D)" \
+	GOBIN="$(@D)/bin" \
+	GOARCH=$(GO_GOARCH) \
+	GOARM=$(GO_GOARM) \
+	GOOS=linux \
+	CGO_ENABLED=0
+
+define GO_BUILD_CMDS
+	cd $(@D)/src && $(GO_MAKE_ENV) ./make.bash
+endef
+
+define GO_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/linux_$(GO_GOARCH)/go $(TARGET_DIR)/$(GO_FINAL)/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/linux_$(GO_GOARCH)/gofmt $(TARGET_DIR)/$(GO_FINAL)/bin/gofmt
+
+	ln -sf $(GO_FINAL)/bin/go $(TARGET_DIR)/usr/bin/
+	ln -sf $(GO_FINAL)/bin/gofmt $(TARGET_DIR)/usr/bin/
+
+	cp -a $(@D)/lib $(TARGET_DIR)/$(GO_FINAL)/
+	cp -a $(@D)/src $(TARGET_DIR)/$(GO_FINAL)/
+
+	mkdir -p $(TARGET_DIR)/$(GO_FINAL)/pkg/tool
+	cp -a $(@D)/pkg/include $(@D)/pkg/linux_$(GO_GOARCH) $(TARGET_DIR)/$(GO_FINAL)/pkg/
+	cp -a $(@D)/pkg/tool/linux_$(GO_GOARCH) $(TARGET_DIR)/$(GO_FINAL)/pkg/tool/
+	chmod -R +x $(TARGET_DIR)/$(GO_FINAL)/pkg/tool
+endef
+
 $(eval $(host-generic-package))
+$(eval $(generic-package))
-- 
2.5.0
