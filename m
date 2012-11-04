From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 01:01:48 +0100
Subject: [Buildroot] [git commit] libhid: disable on avr32
Message-ID: <20121104090716.BCA2999929@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2424cc6783bbfb542f08cf1985b8c9ef18282161
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libhid uses timerfd, which is not yet available in the uClibc-0.9.31
that we have to rely on for avr32.  Since this is pretty much a corner
case, just disable libhid for avr32.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libhid/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libhid/Config.in b/package/libhid/Config.in
index 093b98f..bd1cfcb 100644
--- a/package/libhid/Config.in
+++ b/package/libhid/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBHID
 	bool "libhid"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on !BR2_avr32 # timerfd not in uClibc-0.9.31
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -9,4 +10,4 @@ config BR2_PACKAGE_LIBHID
 	  http://libhid.alioth.debian.org
 
 comment "libhid needs a toolchain with thread support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS && !BR2_avr32
