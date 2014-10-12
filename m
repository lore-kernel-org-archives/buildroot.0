From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 18:54:11 +0200
Subject: [Buildroot] [git commit] package/qemu: build for the target (i386
	or x86_64 only)
Message-ID: <20141012172417.BFF1BB2940@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98e1a6b9619c5f7eca0d83c70d3fd818c0a7c040
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Untested for other architectures, so only enabled for known-working ones.

We explicitly disable all features that depends on other packages,
for now. Such features will be added one by one in the next patches.
Features that do not rely on external packages are explicitly enabled
to catch the dependencies on toolchain features early.

[Peter: propagate dependencies from libglib2]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in      |    1 +
 package/qemu/Config.in |   28 ++++++++++++++++++
 package/qemu/qemu.mk   |   72 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ef84916..19bb9bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -931,6 +931,7 @@ menu "Miscellaneous"
 	source "package/haveged/Config.in"
 	source "package/mcrypt/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
+	source "package/qemu/Config.in"
 	source "package/shared-mime-info/Config.in"
 	source "package/snowball-init/Config.in"
 	source "package/sound-theme-borealis/Config.in"
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
new file mode 100644
index 0000000..6cd6cc8
--- /dev/null
+++ b/package/qemu/Config.in
@@ -0,0 +1,28 @@
+comment "QEMU requires a toolchain with threads"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_QEMU
+	bool "QEMU"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_USE_MMU # fork()
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
index 0af07d9..d6ccc08 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -82,3 +82,75 @@ $(eval $(host-generic-package))
 
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
+QEMU_VARS = \
+	LIBTOOL=$(HOST_DIR)/usr/bin/libtool \
+    PYTHON=$(HOST_DIR)/usr/bin/python \
+    PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
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
+	        --enable-kvm                        \
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
+	        --disable-smartcard-nss             \
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
