From: Min Xu <xuminready@gmail.com>
Date: Sun, 10 Jun 2018 01:01:04 -0700
Subject: [Buildroot] [PATCH 1/1] shadowsocks-libev: fix sync handling
Message-ID: <20180610080104.10059-1-xuminready@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To fixup linking errors:
"undefined reference to `__sync_val_compare_and_swap_4'"
Fixes
http://autobuild.buildroot.net/results/552b09ffe951c429422529c895f4c3ec723cf5ab

http://autobuild.buildroot.net/results/4810526381e15a194767753d324875bfbf5e3dde
http://autobuild.buildroot.net/results/9cb76805c2f2952aa434d143831ee03c7d43aa52

http://autobuild.buildroot.net/results/d00c5f9e1e7a6a40fac5763a06977b351b7875da
http://autobuild.buildroot.net/results/0612f2dc09a8763fdf2111ee8d0c223c8531262a

delete unused hash info.

Signed-off-by: Min Xu <xuminready@gmail.com>
---
 package/shadowsocks-libev/Config.in              | 10 ++++++++++
 package/shadowsocks-libev/shadowsocks-libev.hash |  1 -
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
index d02e5a93ef..1ec4f35bf3 100644
--- a/package/shadowsocks-libev/Config.in
+++ b/package/shadowsocks-libev/Config.in
@@ -1,5 +1,15 @@
+# It requires __sync_*() intrinsics:
+# the 4-byte ones on 32 bits architectures, and the 4-byte and 8-byte
+#   one on 64 bits architecture
+config BR2_PACKAGE_SHADOWSOCKS_LIBEV_ARCH_SUPPORTS
+	bool
+	default y if BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_ARCH_IS_64
+	default y if BR2_TOOLCHAIN_HAS_SYNC_4 && BR2_TOOLCHAIN_HAS_SYNC_8 && BR2_ARCH_IS_64
+
 config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 	bool "shadowsocks-libev"
+	depends on BR2_PACKAGE_SHADOWSOCKS_LIBEV_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBEV
diff --git a/package/shadowsocks-libev/shadowsocks-libev.hash b/package/shadowsocks-libev/shadowsocks-libev.hash
index e8be8a8a71..fffe9fddf0 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.hash
+++ b/package/shadowsocks-libev/shadowsocks-libev.hash
@@ -5,4 +5,3 @@ sha256 5521cf623a07fd1e393528516a83acd2b66c5d4bb4535a52662806a6a060c606 shadowso
 sha256 736883f97d44dbec288bb82819f18f4f86d02ae3192f6a9abefa00db76bace41  COPYING
 sha256 c41a4bc2c4c43e4daa3051e77e31b2d5c8500498afaeac6d831d55a4bb8de3fb  libbloom/LICENSE
 sha256 4fa2ada54f8c0410ec243265378242ffe862386d5ac517f8dd30a1911d25ae93  libcork/COPYING
-sha256 4b3adc9ce620fa868f1dda328203dbccbd3e9f5fbafb49c581edc386a504ee1a  libipset/LICENSE.txt
-- 
2.11.0
