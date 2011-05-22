From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 May 2011 16:58:32 +0200
Subject: [Buildroot] [git commit] qt: scripttools needs gui
Message-ID: <20110522145941.E18598356F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5c8c02a0c6747357ecc3f4884b065cf08bf2395a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The QtScriptTools library depends on the QtGui library, as can be seen
in the src/src.pro file of the Qt sources :

!contains(QT_CONFIG, no-gui):contains(QT_CONFIG, scripttools): SRC_SUBDIRS += src_scripttools

If the scripttools are enabled in the Qt configuration, but not the
gui, then the scripttools library is not built by Qt, and the
Buildroot build process fails with:

cp: cannot stat `/home/test/outputs/test-502/host/usr/sh4-unknown-linux-gnu/sysroot/usr/lib/libQtScriptTools.so.*': No such file or directory

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index eafc855..4a3945c 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -373,6 +373,7 @@ config BR2_PACKAGE_QT_SCRIPT
 config BR2_PACKAGE_QT_SCRIPTTOOLS
 	bool "Script Tools Module"
 	depends on BR2_PACKAGE_QT_SCRIPT
+	depends on BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  Build the Qt Script Tools module.
 	  if unsure, say n.
-- 
1.7.3.4
