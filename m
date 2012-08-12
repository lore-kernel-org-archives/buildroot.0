From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:53:59 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_11/36=5D_package/qemu=3A_new_packa?=
	=?utf-8?q?ge?=
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-11-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in      |    1 +
 package/qemu/Config.in |   24 ++++++++++++
 package/qemu/qemu.mk   |   98 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 123 insertions(+), 0 deletions(-)
 create mode 100644 package/qemu/Config.in
 create mode 100644 package/qemu/qemu.mk

diff --git a/package/Config.in b/package/Config.in
index 3109591..eb02983 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -504,6 +504,7 @@ menu "Miscellaneous"
 source "package/collectd/Config.in"
 source "package/empty/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
+source "package/qemu/Config.in"
 source "package/shared-mime-info/Config.in"
 source "package/sound-theme-borealis/Config.in"
 source "package/sound-theme-freedesktop/Config.in"
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
new file mode 100644
index 0000000..a77d863
--- /dev/null
+++ b/package/qemu/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_QEMU
+	bool "QEMU"
+	depends on BR2_PACKAGE_PYTHON       # We only need host-python,
+	                                    # but there's no way to say so.
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  QEMU is a generic and open source machine emulator and virtualizer.
+	  
+	  When used as a machine emulator, QEMU can run OSes and programs made
+	  for one machine (e.g. an ARM board) on a different machine (e.g.
+	  your own PC). By using dynamic translation, it achieves very good
+	  performance.
+	  
+	  When used as a virtualizer, QEMU achieves near native performances
+	  by executing the guest code directly on the host CPU. QEMU supports
+	  virtualization when executing under the Xen hypervisor or using the
+	  KVM kernel module in Linux. When using KVM, QEMU can virtualize x86,
+	  server and embedded PowerPC, and S390 guests. 
+	  
+	  http://qemu.org/
+
+comment "QEMU requires python"
+	depends on !BR2_PACKAGE_PYTHON
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
new file mode 100644
index 0000000..3825731
--- /dev/null
+++ b/package/qemu/qemu.mk
@@ -0,0 +1,98 @@
+#-----------------------------------------------------------------------------
+# Package description
+
+QEMU_VERSION = 1.1.1-1
+QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
+QEMU_SITE = http://wiki.qemu.org/download
+QEMU_LICENSE = GPLv2 LGPLv2.1 MIT BSD-3c BSD-2c Others/BSD-1c
+QEMU_LICENSE_FILES = COPYING COPYING.LIB
+#?NOTE: there is no top-level license file for non-(L)GPL licenses;
+#       the non-(L)GPL license texts are specified in the affected
+#       individual source files.
+
+#-----------------------------------------------------------------------------
+# Package unconditional configuration
+
+QEMU_DEPENDENCIES = zlib libglib2
+
+#-----------------------------------------------------------------------------
+# Package conditional configuration
+
+# Need the LIBS variable because librt and libm are
+# not automatically pulled. :-(
+QEMU_LIBS = -lrt -lm
+
+QEMU_OPTS =
+QEMU_VARS =
+
+#----------------------------------------------------------------------------
+# Package build process
+
+# Note: although QEMU uses a ./configure script, it is not compatible with
+#       the traditional autotools options (eg. --target et al.), so we can
+#       not use the autotools-package infrastructure. So we have to use the
+#       generic-package infra instead. Sigh... :-(
+
+define QEMU_CONFIGURE_CMDS
+	( cd $(@D);                                 \
+	    LIBS='$(QEMU_LIBS)'                     \
+	    $(TARGET_CONFIGURE_OPTS)                \
+	    $(TARGET_CONFIGURE_ARGS)                \
+	    $(QEMU_VARS)                            \
+	    ./configure                             \
+	        --prefix=/usr                       \
+	        --cross-prefix=$(TARGET_CROSS)      \
+	        --audio-drv-list=                   \
+	        --audio-card-list=                  \
+	        --enable-kvm                        \
+	        --enable-nptl                       \
+	        --enable-attr                       \
+	        --enable-vhost-net                  \
+	        --enable-system                     \
+	        --enable-linux-user                 \
+	        --disable-bsd-user                  \
+	        --disable-xen                       \
+	        --disable-slirp                     \
+	        --disable-sdl                       \
+	        --disable-vnc                       \
+	        --disable-virtfs                    \
+	        --disable-brlapi                    \
+	        --disable-curses                    \
+	        --disable-curl                      \
+	        --disable-fdt                       \
+	        --disable-bluez                     \
+	        --disable-guest-base                \
+	        --disable-uuid                      \
+	        --disable-vde                       \
+	        --disable-linux-aio                 \
+	        --disable-cap-ng                    \
+	        --disable-docs                      \
+	        --disable-spice                     \
+	        --disable-rbd                       \
+	        --disable-libiscsi                  \
+	        --disable-usb-redir                 \
+	        --disable-guest-agent               \
+	        --disable-smartcard                 \
+	        --disable-strip                     \
+	        $(QEMU_OPTS)                        \
+	)
+endef
+
+define QEMU_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define QEMU_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define QEMU_UNINSTALL_TARGET_CMDS
+	@echo 'QEMU has no uninstall rule.'
+	@false
+endef
+
+define QEMU_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
-- 
1.7.2.5
