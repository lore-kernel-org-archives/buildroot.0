From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 18:51:39 +0200
Subject: [Buildroot] [git commit] package/gpsd: bump version to 3.19
Message-ID: <20190804164929.94AE77FCEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fac4ec44de9aa495e8ff5bd6a087abf455ded13d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches applied upstream:
https://gitlab.com/gpsd/gpsd/commit/02d21faebec245e1526449fb54e7078914d75db7
https://gitlab.com/gpsd/gpsd/commit/d685ab05952d7eadf012fc054032f0190cf2abda
https://gitlab.com/gpsd/gpsd/commit/bfc7d136fb78fd20875efceb949c2e537e5435ee

Project moved to gitlab, updated project URL.

Updated license hash and changed license to BSD-2-Clause after upstream
commit:
https://gitlab.com/gpsd/gpsd/commit/2a286af6cf4f7fd469bf6bea644a7416c9631cde

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-crash-when-not-building-python-man-pages.patch | 59 ----------------------
 ...r_ubx-Save-UBX-RXM-RAWX-data-in-rawdate_t.patch | 38 --------------
 ...ket_states.h-fix-isync-build-without-NMEA.patch | 37 --------------
 package/gpsd/Config.in                             |  2 +-
 package/gpsd/gpsd.hash                             |  4 +-
 package/gpsd/gpsd.mk                               |  4 +-
 6 files changed, 5 insertions(+), 139 deletions(-)

