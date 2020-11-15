From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Nov 2020 11:23:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: fix build without threads
Message-ID: <20201115102352.145892-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/70c98e89b1d5e5b651d1f6928dc53f465103f57a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0002-meson.build-check-for-pthread.h.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/harfbuzz/0002-meson.build-check-for-pthread.h.patch

diff --git a/package/harfbuzz/0002-meson.build-check-for-pthread.h.patch b/package/harfbuzz/0002-meson.build-check-for-pthread.h.patch
new file mode 100644
index 0000000000..128876dfb7
--- /dev/null
+++ b/package/harfbuzz/0002-meson.build-check-for-pthread.h.patch
@@ -0,0 +1,49 @@
+From 96bbf3a3af45d86f790afdf91a6686c37421e92b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 15 Nov 2020 10:57:37 +0100
+Subject: [PATCH] meson.build: check for pthread.h
+
+Check for pthread.h otherwise the build will fail with some toolchains
+that have libphtread.so but not pthread.h:
+
+Run-time dependency threads found: YES
+
+../src/hb-mutex.hh:53:10: fatal error: pthread.h: No such file or directory
+ #include <pthread.h>
+          ^~~~~~~~~~~
+
+Moreover, fix detection of pthread fallback
+
+Fixes:
+ - http://autobuild.buildroot.org/results/70c98e89b1d5e5b651d1f6928dc53f465103f57a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index bf3925db..6d263d48 100644
+--- a/meson.build
++++ b/meson.build
+@@ -284,13 +284,15 @@ endif
+ # threads
+ thread_dep = null_dep
+ if host_machine.system() != 'windows'
+-  thread_dep = dependency('threads', required: false)
++  if cpp.has_header('pthread.h')
++    thread_dep = dependency('threads', required: false)
++  endif
+ 
+   if thread_dep.found()
+     conf.set('HAVE_PTHREAD', 1)
+   else
+     check_headers += ['sched.h']
+-    check_funcs += ['sched_yield', {'link_with': 'rt'}]
++    check_funcs += [['sched_yield', {'link_with': 'rt'}]]
+   endif
+ endif
+ 
+-- 
+2.29.2
+
-- 
2.29.2
