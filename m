From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 12:38:17 +0200
Subject: [Buildroot] [git commit] infra: support buildroot being located in
	/usr
Message-ID: <20140629103846.8AABD9D106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7701fc53d19be7cab8bddba72046a39e8421fd9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pkg-generic and pkg-autotools both perform sed replacements of /usr to
$(STAGING_DIR)/usr, in .pc and .la files respectively. However, if buildroot
itself is located in /usr, then STAGING_DIR also starts with /usr, and naive
replacements of '/usr' can result in paths of the form:
    /usr/buildroot/.../sysroot/usr/buildroot/.../sysroot/...

This patch makes the replacements more careful, by first replacing the known
paths BASE_DIR and STAGING_DIR to tokens, then performing the actual
replacement, and finally replacing the tokens with the corresponding paths.

Additionally it removes the unnecessary making of a backup copy in
pkg-autotools.

Partially fixes bug #5750 (https://bugs.busybox.net/show_bug.cgi?id=5750)

[Thomas: improve pkg-autotools.mk by including the explanation comment
proposed by Arnout.]

Partially-based-on-a-patch-from: Ben Stoltz <benstoltz@gmail.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-autotools.mk |   19 +++++++++++++++++--
 package/pkg-generic.mk   |    9 ++++++---
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index e27ec1f..8527314 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -264,12 +264,27 @@ endif
 # Staging installation step. Only define it if not already defined by
 # the package .mk file.
 #
+# Most autotools packages install libtool .la files alongside any
+# installed libraries. These .la files sometimes refer to paths
+# relative to the sysroot, which libtool will interpret as absolute
+# paths to host libraries instead of the target libraries. Since we
+# configure with --prefix=/usr, such absolute paths start with
+# /usr. So we add $(STAGING_DIR) in front of any path that starts with
+# /usr.
+#
+# To protect against the case that the output directory itself is
+# under /usr, we first substitute away any occurences of the output
+# directory to @BASE_DIR at .
+#
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
 	for i in $$$$(find $$(STAGING_DIR)/usr/lib* -name "*.la"); do \
-		cp -f $$$$i $$$$i~; \
-		$$(SED) "s:\(['= ]\)/usr:\\1$$(STAGING_DIR)/usr:g" $$$$i; \
+		$$(SED) "s:$$(BASE_DIR):@BASE_DIR@:g" \
+			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
+			-e "s:@STAGING_DIR@:$$(STAGING_DIR):g" \
+			-e "s:@BASE_DIR@:$$(BASE_DIR):g" \
+			$$$$i; \
 	done
 endef
 endif
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 78fe134..54193d2 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -201,9 +201,12 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(call MESSAGE,"Fixing package configuration files") ;\
-			$(SED)  "s,^\(exec_\)\?prefix=.*,\1prefix=$(STAGING_DIR)/usr,g" \
-				-e "s,-I/usr/,-I$(STAGING_DIR)/usr/,g" \
-				-e "s,-L/usr/,-L$(STAGING_DIR)/usr/,g" \
+			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
+				-e "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
+				-e "s,-I/usr/,-I at STAGING_DIR@/usr/,g" \
+				-e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
+				-e "s, at STAGING_DIR@,$(STAGING_DIR),g" \
+				-e "s, at BASE_DIR@,$(BASE_DIR),g" \
 				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
 	fi
 	$(Q)touch $@
