From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:54:07 +0200
Subject: [Buildroot] [PATCH 19/36] package/qemu: add option to remove
	unwanted keymaps
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-19-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |   12 ++++++++++
 package/qemu/qemu.mk   |   58 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 0 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e34680c..0ae7fc3 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -125,6 +125,18 @@ config BR2_PACKAGE_QEMU_BLOBS
 	  Note2: This has nothing to do with the licensing of the blobs;
 	         some (most?) even have a free and/or open source license.
 
+config BR2_PACKAGE_QEMU_KEYMAPS
+	string "Keymaps to keep"
+	default "all"
+	help
+	  Enter the list of keymap(s) to keep. To keep many keymaps, you can
+	  use shell globs, or you can enter a space-separated list of keymaps:
+	    - empty to remove all keymaps
+	    - 'all' to keep all keymaps
+	    - 'fr*' to keep all french keymaps
+	    - 'de fr* en-*' for german, french and english keymaps
+	    - and so on (see the QEMU source for all supported keymaps)
+
 endif # BR2_PACKAGE_QEMU
 
 comment "QEMU requires python"
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index cd473f8..c00209b 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -86,6 +86,64 @@ QEMU_OPTS += --disable-blobs
 endif
 
 #----------------------------------------------------------------------------
+# Package hooks
+
+# Post-install removal of unwanted keymaps:
+# - if we want 'all', we do nothing;
+# - if we want none, we completely remove the keymap dir
+# - otherwise:
+#   - we completely remove the keymap dir; and recreate it empty
+#   - we recursively copy only those keymaps we want (as keymaps may include
+#     some common files)
+#
+# NOTE-1: we need the un-quoted list of keymaps, so it is interpreted as a glob
+#         by the shell.
+# NOTE-2: yes, all (current!) keymaps do include the 'common' keymap, which in
+#         turn includes the 'modifiers' keymap, so we could unconditionally
+#         copy those two, for a much simpler code. Doing it the way it's done
+#         is more generic, and will adapt to any future keymaps which has
+#         multiple includes, or none.
+# NOTE-3: we can't use $(SED), because it expands to include the '-i' option,
+#         which we do *not* want here, because we are not munging a file, but
+#         using sed as a enhanced grep.
+#
+QEMU_KEYMAPS = $(call qstrip,$(BR2_PACKAGE_QEMU_KEYMAPS))
+
+ifeq ($(QEMU_KEYMAPS),all)      #--- Keep all keymaps ---#
+define QEMU_POST_INSTALL_KEYMAPS
+	@: Nothing
+endef
+
+else ifeq ($(QEMU_KEYMAPS),)    #--- Remove all keymaps ---#
+define QEMU_POST_INSTALL_KEYMAPS
+	rm -rf "$(TARGET_DIR)/usr/share/qemu/keymaps"
+endef
+
+else                            #--- Keep selected keymaps ---#
+define QEMU_POST_INSTALL_KEYMAPS
+	rm -rf "$(TARGET_DIR)/usr/share/qemu/keymaps"
+	mkdir -p "$(TARGET_DIR)/usr/share/qemu/keymaps"
+	add_keymap() {                                                  \
+	    local k="$${1}"; local dest="$${2}";                        \
+	    if [ -n "$${k}" -a ! -f "$${dest}/$${k}" ]; then            \
+	        cp -v "$${k}" "$${dest}";                               \
+	        for k in $$(sed -r -e '/^include[[:space:]]+(.*)$$/!d;' \
+	                           -e 's//\1/;' "$${k}" ); do           \
+	            add_keymap "$${k}" "$${dest}";                      \
+	        done;                                                   \
+	    fi;                                                         \
+	};                                                              \
+	cd $(@D)/pc-bios/keymaps;                                       \
+	for k in $(QEMU_KEYMAPS); do                                    \
+	    add_keymap "$${k}" "$(TARGET_DIR)/usr/share/qemu/keymaps";  \
+	done
+endef
+
+endif # Keymaps to keep
+
+QEMU_POST_INSTALL_TARGET_HOOKS += QEMU_POST_INSTALL_KEYMAPS
+
+#----------------------------------------------------------------------------
 # Package build process
 
 # Note: although QEMU uses a ./configure script, it is not compatible with
-- 
1.7.2.5
