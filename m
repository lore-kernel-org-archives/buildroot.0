From: Christian Stewart <christian@paral.in>
Date: Sun,  1 May 2016 01:02:27 -0400
Subject: [Buildroot] [PATCH 1/1] runc: new package
Message-ID: <1462078947-7338-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

runC is a CLI tool for spawning and running containers according to the
OCP specification.

runC is used by the latest Docker engine versions, however, runc itself
is standalone and has no other dependencies.

https://runc.io/

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in      |  1 +
 package/runc/Config.in | 12 ++++++++++++
 package/runc/runc.mk   | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 package/runc/Config.in
 create mode 100644 package/runc/runc.mk

diff --git a/package/Config.in b/package/Config.in
index 9d668bf..6c513ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1664,6 +1664,7 @@ endif
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/rsyslog/Config.in"
 endif
+	source "package/runc/Config.in"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
 	source "package/smack/Config.in"
diff --git a/package/runc/Config.in b/package/runc/Config.in
new file mode 100644
index 0000000..b76d827
--- /dev/null
+++ b/package/runc/Config.in
@@ -0,0 +1,12 @@
+comment "runc needs a linux kernel"
+	depends on BR2_USE_MMU
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_RUNC
+	bool "runc"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	help
+    runC is a CLI tool for spawning and running containers
+    according to the OCP specification.
+
+	  https://github.com/opencontainers/runc
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
new file mode 100644
index 0000000..004b556
--- /dev/null
+++ b/package/runc/runc.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# runc
+#
+################################################################################
+
+RUNC_VERSION = v0.1.1
+RUNC_VERSION_COMMIT = baf6536d6259209c3edfa2b22237af82942d3dfa
+RUNC_SITE = https://github.com/opencontainers/runc/archive
+RUNC_SOURCE = $(RUNC_VERSION).tar.gz
+
+RUNC_LICENSE = Apache-2.0
+RUNC_LICENSE_FILES = LICENSE
+
+RUNC_DEPENDENCIES = host-go
+
+RUNC_MAKE_ENV = \
+	GOBIN="$(@D)/bin" \
+	GOPATH="$(@D)/Godeps/_workspace" \
+	GOARCH=$(GO_GOARCH) \
+	CGO_ENABLED=1
+
+RUNC_GLDFLAGS = \
+	-X main.gitCommit=$(RUNC_VERSION_COMMIT) \
+	-extldflags '-static'
+
+RUNC_GOTAGS = cgo static_build
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+RUNC_GOTAGS += --enable-seccomp
+RUNC_DEPENDENCIES += libseccomp
+endif
+
+define RUNC_CONFIGURE_CMDS
+	# Put sources at prescribed GOPATH location.
+	$(RUNC_MAKE_ENV) mkdir -p $$GOPATH/src/github.com/opencontainers
+	$(RUNC_MAKE_ENV) ln -s $(@D) $$GOPATH/src/github.com/opencontainers/runc
+endef
+
+define RUNC_BUILD_CMDS
+	cd $(@D) && $(RUNC_MAKE_ENV) $(HOST_DIR)/usr/bin/go \
+		build -v -o $(@D)/bin/runc -tags "$(RUNC_GOTAGS)" -ldflags "$(RUNC_GLDFLAGS)" .
+endef
+
+define RUNC_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/runc $(TARGET_DIR)/usr/bin/runc
+endef
+
+$(eval $(generic-package))
-- 
2.7.3
