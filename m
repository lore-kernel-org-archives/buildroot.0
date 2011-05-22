From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2011 10:53:40 +0200
Subject: [Buildroot] [PATCH 1/1] qt: scripttools needs gui
In-Reply-To: <cover.1306054416.git.thomas.petazzoni@free-electrons.com>
References: <cover.1306054416.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d8244392bcde50c998813d693d8985d1c8fd60b1.1306054416.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The QtScriptTools library depends on the QtGui library, as can be seen
in the src/src.pro file of the Qt sources :

!contains(QT_CONFIG, no-gui):contains(QT_CONFIG, scripttools): SRC_SUBDIRS += src_scripttools

If the scripttools are enabled in the Qt configuration, but not the
gui, then the scripttools library is not built by Qt, and the
Buildroot build process fails with:

cp: cannot stat `/home/test/outputs/test-502/host/usr/sh4-unknown-linux-gnu/sysroot/usr/lib/libQtScriptTools.so.*': No such file or directory

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
1.7.1
