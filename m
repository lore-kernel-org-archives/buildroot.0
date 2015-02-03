From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  3 Feb 2015 15:21:48 +0100
Subject: [Buildroot] [PATCH 08/10] linux: avoid unnecessary changes in
	defconfig for INITRAMFS_SOURCE
In-Reply-To: <cover.1422972638.git.yann.morin.1998@free.fr>
References: <cover.1422972638.git.yann.morin.1998@free.fr>
Message-ID: <d2981725a8a9bf2f5c557e769047ce6fa60cf5fe.1422972638.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

When Buildroot is configured to append the root filesystem to the Linux
kernel as initramfs, Buildroot sets the path to the initramfs source
dynamically in the Linux configuration file.

As this path is specified as an absolute path, typically being different
for different users of the same project (e.g. containing a username),
saving the configuration to a version control system (for example using
'make linux-update-defconfig') would result in a difference for this
path at every invocation by a different user.
Although this is technically not an issue, it is confusing that this
generates a difference.

Address this issue by using a not-yet-expanded make variable to specify
the path to the initramfs source. That variable will be expanded by the
Linux build system, which uses it both as a Makefile variable and a
shell variable; thus, it needs to be specified in LINUX_MAKE_ENV (so
it is exported and available in sub-processes of make).  Any saved
configuration file would simply contain the reference to the
not-yet-expanded variable.

As in the Linux build system, the config variables are both read from
make as from a shell script, we cannot use $() syntax as this would be
interpreted as a command invocation by the shell. Instead, use ${}
syntax which is interpreted as variable reference both by the shell as
by make.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: "Yann E. Morin" <yann.morin.1998@free.fr>
---
 linux/linux.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 86dd1ee..0e09269 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -55,7 +55,9 @@ LINUX_MAKE_FLAGS = \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
 	DEPMOD=$(HOST_DIR)/sbin/depmod
 
-LINUX_MAKE_ENV = $(TARGET_MAKE_ENV)
+LINUX_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	BR_BINARIES_DIR=$(BINARIES_DIR)
 
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
@@ -191,7 +193,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 	# rebuilt using the linux-rebuild-with-initramfs target.
 	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
 		touch $(BINARIES_DIR)/rootfs.cpio
-		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$(BINARIES_DIR)/rootfs.cpio",$(@D)/.config)
+		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$${BR_BINARIES_DIR}/rootfs.cpio",$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
-- 
1.9.1
