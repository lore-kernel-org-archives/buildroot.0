From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Apr 2020 22:42:57 +0200
Subject: [Buildroot] [git commit] package/stellarium: bump version to 0.20.0
Message-ID: <20200410203127.437BF8E391@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29f718278ba8a13365bdecbf7e6a15e8b1ef3c7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added upstream commit to fix build error.
Switched to sha256 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Fix-building-Stellarium-without-scripting.patch | 56 ++++++++++++++++++++++
 package/stellarium/stellarium.hash                 |  6 +--
 package/stellarium/stellarium.mk                   |  2 +-
 3 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/package/stellarium/0001-Fix-building-Stellarium-without-scripting.patch b/package/stellarium/0001-Fix-building-Stellarium-without-scripting.patch
new file mode 100644
index 0000000000..de0a656f01
--- /dev/null
+++ b/package/stellarium/0001-Fix-building-Stellarium-without-scripting.patch
@@ -0,0 +1,56 @@
+From a5786f16b6330a4b6d4adb11e8d9bea23956977e Mon Sep 17 00:00:00 2001
+From: Alexander Wolf <alex.v.wolf@gmail.com>
+Date: Tue, 31 Mar 2020 16:49:15 +0700
+Subject: [PATCH] Fix building Stellarium without scripting
+
+Downloaded from upstream commit
+https://github.com/Stellarium/stellarium/commit/a5786f16b6330a4b6d4adb11e8d9bea23956977e
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ plugins/NavStars/src/NavStars.cpp | 3 +--
+ src/gui/StelGui.cpp               | 4 +++-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/plugins/NavStars/src/NavStars.cpp b/plugins/NavStars/src/NavStars.cpp
+index 7ef8cfb1d4..aa67bcc266 100644
+--- a/plugins/NavStars/src/NavStars.cpp
++++ b/plugins/NavStars/src/NavStars.cpp
+@@ -35,7 +35,6 @@
+ #include "NavStarsWindow.hpp"
+ #include "NavStarsCalculator.hpp"
+ #include "Planet.hpp"
+-#include <StelMainScriptAPI.hpp>
+ 
+ #include <QList>
+ #include <QSharedPointer>
+@@ -489,7 +488,7 @@ void NavStars::extraInfo(StelCore* core, const StelObjectP& selectedObject, bool
+ 	jde = core->getJDE();
+ 
+ 	NavStarsCalculator calc;
+-	calc.setUTC(StelMainScriptAPI::getDate("utc"))
++	calc.setUTC(StelUtils::julianDayToISO8601String(jd))
+ 		.setLatDeg(core->getCurrentLocation().latitude)
+ 		.setLonDeg(core->getCurrentLocation().longitude)
+ 		.setJd(jd)
+diff --git a/src/gui/StelGui.cpp b/src/gui/StelGui.cpp
+index 09ef4ba8ca..c2eb91b35a 100644
+--- a/src/gui/StelGui.cpp
++++ b/src/gui/StelGui.cpp
+@@ -225,13 +225,15 @@ void StelGui::init(QGraphicsWidget *atopLevelGraphicsWidget)
+ 	QString windowsGroup = N_("Windows");
+ 	QString miscGroup = N_("Miscellaneous");
+ 	actionsMgr->addAction("actionQuit_Global", miscGroup, N_("Quit"), this, "quit()", "Ctrl+Q", "Ctrl+X");
++
++#ifndef DISABLE_SCRIPTING
+ 	actionsMgr->addAction("actionIncrease_Script_Speed", datetimeGroup, N_("Speed up the script execution rate"), this, "increaseScriptSpeed()");
+ 	actionsMgr->addAction("actionDecrease_Script_Speed", datetimeGroup, N_("Slow down the script execution rate"), this, "decreaseScriptSpeed()");
+ 	actionsMgr->addAction("actionSet_Real_Script_Speed", datetimeGroup, N_("Set the normal script execution rate"), this, "setRealScriptSpeed()");
+ 	actionsMgr->addAction("actionStop_Script", datetimeGroup, N_("Stop script execution"), this, "stopScript()", "Ctrl+D, S");
+ 	actionsMgr->addAction("actionPause_Script", datetimeGroup, N_("Pause script execution"), this, "pauseScript()", "Ctrl+D, P");
+ 	actionsMgr->addAction("actionResume_Script", datetimeGroup, N_("Resume script execution"), this, "resumeScript()", "Ctrl+D, R");
+-
++#endif
+ #ifdef ENABLE_SCRIPT_CONSOLE
+ 	actionsMgr->addAction("actionShow_ScriptConsole_Window_Global", windowsGroup, N_("Script console window"), scriptConsole, "visible", "F12", "", true);
+ #endif
diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index ea1256df1b..c816abe963 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,6 +1,6 @@
 # From https://github.com/Stellarium/stellarium/releases
-md5 2de84da8a2256f3239174e3ad8f83a5b  stellarium-0.19.3.tar.gz
-sha1 a82cfa21c8dcfbd0a0cf4e30c4ea017ceb2f87a5  stellarium-0.19.3.tar.gz
+md5 9c7059f6d3f0ea0f97147456f6d00069  stellarium-0.20.0.tar.gz
+sha1 2a86e4401d99efc7c46e182778522c4fb6cf7193  stellarium-0.20.0.tar.gz
+sha256 07ed1785d28f761511dc22f9b09ce70e96b5113fc7769fcdf4478f7a5a035370  stellarium-0.20.0.tar.gz
 # Locally computed
-sha256 176e15d8d18340cf8c8cfed14f364cbda345d94e77cc97589c163c45d9cb225d  stellarium-0.19.3.tar.gz
 sha256 3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index ff1eb27018..1d5a1e636a 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 0.19.3
+STELLARIUM_VERSION = 0.20.0
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
