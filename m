From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Sun, 30 Dec 2018 06:03:14 +0800
Subject: [Buildroot] [PATCH v2 1/1] package/systemd: fix build on toolchain
 without C++
Message-ID: <1546120994-28217-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

This is a backport from upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes v1 -> v2:
  - Fixup patch and change commit message
---
 ...-use-cross-compilation-compatible-c-check.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch

diff --git a/package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch b/package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch
new file mode 100644
index 0000000..b33e054
--- /dev/null
+++ b/package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch
@@ -0,0 +1,59 @@
+From 180a940333c84495015bd5b24d41c1dbfff509f2 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 27 Dec 2018 09:16:20 +0800
+Subject: [PATCH] meson: use cross compilation compatible c++ check
+
+[james.hilliard1 at gmail.com: backport from upstream]
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
-- 
2.7.4
