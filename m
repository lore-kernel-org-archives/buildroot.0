From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Aug 2015 13:50:01 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/jsoncpp: Broken on musl
Message-ID: <1439121001-14787-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also propagate to reverse dependencies, to keep bisectability do this in
one commit.

Fixes compile error:

[ 16%] Building CXX object src/lib_json/CMakeFiles/jsoncpp_lib.dir/json_value.cpp.o
In file included from /home/fli4l/br3/output/host/usr/lib/gcc/x86_64-buildroot-linux-musl/4.9.2/include/xmmintrin.h:34:0,
                 from /home/fli4l/br3/output/host/usr/lib/gcc/x86_64-buildroot-linux-musl/4.9.2/include/x86intrin.h:31,
                 from /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/include/c++/4.9.2/x86_64-buildroot-linux-musl/bits/opt_random.h:33,
                 from /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/include/c++/4.9.2/random:50,
                 from /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/include/c++/4.9.2/bits/stl_algo.h:66,
                 from /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/include/c++/4.9.2/algorithm:62,
                 from /home/fli4l/br3/output/build/jsoncpp-1.6.1/src/lib_json/json_value.cpp:20:
/home/fli4l/br3/output/host/usr/lib/gcc/x86_64-buildroot-linux-musl/4.9.2/include/mm_malloc.h:34:64: error: declaration of 'int posix_memalign(void**, size_t, size_t) throw ()' has a different exception specifier
 extern "C" int posix_memalign (void **, size_t, size_t) throw ();
                                                                ^
In file included from /home/fli4l/br3/output/build/jsoncpp-1.6.1/include/json/assertions.h:9:0,
                 from /home/fli4l/br3/output/build/jsoncpp-1.6.1/src/lib_json/json_value.cpp:7:
/home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/stdlib.h:98:5: error: from previous declaration 'int posix_memalign(void**, size_t, size_t)'
 int posix_memalign (void **, size_t, size_t);
     ^
make[2]: *** [src/lib_json/CMakeFiles/jsoncpp_lib.dir/json_value.cpp.o] Error 1

using this defconfig:

BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_JSONCPP=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: - rebased
    - updated comments (Yann)
    - added reverse dependencies to kodi-pvr-filmon & kodi-pvr-pctv
v2: Disable jsoncpp and reverse dependency with musl toolchain instead of patching gcc (Thomas)
    FTR: gcc patches can be found here: http://patchwork.ozlabs.org/patch/460337/

---
 package/jsoncpp/Config.in         | 5 +++--
 package/kodi-pvr-filmon/Config.in | 4 ++++
 package/kodi-pvr-pctv/Config.in   | 4 ++++
 package/sysdig/Config.in          | 6 ++++--
 4 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/package/jsoncpp/Config.in b/package/jsoncpp/Config.in
index 2c96f13..fb9da7a 100644
--- a/package/jsoncpp/Config.in
+++ b/package/jsoncpp/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_JSONCPP
+	depends on !BR2_TOOLCHAIN_USES_MUSL # posix_memalign
 	depends on BR2_INSTALL_LIBSTDCPP
 	bool "jsoncpp"
 	help
@@ -10,5 +11,5 @@ config BR2_PACKAGE_JSONCPP
 
 	  https://github.com/open-source-parsers/jsoncpp
 
-comment "jsoncpp needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "jsoncpp needs a (e)glibc or uClibc toolchain w/ C++"
+	depends on BR2_TOOLCHAIN_USES_MUSL || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/kodi-pvr-filmon/Config.in b/package/kodi-pvr-filmon/Config.in
index 0b662df..491b3ac 100644
--- a/package/kodi-pvr-filmon/Config.in
+++ b/package/kodi-pvr-filmon/Config.in
@@ -2,7 +2,11 @@ config BR2_PACKAGE_KODI_PVR_FILMON
 	bool "kodi-pvr-filmon"
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
+	depends on !BR2_TOOLCHAIN_USES_MUSL # jsoncpp
 	help
 	  Filmon PVR client addon for Kodi
 
 	  https://github.com/kodi-pvr/pvr.filmon
+
+comment "kodi-pvr-filmon needs a (e)glibc or uClibc toolchain"
+	depends on BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/kodi-pvr-pctv/Config.in b/package/kodi-pvr-pctv/Config.in
index 255cd4a..97c367d 100644
--- a/package/kodi-pvr-pctv/Config.in
+++ b/package/kodi-pvr-pctv/Config.in
@@ -2,7 +2,11 @@ config BR2_PACKAGE_KODI_PVR_PCTV
 	bool "kodi-pvr-pctv"
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
+	depends on !BR2_TOOLCHAIN_USES_MUSL # jsoncpp
 	help
 	  PCTV PVR client addon for Kodi
 
 	  https://github.com/kodi-pvr/pvr.vdr.vnsi
+
+comment "kodi-pvr-pctv needs a (e)glibc or uClibc toolchain"
+	depends on BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index dc71d5f..50ebbba 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SYSDIG
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_JSONCPP
+	depends on !BR2_TOOLCHAIN_USES_MUSL # jsoncpp
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # libjson
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
@@ -16,6 +17,7 @@ config BR2_PACKAGE_SYSDIG
 
 	  http://sysdig.org
 
-comment "sysdig needs a toolchain w/ C++, dynamic library and a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+comment "sysdig needs a (e)glibc or uClibc toolchain w/ C++, dynamic library and a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
-- 
2.1.4
