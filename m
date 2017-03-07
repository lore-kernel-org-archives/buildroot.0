From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  7 Mar 2017 22:16:28 +0100
Subject: [Buildroot] [PATCH] package/rpi-userland: don't isntall file in
	random location
Message-ID: <1488921388-9691-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, rpi-userland installs files in $(@D)/../../bin/ which is
entirely stupid, especially in cross-compilation.

Get rid of the dubious, broken, custom install command.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...toverlay-don-t-install-script-in-random-l.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/rpi-userland/0006-host-apps-dtoverlay-don-t-install-script-in-random-l.patch

diff --git a/package/rpi-userland/0006-host-apps-dtoverlay-don-t-install-script-in-random-l.patch b/package/rpi-userland/0006-host-apps-dtoverlay-don-t-install-script-in-random-l.patch
new file mode 100644
index 0000000..2900eb7
--- /dev/null
+++ b/package/rpi-userland/0006-host-apps-dtoverlay-don-t-install-script-in-random-l.patch
@@ -0,0 +1,45 @@
+From a5a4e361c8116ca9228a896f672102c02be56bb7 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Tue, 7 Mar 2017 22:01:39 +0100
+Subject: [PATCH] host-apps/dtoverlay: don't install script in random location
+
+Currently, we add a custom command that installs the dtoverlay pre/post
+scripts in ${CMAKE_BINARY_DIR}/../../bin
+
+However:
+
+  - this points outside of the package directory.; it even points two
+    directories higher;
+
+  - when doing cross-compilation, this is definitely not the place where
+    the /bin directory really is;
+
+  - the scripts are already properly installed without this code.
+
+Remove that code, it serves no purpose and breaks for cross-compilation.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ host_applications/linux/apps/dtoverlay/CMakeLists.txt | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/host_applications/linux/apps/dtoverlay/CMakeLists.txt b/host_applications/linux/apps/dtoverlay/CMakeLists.txt
+index 9009200..dd48d83 100755
+--- a/host_applications/linux/apps/dtoverlay/CMakeLists.txt
++++ b/host_applications/linux/apps/dtoverlay/CMakeLists.txt
+@@ -22,12 +22,4 @@ add_custom_command(TARGET dtoverlay POST_BUILD COMMAND ln;-sf;dtoverlay;dtparam)
+ install(FILES ${CMAKE_CURRENT_BINARY_DIR}/dtparam DESTINATION bin)
+ 
+ set(DTOVERLAY_SCRIPTS dtoverlay-pre dtoverlay-post)
+-foreach(_script ${DTOVERLAY_SCRIPTS})
+-   add_custom_command(
+-     TARGET dtoverlay
+-     COMMAND ${CMAKE_COMMAND}
+-     -E copy ${CMAKE_CURRENT_SOURCE_DIR}/${_script}
+-     ${CMAKE_BINARY_DIR}/../../bin/${_script}
+-   )
+-endforeach()
+ install(PROGRAMS ${DTOVERLAY_SCRIPTS} DESTINATION bin)
+-- 
+2.7.4
+
-- 
2.7.4
