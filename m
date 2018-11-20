From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 20 Nov 2018 11:10:42 -0200
Subject: [Buildroot] [PATCH] qemu: add an option to enable seccomp
Message-ID: <20181120131042.6468-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is required to resume working on the forthcoming libvirt package
after a long test period (https://patchwork.ozlabs.org/patch/841613).

Leave it disabled by default, for backward compatibility.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/qemu/Config.in | 13 +++++++++++++
 package/qemu/qemu.mk   |  8 +++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 33d4cccd7b..032d2ccafe 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -137,6 +137,19 @@ config BR2_PACKAGE_QEMU_FDT
 	  Say 'y' here to have QEMU capable of constructing Device
 	  Trees, and passing them to the VMs.
 
+config BR2_PACKAGE_QEMU_SECCOMP
+	bool "Enable seccomp"
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	select BR2_PACKAGE_LIBSECCOMP
+	help
+	  Enable support for the Linux Kernel's syscall filtering
+	  mechanism.
+
+comment "seccomp needs a toolchain w/ headers >= 3.12"
+	depends on !BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+
 comment "FDT support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 5bdf390bc9..253ef9d55c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -55,6 +55,13 @@ endif
 
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_SECCOMP),y)
+QEMU_OPTS += --enable-seccomp
+QEMU_DEPENDENCIES += libseccomp
+else
+QEMU_OPTS += --disable-seccomp
+endif
+
 # There is no "--enable-slirp"
 ifeq ($(BR2_PACKAGE_QEMU_SLIRP),)
 QEMU_OPTS += --disable-slirp
@@ -121,7 +128,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-libiscsi \
 			--disable-usb-redir \
 			--disable-strip \
-			--disable-seccomp \
 			--disable-sparse \
 			--disable-mpath \
 			--disable-sanitizers \
-- 
2.14.5
