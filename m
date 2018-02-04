From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Feb 2018 23:45:40 +0100
Subject: [Buildroot] [git commit] package/gpsd: add config option for
 Spectratime iSync and build fix patch
Message-ID: <20180204224610.BBFEC8839D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b4bbf6e08f1ddb14d103add3747ee894b1184f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As in the inital 3.17 version bump patch the iSync config option was not
added, the iSync driver was implicitly enabled in the gpsd config as default,
and due to a bug in the gpsd build setup, this caused several autobuild issues
which are fixed by this. This commit adds both the Buildroot config option and
the gpsd patch which was also sent to and accepted in upstream.

Fixes:
    http://autobuild.buildroot.net/results/555b4bdd1707aa21e6d3014e30b635c96c5efffc
    http://autobuild.buildroot.net/results/cfc14a2c471c63ecc4c95c12b8e00ed7656acfd2
    http://autobuild.buildroot.net/results/2104e15526bd6f467f0d56dee10b5fa46e2c71dd
    http://autobuild.buildroot.net/results/610b3f898b396c1def682b809482408c2c4555bc
    ... and many more.

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...x-isync-build-when-ublox-not-selected-too.patch | 36 ++++++++++++++++++++++
 package/gpsd/Config.in                             |  5 +++
 package/gpsd/gpsd.mk                               |  3 ++
 3 files changed, 44 insertions(+)

diff --git a/package/gpsd/0002-Fix-isync-build-when-ublox-not-selected-too.patch b/package/gpsd/0002-Fix-isync-build-when-ublox-not-selected-too.patch
new file mode 100644
index 0000000000..1dfa9607e3
--- /dev/null
+++ b/package/gpsd/0002-Fix-isync-build-when-ublox-not-selected-too.patch
@@ -0,0 +1,36 @@
+From 98c8f5f4429ac3bfc09eee235fee08b9aaff8c52 Mon Sep 17 00:00:00 2001
+From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+Date: Tue, 30 Jan 2018 19:58:54 -0800
+Subject: [PATCH] Fix isync build when ublox not selected too.
+
+The isync support uses the ublox driver, but if the ublox support is
+disabled while isync is enabled, the build will fail.
+
+
+Upstream commit:
+http://git.savannah.gnu.org/cgit/gpsd.git/commit/?id=98c8f5f4429ac3bfc09eee235fee08b9aaff8c52
+
+Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+---
+ SConstruct | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/SConstruct b/SConstruct
+index 1c1a215..c6a309e 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -334,6 +334,11 @@ for driver in ('ashtech',
+         env['nmea0183'] = True
+         break
+ 
++
++# iSync uses ublox underneath, so we force to enable it
++if env['isync']:
++    env['ublox'] = True
++
+ opts.Save('.scons-option-cache', env)
+ env.SConsignFile(".sconsign.dblite")
+ 
+-- 
+2.7.4
+
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 68d3e2e7e8..d9ab7b7dba 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -152,6 +152,11 @@ config BR2_PACKAGE_GPSD_GPSCLOCK
 	help
 	  GPSClock support
 
+config BR2_PACKAGE_GPSD_ISYNC
+	bool "iSync"
+	help
+	  Spectratime iSync LNRClok/GRCLOK support
+
 config BR2_PACKAGE_GPSD_ITRAX
 	bool "iTrax"
 	help
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index e3fa20c430..8c8023e818 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -111,6 +111,9 @@ endif
 ifneq ($(BR2_PACKAGE_GPSD_GPSCLOCK),y)
 GPSD_SCONS_OPTS += gpsclock=no
 endif
+ifneq ($(BR2_PACKAGE_GPSD_ISYNC),y)
+GPSD_SCONS_OPTS += isync=no
+endif
 ifneq ($(BR2_PACKAGE_GPSD_ITRAX),y)
 GPSD_SCONS_OPTS += itrax=no
 endif
