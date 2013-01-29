From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jan 2013 23:43:48 +0100
Subject: [Buildroot] [PATCH 04/29] package/qemu: add fine-grained target
	selection
In-Reply-To: <cover.1359498903.git.yann.morin.1998@free.fr>
References: <cover.1359498903.git.yann.morin.1998@free.fr>
Message-ID: <025c722146434fbe10e5fb664a04c12134d0b5aa.1359498903.git.yann.morin.1998@free.fr>
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
index 9bfe37d..4f1576b 100644
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
 # QEMU 1.2.x requires that at least one target emulation be selected, so
 # we use the following two symbols to force systems emulation if user
 # emulation is not selected. This limitation will be lifted when qemu-1.3.0
@@ -55,4 +74,6 @@ config BR2_PACKAGE_QEMU_LINUX_USER
 
 # Note: bsd-user can not be build on Linux
 
+endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
+
 endif # BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index c2302fa..c91c79b 100644
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
