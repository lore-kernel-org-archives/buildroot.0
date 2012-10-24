From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Oct 2012 23:25:48 +0200
Subject: [Buildroot] [PATCH 22/47] package/qemu: add basic target selection
In-Reply-To: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1351113973-17237-23-git-send-email-yann.morin.1998@free.fr>
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
index bd37b34..c8623bf 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -25,3 +25,36 @@ config BR2_PACKAGE_QEMU
 	  server and embedded PowerPC, and S390 guests.
 	  
 	  http://qemu.org/
+
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
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 83d8227..14d0505 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -25,6 +25,24 @@ QEMU_VARS =
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
+ifeq ($(BR2_PACKAGE_QEMU_BSD_USER),y)
+QEMU_OPTS += --enable-bsd-user
+else
+QEMU_OPTS += --disable-bsd-user
+endif
+
 # Note: although QEMU uses a ./configure script, it is not compatible with
 #       the traditional autotools options (eg. --target et al.), so we can
 #       not use the autotools-package infrastructure. So we have to use the
@@ -45,9 +63,6 @@ define QEMU_CONFIGURE_CMDS
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
