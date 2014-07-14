From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 14 Jul 2014 13:50:26 +0200
Subject: [Buildroot] [PATCH 2 of 6] pkg-utils: kconfig helpers: use single
 iso double quoting
In-Reply-To: <patchbomb.1405338624@localhost>
References: <patchbomb.1405338624@localhost>
Message-ID: <53e04c0bd837ebc96e93.1405338626@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The echo statements in the kconfig helpers are currently using double
quotes. For KCONFIG_SET_OPT this is problematic when the value argument
itself contains a double quote (a string value). In this case, the statement
    echo "$(1)=$(2)" >> $(3)
would become:
    echo "FOO="string value"" >> /some/path/.config
resulting in the string
    FOO=string value
in the config file, rather than the properly quoted
    FOO="string value"

The linux package worked around this by escaping the quote characters, but
a prettier solution is to use single quoting in the helpers (or
alternatively use no quoting at all).
A side effect of this change is that a $variable in the key or value would
no longer be interpreted by the shell, removing any unexpected behavior.

This change is only really necessary for KCONFIG_SET_OPT, but for symmetry
reasons the other helpers are updated too.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 linux/linux.mk       |  2 +-
 package/pkg-utils.mk |  6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff -r 4a53bf323d8a -r 53e04c0bd837 linux/linux.mk
--- a/linux/linux.mk	Wed Jul 09 20:27:38 2014 +0200
+++ b/linux/linux.mk	Sun Jul 13 09:34:05 2014 +0200
@@ -180,7 +180,7 @@
 	# rebuilt using the linux26-rebuild-with-initramfs target.
 	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
 		touch $(BINARIES_DIR)/rootfs.cpio
-		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.cpio\",$(@D)/.config)
+		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$(BINARIES_DIR)/rootfs.cpio",$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
diff -r 4a53bf323d8a -r 53e04c0bd837 package/pkg-utils.mk
--- a/package/pkg-utils.mk	Wed Jul 09 20:27:38 2014 +0200
+++ b/package/pkg-utils.mk	Sun Jul 13 09:34:05 2014 +0200
@@ -35,17 +35,17 @@
 
 define KCONFIG_ENABLE_OPT # (option, file)
 	$(SED) "/\\<$(1)\\>/d" $(2)
-	echo "$(1)=y" >> $(2)
+	echo '$(1)=y' >> $(2)
 endef
 
 define KCONFIG_SET_OPT # (option, value, file)
 	$(SED) "/\\<$(1)\\>/d" $(3)
-	echo "$(1)=$(2)" >> $(3)
+	echo '$(1)=$(2)' >> $(3)
 endef
 
 define KCONFIG_DISABLE_OPT # (option, file)
 	$(SED) "/\\<$(1)\\>/d" $(2)
-	echo "# $(1) is not set" >> $(2)
+	echo '# $(1) is not set' >> $(2)
 endef
 
 # Helper functions to determine the name of a package and its
