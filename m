From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed,  6 Dec 2017 11:56:53 +0100
Subject: [Buildroot] [PATCH 1/5] package/pkg-golang: new package
 infrastructure
In-Reply-To: <1512557817-431-1-git-send-email-angelo@amarulasolutions.com>
References: <1512557817-431-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1512557817-431-2-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

This patch adds a new infrastructure for golang based packages.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
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
index 0000000..aaca5f4
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
+# build the package, instead of the default golang behavior. The
+# package can also define some post operation hooks.
+#
+################################################################################
+
+GOBIN = $(HOST_DIR)/bin/go
+
+################################################################################
+# inner-golang-package -- defines how the configuration, compilation and
+# installation of a Go package should be done, implements a few hooks to
+# tune the build process for Go specificities and calls the generic package
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
+$(2)_GOPATH ?= _gopath
+$(2)_GO_ENV ?= $$(HOST_GO_TARGET_ENV) \
+		GOPATH="$$(@D)/$$($(2)_GOPATH)" \
+		CGO_ENABLED=$$(HOST_GO_CGO_ENABLED)
+
+ifeq ($(BR2_STATIC_LIBS),y)
+	$(2)_GO_LDFLAGS += -extldflags '-static'
+endif
+
+ifdef $(2)_GO_LDFLAGS
+	$(2)_BUILD_OPTS += -ldflags "$$($(2)_GO_LDFLAGS)"
+endif
+
+ifdef $(2)_GO_TAGS
+	$(2)_BUILD_OPTS += -tags "$$($(2)_GO_TAGS)"
+endif
+
+# Target packages need the Go compiler on the host.
+$(2)_DEPENDENCIES += host-go
+
+#
+# The go build/install command installs the binaries inside
+# gopath/bin/linux_GOARCH/ when cross compilation is enabled.
+# We set this variable here to be used by packages if needed.
+#
+$(2)_BINDIR = $$($(2)_GOPATH)/bin/linux_$$(GO_GOARCH)
+
+#
+# Source files in Go should be uncompressed in a precise folder in the
+# hierarchy of GOPATH. It usually resolves around domain/vendor/software.
+#
+$(2)_GO_SRC_PATH ?= $$(call domain,$($(2)_SITE))/$$(firstword $$(subst /, ,$$(call notdomain,$($(2)_SITE))))
+$(2)_SRC_PATH  = $$(@D)/$$($(2)_GOPATH)/src/$$($(2)_GO_SRC_PATH)/$(1)
+
+#
+# Configure step. Only define it if not already defined by the package
+# .mk file.
+#
+ifndef $(2)_CONFIGURE_CMDS
+define $(2)_CONFIGURE_CMDS
+	mkdir -p $$(@D)/$$($(2)_GOPATH)/bin
+	mkdir -p $$(@D)/$$($(2)_GOPATH)/src/$$($(2)_GO_SRC_PATH)
+	ln -sf $$(@D) $$($(2)_SRC_PATH)
+endef
+endif
+
+#
+# Build step. Only define it if not already defined by the package .mk file.
+# We use the install command instead of build command here because the
+# install command also moves the package binaries in gopath/bin/linux_GOARCH/.
+# Using the install command also leverages the go build infrastructure
+# for building and installing multiple binaries.
+#
+ifndef $(2)_BUILD_CMDS
+define $(2)_BUILD_CMDS
+	cd $$($(2)_SRC_PATH) && $$($(2)_GO_ENV) $$(GOBIN) install -v $$($(2)_BUILD_OPTS)
+endef
+endif
+
+#
+# Target installation step. Only define it if not already defined by the
+# package .mk file.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $$(@D)/$$($(2)_BINDIR)/$(1) $(TARGET_DIR)/usr/bin/
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
-- 
2.7.4
