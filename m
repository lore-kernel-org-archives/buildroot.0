From: Mirza Krak <mirza.krak@northern.tech>
Date: Sun, 26 Aug 2018 23:41:44 +0200
Subject: [Buildroot] [PATCH 1/3] package/pkg-golang: add support for host
 target
In-Reply-To: <20180826214146.28328-1-mirza.krak@northern.tech>
References: <20180826214146.28328-1-mirza.krak@northern.tech>
Message-ID: <20180826214146.28328-2-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this you can add:

    $(eval $(host-golang-package))

to a package .mk file to build for host.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---
 package/pkg-golang.mk | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 6eacd14180..7d9956378f 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -23,10 +23,13 @@
 
 GO_BIN = $(HOST_DIR)/bin/go
 
-# We pass an empty GOBIN, otherwise "go install: cannot install
-# cross-compiled binaries when GOBIN is set"
 GO_TARGET_ENV = \
 	$(HOST_GO_TARGET_ENV) \
+	$(GO_HOST_ENV)
+
+# We pass an empty GOBIN, otherwise "go install: cannot install
+# cross-compiled binaries when GOBIN is set"
+GO_HOST_ENV = \
 	PATH=$(BR_PATH) \
 	GOBIN= \
 	CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
@@ -44,7 +47,6 @@ GO_TARGET_ENV = \
 #             packages
 #  argument 4 is the type (target or host)
 #
-# NOTE Only type target is supported at the moment
 ################################################################################
 
 define inner-golang-package
@@ -96,6 +98,9 @@ endif
 # Build step. Only define it if not already defined by the package .mk
 # file.
 ifndef $(2)_BUILD_CMDS
+ifeq ($(4),target)
+
+# Build package for target
 define $(2)_BUILD_CMDS
 	$$(foreach d,$$($(2)_BUILD_TARGETS),\
 		cd $$($(2)_SRC_PATH); \
@@ -107,10 +112,23 @@ define $(2)_BUILD_CMDS
 			./$$(d)
 	)
 endef
+else
+	# Build package for host
+define $(2)_BUILD_CMDS
+	$$(foreach d,$$($(2)_BUILD_TARGETS),\
+		cd $$($(2)_SRC_PATH); \
+		$$(GO_HOST_ENV) \
+			GOPATH="$$(@D)/$$($(2)_WORKSPACE)" \
+			$$($(2)_GO_ENV) \
+			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
+			-o $$(@D)/bin/$$(or $$($(2)_BIN_NAME),$$(notdir $$(d))) \
+			./$$(d)
+	)
+endef
+endif
 endif
 
-# Target installation step. Only define it if not already defined by the
-# package .mk file.
+# Target installation step
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	$$(foreach d,$$($(2)_INSTALL_BINS),\
@@ -119,6 +137,15 @@ define $(2)_INSTALL_TARGET_CMDS
 endef
 endif
 
+# Host installation step
+ifndef $(2)_INSTALL_CMDS
+define $(2)_INSTALL_CMDS
+	$$(foreach d,$$($(2)_INSTALL_BINS),\
+		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $(HOST_DIR)/usr/bin/$$(d)
+	)
+endef
+endif
+
 # Call the generic package infrastructure to generate the necessary make
 # targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
@@ -130,3 +157,4 @@ endef # inner-golang-package
 ################################################################################
 
 golang-package = $(call inner-golang-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
+host-golang-package = $(call inner-golang-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
-- 
2.11.0
