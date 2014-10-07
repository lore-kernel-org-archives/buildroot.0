From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:14 +0200
Subject: [Buildroot] [PATCH 05/30] package/qemu: add fine-grained target
	selection
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <c89a7b0c9e3077db5e2abe973808648fa30f57da.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 21 +++++++++++++++++++++
 package/qemu/qemu.mk   |  4 ++++
 2 files changed, 25 insertions(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index a8fe9c8..d0006d5 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -29,6 +29,25 @@ if BR2_PACKAGE_QEMU
 
 comment "Emulators selection"
 
+config BR2_PACKAGE_QEMU_CUSTOM_TARGETS
+	string "Enable specific targets"
+	help
+	  Enter here the list of QEMU targets you want to build. For example:
+
+	    System emulation      | User-land emulation
+	    ----------------------+-----------------------
+	    i386-softmmu          | i386-linux-user
+	    arm-softmmu           | ppc-linux-user
+	    x86_64-softmmu        | sparc-bsd-user
+	    ...                   | ...
+
+config QEMU_FOO
+	bool # To break the indentation
+
+if BR2_PACKAGE_QEMU_CUSTOM_TARGETS = ""
+
+comment "... or you can select emulator families to enable, below:"
+
 config BR2_PACKAGE_QEMU_SYSTEM
 	bool "Enable all systems emulation"
 	help
@@ -41,4 +60,6 @@ config BR2_PACKAGE_QEMU_LINUX_USER
 
 # Note: bsd-user can not be build on Linux
 
+endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
+
 endif # BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 9f76145..5d9fd48 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -111,6 +111,10 @@ else
 QEMU_OPTS += --disable-linux-user
 endif
 
+ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
+QEMU_OPTS += --target-list="$(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS))"
+endif
+
 define QEMU_CONFIGURE_CMDS
 	( cd $(@D);                                 \
 	    LIBS='$(QEMU_LIBS)'                     \
-- 
1.9.1
