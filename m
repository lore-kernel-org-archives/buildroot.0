From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:54:01 +0200
Subject: [Buildroot] [PATCH 13/36] package/qemu: add fine-grained target
	selection
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-13-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |   21 +++++++++++++++++++++
 package/qemu/qemu.mk   |    4 ++++
 2 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 253a4ad..ba9b1d6 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -24,6 +24,25 @@ if BR2_PACKAGE_QEMU
 
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
 # We need at least one to be selected
 config BR2_PACKAGE_QEMU_EMUL_SET
 	bool
@@ -51,6 +70,8 @@ config BR2_PACKAGE_QEMU_BSD_USER
 	help
 	  Say 'y' to build all BSD user-land emulators that QEMU supports.
 
+endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
+
 endif # BR2_PACKAGE_QEMU
 
 comment "QEMU requires python"
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 34d9dd1..b1f7071 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -43,6 +43,10 @@ else
 QEMU_OPTS += --disable-bsd-user
 endif
 
+ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
+QEMU_OPTS += --target-list="$(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS))"
+endif
+
 #----------------------------------------------------------------------------
 # Package build process
 
-- 
1.7.2.5
