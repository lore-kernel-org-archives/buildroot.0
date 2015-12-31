From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Dec 2015 15:55:35 +0100
Subject: [Buildroot] [git commit] acsccid: propagate dependencies from
	pcsc-lite
Message-ID: <20151231145650.231497FF85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e097b36d345186b5fd1ad99c122ec889fdd6c665
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new package acsccid properly propagated the dependency of libusb,
but not the one of pcsc-lite, causing pcsc-lite to be selected in
situation where it shouldn't be (such as in static-only
configurations).

Fixes:

  http://autobuild.buildroot.org/results/e0b/e0b205dceb84303d1dfaf8b39562b934f6914b8d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/acsccid/Config.in | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/acsccid/Config.in b/package/acsccid/Config.in
index 165148e..90624ee 100644
--- a/package/acsccid/Config.in
+++ b/package/acsccid/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_ACSCCID
 	bool "acsccid"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pcsc-lite, libusb
+	depends on BR2_USE_MMU # pcsc-lite
+	depends on !BR2_STATIC_LIBS # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
 	# Even though there is a --disable-libusb option, it has in
 	# fact no effect, and acsccid really requires libusb.
@@ -11,5 +13,7 @@ config BR2_PACKAGE_ACSCCID
 
 	  http://acsccid.sourceforge.net/
 
-comment "acsccid needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "acsccid needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
