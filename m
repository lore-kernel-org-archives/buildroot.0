From: Christian Stewart <christian@paral.in>
Date: Tue, 14 Jul 2015 15:17:17 -0700
Subject: [Buildroot] [PATCH v2 1/3] golang: new package
Message-ID: <1436912239-27893-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces golang as a host and target package, allowing for cross-platform go builds.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                                  |  1 +
 package/golang/0001-add-no-march-option-gccp.patch | 19 ++++++++++++
 .../0002-remove-unnecessary-march-ld-flag.patch    | 29 ++++++++++++++++++
 package/golang/Config.in                           | 12 ++++++++
 package/golang/golang.hash                         |  1 +
 package/golang/golang.mk                           | 35 ++++++++++++++++++++++
 6 files changed, 97 insertions(+)
 create mode 100644 package/golang/0001-add-no-march-option-gccp.patch
 create mode 100644 package/golang/0002-remove-unnecessary-march-ld-flag.patch
 create mode 100644 package/golang/Config.in
 create mode 100644 package/golang/golang.hash
 create mode 100644 package/golang/golang.mk

diff --git a/package/Config.in b/package/Config.in
index 5beb450..b49c94f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -455,6 +455,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-zlib/Config.in"
 endmenu
 endif
+	source "package/golang/Config.in"
 	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
 	source "package/jamvm/Config.in"
diff --git a/package/golang/0001-add-no-march-option-gccp.patch b/package/golang/0001-add-no-march-option-gccp.patch
new file mode 100644
index 0000000..87231aa
--- /dev/null
+++ b/package/golang/0001-add-no-march-option-gccp.patch
@@ -0,0 +1,19 @@
+Adds an option to not add the problematic -m parameter to GCC.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+
+diff -Nau golang.orig/src/cmd/cgo/gcc.go golang/src/cmd/cgo/gcc.go
+--- golang.orig/src/cmd/cgo/gcc.go.orig	2015-07-09 15:53:55.720794139 -0700
++++ golang/src/cmd/cgo/gcc.go	2015-07-09 17:46:43.664496374 -0700
+@@ -736,6 +736,11 @@
+ 
+ // gccMachine returns the gcc -m flag to use, either "-m32", "-m64" or "-marm".
+ func (p *Package) gccMachine() []string {
++
++	if os.Getenv("CGO_NO_EMULATION") == "1" {
++		return nil
++	}
++
+ 	switch goarch {
+ 	case "amd64":
+ 		return []string{"-m64"}
diff --git a/package/golang/0002-remove-unnecessary-march-ld-flag.patch b/package/golang/0002-remove-unnecessary-march-ld-flag.patch
new file mode 100644
index 0000000..7cc20f4
--- /dev/null
+++ b/package/golang/0002-remove-unnecessary-march-ld-flag.patch
@@ -0,0 +1,29 @@
+Removes defining -m parameter to LD, which is unnecessary in buildroot.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+
+diff -Nau golang.orig/src/cmd/ld/lib.c golang/src/cmd/ld/lib.c
+--- golang.orig/src/cmd/ld/lib.c.orig	2015-07-09 18:38:44.192359082 -0700
++++ golang/src/cmd/ld/lib.c	2015-07-09 18:39:02.108358294 -0700
+@@ -589,20 +589,7 @@
+ 	if(extld == nil)
+ 		extld = "gcc";
+ 	argv[argc++] = extld;
+-	switch(thechar){
+-	case '8':
+-		argv[argc++] = "-m32";
+-		break;
+-	case '6':
+-		argv[argc++] = "-m64";
+-		break;
+-	case '5':
+-		argv[argc++] = "-marm";
+-		break;
+-	}
+-	if(!debug['s'] && !debug_s) {
+-		argv[argc++] = "-gdwarf-2"; 
+-	} else {
++	if(debug['s'] || debug_s) {
+ 		argv[argc++] = "-s";
+ 	}
+ 	if(HEADTYPE == Hdarwin)
diff --git a/package/golang/Config.in b/package/golang/Config.in
new file mode 100644
index 0000000..6e179fa
--- /dev/null
+++ b/package/golang/Config.in
@@ -0,0 +1,12 @@
+comment "golang needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_GOLANG
+  depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	bool "golang"
+	help
+	  Go compiler and cli tool.
+
+	  http://golang.org/
diff --git a/package/golang/golang.hash b/package/golang/golang.hash
new file mode 100644
index 0000000..c7a9fa9
--- /dev/null
+++ b/package/golang/golang.hash
@@ -0,0 +1 @@
+sha256 3e5d07bc5214a1ffe187cf6406c5b5a80ee44f12f6bca97a5463db0afee2f6ac  golang-1.4.2.tar.gz
diff --git a/package/golang/golang.mk b/package/golang/golang.mk
new file mode 100644
index 0000000..3460dff
--- /dev/null
+++ b/package/golang/golang.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# GOLANG
+#
+################################################################################
+
+GOLANG_VERSION = 1.4.2
+GOLANG_SITE = $(call github,golang,go,go$(GOLANG_VERSION))
+GOLANG_LICENSE_FILES = LICENSE
+
+GOLANG = $(HOST_DIR)/usr/bin/go
+GOLANGFMT = $(HOST_DIR)/usr/bin/gofmt
+
+define GOLANG_BUILD_CMDS
+	cd $(@D)/src/ && CC_FOR_TARGET="$(TARGET_CC)" LD_FOR_TARGET="$(TARGET_LD)" GOOS=linux GOARCH=$(ARCH) GOROOT_FINAL="/usr/src/go" ./make.bash
+endef
+
+define GOLANG_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/linux_$(ARCH)/* $(TARGET_DIR)/usr/bin/
+	mkdir -p $(TARGET_DIR)/usr/src/go/
+	$(INSTALL) -D $(@D)/* $(TARGET_DIR)/usr/src/go/
+endef
+
+define HOST_GOLANG_BUILD_CMDS
+	cd $(@D)/src/ && CC_FOR_TARGET="$(TARGET_CC)" GOOS=linux GOARCH=$(ARCH) GOROOT_FINAL=$(HOST_DIR)/usr/src/go/ bash ./make.bash
+endef
+
+define HOST_GOLANG_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/go $(@D)/bin/gofmt $(HOST_DIR)/usr/bin/
+	mkdir -p $(HOST_DIR)/usr/src/go/
+	cp -r $(@D)/* $(HOST_DIR)/usr/src/go/
+endef
+
+$(eval $(host-generic-package))
+$(eval $(generic-package))
-- 
2.1.4
