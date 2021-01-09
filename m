From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Jan 2021 13:33:37 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: CodeSourcery AArch64 2014.11
 does not contain libatomic
Message-ID: <20210109123337.1512700-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build error

output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-amd-linux-gnu/4.9.1/../../../../aarch64-amd-linux-gnu/bin/ld:
 cannot find -latomic

using this defconfig

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64=y
BR2_PACKAGE_OPENSSL=y

libopenssl is only used here as an example: all packages adding -latomic
if BR2_TOOLCHAIN_HAS_LIBATOMIC=y are broken, like dav1d, ffmpeg, gnutls,
kodi and vlc.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 toolchain/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 395c8e36b8..553612c4aa 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -702,6 +702,7 @@ config BR2_TOOLCHAIN_HAS_SYNC_8
 config BR2_TOOLCHAIN_HAS_LIBATOMIC
 	bool
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64 && \
 		BR2_TOOLCHAIN_HAS_THREADS && \
 		!BR2_BINFMT_FLAT
 
-- 
2.29.2
