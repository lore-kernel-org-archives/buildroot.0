From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 22 Mar 2021 20:42:21 +0100
Subject: [Buildroot] [PATCH] package/janet: bump to version 1.15.4
Message-ID: <20210322194221.1987437-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

remove 2 patches merged upstream

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...uild-defaults-to-c99-for-build.c_std.patch | 42 -------------------
 .../0002-meson.build-fix-static-build.patch   | 37 ----------------
 package/janet/janet.hash                      |  2 +-
 package/janet/janet.mk                        |  2 +-
 4 files changed, 2 insertions(+), 81 deletions(-)
 delete mode 100644 package/janet/0001-meson.build-defaults-to-c99-for-build.c_std.patch
 delete mode 100644 package/janet/0002-meson.build-fix-static-build.patch

diff --git a/package/janet/0001-meson.build-defaults-to-c99-for-build.c_std.patch b/package/janet/0001-meson.build-defaults-to-c99-for-build.c_std.patch
deleted file mode 100644
index 607fc2ee8..000000000
--- a/package/janet/0001-meson.build-defaults-to-c99-for-build.c_std.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 546437d799f4cbc1dd86a015eac3b9ab405130c6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 10 Mar 2021 07:57:53 +0100
-Subject: [PATCH] meson.build: defaults to c99 for "build.c_std"
-
-Since Meson 0.51, there are special build options for "native:true"
-builds, prefixed with "build.".  This change breaks cross builds
-because `janet-boot/src_core_asm.c` is no longer built with `-std=c99`:
-
-FAILED: janet-boot.p/src_core_asm.c.o
-/usr/bin/gcc -Ijanet-boot.p -I. -I.. -I../src/include -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -O3 -pthread -DJANET_BOOTSTRAP -MD -MQ janet-boot.p/src_core_asm.c.o -MF janet-boot.p/src_core_asm.c.o.d -o janet-boot.p/src_core_asm.c.o -c ../src/core/asm.c
-../src/core/asm.c: In function 'janet_disasm_bytecode':
-../src/core/asm.c:866:5: error: 'for' loop initial declarations are only allowed in C99 mode
-     for (int32_t i = 0; i < def->bytecode_length; i++) {
-     ^
-
-Fixes:
- - http://autobuild.buildroot.net/results/355e0992338a8d132050517f83a3884606b00529
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved (and backported) from:
-https://github.com/janet-lang/janet/commit/546437d799f4cbc1dd86a015eac3b9ab405130c6]
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 1b326111..d3a2d399 100644
---- a/meson.build
-+++ b/meson.build
-@@ -19,7 +19,7 @@
- # IN THE SOFTWARE.
- 
- project('janet', 'c',
--  default_options : ['c_std=c99', 'b_lundef=false', 'default_library=both'],
-+  default_options : ['c_std=c99', 'build.c_std=c99', 'b_lundef=false', 'default_library=both'],
-   version : '1.15.0')
- 
- # Global settings
--- 
-2.30.0
-
diff --git a/package/janet/0002-meson.build-fix-static-build.patch b/package/janet/0002-meson.build-fix-static-build.patch
deleted file mode 100644
index bd335cad9..000000000
--- a/package/janet/0002-meson.build-fix-static-build.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b0f1a4967db9d8910e0091adff5e40a2a147323f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 12 Mar 2021 08:46:05 +0100
-Subject: [PATCH] meson.build: fix static build
-
-Don't enforce -rdynamic when building statically to avoid the following
-build failure:
-
-/home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/arm-linux-gcc  -o janet janet.p/meson-generated_.._janet.c.o janet.p/src_mainclient_shell.c.o -Wl,--as-needed -Wl,--allow-shlib-undefined -Wl,-O1 -rdynamic -Wl,-elf2flt -static -Wl,--start-group -lm -ldl -Wl,--end-group -pthread
-arm-linux-gcc.br_real: error: unrecognized command line option '-rdynamic'
-
-Fixes:
- - http://autobuild.buildroot.org/results/a4f927f73a7b80e65408c992d7b6023609a1eacc
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/janet-lang/janet/commit/b0f1a4967db9d8910e0091adff5e40a2a147323f]
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index d3a2d399..a8a0a054 100644
---- a/meson.build
-+++ b/meson.build
-@@ -33,7 +33,7 @@ dl_dep = cc.find_library('dl', required : false)
- thread_dep = dependency('threads')
- 
- # Link options
--if build_machine.system() != 'windows'
-+if get_option('default_library') != 'static' and build_machine.system() != 'windows'
-     add_project_link_arguments('-rdynamic', language : 'c')
- endif
- 
--- 
-2.30.0
-
diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 4a1167f8e..ca8093536 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e2cf16b330e47c858a675ac79b5a0af83727ff041efcb133a80f36bedfae57c4  janet-1.15.0.tar.gz
+sha256  8eed302c8ded1df882544d13ce7e415b213cf7bc8fa77ca16110c89b36d19763  janet-1.15.4.tar.gz
 
 # Locally calculated
 sha256  1114e280d850605ae71b656dfc88115ab06081e8157720a2497f50edf50b110e  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 7243d60c0..027edd72c 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.15.0
+JANET_VERSION = 1.15.4
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-- 
2.27.0
