From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 1 Aug 2019 16:08:01 +0200
Subject: [Buildroot] [git commit] linux: make
 BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT public
Message-ID: <20190801140813.98C5E8164F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=869773d6683fc5bc0d8b3a7240a3dd95e17e659d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently the BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT option is only
available to be selected by another config option. This option controls
if the Linux build system should build the DTB itself, or if buildroot
explicitly calls the Linux Makefile like "make something.dtb".

My use case: I want to build an OpenRISC image with a custom device tree
file. OpenRISC does not support appended DTBs, and I'm not using a
bootloader, but link everything into a single kernel (vmlinux) image.

The kernel option CONFIG_OPENRISC_BUILTIN_DTB allows me to specify a dtb
file, which is typically located in the kernel source tree in
arch/openrisc/boot/dts/NAME.dts.

Since my dts file is not part of the upstream kernel, I have two
options: either patch the kernel to include the DTS file, and then
specify it using the CONFIG_OPENRISC_BUILTIN_DTB option.

Or use buildroot's BR2_LINUX_KERNEL_CUSTOM_DTS_PATH config option to
copy any DTS file to the kernel source tree, and then specify this file
with CONFIG_OPENRISC_BUILTIN_DTB as before.

However, the second option also requries the buildroot option
BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT to be set, otherwise I end up with a
"make -C kerneldir NAME.dts" call, which doesn't work (no such target
exists).

Currently the BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT option exists, but it's
not visible/available. Simply making it available solves the problem for
me nicely.

Signed-off-by: Philipp Wagner <mail@philipp-wagner.com>
[Arnout: add help text]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/Config.in | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 871141fdcd..e275b8ad4f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -375,7 +375,13 @@ if BR2_LINUX_KERNEL_DTS_SUPPORT
 # The variable below address the second case, were you only want
 # limited actions from buildroot.
 config BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
-	bool
+	bool "DTB is built by kernel itself"
+	help
+	  Normally, the device tree(s) to be built have to be passed
+	  explicitly to the kernel build system. For some binary
+	  formats, however, the kernel build system links in the
+	  device tree directly in the kernel binary. Select this option
+	  if you have such a kernel binary format.
 
 config BR2_LINUX_KERNEL_APPENDED_DTB
 	bool
