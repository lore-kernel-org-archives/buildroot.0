From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 May 2015 23:30:39 +0200
Subject: [Buildroot] [PATCH 2/2 v2] pkg-infra: munging .la files is not
	limited to autotools packages
In-Reply-To: <cover.1430687963.git.yann.morin.1998@free.fr>
References: <cover.1430687963.git.yann.morin.1998@free.fr>
Message-ID: <2498f2352f5b65d77d91f6405d39e6349de640dc.1430687963.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we're only fixing libtool's .la files for autotools packages,
and even more so, only for those that do not define their own
_INSTALL_STAGING_CMDS.

However, .la files might also be installed by non-autotools packages,
like the NVidia GPU binary blob (libGL.la).

So, move that code into the global build rule, so all packages get their
.la files fixed, whether they be autotools packages or not, and whether
they define their own _INSTALL_STAGING_CMDS or not.

Also print a message.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-autotools.mk | 27 ---------------------------
 package/pkg-generic.mk   | 30 ++++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 9dea08a..bf65247 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -295,36 +295,9 @@ endif
 # Staging installation step. Only define it if not already defined by
 # the package .mk file.
 #
-# Most autotools packages install libtool .la files alongside any
-# installed libraries. These .la files sometimes refer to paths
-# relative to the sysroot, which libtool will interpret as absolute
-# paths to host libraries instead of the target libraries. Since this
-# is not what we want, these paths are fixed by prefixing them with
-# $(STAGING_DIR).  As we configure with --prefix=/usr, this fix
-# needs to be applied to any path that starts with /usr.
-#
-# To protect against the case that the output or staging directories
-# or the pre-installed external toolchain themselves are under /usr,
-# we first substitute away any occurrences of these directories as
-# @BASE_DIR@, @STAGING_DIR@ and @TOOLCHAIN_EXTERNAL_INSTALL_DIR@ respectively.
-# Note that STAGING_DIR can be outside BASE_DIR when the user sets
-# BR2_HOST_DIR to a custom value. Note that TOOLCHAIN_EXTERNAL_INSTALL_DIR
-# can be under @BASE_DIR@ when it's a downloaded toolchain, and can be empty
-# when we use an internal toolchain.
-#
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_SRCDIR)
-	find $$(STAGING_DIR)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
-		$$(SED) "s:$$(BASE_DIR):@BASE_DIR@:g" \
-			-e "s:$$(STAGING_DIR):@STAGING_DIR@:g" \
-			$$(if $$(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
-				-e "s:$$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:g") \
-			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
-			$$(if $$(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
-				-e "s:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:$$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):g") \
-			-e "s:@STAGING_DIR@:$$(STAGING_DIR):g" \
-			-e "s:@BASE_DIR@:$$(BASE_DIR):g"
 endef
 endif
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d5b29f0..bd6fa5c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -172,6 +172,25 @@ $(BUILD_DIR)/%/.stamp_host_installed:
 	@$(call step_end,install-host)
 
 # Install to staging dir
+#
+# Some packages install libtool .la files alongside any installed
+# libraries. These .la files sometimes refer to paths relative to the
+# sysroot, which libtool will interpret as absolute paths to host
+# libraries instead of the target libraries. Since this is not what we
+# want, these paths are fixed by prefixing them with $(STAGING_DIR).
+# As we configure with --prefix=/usr, this fix needs to be applied to
+# any path that starts with /usr.
+#
+# To protect against the case that the output or staging directories or
+# the pre-installed external toolchain themselves are under /usr, we first
+# substitute away any occurrences of these directories with @BASE_DIR@,
+# @STAGING_DIR@ and @TOOLCHAIN_EXTERNAL_INSTALL_DIR@ respectively.
+#
+# Note that STAGING_DIR can be outside BASE_DIR when the user sets
+# BR2_HOST_DIR to a custom value. Note that TOOLCHAIN_EXTERNAL_INSTALL_DIR
+# can be under @BASE_DIR@ when it's a downloaded toolchain, and can be
+# empty when we use an internal toolchain.
+#
 $(BUILD_DIR)/%/.stamp_staging_installed:
 	@$(call step_start,install-staging)
 	@$(call MESSAGE,"Installing to staging directory")
@@ -189,6 +208,17 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 				-e "s, at BASE_DIR@,$(BASE_DIR),g" \
 				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
 	fi
+	@$(call MESSAGE,"Fixing libtool files")
+	$(Q)find $(STAGING_DIR)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
+		$(SED) "s:$(BASE_DIR):@BASE_DIR@:g" \
+			-e "s:$(STAGING_DIR):@STAGING_DIR@:g" \
+			$(if $(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
+				-e "s:$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:g") \
+			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
+			$(if $(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
+				-e "s:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):g") \
+			-e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
+			-e "s:@BASE_DIR@:$(BASE_DIR):g"
 	$(Q)touch $@
 	@$(call step_end,install-staging)
 
-- 
1.9.1
