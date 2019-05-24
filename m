From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 24 May 2019 15:57:45 +0200
Subject: [Buildroot] [PATCH/next v2,
 1/1] package/gpsd: bump to version 3.18.1
Message-ID: <20190524135745.8823-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove second patch (already in version)
- Add a patch to fix build without man pages
- Add a patch to remove C99-style loop

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Beno?t Th?baudeau):
 - Add second patch to fix C99-style loop

 ...h-when-not-building-python-man-pages.patch | 59 +++++++++++++++++++
 ...-fix-build-with-reconfigure-disabled.patch | 49 ---------------
 ...-Save-UBX-RXM-RAWX-data-in-rawdate_t.patch | 38 ++++++++++++
 package/gpsd/gpsd.hash                        |  2 +-
 package/gpsd/gpsd.mk                          |  2 +-
 5 files changed, 99 insertions(+), 51 deletions(-)
 create mode 100644 package/gpsd/0002-SConstruct-Do-not-crash-when-not-building-python-man-pages.patch
 delete mode 100644 package/gpsd/0002-driver_greis-fix-build-with-reconfigure-disabled.patch
 create mode 100644 package/gpsd/0003-driver_ubx-Save-UBX-RXM-RAWX-data-in-rawdate_t.patch

diff --git a/package/gpsd/0002-SConstruct-Do-not-crash-when-not-building-python-man-pages.patch b/package/gpsd/0002-SConstruct-Do-not-crash-when-not-building-python-man-pages.patch
new file mode 100644
index 0000000000..75317af10e
--- /dev/null
+++ b/package/gpsd/0002-SConstruct-Do-not-crash-when-not-building-python-man-pages.patch
@@ -0,0 +1,59 @@
+From 02d21faebec245e1526449fb54e7078914d75db7 Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Thu, 1 Nov 2018 15:49:01 -0700
+Subject: SConstruct:  Do not crash when not building python man pages.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://git.savannah.gnu.org/cgit/gpsd.git/commit/?id=02d21faebec245e1526449fb54e7078914d75db7]
+---
+ SConstruct | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index 0fc3614..0226cd2 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -1751,14 +1751,19 @@ if tiocmiwait:
+         "ppscheck.8": "ppscheck.xml",
+     })
+ 
+-all_manpages = list(base_manpages.keys()) + list(python_manpages.keys())
++all_manpages = list(base_manpages.keys())
++if python_manpages:
++    all_manpages += list(python_manpages.keys())
+ 
+ man_env = env.Clone()
+ if man_env.GetOption('silent'):
+     man_env['SPAWN'] = filtered_spawn  # Suppress stderr chatter
+ manpage_targets = []
+ if manbuilder:
+-    items = list(base_manpages.items()) + list(python_manpages.items())
++    items = list(base_manpages.items())
++    if python_manpages:
++        items += list(python_manpages.items())
++
+     for (man, xml) in items:
+         manpage_targets.append(man_env.Man(source=xml, target=man))
+ 
+@@ -1907,7 +1912,7 @@ if qt_env:
+ 
+ 
+ maninstall = []
+-for manpage in list(base_manpages.keys()) + list(python_manpages.keys()):
++for manpage in all_manpages:
+     if not manbuilder and not os.path.exists(manpage):
+         continue
+     section = manpage.split(".")[1]
+@@ -2517,7 +2522,7 @@ if os.path.exists("gpsd.c") and os.path.exists(".gitignore"):
+     if ".gitignore" in distfiles:
+         distfiles.remove(".gitignore")
+     distfiles += generated_sources
+-    distfiles += list(base_manpages.keys()) + list(python_manpages.keys())
++    distfiles += all_manpages
+     if "packaging/rpm/gpsd.spec" not in distfiles:
+         distfiles.append("packaging/rpm/gpsd.spec")
+ 
+-- 
+cgit v1.0-41-gc330
+
diff --git a/package/gpsd/0002-driver_greis-fix-build-with-reconfigure-disabled.patch b/package/gpsd/0002-driver_greis-fix-build-with-reconfigure-disabled.patch
deleted file mode 100644
index 77badb31cf..0000000000
--- a/package/gpsd/0002-driver_greis-fix-build-with-reconfigure-disabled.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 21a752e827bc9e14de4b4c26aef4d0db7403a5b7 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 9 Oct 2018 15:22:46 +0300
-Subject: [PATCH] driver_greis: fix build with reconfigure disabled
-
-Unhide the definition of greis_parse_input and greis_event_hook since
-they are used unconditionally.
-
-Fixes the following build failure:
-
-driver_greis.c:969:25: error: 'greis_parse_input' undeclared here (not in a function); did you mean 'generic_parse_input'?
-     .parse_packet     = greis_parse_input,
-                         ^~~~~~~~~~~~~~~~~
-                         generic_parse_input
-driver_greis.c:973:25: error: 'greis_event_hook' undeclared here (not in a function)
-     .event_hook       = greis_event_hook,
-                         ^~~~~~~~~~~~~~~~
-
-Cc: Gregory Fong <gregory.fong@virginorbit.com>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: http://lists.nongnu.org/archive/html/gpsd-dev/2018-10/msg00012.html
-
- driver_greis.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/driver_greis.c b/driver_greis.c
-index 9eb148fc76cd..222bd9daf020 100644
---- a/driver_greis.c
-+++ b/driver_greis.c
-@@ -797,7 +797,6 @@ static ssize_t greis_control_send(struct gps_device_t *session,
- }
- #endif /* CONTROLSEND_ENABLE */
- 
--#ifdef RECONFIGURE_ENABLE
- static void greis_event_hook(struct gps_device_t *session, event_t event)
- {
-     if (session->context->readonly)
-@@ -870,6 +869,7 @@ static gps_mask_t greis_parse_input(struct gps_device_t *session)
- 	return 0;
- }
- 
-+#ifdef RECONFIGURE_ENABLE
- /**
-  * Set port operating mode, speed, parity, stopbits etc. here.
-  * Note: parity is passed as 'N'/'E'/'O', but you should program
--- 
-2.19.1
-
diff --git a/package/gpsd/0003-driver_ubx-Save-UBX-RXM-RAWX-data-in-rawdate_t.patch b/package/gpsd/0003-driver_ubx-Save-UBX-RXM-RAWX-data-in-rawdate_t.patch
new file mode 100644
index 0000000000..a9b40c64af
--- /dev/null
+++ b/package/gpsd/0003-driver_ubx-Save-UBX-RXM-RAWX-data-in-rawdate_t.patch
@@ -0,0 +1,38 @@
+From d685ab05952d7eadf012fc054032f0190cf2abda Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Fri, 26 Oct 2018 10:12:40 -0700
+Subject: driver_ubx: Save UBX-RXM-RAWX data in rawdate_t.
+
+A step in getting u-blox 8 raw data into the new RAW JSON message.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved (and backported to keep only C99-style loop fix) from:
+https://git.savannah.gnu.org/cgit/gpsd.git/commit/driver_ubx.c?id=d685ab05952d7eadf012fc054032f0190cf2abda]
+---
+ driver_ubx.c | 29 ++++++++++++++++++++++++++---
+ 1 file changed, 26 insertions(+), 3 deletions(-)
+
+diff --git a/driver_ubx.c b/driver_ubx.c
+index 585b2b9..0dccddf 100644
+--- a/driver_ubx.c
++++ b/driver_ubx.c
+@@ -813,6 +813,7 @@ static gps_mask_t ubx_rxm_rawx(struct gps_device_t *session,
+     int8_t leapS;
+     uint8_t numMeas;
+     uint8_t recStat;
++    int i;
+ 
+     if (16 > data_len) {
+ 	gpsd_log(&session->context->errout, LOG_WARN,
+@@ -830,6 +831,6 @@ static gps_mask_t ubx_rxm_rawx(struct gps_device_t *session,
+ 	     "UBX_RXM_RAWX: rcvTow %f week %u leapS %d numMeas %u recStat %d\n",
+ 	     rcvTow, week, leapS, numMeas, recStat);
+ 
+-    for (int i = 0; i < numMeas; i++) {
++    for (i = 0; i < numMeas; i++) {
+         int off = 32 * i;
+         double prMes = getled64((const char *)buf, off + 16);
+         double cpMes = getled64((const char *)buf, off + 24);
+-- 
+cgit v1.0-41-gc330
+
diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index fe594ea28b..a6d4a65200 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	48521f5158f5fda4c88a6f75e8bfc1ee67e999e3fc095e4a06cb8c2af56712f4	gpsd-3.18.tar.gz
+sha256	5cb1e6d880ec9a52c62492dd0e3d77451b7c7ad625895bd652f6354215aec23e	gpsd-3.18.1.tar.gz
 sha256	71ff85d18bf063954cfc4251678d0e772223e21f80febbd99d5524c90f73f832	COPYING
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 0a17ddc93e..8edebe5fbf 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.18
+GPSD_VERSION = 3.18.1
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-3-Clause
 GPSD_LICENSE_FILES = COPYING
-- 
2.20.1
