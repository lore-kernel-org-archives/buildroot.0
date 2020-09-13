From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Sep 2020 18:56:47 +0200
Subject: [Buildroot] [git commit] package/re2: needs threads
Message-ID: <20200913165016.7776488377@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9a2d65cae88ca7c641af2f69161ab0d21bac91c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

re2 unconditionally uses -pthread and add it to re2.pc

Moreover, it fails to buid without threads on:

In file included from /home/peko/autobuild/instance-0/output-1/per-package/re2/host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabihf/include/c++/8.3.0/arm-buildroot-linux-uclibcgnueabihf/bits/os_defines.h:39,
                 from /home/peko/autobuild/instance-0/output-1/per-package/re2/host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabihf/include/c++/8.3.0/arm-buildroot-linux-uclibcgnueabihf/bits/c++config.h:508,
                 from /home/peko/autobuild/instance-0/output-1/per-package/re2/host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabihf/include/c++/8.3.0/bits/stl_algobase.h:59,
                 from /home/peko/autobuild/instance-0/output-1/per-package/re2/host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabihf/include/c++/8.3.0/memory:62,
                 from /home/peko/autobuild/instance-0/output-1/build/re2-2020-08-01/re2/filtered_re2.h:24,
                 from /home/peko/autobuild/instance-0/output-1/build/re2-2020-08-01/re2/filtered_re2.cc:5:
/home/peko/autobuild/instance-0/output-1/per-package/re2/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/features.h:218:5: warning: #warning requested reentrant code, but thread support was disabled [-Wcpp]
 #   warning requested reentrant code, but thread support was disabled
     ^~~~~~~
In file included from /home/peko/autobuild/instance-0/output-1/build/re2-2020-08-01/re2/prog.h:22,
                 from /home/peko/autobuild/instance-0/output-1/build/re2-2020-08-01/re2/bitstate.cc:28:
/home/peko/autobuild/instance-0/output-1/build/re2-2020-08-01/re2/re2.h:768:16: error: 'once_flag' in namespace 'std' does not name a type
   mutable std::once_flag rprog_once_;
                ^~~~~~~~~
/home/peko/autobuild/instance-0/output-1/build/re2-2020-08-01/re2/re2.h:768:11: note: 'std::once_flag' is defined in header '<mutex>'; did you forget to '#include <mutex>'?
/home/peko/autobuild/instance-0/output-1/build/re2-2020-08-01/re2/re2.h:218:1:
+#include <mutex>

Fixes:
 - http://autobuild.buildroot.org/results/7d7c6dcac3cb8ea6deb753178e85eb1c5c74c8e3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/grpc/Config.in | 2 +-
 package/re2/Config.in  | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index 2eb7c1de1c..0270b38c35 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GRPC
 	bool "grpc"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, re2
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf, re2
 	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp
diff --git a/package/re2/Config.in b/package/re2/Config.in
index 004185a4b6..64217e8aa2 100644
--- a/package/re2/Config.in
+++ b/package/re2/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_RE2
 	bool "re2"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # needs C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  RE2 is a fast, safe, thread-friendly alternative
 	  to backtracking regular expression engines like
@@ -10,5 +11,7 @@ config BR2_PACKAGE_RE2
 
 	  https://github.com/google/re2
 
-comment "re2 needs a toolchain w/ C++, gcc >= 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+comment "re2 needs a toolchain w/ C++, threads, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
