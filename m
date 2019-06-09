From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  9 Jun 2019 12:48:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/gpsd: fix isync build without nmea
Message-ID: <20190609104803.22169-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/7757ff82623eb5db8cbd9cdf69baf308fd0b0666

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...tates.h-fix-isync-build-without-NMEA.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/gpsd/0004-packet_states.h-fix-isync-build-without-NMEA.patch

diff --git a/package/gpsd/0004-packet_states.h-fix-isync-build-without-NMEA.patch b/package/gpsd/0004-packet_states.h-fix-isync-build-without-NMEA.patch
new file mode 100644
index 0000000000..3ae6a64aad
--- /dev/null
+++ b/package/gpsd/0004-packet_states.h-fix-isync-build-without-NMEA.patch
@@ -0,0 +1,39 @@
+From da57b3d59e94b1a2e2ea6167c47cf822c7715626 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 9 Jun 2019 11:52:55 +0200
+Subject: [PATCH] packet_states.h: fix isync build without NMEA
+
+Build fails if isync is enabled without nmea because NMEA_DOLLAR is not
+defined.
+
+Fix this build failure by defining NMEA_DOLLAR if STASH_ENABLE is set
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7757ff82623eb5db8cbd9cdf69baf308fd0b0666
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://gitlab.com/gpsd/gpsd/merge_requests/11]
+---
+ packet_states.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/packet_states.h b/packet_states.h
+index 4c3a3208..f2f04dcf 100644
+--- a/packet_states.h
++++ b/packet_states.h
+@@ -4,8 +4,11 @@
+    COMMENT_BODY,	/* pound comment for a test load */
+    COMMENT_RECOGNIZED,	/* comment recognized */
+ 
+-#ifdef NMEA0183_ENABLE
++#if defined(NMEA0183_ENABLE) || defined(STASH_ENABLE)
+    NMEA_DOLLAR,		/* we've seen first character of NMEA leader */
++#endif /* NMEA0183_ENABLE || STASH_ENABLE */
++
++#ifdef NMEA0183_ENABLE
+    NMEA_BANG,		/* we've seen first character of an AIS message '!' */
+    NMEA_PUB_LEAD,	/* seen second character of NMEA G leader */
+    NMEA_VENDOR_LEAD,	/* seen second character of NMEA P leader */
+-- 
+2.20.1
+
-- 
2.20.1
