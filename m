From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jun 2016 22:24:44 +0200
Subject: [Buildroot] [git commit] package/qt: Fix Kconfig for OpenGL support
Message-ID: <20160613203323.3C7B881E8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc377f233870e52466104db992414ca32873cc0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_QT_OPENGL_ES was moved to a choice option. This option kind
can apparently not be selected by other packages. Therefore this patch
introduces a new Kconfig option BR2_PACKAGE_QT_OPENGL which takes care
of OpenGL support as such, BR2_PACKAGE_QT_OPENGL_NONE is not needed
anymore now. The choice options are now only used to determine the
type of OpenGL support.

This patch contains the necessary preparation to fix a build error in
the qwt package.

[Peter: fix QT_OPENGL dependencies to match options]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/Config.in | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 14b13ce..91eb208 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -350,14 +350,20 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
 	  Build the platform Phonon plugin.
 	  If unsure, say n.
 
+config BR2_PACKAGE_QT_OPENGL
+	bool "OpenGL support"
+	depends on (BR2_PACKAGE_HAS_LIBGL && BR2_PACKAGE_QT_X11) || \
+		   (BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES)
+	help
+	  This option enables OpenGL support.
+
+if BR2_PACKAGE_QT_OPENGL
+
 choice
 	prompt "OpenGL API"
 	help
 	  Select OpenGL API.
 
-config BR2_PACKAGE_QT_OPENGL_NONE
-	bool "No OpenGL support"
-
 comment "Desktop OpenGL not available (needs Qt standard (X11))"
 	depends on !BR2_PACKAGE_QT_X11
 
@@ -377,6 +383,8 @@ config BR2_PACKAGE_QT_OPENGL_ES
 
 endchoice
 
+endif # BR2_PACKAGE_QT_OPENGL
+
 endif
 
 config BR2_PACKAGE_QT_DBUS
