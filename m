From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 16 Oct 2017 19:08:46 +0200
Subject: [Buildroot] [RFC v2 2/4] package/pkg-golang: new package
	infrastructure
In-Reply-To: <1508173728-29181-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1508173728-29181-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1508173728-29181-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a new infrastructure for golang based packages.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/Makefile.in   |   1 +
 package/pkg-golang.mk | 121 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 122 insertions(+)
 create mode 100644 package/pkg-golang.mk

diff --git a/package/Makefile.in b/package/Makefile.in
index a1a5316..60d98d0 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -429,3 +429,4 @@ include package/pkg-kconfig.mk
 include package/pkg-rebar.mk
 include package/pkg-kernel-module.mk
 include package/pkg-waf.mk
+include package/pkg-golang.mk
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
new file mode 100644
index 0000000..c4e6410
--- /dev/null
+++ b/package/pkg-golang.mk
@@ -0,0 +1,121 @@
+################################################################################
+# Golang package infrastructure
+#
+# This file implements an infrastructure that eases development of
+# package .mk files for Go packages. It should be used for all
+# packages that are written in go.
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+#
+# In terms of implementation, this golang infrastructure requires
+# the .mk file to only specify metadata information about the
+# package: name, version, download URL, etc.
+#
+# We still allow the package .mk file to override what the different
+# steps are doing, if needed. For example, if <PKG>_BUILD_CMDS is
+# already defined, it is used as the list of commands to perform to
+# build the package, instead of the default golang behaviour. The
+# package can also define some post operation hooks.
+#
+################################################################################
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
+ifndef $(2)_MAKE_ENV
+define $(2)_MAKE_ENV
+	$$(HOST_GO_TARGET_ENV) \
+	GOPATH="$$(@D)/gopath" \
+	CGO_ENABLED=$$(HOST_GO_CGO_ENABLED)
+endef
+endif
+
+# Target packages need the Go compiler on the host.
+$(2)_DEPENDENCIES += host-go
+
+#
+# go install command doesn't work well when cross compilation is enabled,
+# we set the executable output of the compilation to a specific location.
+# We set this variable here to be used by packages if needed.
+#
+$(2)_EXECUTABLE = $$(@D)/gopath/bin/$(1)
+
+#
+# Source files in Go should be uncompressed in a precise folder in the
+# hiearchy of GOPATH. It usually resolves around domain/vendor/software.
+#
+$(1)_src_path ?= $$(call domain,$($(2)_SITE))/$$(firstword $$(subst /, ,$$(call notdomain,$($(2)_SITE))))
+$(2)_SRC_PATH  = $$(@D)/gopath/src/$$($(1)_src_path)/$(1)
+
+#
+# Configure step. Only define it if not already defined by the package
+# .mk file. And take care of the differences between host and target
+# packages.
+#
+ifndef $(2)_CONFIGURE_CMDS
+define $(2)_CONFIGURE_CMDS
+	mkdir -p $$(@D)/gopath/bin
+	mkdir -p $$(@D)/gopath/src/$$($(1)_src_path)
+	ln -sf $$(@D) $$($(2)_SRC_PATH)
+endef
+endif
+
+#
+# Build step. Only define it if not already defined by the package .mk file.
+# There is no differences between host and target packages.
+#
+ifndef $(2)_BUILD_CMDS
+define $(2)_BUILD_CMDS
+	cd $$($(2)_SRC_PATH) && $$($(2)_MAKE_ENV) $(HOST_DIR)/bin/go build \
+	-o $$($(2)_EXECUTABLE) -v $$($(2)_BUILD_OPTS)
+endef
+endif
+
+#
+# Host installation step. Only define it if not already defined by the
+# package .mk file.
+#
+ifndef $(2)_INSTALL_CMDS
+define $(2)_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $$($(2)_EXECUTABLE) $(HOST_DIR)/usr/bin/
+endef
+endif
+
+#
+# Target installation step. Only define it if not already defined by the
+# package .mk file.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $$($(2)_EXECUTABLE) $(TARGET_DIR)/usr/bin/
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
+golang-package = $(call inner-golang-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
+host-golang-package = $(call inner-golang-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
+
-- 
2.7.4
