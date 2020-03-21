From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2020 21:43:31 +0100
Subject: [Buildroot] [git commit] linux: Allow modprobe for out-of-tre
 modules
Message-ID: <20200321203709.A5CAD83B8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82e7656400958d2a1aa458e86db518201e27e7fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a package installs a kernel module, it is currently not possible to
have it loaded with modprobe or when the kernel requests an alias for
it, as the module is not listed in /lib/modules/<kernel-version>/modules.dep
and the associated files.

So, we need to run depmod after all packages are installed, to register
any such out-of-tree module.

This means we should be able to let go of calling depmod at the time the
kernel is installed, but if we pass an invalid command, the kernel
whines:

      DEPMOD  5.4.27
    ./scripts/depmod.sh: 46: /dev/null: Permission denied
    make[2]: *** [Makefile:1326: _modinst_post] Error 126

This is because the kernel does not directly call to depmod, but uses a
wrapper that is not happy if depmod is not depmod.

Since the call to depmod does not cost much, we just keep it.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
[yann.morin.1998 at free.fr:
  - keep calling depmod when installing kernel
  - expand commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/linux.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index f8c34c3dca..2e3ea52053 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -127,6 +127,8 @@ LINUX_POST_EXTRACT_HOOKS += LINUX_XTENSA_OVERLAY_EXTRACT
 LINUX_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
 
+# We don't want to run depmod after installing the kernel. It's done in a
+# target-finalize hook, to encompass modules installed by packages.
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
@@ -534,6 +536,13 @@ define LINUX_INSTALL_TARGET_CMDS
 	$(LINUX_INSTALL_HOST_TOOLS)
 endef
 
+# Run depmod in a target-finalize hook, to encompass modules installed by
+# packages.
+define LINUX_RUN_DEPMOD
+	$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED)
+endef
+LINUX_TARGET_FINALIZE_HOOKS += LINUX_RUN_DEPMOD
+
 # Include all our extensions.
 #
 # Note: our package infrastructure uses the full-path of the last-scanned
