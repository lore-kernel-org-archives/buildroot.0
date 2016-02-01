From: Ludovic Guegan <ludovic.guegan@gmail.com>
Date: Tue,  2 Feb 2016 00:31:01 +0100
Subject: [Buildroot] [PATCH 4/8 RFC] package/pkg-golang.mk: infrastructure
	for Go packages
In-Reply-To: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
References: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
Message-ID: <1454369465-4804-5-git-send-email-ludovic.guegan@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ludovic Guegan <ludovic.guegan@gmail.com>
---
 package/Makefile.in       |   1 +
 package/pkg-golang.mk     | 156 ++++++++++++++++++++++++++++++++++++++++++++++
 support/scripts/pkg-stats |  11 ++++
 3 files changed, 168 insertions(+)
 create mode 100644 package/pkg-golang.mk

diff --git a/package/Makefile.in b/package/Makefile.in
index dd595e2..067abb6 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -393,6 +393,7 @@ include package/pkg-download.mk
 include package/pkg-autotools.mk
 include package/pkg-cmake.mk
 include package/pkg-luarocks.mk
+include package/pkg-golang.mk
 include package/pkg-perl.mk
 include package/pkg-python.mk
 include package/pkg-virtual.mk
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
new file mode 100644
index 0000000..cff4e9f
--- /dev/null
+++ b/package/pkg-golang.mk
@@ -0,0 +1,156 @@
+################################################################################
+# Golang package infrastructure
+#
+# This file implements an infrastructure that eases development of package
+# .mk files for Go packages.
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+#
+# In terms of implementation, this Go infrastructure requires the .mk file
+# to only specify metadata information about the package: name, version,
+# download URL, etc.
+#
+# We still allow the package .mk file to override what the different steps
+# are doing, if needed. For example, if <PKG>_BUILD_CMDS is already defined,
+# it is used as the list of commands to perform to build the package,
+# instead of the default golang behaviour. The package can also define some
+# post operation hooks.
+#
+################################################################################
+
+GO_ENV = PATH=$(BR_PATH) GOPATH=$($PKGDIR)
+
+#
+# If compiling for the target then set GOARCH accordingly.
+#
+
+ifeq ($(4),target)
+
+ifeq ($(BR2_i386),y)
+GOLANG_ARCH = 386
+endif # i386
+
+ifeq ($(BR2_x86_64),y)
+GOLANG_ARCH = amd64
+endif # x86_64
+
+ifeq ($(BR2_arm),y)
+GOLANG_ARCH = arm
+endif # arm
+
+GO_ENV += GOARCH=$(GOLANG_ARCH)
+
+endif # ($(4),target)
+
+################################################################################
+#
+# Go packages are normally fetch using "go get", unfortunatly this method
+# fetch the HEAD reference of the package. We use golang-gb in order to
+# implement reproducible builds.
+#
+#  argument 1 is the package name to fetch as specified in the source code
+#  argument 2 is the revision reference
+################################################################################
+
+define fetch-golang-package
+	cd $($(PKG)_SRCDIR); \
+		env -i $(GO_ENV) gb vendor fetch -no-recurse -revision $(2) $(1);
+endef
+
+################################################################################
+# inner-golang-package -- defines how the configuration, compilation and
+# installation of a Go package should be done, implements a few hooks to
+# tune the build process for Go specifities and calls the generic package
+# infrastructure to generate the necessary make targets
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including a HOST_ prefix
+#             for host packages
+#  argument 3 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 4 is the type (target or host)
+################################################################################
+
+define inner-golang-package
+
+# Target packages need both the Go compiler on the host and the golang-gb
+# build tool on the host (for reproduable builds).
+$(2)_DEPENDENCIES += host-golang host-golang-gb
+
+#
+# Fetch go package if $($(PKG)_DEPS) is defined
+#
+ifdef $(2)_DEPS
+
+define $(2)_FETCH_DEPS
+	mkdir -p $$($$(PKG)_DIR)/{src,vendor}
+	cd $$($$(PKG)_SRCDIR); env -i $(GO_ENV) gb vendor delete --all
+	$$($$(PKG)_DEPS)
+endef
+
+$(2)_POST_DOWNLOAD_HOOKS += $(2)_FETCH_DEPS
+
+endif # $(2)_DEPS
+
+#
+# Build step. Only define it if not already defined by the package .mk file.
+# There is no differences between host and target packages.
+#
+ifndef $(2)_BUILD_CMDS
+define $(2)_BUILD_CMDS
+	$(foreach p,$$($$(PKG)_BUILD_PACKAGES), cd $$($$(PKG)_SRCDIR); \
+		env -i $(GO_ENV) gb build $(p))
+endef
+endif
+
+#
+# The variable $(2)_INSTALL_BINARIES list the binaries to install. Go programs
+# are named after the last part of their package. If $(2)_INSTALL_BINARIES is
+# not define, it is created from $(2)_BUILD_PACKAGES. 
+#
+ifndef $(2)_INSTALL_BINARIES
+ ifdef $(3)_INSTALL_BINARIES
+  $(2)_INSTALL_BINARIES = $$($(3)_INSTALL_BINARIES)
+ else
+  $(2)_INSTALL_BINARIES = $(foreach p, $($(2)_BUILD_PACKAGES), $(lastword $(subst /, ,$(p))))
+ endif
+endif
+
+#
+# Host installation step. Only define it if not already defined by the
+# package .mk file.
+#
+ifndef $(2)_INSTALL_CMDS
+define $(2)_INSTALL_CMDS
+	$(foreach p,$$($$(PKG)_INSTALL_BINARIES), \
+		$(INSTALL) -m 755 $$($$(PKG)_DIR)/bin/$(p) $(HOST_DIR)/usr/bin)
+endef
+endif
+
+#
+# Target installation step. Only define it if not already defined by the
+# package .mk file.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	$(foreach p,$$($$(PKG)_INSTALL_BINARIES), \
+		$(INSTALL) -m 755 $$($$(PKG)_DIR)/bin/$(p) $(TARGET_DIR)/usr/bin)
+endef
+endif
+
+# Call the generic package infrastructure to generate the necessary make
+# targets
+$(call inner-generic-package,$(1),$(2),$(3),$(4))
+
+endef # inner-golang-package
+
+################################################################################
+# golang-package -- the target generator macro for Go packages
+################################################################################
+
+golang-package = $(call inner-golang-package,\
+	$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
+host-golang-package = $(call inner-golang-package,host-$(pkgname),\
+	$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index fad7ae9..5e6bc08 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -112,6 +112,7 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	$i = "package/pkg-cmake.mk" -o \
 	$i = "package/pkg-kconfig.mk" -o \
 	$i = "package/pkg-luarocks.mk" -o \
+	$i = "package/pkg-golang.mk" -o \
 	$i = "package/pkg-perl.mk" -o \
 	$i = "package/pkg-python.mk" -o \
 	$i = "package/pkg-rebar.mk" -o \
@@ -145,6 +146,16 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	hastarget=1
     fi
 
+    if grep -E "\(host-golang-package\)" $i > /dev/null ; then
+	infratype="golang"
+	hashost=1
+    fi
+
+    if grep -E "\(golang-package\)" $i > /dev/null ; then
+	infratype="golang"
+	hastarget=1
+    fi
+
     if grep -E "\(host-luarocks-package\)" $i > /dev/null ; then
 	infratype="luarocks"
 	hashost=1
-- 
2.7.0
