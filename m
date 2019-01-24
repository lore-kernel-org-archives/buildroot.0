From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 21:54:18 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/systemd: fix
 build on toolchain without C++
Message-ID: <20190124214757.06F108E667@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=326635afec4169bb5b02ab694fd0facd46bc51d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

This is a backport from upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5ae9157af6b8a0a134cb54f44dea3fbb3a3f3481)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-use-cross-compilation-compatible-c-check.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch b/package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch
new file mode 100644
index 0000000000..70d816fae2
--- /dev/null
+++ b/package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch
@@ -0,0 +1,60 @@
+From 180a940333c84495015bd5b24d41c1dbfff509f2 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 27 Dec 2018 09:16:20 +0800
+Subject: [PATCH] meson: use cross compilation compatible c++ check
+
+[james.hilliard1 at gmail.com: backport from upstream commit
+46e63a2a3ed46ce97430ce38e4cc0798c57900eb]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ meson.build             | 4 +---
+ src/systemd/meson.build | 3 +--
+ src/test/meson.build    | 2 +-
+ 3 files changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index b338886..1964b1a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -287,10 +287,8 @@ want_tests = get_option('tests')
+ slow_tests = want_tests != 'false' and get_option('slow-tests')
+ install_tests = get_option('install-tests')
+ 
+-cxx = find_program('c++', required : fuzzer_build)
+-if cxx.found()
++if add_languages('cpp', required : fuzzer_build)
+         #  Used only for tests
+-        add_languages('cpp')
+         cxx_cmd = ' '.join(meson.get_compiler('cpp').cmd_array())
+ else
+         cxx_cmd = ''
+diff --git a/src/systemd/meson.build b/src/systemd/meson.build
+index e0c967e..75c48b0 100644
+--- a/src/systemd/meson.build
++++ b/src/systemd/meson.build
+@@ -52,8 +52,7 @@ if cc.has_argument('-std=iso9899:2017')
+         opts += [['c', '-std=iso9899:2017']]
+ endif
+ 
+-cxx = find_program('c++', required : false)
+-if cxx.found()
++if add_languages('cpp', required : false)
+         opts += [['c++'],
+                  ['c++', '-std=c++98'],
+                  ['c++', '-std=c++11']]
+diff --git a/src/test/meson.build b/src/test/meson.build
+index ea049a6..d9d87e0 100644
+--- a/src/test/meson.build
++++ b/src/test/meson.build
+@@ -957,7 +957,7 @@ tests += [
+ 
+ ]
+ 
+-if cxx.found()
++if cxx_cmd != ''
+         tests += [
+                 [['src/libsystemd/sd-bus/test-bus-vtable-cc.cc'],
+                  [],
+-- 
+2.7.4
+
