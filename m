From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Feb 2013 15:06:39 +0100
Subject: [Buildroot] [PATCH 02/29] package/qemu: build for the target (i386
	or x86_64 only)
In-Reply-To: <cover.1359899108.git.yann.morin.1998@free.fr>
References: <cover.1359899108.git.yann.morin.1998@free.fr>
Message-ID: <1cfb9926a84a4518c9afafbdfb36198911804de9.1359899108.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Untested for other architectures, so only enabled for known-working ones.

We explicitly disable all features that depends on other packages,
for now. Such features will be added one by one in the next patches.
Features that do not rely on external packages are explicitly enabled
to catch the dependencies on toolchain features early.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in      |    1 +
 package/qemu/Config.in |   26 +++++++++++++++++
 package/qemu/qemu.mk   |   73 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+), 0 deletions(-)
 create mode 100644 package/qemu/Config.in

diff --git a/package/Config.in b/package/Config.in
index f4a331c..b04534a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -607,6 +607,7 @@ source "package/empty/Config.in"
 source "package/googlefontdirectory/Config.in"
 source "package/mcrypt/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
+source "package/qemu/Config.in"
 source "package/shared-mime-info/Config.in"
 source "package/snowball-init/Config.in"
 source "package/sound-theme-borealis/Config.in"
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
new file mode 100644
index 0000000..b0ed279
--- /dev/null
+++ b/package/qemu/Config.in
@@ -0,0 +1,26 @@
+comment "QEMU requires a toolchain with threads"
+	depends on !BR2_i386 && !BR2_x86_64
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_QEMU
+	bool "QEMU"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_ZLIB
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
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 806ffd8..d8c9e6e 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -81,3 +81,76 @@ $(eval $(host-autotools-package))
 
 # variable used by other packages
 QEMU_USER = $(HOST_DIR)/usr/bin/qemu-$(HOST_QEMU_ARCH)
+
+#-------------------------------------------------------------
+# Target-qemu
+
+QEMU_DEPENDENCIES = host-pkgconf host-python libglib2 zlib pixman
+
+# Need the LIBS variable because librt and libm are
+# not automatically pulled. :-(
+QEMU_LIBS = -lrt -lm
+
+QEMU_OPTS =
+
+QEMU_VARS =                                                                         \
+    PYTHON=$(HOST_DIR)/usr/bin/python                                               \
+    PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages    \
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
+	        --with-system-pixman                \
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
+	        --disable-smartcard                 \
+	        --disable-strip                     \
+	        --disable-seccomp                   \
+	        --disable-sparse                    \
+	        --disable-tools                     \
+	        $(QEMU_OPTS)                        \
+	)
+endef
+
+define QEMU_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QEMU_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(QEMU_MAKE_ENV) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
1.7.2.5
