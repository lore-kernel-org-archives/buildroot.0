From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Sep 2020 14:22:20 +0200
Subject: [Buildroot] [PATCH 1/2] linux: show compression options only on
 some architectures
Message-ID: <20200924122222.3449188-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our Linux kernel compression options have the effect of enabling
CONFIG_KERNEL_{GZIP,LZMA,LZ4,...}. However, those configuration
options only exist on a subset of the CPU architectures, and it is
confusing to have such a choice visible when it in fact has no
effect. For example on ARM64, it has absolutely no effect, and the way
to create a compressed image is different, and the image is not
self-extractible.

So, we introduce a BR2_LINUX_KERNEL_ARCH_HAS_COMPRESSION to know which
architectures have compression support. Of course, it's never going to
be perfect as the set of architectures supporting compression might
change over time. But at least, it will allow us to hide this option
on architectures that do not at this point support compression.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 49da2b81b2..9f2af6da5b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -299,6 +299,22 @@ endchoice
 # Kernel compression format
 #
 
+# Indicates whether this architecture has support for built-in kernel
+# compression, i.e architectures that select one of
+# HAVE_KERNEL_{GZIP,LZMA,LZ4,LZO,XZ,UNCOMPRESSED}
+config BR2_LINUX_KERNEL_ARCH_HAS_COMPRESSION
+	bool
+	default y if BR2_arcle || BR2_arceb
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_csky
+	default y if BR2_i386
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_sh
+	default y if BR2_x86_64
+
+if BR2_LINUX_KERNEL_ARCH_HAS_COMPRESSION
+
 choice
 	prompt "Kernel compression format"
 	help
@@ -326,6 +342,8 @@ config BR2_LINUX_KERNEL_ZSTD
 
 endchoice
 
+endif
+
 config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
 	string "Kernel image target name"
 	depends on BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
-- 
2.26.2