diff --git a/package/gpsd/0002-SConstruct-Do-not-crash-when-not-building-python-man-pages.patch b/package/gpsd/0002-SConstruct-Do-not-crash-when-not-building-python-man-pages.patch
deleted file mode 100644
index 75317af10e..0000000000
--- a/package/gpsd/0002-SConstruct-Do-not-crash-when-not-building-python-man-pages.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 02d21faebec245e1526449fb54e7078914d75db7 Mon Sep 17 00:00:00 2001
-From: "Gary E. Miller" <gem@rellim.com>
-Date: Thu, 1 Nov 2018 15:49:01 -0700
-Subject: SConstruct:  Do not crash when not building python man pages.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://git.savannah.gnu.org/cgit/gpsd.git/commit/?id=02d21faebec245e1526449fb54e7078914d75db7]
----
- SConstruct | 13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/SConstruct b/SConstruct
-index 0fc3614..0226cd2 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -1751,14 +1751,19 @@ if tiocmiwait:
-         "ppscheck.8": "ppscheck.xml",
-     })
- 
--all_manpages = list(base_manpages.keys()) + list(python_manpages.keys())
-+all_manpages = list(base_manpages.keys())
-+if python_manpages:
-+    all_manpages += list(python_manpages.keys())
- 
- man_env = env.Clone()
- if man_env.GetOption('silent'):
-     man_env['SPAWN'] = filtered_spawn  # Suppress stderr chatter
- manpage_targets = []
- if manbuilder:
--    items = list(base_manpages.items()) + list(python_manpages.items())
-+    items = list(base_manpages.items())
-+    if python_manpages:
-+        items += list(python_manpages.items())
-+
-     for (man, xml) in items:
-         manpage_targets.append(man_env.Man(source=xml, target=man))
- 
-@@ -1907,7 +1912,7 @@ if qt_env:
- 
- 
- maninstall = []
--for manpage in list(base_manpages.keys()) + list(python_manpages.keys()):
-+for manpage in all_manpages:
-     if not manbuilder and not os.path.exists(manpage):
-         continue
-     section = manpage.split(".")[1]
-@@ -2517,7 +2522,7 @@ if os.path.exists("gpsd.c") and os.path.exists(".gitignore"):
-     if ".gitignore" in distfiles:
-         distfiles.remove(".gitignore")
-     distfiles += generated_sources
--    distfiles += list(base_manpages.keys()) + list(python_manpages.keys())
-+    distfiles += all_manpages
-     if "packaging/rpm/gpsd.spec" not in distfiles:
-         distfiles.append("packaging/rpm/gpsd.spec")
- 
--- 
-cgit v1.0-41-gc330
-
diff --git a/package/gpsd/0003-driver_ubx-Save-UBX-RXM-RAWX-data-in-rawdate_t.patch b/package/gpsd/0003-driver_ubx-Save-UBX-RXM-RAWX-data-in-rawdate_t.patch
deleted file mode 100644
index a9b40c64af..0000000000
--- a/package/gpsd/0003-driver_ubx-Save-UBX-RXM-RAWX-data-in-rawdate_t.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From d685ab05952d7eadf012fc054032f0190cf2abda Mon Sep 17 00:00:00 2001
-From: "Gary E. Miller" <gem@rellim.com>
-Date: Fri, 26 Oct 2018 10:12:40 -0700
-Subject: driver_ubx: Save UBX-RXM-RAWX data in rawdate_t.
-
-A step in getting u-blox 8 raw data into the new RAW JSON message.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved (and backported to keep only C99-style loop fix) from:
-https://git.savannah.gnu.org/cgit/gpsd.git/commit/driver_ubx.c?id=d685ab05952d7eadf012fc054032f0190cf2abda]
----
- driver_ubx.c | 29 ++++++++++++++++++++++++++---
- 1 file changed, 26 insertions(+), 3 deletions(-)
-
-diff --git a/driver_ubx.c b/driver_ubx.c
-index 585b2b9..0dccddf 100644
---- a/driver_ubx.c
-+++ b/driver_ubx.c
-@@ -813,6 +813,7 @@ static gps_mask_t ubx_rxm_rawx(struct gps_device_t *session,
-     int8_t leapS;
-     uint8_t numMeas;
-     uint8_t recStat;
-+    int i;
- 
-     if (16 > data_len) {
- 	gpsd_log(&session->context->errout, LOG_WARN,
-@@ -830,6 +831,6 @@ static gps_mask_t ubx_rxm_rawx(struct gps_device_t *session,
- 	     "UBX_RXM_RAWX: rcvTow %f week %u leapS %d numMeas %u recStat %d\n",
- 	     rcvTow, week, leapS, numMeas, recStat);
- 
--    for (int i = 0; i < numMeas; i++) {
-+    for (i = 0; i < numMeas; i++) {
-         int off = 32 * i;
-         double prMes = getled64((const char *)buf, off + 16);
-         double cpMes = getled64((const char *)buf, off + 24);
--- 
-cgit v1.0-41-gc330
-
diff --git a/package/gpsd/0004-packet_states.h-fix-isync-build-without-NMEA.patch b/package/gpsd/0004-packet_states.h-fix-isync-build-without-NMEA.patch
deleted file mode 100644
index 1a36bc8429..0000000000
--- a/package/gpsd/0004-packet_states.h-fix-isync-build-without-NMEA.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a6561fbf2a53972e552b1619c8711092c72c2199 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 9 Jun 2019 11:52:55 +0200
-Subject: [PATCH] packet_states.h: fix isync build without NMEA
-
-Build fails if isync is enabled without nmea because NMEA_DOLLAR is not
-defined.
-
-Fix this build failure by always defining NMEA_DOLLAR
-
-Fixes:
- - http://autobuild.buildroot.org/results/7757ff82623eb5db8cbd9cdf69baf308fd0b0666
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://gitlab.com/gpsd/gpsd/merge_requests/11]
----
- packet_states.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/packet_states.h b/packet_states.h
-index 4c3a3208..0adbeb1d 100644
---- a/packet_states.h
-+++ b/packet_states.h
-@@ -3,9 +3,9 @@
- 
-    COMMENT_BODY,	/* pound comment for a test load */
-    COMMENT_RECOGNIZED,	/* comment recognized */
-+   NMEA_DOLLAR,		/* we've seen first character of NMEA leader */
- 
- #ifdef NMEA0183_ENABLE
--   NMEA_DOLLAR,		/* we've seen first character of NMEA leader */
-    NMEA_BANG,		/* we've seen first character of an AIS message '!' */
-    NMEA_PUB_LEAD,	/* seen second character of NMEA G leader */
-    NMEA_VENDOR_LEAD,	/* seen second character of NMEA P leader */
--- 
-2.20.1
-
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index c1bebc30d7..685830aed3 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -18,7 +18,7 @@ menuconfig BR2_PACKAGE_GPSD
 
 	  The D-Bus interface is included if dbus-glib is enabled.
 
-	  http://www.catb.org/gpsd/
+	  https://gpsd.gitlab.io/gpsd
 
 if BR2_PACKAGE_GPSD
 
diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index a6d4a65200..40f2b7c990 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	5cb1e6d880ec9a52c62492dd0e3d77451b7c7ad625895bd652f6354215aec23e	gpsd-3.18.1.tar.gz
-sha256	71ff85d18bf063954cfc4251678d0e772223e21f80febbd99d5524c90f73f832	COPYING
+sha256	27dd24d45b2ac69baab7933da2bf6ae5fb0be90130f67e753c110a3477155f39	gpsd-3.19.tar.gz
+sha256	13ba6fe5b2f41f03b854f9ac5f271e116d5ed55890cc20f5fe44dcfa0dc5958b	COPYING
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index a0853dbfd8..b4d0778b18 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.18.1
+GPSD_VERSION = 3.19
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
-GPSD_LICENSE = BSD-3-Clause
+GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
 GPSD_INSTALL_STAGING = YES
 
