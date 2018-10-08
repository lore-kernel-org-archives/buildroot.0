From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 17:42:33 +0200
Subject: [Buildroot] [git commit] gpsd: upgrade to 3.18
Message-ID: <20181008154213.2753E8E422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a098aa2dbee360f022bdb5919e6c6b34a2d1c6c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removing previously upstreamed build fix patch and add config
option for the newly introduced Greis driver

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...x-isync-build-when-ublox-not-selected-too.patch | 36 ----------------------
 package/gpsd/Config.in                             |  5 +++
 package/gpsd/gpsd.hash                             |  2 +-
 package/gpsd/gpsd.mk                               |  5 ++-
 4 files changed, 10 insertions(+), 38 deletions(-)

diff --git a/package/gpsd/0002-Fix-isync-build-when-ublox-not-selected-too.patch b/package/gpsd/0002-Fix-isync-build-when-ublox-not-selected-too.patch
deleted file mode 100644
index 1dfa9607e3..0000000000
--- a/package/gpsd/0002-Fix-isync-build-when-ublox-not-selected-too.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 98c8f5f4429ac3bfc09eee235fee08b9aaff8c52 Mon Sep 17 00:00:00 2001
-From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
-Date: Tue, 30 Jan 2018 19:58:54 -0800
-Subject: [PATCH] Fix isync build when ublox not selected too.
-
-The isync support uses the ublox driver, but if the ublox support is
-disabled while isync is enabled, the build will fail.
-
-
-Upstream commit:
-http://git.savannah.gnu.org/cgit/gpsd.git/commit/?id=98c8f5f4429ac3bfc09eee235fee08b9aaff8c52
-
-Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
----
- SConstruct | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/SConstruct b/SConstruct
-index 1c1a215..c6a309e 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -334,6 +334,11 @@ for driver in ('ashtech',
-         env['nmea0183'] = True
-         break
- 
-+
-+# iSync uses ublox underneath, so we force to enable it
-+if env['isync']:
-+    env['ublox'] = True
-+
- opts.Save('.scons-option-cache', env)
- env.SConsignFile(".sconsign.dblite")
- 
--- 
-2.7.4
-
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 849d22ffa7..e951c0154e 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -154,6 +154,11 @@ config BR2_PACKAGE_GPSD_GPSCLOCK
 	help
 	  GPSClock support
 
+config BR2_PACKAGE_GPSD_GREIS
+	bool "Greis"
+	help
+	  Greis support
+
 config BR2_PACKAGE_GPSD_ISYNC
 	bool "iSync"
 	help
diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index 805c298bca..fe594ea28b 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	68e0dbecfb5831997f8b3d6ba48aed812eb465d8c0089420ab68f9ce4d85e77a	gpsd-3.17.tar.gz
+sha256	48521f5158f5fda4c88a6f75e8bfc1ee67e999e3fc095e4a06cb8c2af56712f4	gpsd-3.18.tar.gz
 sha256	71ff85d18bf063954cfc4251678d0e772223e21f80febbd99d5524c90f73f832	COPYING
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 8c8023e818..b8eea8bf24 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.17
+GPSD_VERSION = 3.18
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-3-Clause
 GPSD_LICENSE_FILES = COPYING
@@ -111,6 +111,9 @@ endif
 ifneq ($(BR2_PACKAGE_GPSD_GPSCLOCK),y)
 GPSD_SCONS_OPTS += gpsclock=no
 endif
+ifneq ($(BR2_PACKAGE_GPSD_GREIS),y)
+GPSD_SCONS_OPTS += greis=no
+endif
 ifneq ($(BR2_PACKAGE_GPSD_ISYNC),y)
 GPSD_SCONS_OPTS += isync=no
 endif
