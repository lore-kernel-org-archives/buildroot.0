From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Dec 2012 18:01:32 +0100
Subject: [Buildroot] [PATCH 03/27] package/qemu: add fine-grained target
	selection
In-Reply-To: <cover.1355677144.git.yann.morin.1998@free.fr>
References: <cover.1355677144.git.yann.morin.1998@free.fr>
Message-ID: <cf3baa86604452c308d2fbbf868891ae18e8ff79.1355677144.git.yann.morin.1998@free.fr>
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
index ddf3665..f76b443 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -28,6 +28,25 @@ if BR2_PACKAGE_QEMU
 
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
 # QEMU 1.2.x requires that at least one target emulation be selected, so
 # we use the following two symbols to force systems emulation if user
 # emulation is not selected. This limitation will be lifted when qemu-1.3.0
@@ -54,4 +73,6 @@ config BR2_PACKAGE_QEMU_LINUX_USER
 
 # Note: bsd-user can not be build on Linux
 
+endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
+
 endif # BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 6fd389b..caf3426 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -109,6 +109,10 @@ else
 QEMU_OPTS += --disable-linux-user
 endif
 
+ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
+QEMU_OPTS += --target-list="$(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS))"
+endif
+
 # Note: although QEMU uses a ./configure script, it is not compatible with
 #       the traditional autotools options (eg. --target et al.), so we have
 #       to override the default provided by the autotools-package infra, and
-- 
1.7.2.5
