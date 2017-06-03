From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  4 Jun 2017 00:30:33 +0300
Subject: [Buildroot] [PATCH] iproute2: needs kernel headers 3.4+
Message-ID: <57d7063c549b528c75863ae3c0278f4fcc2439cc.1496525433.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iproute2 needs the __kernel_long_t and __kernel_ulong_t types that were
introduced in kernel v3.4.

Fixes:
http://autobuild.buildroot.net/results/823/823f0dbe17999c07134fac5a0620e3ad15362204/
http://autobuild.buildroot.net/results/a79/a797a6e3d193fa70abd59411df21657a1c0a45d4/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ifupdown/Config.in | 6 +++---
 package/iproute2/Config.in | 6 +++---
 package/openswan/Config.in | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/ifupdown/Config.in b/package/ifupdown/Config.in
index ccacd0fc9cec..97d02b4c37fc 100644
--- a/package/ifupdown/Config.in
+++ b/package/ifupdown/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_IFUPDOWN
 	bool "ifupdown"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # iproute2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # iproute2
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	# runtime for ip binary
 	select BR2_PACKAGE_IPROUTE2 if !BR2_PACKAGE_BUSYBOX
@@ -12,7 +12,7 @@ config BR2_PACKAGE_IFUPDOWN
 
 	  https://tracker.debian.org/pkg/ifupdown
 
-comment "ifupdown needs a toolchain w/ headers >= 3.0"
+comment "ifupdown needs a toolchain w/ headers >= 3.4"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/iproute2/Config.in b/package/iproute2/Config.in
index fd373a812342..ab9e515eca76 100644
--- a/package/iproute2/Config.in
+++ b/package/iproute2/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_IPROUTE2
 	bool "iproute2"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # bpf, namespaces
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # __kernel_{u,}long_t
 	help
 	  Kernel routing and traffic control utilities. Provides things
 	  like ip and tc.
 
 	  http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2
 
-comment "iproute2 needs a toolchain w/ headers >= 3.0"
+comment "iproute2 needs a toolchain w/ headers >= 3.4"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
diff --git a/package/openswan/Config.in b/package/openswan/Config.in
index 5db665c6f70c..340686cc50e6 100644
--- a/package/openswan/Config.in
+++ b/package/openswan/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_OPENSWAN
 	bool "openswan"
 	depends on BR2_USE_MMU # iproute2
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # iproute2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # iproute2
 	depends on !BR2_TOOLCHAIN_USES_MUSL # GLOB_BRACE
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_IPROUTE2
@@ -10,7 +10,7 @@ config BR2_PACKAGE_OPENSWAN
 
 	  http://www.openswan.org
 
-comment "openswan needs a uClibc or glibc toolchain w/ headers >= 3.0"
+comment "openswan needs a uClibc or glibc toolchain w/ headers >= 3.4"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || \
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || \
 		BR2_TOOLCHAIN_USES_MUSL
-- 
2.11.0
