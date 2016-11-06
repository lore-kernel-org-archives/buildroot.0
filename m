From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 23:02:13 +0100
Subject: [Buildroot] [git commit] package/qemu: disable Qemu user-land
	emulation for musl toolchains
Message-ID: <20161106220215.8837681871@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc1d28891f52c3ccce1a01ad5ad1a9db23300495
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like for cyclictest (rt-test)[1], linux-user/syscall.c use the
definition of the "struct sigevent" from Glibc/uClibc which doesn't
build with musl libc.

So, disable Qemu user-land emulation for musl toolchains.

Fixes:
http://autobuild.buildroot.net/results/b27/b277e668d9e22b624416bf46f6ccba802acd257e

[1] 43bffa59e7359610c8f00038ddd97795c0ca35e1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qemu/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index ea6b946..8bae5f4 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -69,11 +69,16 @@ comment "systems emulation needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_QEMU_LINUX_USER
 	bool "Enable all Linux user-land emulation"
+	# Incompatible "struct sigevent" definition on musl
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  Say 'y' to build all Linux user-land emulators that QEMU supports.
 
 # Note: bsd-user can not be build on Linux
 
+comment "Linux user-land emulation needs a glibc or uClibc toolchain"
+	depends on BR2_TOOLCHAIN_USES_MUSL
+
 endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
 
 config BR2_PACKAGE_QEMU_HAS_EMULS
