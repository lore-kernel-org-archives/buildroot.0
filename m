From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2021 21:33:23 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] toolchain: CodeSourcery
 AArch64 2014.11 does not contain libatomic
Message-ID: <20210112201447.372A787628@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52bee93025332e4178377927453cb5d9c0c9ced7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a530fd4a4268b44961d8ab0a053fa0cf3b29fb5c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index db2ab0f059..5611e5c6d5 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -697,6 +697,7 @@ config BR2_TOOLCHAIN_HAS_SYNC_8
 config BR2_TOOLCHAIN_HAS_LIBATOMIC
 	bool
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64 && \
 		BR2_TOOLCHAIN_HAS_THREADS && \
 		!BR2_BINFMT_FLAT
 
