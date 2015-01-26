From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jan 2015 23:33:40 +0100
Subject: [Buildroot] [git commit] libnftl: loosen threads dependency
Message-ID: <20150126223425.C54B080429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4aec35bf9c16fe94501b5ce5dca9e10be4495b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nftables works fine without threads, only the XML parsing support in
libnftl requires -lpthread so move the depends into
BR2_PACKAGE_LIBNFTNL_XML.

[Thomas: tweak commit title and log.]

Signed-off-by: Alexander Clouter <alex+buildroot@digriz.org.uk>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnftnl/Config.in |   10 ++++++----
 package/nftables/Config.in |    6 ++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/libnftnl/Config.in b/package/libnftnl/Config.in
index ffd9d5b..af0bb4a 100644
--- a/package/libnftnl/Config.in
+++ b/package/libnftnl/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBNFTNL
 	bool "libnftnl"
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# bad headers, no sa_family_t in linux/socket.h
 	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
 	select BR2_PACKAGE_LIBMNL
@@ -25,12 +24,15 @@ config BR2_PACKAGE_LIBNFTNL_JSON
 
 config BR2_PACKAGE_LIBNFTNL_XML
 	bool "enable XML support"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_MXML
 	help
 	  Enable XML parsing support
 
+comment "libnftnl XML parsing support needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 endif
 
-comment "libnftnl needs a toolchain w/ threads, IPv6, largefile"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || \
-		!BR2_LARGEFILE
+comment "libnftnl needs a toolchain w/ IPv6, largefile"
+	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE
diff --git a/package/nftables/Config.in b/package/nftables/Config.in
index 1e0798e..b7af244 100644
--- a/package/nftables/Config.in
+++ b/package/nftables/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_NFTABLES
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_LIBMNL
@@ -18,7 +17,6 @@ config BR2_PACKAGE_NFTABLES
 
 	  http://www.netfilter.org/projects/nftables/index.html
 
-comment "nftables needs a toolchain w/ IPv6, largefile, threads, wchar, headers >= 3.4"
+comment "nftables needs a toolchain w/ IPv6, largefile, wchar, headers >= 3.4"
 	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
