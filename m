From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 10 Apr 2020 15:34:14 -0600
Subject: [Buildroot] [PATCH 1/1] package/wireguard-linux-compat: depend on
 headers < 5.6
Message-ID: <20200410213414.60355-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since wireguard is built into kernels 5.6 and later we can't build
wireguard-linux-compat on them, so we need to depend on
!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wireguard-linux-compat/Config.in | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wireguard-linux-compat/Config.in b/package/wireguard-linux-compat/Config.in
index 4ee214be63..5ecb4ef591 100644
--- a/package/wireguard-linux-compat/Config.in
+++ b/package/wireguard-linux-compat/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_WIREGUARD_LINUX_COMPAT
 	depends on BR2_LINUX_KERNEL
 	# kernel module requires 3.10+
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	# kernel module incompatible with 5.6+
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
 	help
 	  WireGuard is an extremely simple yet fast and modern VPN
 	  that utilizes state-of-the-art cryptography. It aims to be
@@ -20,4 +22,8 @@ config BR2_PACKAGE_WIREGUARD_LINUX_COMPAT
 	  https://www.wireguard.com
 
 comment "wireguard-linux-compat needs a toolchain w/ headers >= 3.10"
-	depends on BR2_LINUX_KERNEL && !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	depends on BR2_LINUX_KERNEL && !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 \
+		&& !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
+
+comment "wireguard-linux-compat cannot be used with kernels that have native wireguard support"
+	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
-- 
2.20.1
