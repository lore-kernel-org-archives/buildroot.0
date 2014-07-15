From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 19:18:40 +0200
Subject: [Buildroot] [git commit] pkg-utils: kconfig helpers: use single iso
	double quoting
Message-ID: <20140715171925.B98739D248@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62bbfbaa63f47a9057d87e434744e50c08c8ff32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk       |    2 +-
 package/pkg-utils.mk |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index bd3f2ac..bcd9dc1 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -180,7 +180,7 @@ define LINUX_CONFIGURE_CMDS
 	# rebuilt using the linux26-rebuild-with-initramfs target.
 	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
 		touch $(BINARIES_DIR)/rootfs.cpio
-		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.cpio\",$(@D)/.config)
+		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$(BINARIES_DIR)/rootfs.cpio",$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index e802864..99e1f76 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -35,17 +35,17 @@ $(eval $(call caseconvert-helper,LOWERCASE,$(join $(addsuffix :,$([TO])),$([FROM
 
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
