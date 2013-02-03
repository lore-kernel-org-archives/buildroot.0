From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Feb 2013 15:06:47 +0100
Subject: [Buildroot] [PATCH 10/29] package/qemu: add option to remove
	unwanted keymaps
In-Reply-To: <cover.1359899108.git.yann.morin.1998@free.fr>
References: <cover.1359899108.git.yann.morin.1998@free.fr>
Message-ID: <466d544f3b710b192fc3ee565d63dc08c05e5d0f.1359899108.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |   12 ++++++++++
 package/qemu/qemu.mk   |   55 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+), 0 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index a33c700..7823842 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -115,4 +115,16 @@ config BR2_PACKAGE_QEMU_BLOBS
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
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 59d759f..8d08f6b 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -153,6 +153,61 @@ ifeq ($(BR2_PACKAGE_QEMU_BLOBS),)
 QEMU_OPTS += --disable-blobs
 endif
 
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
 define QEMU_CONFIGURE_CMDS
 	( cd $(@D);                                 \
 	    LIBS='$(QEMU_LIBS)'                     \
-- 
1.7.2.5
