From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 22:26:44 +0200
Subject: [Buildroot] [git commit] linux: add support for ZSTD compression
Message-ID: <20200903201848.4F1C587A01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88a268354daaaa6422ed875ad8c580dbaf1d81a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for creating self-extractible kernels compressed with ZSTD.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 3 +++
 linux/linux.mk  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 7c2ede8ce2..834f362ead 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -321,6 +321,9 @@ config BR2_LINUX_KERNEL_LZO
 config BR2_LINUX_KERNEL_XZ
 	bool "xz compression"
 
+config BR2_LINUX_KERNEL_ZSTD
+	bool "zstd compression"
+
 endchoice
 
 config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
diff --git a/linux/linux.mk b/linux/linux.mk
index 372fa51c72..e07e014d1e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -98,12 +98,15 @@ else ifeq ($(BR2_LINUX_KERNEL_LZO),y)
 LINUX_DEPENDENCIES += host-lzop
 else ifeq ($(BR2_LINUX_KERNEL_XZ),y)
 LINUX_DEPENDENCIES += host-xz
+else ifeq ($(BR2_LINUX_KERNEL_ZSTD),y)
+LINUX_DEPENDENCIES += host-zstd
 endif
 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_GZIP) += CONFIG_KERNEL_GZIP
 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZ4) += CONFIG_KERNEL_LZ4
 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZMA) += CONFIG_KERNEL_LZMA
 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZO) += CONFIG_KERNEL_LZO
 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) += CONFIG_KERNEL_XZ
+LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_ZSTD) += CONFIG_KERNEL_ZSTD
 
 ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL),y)
 LINUX_DEPENDENCIES += host-openssl
