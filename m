From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 31 Oct 2013 11:16:11 +0100
Subject: [Buildroot] [pkg-luarocks infra 4/5] add luarocks infrastructure
In-Reply-To: <1383214572-8216-1-git-send-email-francois.perrad@gadz.org>
References: <1383214572-8216-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1383214572-8216-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 Makefile                |    1 +
 package/Makefile.in     |    1 +
 package/pkg-luarocks.mk |   76 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 package/pkg-luarocks.mk

diff --git a/Makefile b/Makefile
index f266e2d..3869154 100644
--- a/Makefile
+++ b/Makefile
@@ -470,6 +470,7 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
 endif
+	rm -rf $(TARGET_DIR)/usr/lib/luarocks
 	$(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
 	if test -d $(TARGET_DIR)/lib/modules; then \
 		find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
diff --git a/package/Makefile.in b/package/Makefile.in
index 612f3c7..f7fd8f9 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -363,4 +363,5 @@ include package/pkg-utils.mk
 include package/pkg-download.mk
 include package/pkg-autotools.mk
 include package/pkg-cmake.mk
+include package/pkg-luarocks.mk
 include package/pkg-generic.mk
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
new file mode 100644
index 0000000..1200cea
--- /dev/null
+++ b/package/pkg-luarocks.mk
@@ -0,0 +1,76 @@
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
+# package: name, version, version_upstream, etc.
+#
+################################################################################
+
+LUAROCKS_RUN = $(HOST_DIR)/usr/bin/luarocks
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
+$(2)_SUBDIR				= $(1)-$($(3)_VERSION_UPSTREAM)
+$(2)_ROCK				= $(1)-$($(3)_VERSION).src.rock
+$(2)_ROCKSPEC				= $(1)-$($(3)_VERSION).rockspec
+
+# This must be repeated from inner-generic-package, otherwise we only get
+# host-luarocks in _DEPENDENCIES because of the following line
+$(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+
+$(2)_DEPENDENCIES += host-luarocks
+
+# Download step
+$(2)_SOURCE =
+$(2)_ROCK_DOWNLOAD ?= \
+	cd $(DL_DIR) && (test -e $$($(2)_ROCK) || $(LUAROCKS_RUN) download --source $(1) $$($(2)_VERSION))
+$(2)_POST_DOWNLOAD_HOOKS += $(2)_ROCK_DOWNLOAD
+
+# Extract step
+$(2)_EXTRACT_CMDS ?= \
+	cd $$($(2)_DIR)/.. && $(LUAROCKS_RUN) unpack $(DL_DIR)/$$($(2)_ROCK)
+
+#
+# Build/install step.
+#
+$(2)_INSTALL_TARGET_CMDS ?= \
+	cd $$($(2)_SRCDIR) && $(LUAROCKS_RUN) build --minimal $$($(2)_ROCKSPEC)
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
1.7.9.5
