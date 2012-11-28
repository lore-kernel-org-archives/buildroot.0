From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Nov 2012 00:54:26 +0100
Subject: [Buildroot] [PATCH 27/51] package/qemu: add fine-grained target
	selection
In-Reply-To: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1354146890-27380-28-git-send-email-yann.morin.1998@free.fr>
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
index aceff18..29fd513 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -31,6 +31,25 @@ if BR2_PACKAGE_QEMU
 
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
@@ -58,4 +77,6 @@ config BR2_PACKAGE_QEMU_BSD_USER
 	help
 	  Say 'y' to build all BSD user-land emulators that QEMU supports.
 
+endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
+
 endif # BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 89d62c0..d77e3b8 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -124,6 +124,10 @@ else
 QEMU_OPTS += --disable-bsd-user
 endif
 
+ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
+QEMU_OPTS += --target-list="$(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS))"
+endif
+
 # Note: although QEMU uses a ./configure script, it is not compatible with
 #       the traditional autotools options (eg. --target et al.), so we can
 #       not use the autotools-package infrastructure. So we have to use the
-- 
1.7.2.5
