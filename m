From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 20:43:26 +0200
Subject: [Buildroot] [git commit] shadowsocks-libev: add dependency on sync
 builtins
Message-ID: <20180617184430.B7B26886EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0c28f2a80522961c33bbcefc35b4f09dbcb6429
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcork (bundled inside shadowsocks-libev) uses the __sync builtins
for atomic operations: the 4-byte variant on 32 bits platforms and the
8-byte variant on 64-bits platform.

Fixes:

  http://autobuild.buildroot.net/results/552b09ffe951c429422529c895f4c3ec723cf5ab

Signed-off-by: Min Xu <xuminready@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shadowsocks-libev/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
index 56914e8e9d..f58abdbcb1 100644
--- a/package/shadowsocks-libev/Config.in
+++ b/package/shadowsocks-libev/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 	bool "shadowsocks-libev"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # for libcork
+	depends on BR2_TOOLCHAIN_HAS_SYNC_8 || !BR2_ARCH_IS_64 # for libcork
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_C_ARES
@@ -14,5 +16,7 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 	  https://github.com/shadowsocks/shadowsocks-libev
 
 comment "shadowsocks-libev needs a toolchain w/ threads"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_HAS_SYNC_8 || !BR2_ARCH_IS_64
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
