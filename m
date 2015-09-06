From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Sep 2015 15:14:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/libyuv: not available on aarch64
Message-ID: <1441545295-26498-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aarch64 is a NEON-enabled arch according to the source code[1] but the
files containing the NEON-specific functions[2] are not added to the
build using CMake.

Until this is fixed we disable libyuv for aarch64.

Fixes
http://autobuild.buildroot.net/results/0c5/0c559f1b1b9bc9f2e2a131e34f034ce4e34fa75b/
http://autobuild.buildroot.net/results/bf3/bf324985e9bbcd61196304de1d0313a0e216a0a8/
http://autobuild.buildroot.net/results/d55/d552e5e46c263ff9860192a993ee9ed11d7783a6/
http://autobuild.buildroot.net/results/2d7/2d73ccdfd5d06bd6dfdc4e303fe48a554460fa1c/
http://autobuild.buildroot.net/results/972/97207ed46a519368e242f0621e4363d522e21ee8/
http://autobuild.buildroot.net/results/d84/d84d54d85183296c57c9131d946e4517ddcaa84d/
http://autobuild.buildroot.net/results/c18/c189149b8d2a0242da06ec68863db23cd0fa65b8/
http://autobuild.buildroot.net/results/73a/73a026644179708692c43166a8ffba3ce0e19d95/

[1] https://freeswitch.org/stash/projects/SD/repos/libyuv/browse/include/libyuv/row.h#263
[2] https://freeswitch.org/stash/projects/SD/repos/libyuv/browse/BUILD.gn#101

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libyuv/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libyuv/Config.in b/package/libyuv/Config.in
index 29dcaa4..4a7c376 100644
--- a/package/libyuv/Config.in
+++ b/package/libyuv/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBYUV
 	bool "libyuv"
+	depends on !BR2_aarch64 # not supported by buildsystem
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	help
@@ -9,4 +10,5 @@ config BR2_PACKAGE_LIBYUV
 	  https://code.google.com/p/libyuv
 
 comment "libyuv needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_aarch64
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
-- 
2.1.4
