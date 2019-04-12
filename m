From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 12 Apr 2019 18:56:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/lldpd: fix build without cdp
Message-ID: <20190412165602.29302-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/e46055b86bcb03614f3fba076af2278e46a39714

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...lation-with--enable-fdp--disable-cdp.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/lldpd/0001-build-fix-compilation-with--enable-fdp--disable-cdp.patch

diff --git a/package/lldpd/0001-build-fix-compilation-with--enable-fdp--disable-cdp.patch b/package/lldpd/0001-build-fix-compilation-with--enable-fdp--disable-cdp.patch
new file mode 100644
index 0000000000..575d97d96d
--- /dev/null
+++ b/package/lldpd/0001-build-fix-compilation-with--enable-fdp--disable-cdp.patch
@@ -0,0 +1,35 @@
+From 4e7ec8233cd185941eaa9e41785cfc53f92799b4 Mon Sep 17 00:00:00 2001
+From: Vincent Bernat <vincent@bernat.ch>
+Date: Tue, 8 Jan 2019 17:19:15 -0500
+Subject: [PATCH] build: fix compilation with `--enable-fdp --disable-cdp`
+
+Fix #315
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/vincentbernat/lldpd/commit/4e7ec8233cd185941eaa9e41785cfc53f92799b4]
+---
+ src/lldpd-structs.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/lldpd-structs.h b/src/lldpd-structs.h
+index c3ffa108..f6b03d7d 100644
+--- a/src/lldpd-structs.h
++++ b/src/lldpd-structs.h
+@@ -129,7 +129,7 @@ struct lldpd_dot3_power {
+ MARSHAL(lldpd_dot3_power);
+ #endif
+ 
+-#ifdef ENABLE_CDP
++#if defined (ENABLE_CDP) || defined (ENABLE_FDP)
+ struct cdpv2_power {
+ 	u_int16_t request_id;
+ 	u_int16_t management_id;
+@@ -273,7 +273,7 @@ struct lldpd_port {
+ 	struct lldpd_med_power	 p_med_power;
+ #endif
+ 
+-#ifdef ENABLE_CDP
++#if defined (ENABLE_CDP) || defined (ENABLE_FDP)
+ 	struct cdpv2_power p_cdp_power;
+ #endif
+ 
-- 
2.20.1
