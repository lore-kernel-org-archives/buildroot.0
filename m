From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 22:24:08 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/brotli: fix
 pkg-config
Message-ID: <20201010201423.9D0BE88D22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94d7c1485f0906483261d0434b5963c62f5b91ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

brotli pkg-config files are broken since version 1.0.8 and
https://github.com/google/brotli/commit/31754d4ffce14153b5c2addf7a11019ec23f51c1

This raise static build failures with all packages using brotli,
fontconfig or freetype such as fbterm:

-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -static -static  -static -o fbterm fbterm-fbconfig.o fbterm-fbio.o fbterm-fbshell.o fbterm-fbshellman.o fbterm-fbterm.o fbterm-font.o fbterm-input.o fbterm-mouse.o fbterm-screen.o fbterm-improxy.o fbterm-screen_render.o fbterm-fbdev.o fbterm-vesadev.o lib/libshell.a -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -lfreetype -lbz2 -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -lz -lpng16 -lz -R/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -lbrotlidec -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -R/srv/storage/autobuild/run/instance-1/output-1/host/bin/../
 arm-buil
 droot-linux-uclibcgnueabihf/sysroot/usr/lib -lbrotlicommon  -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -lfontconfig -lfreetype -lbz2 -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -lz -lpng16 -lz -R/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -lbrotlidec -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -R/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -lbrotlicommon -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -luuid -lexpat   -lutil -lutil
arm-linux-g++.br_real: error: unrecognized command line option '-R'

Fixes:
 - http://autobuild.buildroot.org/results/21ede59686d4998c9e643ea874396a11b1c0df93

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 35a451d98776af56c1913e100e21a2b8392c6162)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d-runtime-linker-path-to-pkg-config-files.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/brotli/0002-Revert-Add-runtime-linker-path-to-pkg-config-files.patch b/package/brotli/0002-Revert-Add-runtime-linker-path-to-pkg-config-files.patch
new file mode 100644
index 0000000000..892aa1da15
--- /dev/null
+++ b/package/brotli/0002-Revert-Add-runtime-linker-path-to-pkg-config-files.patch
@@ -0,0 +1,51 @@
+From 09b0992b6acb7faa6fd3b23f9bc036ea117230fc Mon Sep 17 00:00:00 2001
+From: Eugene Kliuchnikov <eustas.ru@gmail.com>
+Date: Wed, 2 Sep 2020 11:38:26 +0200
+Subject: [PATCH] Revert "Add runtime linker path to pkg-config files (#740)"
+ (#838)
+
+This reverts commit 31754d4ffce14153b5c2addf7a11019ec23f51c1.
+[Retrieved from:
+https://github.com/google/brotli/commit/09b0992b6acb7faa6fd3b23f9bc036ea117230fc]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ scripts/libbrotlicommon.pc.in | 2 +-
+ scripts/libbrotlidec.pc.in    | 2 +-
+ scripts/libbrotlienc.pc.in    | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/scripts/libbrotlicommon.pc.in b/scripts/libbrotlicommon.pc.in
+index 10ca969e..2a8cf7a3 100644
+--- a/scripts/libbrotlicommon.pc.in
++++ b/scripts/libbrotlicommon.pc.in
+@@ -7,5 +7,5 @@ Name: libbrotlicommon
+ URL: https://github.com/google/brotli
+ Description: Brotli common dictionary library
+ Version: @PACKAGE_VERSION@
+-Libs: -L${libdir} -R${libdir} -lbrotlicommon
++Libs: -L${libdir} -lbrotlicommon
+ Cflags: -I${includedir}
+diff --git a/scripts/libbrotlidec.pc.in b/scripts/libbrotlidec.pc.in
+index e7c3124f..6f8ef2e4 100644
+--- a/scripts/libbrotlidec.pc.in
++++ b/scripts/libbrotlidec.pc.in
+@@ -7,6 +7,6 @@ Name: libbrotlidec
+ URL: https://github.com/google/brotli
+ Description: Brotli decoder library
+ Version: @PACKAGE_VERSION@
+-Libs: -L${libdir} -R${libdir} -lbrotlidec
++Libs: -L${libdir} -lbrotlidec
+ Requires.private: libbrotlicommon >= 1.0.2
+ Cflags: -I${includedir}
+diff --git a/scripts/libbrotlienc.pc.in b/scripts/libbrotlienc.pc.in
+index 4dd0811b..2098afe2 100644
+--- a/scripts/libbrotlienc.pc.in
++++ b/scripts/libbrotlienc.pc.in
+@@ -7,6 +7,6 @@ Name: libbrotlienc
+ URL: https://github.com/google/brotli
+ Description: Brotli encoder library
+ Version: @PACKAGE_VERSION@
+-Libs: -L${libdir} -R${libdir} -lbrotlienc
++Libs: -L${libdir} -lbrotlienc
+ Requires.private: libbrotlicommon >= 1.0.2
+ Cflags: -I${includedir}
