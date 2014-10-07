From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:13 +0200
Subject: [Buildroot] [PATCH 04/30] package/qemu: add basic target selection
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <008d362771bc6eeba9cbcfe3398175a8247bcf57.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 18 ++++++++++++++++++
 package/qemu/qemu.mk   | 14 ++++++++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index d323305..a8fe9c8 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -24,3 +24,21 @@ config BR2_PACKAGE_QEMU
 	  server and embedded PowerPC, and S390 guests.
 
 	  http://qemu.org/
+
+if BR2_PACKAGE_QEMU
+
+comment "Emulators selection"
+
+config BR2_PACKAGE_QEMU_SYSTEM
+	bool "Enable all systems emulation"
+	help
+	  Say 'y' to build all system emulators/virtualisers that QEMU supports.
+
+config BR2_PACKAGE_QEMU_LINUX_USER
+	bool "Enable all Linux user-land emulation"
+	help
+	  Say 'y' to build all Linux user-land emulators that QEMU supports.
+
+# Note: bsd-user can not be build on Linux
+
+endif # BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index d6ccc08..9f76145 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -99,6 +99,18 @@ QEMU_VARS = \
     PYTHON=$(HOST_DIR)/usr/bin/python \
     PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 
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
 define QEMU_CONFIGURE_CMDS
 	( cd $(@D);                                 \
 	    LIBS='$(QEMU_LIBS)'                     \
@@ -113,8 +125,6 @@ define QEMU_CONFIGURE_CMDS
 	        --enable-kvm                        \
 	        --enable-attr                       \
 	        --enable-vhost-net                  \
-	        --enable-system                     \
-	        --enable-linux-user                 \
 	        --disable-bsd-user                  \
 	        --disable-xen                       \
 	        --disable-slirp                     \
-- 
1.9.1
