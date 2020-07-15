From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 22:52:04 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/minizip: fix
 static build of demos with openssl
Message-ID: <20200715204954.85B5086D5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6c4e713a8c3ae05a62af9b0702b9f595a6de304
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fixes:
 - http://autobuild.buildroot.org/results/2f11b237a3577df55bc1ee139ed4d51f3ee4e08d
 - http://autobuild.buildroot.org/results/b54b625751a45d3b449fffcdfaa06fb9209b4652

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9d17d72b979a918a63247f7c4112e39c7c491b34)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...eLists.txt-use-pkg-config-to-find-openssl.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/minizip/0001-CMakeLists.txt-use-pkg-config-to-find-openssl.patch b/package/minizip/0001-CMakeLists.txt-use-pkg-config-to-find-openssl.patch
new file mode 100644
index 0000000000..8b44a17712
--- /dev/null
+++ b/package/minizip/0001-CMakeLists.txt-use-pkg-config-to-find-openssl.patch
@@ -0,0 +1,44 @@
+From 1fdf5da78369305164313610dbb1ec868233ba08 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 14 Jun 2020 14:04:03 +0200
+Subject: [PATCH] CMakeLists.txt: use pkg-config to find openssl
+
+Use pkg-config to find openssl libraries otherwise minizip will fail to
+retrieve openssl static dependencies such as -latomic and build of
+test_cmd will fail on:
+
+[100%] Linking C executable test_cmd
+/home/test/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/test/autobuild/run/instance-3/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(bio_lib.o): in function `BIO_free':
+bio_lib.c:(.text+0x510): undefined reference to `__atomic_fetch_sub_4'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b54b625751a45d3b449fffcdfaa06fb9209b4652
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/nmoinvaz/minizip/pull/499]
+---
+ CMakeLists.txt | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b789f62..7a81e32 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -140,7 +140,13 @@ endif()
+ 
+ # Check to see if openssl installation is present
+ if(MZ_OPENSSL)
+-    find_package(OpenSSL)
++    find_package(PkgConfig)
++    if(PKGCONFIG_FOUND)
++        pkg_check_modules(OPENSSL openssl)
++    endif()
++    if(NOT OPENSSL_FOUND)
++        find_package(OpenSSL)
++    endif()
+     if (OPENSSL_FOUND)
+         message(STATUS "Using OpenSSL ${OPENSSL_VERSION}")
+ 
+-- 
+2.26.2
+
