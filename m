From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 19:02:36 +0200
Subject: [Buildroot] [git commit] package/pipewire: link with -latomic
Message-ID: <20210522163327.A4C5988DA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21f87a1004fa6e4ea6e38c4f595cc75f376a3bfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build failure which is raised since bump to version 0.3.26 in commit
a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9

Fixes:
 - http://autobuild.buildroot.org/results/b5305e8e7dd1a5e8bfaba72b06251056ba7d1af1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../pipewire/0003-fix-linking-with-latomic.patch   | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/package/pipewire/0003-fix-linking-with-latomic.patch b/package/pipewire/0003-fix-linking-with-latomic.patch
new file mode 100644
index 0000000000..77132173e4
--- /dev/null
+++ b/package/pipewire/0003-fix-linking-with-latomic.patch
@@ -0,0 +1,108 @@
+From 5068aa54bde4e40d6faa8de43d93216bc3001a3e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 21 May 2021 07:47:46 +0200
+Subject: [PATCH] fix linking with -latomic
+
+Linking with -latomic has been added to pipewire-jack since
+https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/b8c58c74d835ee2918f9e391abd65f9e0132bdb4
+
+However, this is not the right place to add this dependency, atomic_dep
+should be added to pipewire_dep to avoid the following build failure:
+
+/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/pipewire/libpipewire-0.3.so.0.326.0.p/filter.c.o: in function `impl_node_process':
+filter.c:(.text+0xf28): undefined reference to `__atomic_fetch_add_4'
+
+Indeed, atomic operation such as __atomic_fetch_add is used in libcamera
+as well as in ./spa/plugins/libcamera/libcamera_wrapper.cpp,
+./spa/include/spa/utils/ringbuffer.h and ./spa/include/spa/graph/graph.h
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b5305e8e7dd1a5e8bfaba72b06251056ba7d1af1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/689]
+---
+ meson.build                   | 11 +++++------
+ pipewire-jack/src/meson.build |  4 ++--
+ src/pipewire/meson.build      |  4 ++--
+ 3 files changed, 9 insertions(+), 10 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index b6b4553b..1308373a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -157,7 +157,7 @@ test_8_byte_atomic = '''
+ int main(void)
+ {
+   int64_t eight;
+-  __atomic_store_n(&eight, 123, __ATOMIC_SEQ_CST);
++  __atomic_fetch_add(&eight, 123, __ATOMIC_SEQ_CST);
+   return 0;
+ }
+ '''
+@@ -166,16 +166,15 @@ int main(void)
+ # operations on any reasonable architecture.
+ if cc.links(
+   test_8_byte_atomic,
+-  name : '8-byte __atomic_store_n without libatomic')
++  name : '8-byte __atomic_fetch_add without libatomic')
+   atomic_dep = dependency('', required: false)
+ elif cc.links(
+   test_8_byte_atomic,
+   dependencies : libatomic,
+-  name : '8-byte __atomic_store_n with libatomic')
++  name : '8-byte __atomic_fetch_add with libatomic')
+   atomic_dep = libatomic
+-elif get_option('pipewire-jack').enabled()
+-  # Currently only required for the JACK backend
+-  error('8-byte atomic operations are required for pipewire-jack')
++else
++  error('8-byte atomic operations are required')
+ endif
+ 
+ cdata = configuration_data()
+diff --git a/pipewire-jack/src/meson.build b/pipewire-jack/src/meson.build
+index 83e340ba..386abc7f 100644
+--- a/pipewire-jack/src/meson.build
++++ b/pipewire-jack/src/meson.build
+@@ -42,7 +42,7 @@ pipewire_jack = shared_library('jack',
+     version : libversion,
+     c_args : pipewire_jack_c_args,
+     include_directories : [configinc, jack_inc],
+-    dependencies : [pipewire_dep, atomic_dep, mathlib],
++    dependencies : [pipewire_dep, mathlib],
+     install : true,
+     install_dir : libjack_path,
+ )
+@@ -53,7 +53,7 @@ pipewire_jackserver = shared_library('jackserver',
+     version : libversion,
+     c_args : pipewire_jack_c_args,
+     include_directories : [configinc, jack_inc],
+-    dependencies : [pipewire_dep, atomic_dep, mathlib],
++    dependencies : [pipewire_dep, mathlib],
+     install : true,
+     install_dir : libjack_path,
+ )
+diff --git a/src/pipewire/meson.build b/src/pipewire/meson.build
+index e80f3633..0fa6643a 100644
+--- a/src/pipewire/meson.build
++++ b/src/pipewire/meson.build
+@@ -102,12 +102,12 @@ libpipewire = shared_library(pipewire_name, pipewire_sources,
+   c_args : libpipewire_c_args,
+   include_directories : [pipewire_inc, configinc, spa_inc],
+   install : true,
+-  dependencies : [dl_lib, mathlib, pthread_lib, libintl_dep, ],
++  dependencies : [dl_lib, mathlib, pthread_lib, libintl_dep, atomic_dep, ],
+ )
+ 
+ pipewire_dep = declare_dependency(link_with : libpipewire,
+   include_directories : [pipewire_inc, configinc, spa_inc],
+-  dependencies : [pthread_lib, ],
++  dependencies : [pthread_lib, atomic_dep, ],
+ )
+ 
+ pkgconfig.generate(filebase : 'lib at 0@'.format(pipewire_name),
+-- 
+2.30.2
+
