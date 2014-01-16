From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jan 2014 09:16:28 +0100
Subject: [Buildroot] [git commit] tvheadend: disable when NPTL is missing
Message-ID: <20140116081740.947019C4F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56d0da839cea5dcc52165e0ba4660a2694d09020
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/0ae/0ae5c5158215a48d4d4849f52837bbe4b36db381/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tvheadend/Config.in |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 04bcde1..da60f83 100644
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
