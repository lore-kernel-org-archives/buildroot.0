From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 Dec 2018 21:40:24 +0100
Subject: [Buildroot] [PATCH 1/1] ffmpeg: fix static build with pkgconf 1.5.3
Message-ID: <20181215204024.14016-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pkg-config --version returns the following error:
/home/fabrice/buildroot/output/host/bin/pkgconf: --version specified
with other options or module names, assuming --modversion.
Please specify at least one package name on the command line.

As a result, pkg_config will be set to false and the following warning
will be displayed:
WARNING: /home/fabrice/buildroot/output/host/bin/pkg-config not found,
library detection may fail.

So replace pkg-config --version by pkg-config --about

Fixes:
 - http://autobuild.buildroot.org/results/bb3264661c182c124e89e9a2bcf41e556d40aeb8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...igure-fix-static-build-with-pkgconf-1.5.3.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/ffmpeg/0002-configure-fix-static-build-with-pkgconf-1.5.3.patch

diff --git a/package/ffmpeg/0002-configure-fix-static-build-with-pkgconf-1.5.3.patch b/package/ffmpeg/0002-configure-fix-static-build-with-pkgconf-1.5.3.patch
new file mode 100644
index 0000000000..93a4ebb345
--- /dev/null
+++ b/package/ffmpeg/0002-configure-fix-static-build-with-pkgconf-1.5.3.patch
@@ -0,0 +1,41 @@
+From b3f6422a8a72e0ca5f8a1b1a6401db4088977f10 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 15 Dec 2018 21:33:16 +0100
+Subject: [PATCH] configure: fix static build with pkgconf 1.5.3
+
+pkg-config --version returns the following error:
+/home/fabrice/buildroot/output/host/bin/pkgconf: --version specified
+with other options or module names, assuming --modversion.
+Please specify at least one package name on the command line.
+
+As a result, pkg_config will be set to false and the following warning
+will be displayed:
+WARNING: /home/fabrice/buildroot/output/host/bin/pkg-config not found,
+library detection may fail.
+
+So replace pkg-config --version by pkg-config --about
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bb3264661c182c124e89e9a2bcf41e556d40aeb8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index b062b6318e..b46ce00982 100755
+--- a/configure
++++ b/configure
+@@ -4150,7 +4150,7 @@ enabled cross_compile || host_cc_default=$cc
+ set_default host_cc
+ 
+ pkg_config_fail_message=""
+-if ! $pkg_config --version >/dev/null 2>&1; then
++if ! $pkg_config --about >/dev/null 2>&1; then
+     warn "$pkg_config not found, library detection may fail."
+     pkg_config=false
+ elif is_in -static $cc $LDFLAGS && ! is_in --static $pkg_config $pkg_config_flags; then
+-- 
+2.14.1
+
-- 
2.14.1
