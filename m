From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Nov 2018 13:27:55 +0100
Subject: [Buildroot] [PATCH 1/4] llvm: fix build of host-llvm
Message-ID: <20181103122758.10578-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If BR2_PACKAGE_LLVM_TARGET_ARCH is empty because llvm is not supported
on target, build of the host-llvm will fail on "Unknown architecture".

This is an issue because host-llvm (and host-clang) can be needed on
host. For example the libv4l package uses clang to build BPF (in-kernel
bytecode machine) files.

To fix this, add a new "host" default value to
BR2_PACKAGE_LLVM_TARGET_ARCH

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/llvm/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 83e94660eb..0e111f1b76 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_LLVM_TARGET_ARCH
 	default "AArch64" if BR2_aarch64
 	default "ARM" if BR2_arm || BR2_armeb
 	default "X86" if BR2_i386 || BR2_x86_64
+	default "host"
 
 config BR2_PACKAGE_LLVM
 	bool "llvm"
-- 
2.17.1
