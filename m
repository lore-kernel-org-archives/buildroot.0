From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:54:00 +0200
Subject: [Buildroot] [PATCH 12/36] package/qemu: add basic target selection
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-12-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |   33 +++++++++++++++++++++++++++++++++
 package/qemu/qemu.mk   |   21 ++++++++++++++++++---
 2 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index a77d863..253a4ad 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -20,5 +20,38 @@ config BR2_PACKAGE_QEMU
 	  
 	  http://qemu.org/
 
+if BR2_PACKAGE_QEMU
+
+comment "Emulators selection"
+
+# We need at least one to be selected
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
+config BR2_PACKAGE_QEMU_BSD_USER
+	bool "Enable all BSD user-land emulation"
+	select BR2_PACKAGE_QEMU_EMUL_SET
+	help
+	  Say 'y' to build all BSD user-land emulators that QEMU supports.
+
+endif # BR2_PACKAGE_QEMU
+
 comment "QEMU requires python"
 	depends on !BR2_PACKAGE_PYTHON
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 3825731..34d9dd1 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -25,6 +25,24 @@ QEMU_LIBS = -lrt -lm
 QEMU_OPTS =
 QEMU_VARS =
 
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
+ifeq ($(BR2_PACKAGE_QEMU_BSD_USER),y)
+QEMU_OPTS += --enable-bsd-user
+else
+QEMU_OPTS += --disable-bsd-user
+endif
+
 #----------------------------------------------------------------------------
 # Package build process
 
@@ -48,9 +66,6 @@ define QEMU_CONFIGURE_CMDS
 	        --enable-nptl                       \
 	        --enable-attr                       \
 	        --enable-vhost-net                  \
-	        --enable-system                     \
-	        --enable-linux-user                 \
-	        --disable-bsd-user                  \
 	        --disable-xen                       \
 	        --disable-slirp                     \
 	        --disable-sdl                       \
-- 
1.7.2.5
