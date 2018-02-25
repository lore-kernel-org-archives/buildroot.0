From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Feb 2018 23:10:43 +0100
Subject: [Buildroot] [PATCH] package/zlib: zlib-ng only available on some
 archs
Message-ID: <20180225221043.7517-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream has code only for those architectures, with no fallback generic
code, so we must restrict zlib-ng to only those four archs...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Stefan Fr?berg <stefan.froberg@petroprogram.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Note: I was not sure if the big-endian variants for arm and Aarch64 are
supported or not, so to be safe, we supopse they are not. Interested
parties can send further patches to improve the situation.
---
 package/zlib/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/zlib/Config.in b/package/zlib/Config.in
index 87abc2bdd5..40b2e6e0cf 100644
--- a/package/zlib/Config.in
+++ b/package/zlib/Config.in
@@ -1,3 +1,10 @@
+config BR2_PACKAGE_ZLIB_NG_ARCH_SUPPOPRT
+	bool
+	default y if BR2_arm
+	default y if BR2_aarch64
+	default y if BR2_i386
+	default y if BR2_x86_64
+
 config BR2_PACKAGE_ZLIB
 	bool "zlib support"
 	help
@@ -22,6 +29,7 @@ config BR2_PACKAGE_LIBZLIB
 
 config BR2_PACKAGE_ZLIB_NG
 	bool "zlib-ng"
+	depends on BR2_PACKAGE_ZLIB_NG_ARCH_SUPPOPRT
 	select BR2_PACKAGE_HAS_ZLIB
 	help
 	  Zlib replacement with optimizations for
-- 
2.14.1
