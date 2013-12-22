From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2013 21:42:14 +0100
Subject: [Buildroot] [PATCH 06/10] luarocks: new infrastructure
In-Reply-To: <cover.1387744636.git.yann.morin.1998@free.fr>
References: <cover.1387744636.git.yann.morin.1998@free.fr>
Message-ID: <7d529bfc3be26aa2cdfed7604e85fb5277391bc1.1387744636.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Francois Perrad <fperrad@gmail.com>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[yann.morin.1998 at free.fr: apply Thomas' comments]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                    |  8 +++++
 Makefile                     |  1 +
 package/Makefile.in          |  1 +
 package/luarocks/luarocks.mk |  2 ++
 package/pkg-luarocks.mk      | 81 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 93 insertions(+)
 create mode 100644 package/pkg-luarocks.mk

diff --git a/Config.in b/Config.in
index 2b401cb..2d8e6ba 100644
--- a/Config.in
+++ b/Config.in
@@ -217,6 +217,14 @@ config BR2_DEBIAN_MIRROR
 
 endif
 
+config BR2_LUAROCKS_MIRROR
+	string "LuaRocks mirror"
+	default "http://luarocks.org/repositories/rocks"
+	help
+	  LuaRocks repository.
+
+	  See http://luarocks.org
+
 endmenu
 
 config BR2_JLEVEL
diff --git a/Makefile b/Makefile
index 925c1d2..c2a20ff 100644
--- a/Makefile
+++ b/Makefile
@@ -509,6 +509,7 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
 endif
+	rm -rf $(TARGET_DIR)/usr/lib/luarocks
 	$(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
 	if test -d $(TARGET_DIR)/lib/modules; then \
 		find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
diff --git a/package/Makefile.in b/package/Makefile.in
index f5d6289..2e433fd 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -371,5 +371,6 @@ include package/pkg-utils.mk
 include package/pkg-download.mk
 include package/pkg-autotools.mk
 include package/pkg-cmake.mk
+include package/pkg-luarocks.mk
 include package/pkg-python.mk
 include package/pkg-generic.mk
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 1b55dc2..0642dcb 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -38,3 +38,5 @@ define HOST_LUAROCKS_INSTALL_CMDS
 endef
 
 $(eval $(host-generic-package))
+
+LUAROCKS_RUN = $(HOST_DIR)/usr/bin/luarocks
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
new file mode 100644
index 0000000..664f661
--- /dev/null
+++ b/package/pkg-luarocks.mk
@@ -0,0 +1,81 @@
+################################################################################
+# LuaRocks package infrastructure
+# see http://luarocks.org/
+#
+# This file implements an infrastructure that eases development of
+# package .mk files for LuaRocks packages.
+# LuaRocks supports various build.type : builtin, make, cmake.
+# This luarocks infrastructure supports only the builtin mode,
+# the make & cmake modes could be directly handled by generic & cmake infrastructure.
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+# In terms of implementation, this LuaRocks infrastructure requires
+# the .mk file to only specify metadata informations about the
+# package: name, version, etc.
+#
+################################################################################
+
+################################################################################
+# inner-luarocks-package -- defines how the configuration, compilation and
+# installation of a LuaRocks package should be done, implements a few hooks to
+# tune the build process and calls the generic package infrastructure to
+# generate the necessary make targets
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including an HOST_ prefix
+#             for host packages
+#  argument 3 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 4 is the package directory prefix
+#  argument 5 is the type (target or host)
+################################################################################
+
+define inner-luarocks-package
+
+$(2)_BUILD_OPT		?=
+$(2)_SUBDIR		?= $(1)-$(shell echo "$($(3)_VERSION)" | sed -e "s/-[0-9]$$//")
+$(2)_ROCKSPEC		?= $(1)-$($(3)_VERSION).rockspec
+$(2)_SOURCE		?= $(1)-$($(3)_VERSION).src.rock
+$(2)_SITE		?= $(call qstrip,$(BR2_LUAROCKS_MIRROR))
+
+# Since we do not support host-luarocks-package, we know this is
+# a target package, and can just add the required dependencies
+$(2)_DEPENDENCIES	+= host-luarocks luainterpreter
+
+# $(2)_DEPENDENCIES are handled for configure step (too late)
+# but host-luarocks is required to do the extract
+$(1)-extract: host-luarocks
+
+#
+# Extract step
+#
+ifndef $(2)_EXTRACT_CMDS
+define $(2)_EXTRACT_CMDS
+	cd $$($(2)_DIR)/.. && $(LUAROCKS_RUN) unpack $(DL_DIR)/$$($(2)_SOURCE)
+endef
+endif
+
+#
+# Build/install step.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	(cd $$($(2)_SRCDIR); \
+	 $(LUAROCKS_RUN) build --minimal $$($(2)_ROCKSPEC) $$($(2)_BUILD_OPT))
+endef
+endif
+
+# Call the generic package infrastructure to generate the necessary
+# make targets
+$(call inner-generic-package,$(1),$(2),$(3),$(4),$(5))
+
+endef
+
+################################################################################
+# luarocks-package -- the target generator macro for LuaRocks packages
+################################################################################
+
+luarocks-package = $(call inner-luarocks-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+# host-luarocks-package not supported
-- 
1.8.1.2
