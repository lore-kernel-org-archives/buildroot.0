From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 16 Jan 2014 09:49:34 +0200
Subject: [Buildroot] [PATCH] tvheadend: disable when NPTL is missing
Message-ID: <ab66cde1a0e02e60b0238a227bf982aa22f8eac5.1389858574.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/0ae/0ae5c5158215a48d4d4849f52837bbe4b36db381/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/tvheadend/Config.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 04bcde122d56..da60f83a9c0e 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,5 +1,6 @@
 comment "tvheadend needs a toolchain w/ largefile, IPv6, threads"
-	depends on !BR2_avr32
+	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
+	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
 	depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_TVHEADEND
@@ -12,6 +13,10 @@ config BR2_PACKAGE_TVHEADEND
 	# context of Buildroot, the only really problematic
 	# architecture is avr32, which uses gcc 4.2.
 	depends on !BR2_avr32
+	# clock_nanosleep needs NPTL
+	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
+	# no NPTL for these archs
+	depends on !BR2_xtensa && !BR2_arc
 	select BR2_PACKAGE_DVB_APPS
 	select BR2_PACKAGE_OPENSSL
 	help
-- 
1.8.5.2
