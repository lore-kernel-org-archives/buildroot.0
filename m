From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 17:21:10 +0100
Subject: [Buildroot] [git commit] package/pkg-golang: add support for
 building host packages
Message-ID: <20190317162403.1AA01837C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aba08cd218315c8ce5ec97c5e2dd5edbcfa47fdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this you can add:

    $(eval $(host-golang-package))

to a package .mk file to build for host.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
Acked-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-golang.txt |  7 +++++--
 package/go/Config.in.host              |  6 ++++++
 package/pkg-golang.mk                  | 37 +++++++++++++++++++++++++++++++---
 3 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/docs/manual/adding-packages-golang.txt b/docs/manual/adding-packages-golang.txt
index ae90eb7d4f..8c467689be 100644
--- a/docs/manual/adding-packages-golang.txt
+++ b/docs/manual/adding-packages-golang.txt
@@ -52,8 +52,11 @@ If you need CGO support in your package, you must add a dependency on
 +BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS+.
 
 The main macro of the Go package infrastructure is
-+golang-package+. It is similar to the +generic-package+ macro. Only
-target packages are supported with +golang-package+.
++golang-package+. It is similar to the +generic-package+ macro. The
+ability to build host packages is also available, with the
++host-golang-package+ macro.
+Host packages built by +host-golang-package+ macro should depend on
+BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS.
 
 Just like the generic infrastructure, the Go infrastructure works
 by defining a number of variables before calling the +golang-package+.
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 893a448709..3f16dbaec3 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -18,3 +18,9 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	# Go doesn't support CGO linking on MIPS64x platforms
 	# See: https://github.com/karalabe/xgo/issues/46
 	depends on !BR2_mips64 && !BR2_mips64el
+
+# Host go packages should depend on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 4f2c7e77e1..b4e8a53065 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -25,12 +25,18 @@ GO_BIN = $(HOST_DIR)/bin/go
 
 # We pass an empty GOBIN, otherwise "go install: cannot install
 # cross-compiled binaries when GOBIN is set"
-GO_TARGET_ENV = \
-	$(HOST_GO_TARGET_ENV) \
+GO_COMMON_ENV = \
 	PATH=$(BR_PATH) \
 	GOBIN= \
 	CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
 
+GO_TARGET_ENV = \
+	$(HOST_GO_TARGET_ENV) \
+	$(GO_COMMON_ENV)
+
+GO_HOST_ENV = \
+	$(GO_COMMON_ENV)
+
 ################################################################################
 # inner-golang-package -- defines how the configuration, compilation and
 # installation of a Go package should be done, implements a few hooks to tune
@@ -44,7 +50,6 @@ GO_TARGET_ENV = \
 #             packages
 #  argument 4 is the type (target or host)
 #
-# NOTE Only type target is supported at the moment
 ################################################################################
 
 define inner-golang-package
@@ -98,6 +103,8 @@ endif
 # Build step. Only define it if not already defined by the package .mk
 # file.
 ifndef $(2)_BUILD_CMDS
+ifeq ($(4),target)
+# Build package for target
 define $(2)_BUILD_CMDS
 	$$(foreach d,$$($(2)_BUILD_TARGETS),\
 		cd $$($(2)_SRC_PATH); \
@@ -109,6 +116,20 @@ define $(2)_BUILD_CMDS
 			./$$(d)
 	)
 endef
+else
+# Build package for host
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
 
 # Target installation step. Only define it if not already defined by the
@@ -121,6 +142,15 @@ define $(2)_INSTALL_TARGET_CMDS
 endef
 endif
 
+# Host installation step
+ifndef $(2)_INSTALL_CMDS
+define $(2)_INSTALL_CMDS
+	$$(foreach d,$$($(2)_INSTALL_BINS),\
+		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $(HOST_DIR)/bin/$$(d)
+	)
+endef
+endif
+
 # Call the generic package infrastructure to generate the necessary make
 # targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
@@ -132,3 +162,4 @@ endef # inner-golang-package
 ################################################################################
 
 golang-package = $(call inner-golang-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
+host-golang-package = $(call inner-golang-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
