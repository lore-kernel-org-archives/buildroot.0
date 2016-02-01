From: Ludovic Guegan <ludovic.guegan@gmail.com>
Date: Tue,  2 Feb 2016 00:30:58 +0100
Subject: [Buildroot] [PATCH 1/8 RFC] package/golang: create Go 1.5 host
	compiler package
In-Reply-To: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
References: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
Message-ID: <1454369465-4804-2-git-send-email-ludovic.guegan@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This compiler is bootstraped using a Go 1.4 compiler.

Signed-off-by: Ludovic Guegan <ludovic.guegan@gmail.com>
---
 package/Config.in.host        |  1 +
 package/golang/Config.in.host |  7 +++++
 package/golang/golang.hash    |  2 ++
 package/golang/golang.mk      | 72 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 82 insertions(+)
 create mode 100644 package/golang/Config.in.host
 create mode 100644 package/golang/golang.hash
 create mode 100644 package/golang/golang.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 8e6b870..0625bd0 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -12,6 +12,7 @@ menu "Host utilities"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
+	source "package/golang/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jq/Config.in.host"
diff --git a/package/golang/Config.in.host b/package/golang/Config.in.host
new file mode 100644
index 0000000..11ce925
--- /dev/null
+++ b/package/golang/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_GOLANG
+	bool "golang"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Go build system. It is used to cros-compile Go programs for the target.
+
+	  http://golang.org/
diff --git a/package/golang/golang.hash b/package/golang/golang.hash
new file mode 100644
index 0000000..751e19a
--- /dev/null
+++ b/package/golang/golang.hash
@@ -0,0 +1,2 @@
+sha256 754e06dab1c31ab168fc9db9e32596734015ea9e24bc44cae7f237f417ce4efe  go1.5.3.src.tar.gz
+sha256 299a6fd8f8adfdce15bc06bde926e7b252ae8e24dd5b16b7d8791ed79e7b5e9b  go1.4.2.src.tar.gz
diff --git a/package/golang/golang.mk b/package/golang/golang.mk
new file mode 100644
index 0000000..f02ebde
--- /dev/null
+++ b/package/golang/golang.mk
@@ -0,0 +1,72 @@
+################################################################################
+#
+# golang
+#
+################################################################################
+
+GOLANG_VERSION = 1.5.3
+GOLANG_SOURCE = go$(GOLANG_VERSION).src.tar.gz
+GOLANG_SITE = https://storage.googleapis.com/golang
+GOLANG_LICENSE = BSD-3c
+GOLANG_LICENSE_FILES = LICENSE
+GOLANG_EXTRA_SOURCE = go1.4.2.src.tar.gz
+HOST_GOLANG_EXTRA_DOWNLOADS = https://storage.googleapis.com/golang/$(GOLANG_EXTRA_SOURCE)
+GOLANG_SUBDIR = go
+
+#
+# Environment used to bootstrap
+#
+GOLANG_BOOTSTRAP_DIR = $(@D)/bootstrap
+GOLANG_BOOTSTRAP_GO = $(GOLANG_BOOTSTRAP_DIR)/go
+GOLANG_BOOTSTRAP_BIN = $(GOLANG_BOOTSTRAP_GO)/bin
+GOLANG_BOOTSTRAP_ENV = GOBIN=$(GOLANG_BOOTSTRAP_BIN) PATH=$(BR_PATH)
+
+#
+# Environment used to build
+#
+GOLANG_GOROOT_FINAL = $(HOST_DIR)/usr/lib/go
+GOLANG_BUILD_ENV = PATH=$(GOLANG_BOOTSTRAP_BIN):$(BR_PATH) \
+	GOROOT_FINAL=$(GOLANG_GOROOT_FINAL) \
+	GOROOT_BOOTSTRAP=$(GOLANG_BOOTSTRAP_GO)
+
+#
+# Packages can use GO_HOST_BINARY to call the go program
+#
+GO_HOST_BINARY = $(HOST_DIR)/usr/bin/go
+
+#
+# Extracts bootstraping and host compilers
+#
+define HOST_GOLANG_EXTRACT_CMDS
+	mkdir -p $(GOLANG_BOOTSTRAP_BIN)
+	tar xvaf $(BR2_DL_DIR)/$(GOLANG_EXTRA_SOURCE) -C $(GOLANG_BOOTSTRAP_DIR)
+	tar xvaf $(BR2_DL_DIR)/$(GOLANG_SOURCE) -C $(@D)
+endef
+
+#
+# Build bootstraping compiler before the host compiler.
+#
+define HOST_GOLANG_BOOTSTRAP
+	cd $(GOLANG_BOOTSTRAP_GO)/src; env -i $(GOLANG_BOOTSTRAP_ENV) ./make.bash
+endef
+
+HOST_GOLANG_PRE_BUILD_HOOKS += HOST_GOLANG_BOOTSTRAP
+
+#
+# Compile the host compiler with the envionment pointing to the bootstraping
+# compiler previously built
+#
+define HOST_GOLANG_BUILD_CMDS
+	cd $(HOST_GOLANG_SRCDIR)/src; env -i $(GOLANG_BUILD_ENV) ./make.bash
+endef
+
+#
+# Install Go by simply copying the source and the binary to the final
+# destination
+#
+define HOST_GOLANG_INSTALL_CMDS
+	cp -a $(HOST_GOLANG_SRCDIR) $(GOLANG_GOROOT_FINAL)
+	ln -fs $(GOLANG_GOROOT_FINAL)/bin/go $(GO_HOST_BINARY)
+endef
+
+$(eval $(host-generic-package))
-- 
2.7.0
