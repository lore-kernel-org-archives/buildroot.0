From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 19 Jun 2014 21:42:27 +0200
Subject: [Buildroot] [PATCH 1 of 3] infra: support buildroot being located
	in /usr
In-Reply-To: <patchbomb.1403206946@localhost>
References: <patchbomb.1403206946@localhost>
Message-ID: <8282245ececc13c97588.1403206947@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Partially-based-on-a-patch-from: Jeremy Kerr <benstoltz@gmail.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-autotools.mk |   8 ++++++--
 package/pkg-generic.mk   |  10 +++++++---
 2 files changed, 13 insertions(+), 5 deletions(-)

diff -r a59338f65a46 -r 8282245ececc package/pkg-autotools.mk
--- a/package/pkg-autotools.mk	Wed Jun 18 20:22:00 2014 +0400
+++ b/package/pkg-autotools.mk	Thu Jun 19 21:41:02 2014 +0200
@@ -268,8 +268,12 @@
 define $(2)_INSTALL_STAGING_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
 	for i in $$$$(find $$(STAGING_DIR)/usr/lib* -name "*.la"); do \
-		cp -f $$$$i $$$$i~; \
-		$$(SED) "s:\(['= ]\)/usr:\\1$$(STAGING_DIR)/usr:g" $$$$i; \
+		$$(SED) "s:$$(BASE_DIR):@BASE_DIR@:g" \
+			-e "s:$$(STAGING_DIR):@STAGING_DIR@:g" \
+			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
+			-e "s:@STAGING_DIR@:$$(STAGING_DIR):g" \
+			-e "s:@BASE_DIR@:$$(BASE_DIR):g" \
+			$$$$i; \
 	done
 endef
 endif
diff -r a59338f65a46 -r 8282245ececc package/pkg-generic.mk
--- a/package/pkg-generic.mk	Wed Jun 18 20:22:00 2014 +0400
+++ b/package/pkg-generic.mk	Thu Jun 19 21:41:02 2014 +0200
@@ -201,9 +201,13 @@
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(call MESSAGE,"Fixing package configuration files") ;\
-			$(SED)  "s,^\(exec_\)\?prefix=.*,\1prefix=$(STAGING_DIR)/usr,g" \
-				-e "s,-I/usr/,-I$(STAGING_DIR)/usr/,g" \
-				-e "s,-L/usr/,-L$(STAGING_DIR)/usr/,g" \
+			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
+				-e "s,$(STAGING_DIR), at STAGING_DIR@,g" \
+				-e "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
+				-e "s,-I/usr/,-I at STAGING_DIR@/usr/,g" \
+				-e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
+				-e "s, at STAGING_DIR@,$(STAGING_DIR),g" \
+				-e "s, at BASE_DIR@,$(BASE_DIR),g" \
 				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
 	fi
 	$(Q)touch $@
