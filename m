From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sat,  3 Feb 2018 22:40:53 +0100
Subject: [Buildroot] [PATCH v2] package/gpsd: add config option for
 Spectratime iSync and build fix patch
Message-ID: <1517694053-15488-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes v1->v2:
   * Add upstream commit link to build fix patch
---
 ...x-isync-build-when-ublox-not-selected-too.patch | 36 ++++++++++++++++++++++
 package/gpsd/Config.in                             |  5 +++
 package/gpsd/gpsd.mk                               |  3 ++
 3 files changed, 44 insertions(+)
 create mode 100644 package/gpsd/0002-Fix-isync-build-when-ublox-not-selected-too.patch

diff --git a/package/gpsd/0002-Fix-isync-build-when-ublox-not-selected-too.patch b/package/gpsd/0002-Fix-isync-build-when-ublox-not-selected-too.patch
new file mode 100644
index 0000000..1dfa960
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
index 68d3e2e..d9ab7b7 100644
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
index e3fa20c..8c8023e 100644
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
-- 
2.7.4
