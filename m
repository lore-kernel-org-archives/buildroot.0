From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Dec 2012 18:01:31 +0100
Subject: [Buildroot] [PATCH 02/27] package/qemu: add basic target selection
In-Reply-To: <cover.1355677144.git.yann.morin.1998@free.fr>
References: <cover.1355677144.git.yann.morin.1998@free.fr>
Message-ID: <fd597bc0b814be6dcf9b5c9db3aeb47396103a76.1355677144.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qemu-1.2.1 requires that at least one target emulation be enabled, so
we use some kconfig-tricks to force at least the systems emulations to
be enabled if user emulation is not selected.

This limitation will be lifted in the upcoming qemu-1.3.x

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |   32 ++++++++++++++++++++++++++++++++
 package/qemu/qemu.mk   |   14 ++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 4b05e3d..ddf3665 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -23,3 +23,35 @@ config BR2_PACKAGE_QEMU
 	  server and embedded PowerPC, and S390 guests.
 	  
 	  http://qemu.org/
+
+if BR2_PACKAGE_QEMU
+
+comment "Emulators selection"
+
+# QEMU 1.2.x requires that at least one target emulation be selected, so
+# we use the following two symbols to force systems emulation if user
+# emulation is not selected. This limitation will be lifted when qemu-1.3.0
+# is out.
+config BR2_PACKAGE_QEMU_EMUL_SET
+	bool
+
+config BR2_PACKAGE_QEMU_FORCE_SYSTEM
+	bool
+	default n if BR2_PACKAGE_QEMU_EMUL_SET
+	default y if ! BR2_PACKAGE_QEMU_EMUL_SET
+	select BR2_PACKAGE_QEMU_SYSTEM
+
+config BR2_PACKAGE_QEMU_SYSTEM
+	bool "Enable all systems emulation"
+	help
+	  Say 'y' to build all system emulators/virtualisers that QEMU supports.
+
+config BR2_PACKAGE_QEMU_LINUX_USER
+	bool "Enable all Linux user-land emulation"
+	select BR2_PACKAGE_QEMU_EMUL_SET
+	help
+	  Say 'y' to build all Linux user-land emulators that QEMU supports.
+
+# Note: bsd-user can not be build on Linux
+
+endif # BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index ddab4d0..6fd389b 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -97,6 +97,18 @@ QEMU_VARS =
     PYTHON=$(HOST_DIR)/usr/bin/python                                               \
     PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages    \
 
+ifeq ($(BR2_PACKAGE_QEMU_SYSTEM),y)
+QEMU_OPTS += --enable-system
+else
+QEMU_OPTS += --disable-system
+endif
+
+ifeq ($(BR2_PACKAGE_QEMU_LINUX_USER),y)
+QEMU_OPTS += --enable-linux-user
+else
+QEMU_OPTS += --disable-linux-user
+endif
+
 # Note: although QEMU uses a ./configure script, it is not compatible with
 #       the traditional autotools options (eg. --target et al.), so we have
 #       to override the default provided by the autotools-package infra, and
@@ -117,8 +129,6 @@ define QEMU_CONFIGURE_CMDS
 	        --enable-nptl                       \
 	        --enable-attr                       \
 	        --enable-vhost-net                  \
-	        --enable-system                     \
-	        --enable-linux-user                 \
 	        --disable-bsd-user                  \
 	        --disable-xen                       \
 	        --disable-slirp                     \
-- 
1.7.2.5
