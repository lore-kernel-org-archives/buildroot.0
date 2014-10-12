From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 18:59:37 +0200
Subject: [Buildroot] [git commit] package/qemu: add fine-grained target
	selection
Message-ID: <20141012172417.D1716B03FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fd9a3e864789942fbbd9eee3c31e114fa06f41b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in |   21 +++++++++++++++++++++
 package/qemu/qemu.mk   |    4 ++++
 2 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 96ec301..f29f848 100644
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
 config BR2_PACKAGE_QEMU_SYSTEM
 	bool "Enable all systems emulation"
 	help
@@ -43,4 +62,6 @@ config BR2_PACKAGE_QEMU_LINUX_USER
 
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
