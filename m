From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 10 Oct 2012 17:06:22 +0200
Subject: [Buildroot] [PATCH v10 01/10] host-qemu: new package
Message-ID: <1349881591-7062-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

only user mode for the current target architecture

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/qemu/qemu.mk |   82 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 package/qemu/qemu.mk

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
new file mode 100644
index 0000000..de72e04
--- /dev/null
+++ b/package/qemu/qemu.mk
@@ -0,0 +1,82 @@
+#############################################################
+#
+# qemu
+#
+#############################################################
+
+QEMU_VERSION = 1.2.0
+QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
+QEMU_SITE = http://wiki.qemu.org/download
+
+#       BR ARCH         qemu
+#       -------         ----
+#       arm             arm
+#       armeb           armeb
+#       avr32           not supported
+#       bfin            not supported
+#       i386            i386
+#       i486            i386
+#       i586            i386
+#       i686            i386
+#       x86_64          x86_64
+#       m68k            m68k
+#       microblaze      microblaze
+#       mips            mips
+#       mipsel          mipsel
+#       mips64          ?
+#       mips64el        ?
+#       powerpc         ppc
+#       sh2             not supported
+#       sh2a            not supported
+#       sh3             not supported
+#       sh3eb           not supported
+#       sh4             sh4
+#       sh4eb           sh4eb
+#       sh4a            ?
+#       sh4aeb          ?
+#       sh64            not supported
+#       sparc           sparc
+
+QEMU_ARCH = $(ARCH)
+ifeq ($(QEMU_ARCH),i486)
+    QEMU_ARCH = i386
+endif
+ifeq ($(QEMU_ARCH),i586)
+    QEMU_ARCH = i386
+endif
+ifeq ($(QEMU_ARCH),i686)
+    QEMU_ARCH = i386
+endif
+ifeq ($(QEMU_ARCH),powerpc)
+    QEMU_ARCH = ppc
+endif
+HOST_QEMU_TARGETS=$(QEMU_ARCH)-linux-user
+
+define HOST_QEMU_CONFIGURE_CMDS
+	(cd $(@D); ./configure                          \
+		--target-list="$(HOST_QEMU_TARGETS)"    \
+		--prefix="$(HOST_DIR)/usr"              \
+		--interp-prefix=$(STAGING_DIR)          \
+		--cc="$(HOSTCC)"                        \
+		--host-cc="$(HOSTCC)"                   \
+		--extra-cflags="$(HOST_CFLAGS)"         \
+		--extra-ldflags="$(HOST_LDFLAGS)"       \
+	)
+endef
+
+define HOST_QEMU_BUILD_CMDS
+	$(MAKE) -C $(@D) all
+endef
+
+define HOST_QEMU_INSTALL_CMDS
+	$(MAKE) -C $(@D) install
+endef
+
+define HOST_QEMU_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(host-generic-package))
+
+# variable used by other packages
+QEMU_USER = $(HOST_DIR)/usr/bin/qemu-$(QEMU_ARCH)
-- 
1.7.9.5
