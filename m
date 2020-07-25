From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2020 22:18:46 +0200
Subject: [Buildroot] [git commit] package/gvfs: fix linking with libmetadata
Message-ID: <20200725201457.9826C86E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32720be5aa46a432a3cc2611699b1ccdfdce2ebc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/fa892c41b6b9285839a0164b000e37fb04dcc194

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-meson.build-fix-linking-with-libmetadata.patch | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/package/gvfs/0001-meson.build-fix-linking-with-libmetadata.patch b/package/gvfs/0001-meson.build-fix-linking-with-libmetadata.patch
new file mode 100644
index 0000000000..3ee4a28e94
--- /dev/null
+++ b/package/gvfs/0001-meson.build-fix-linking-with-libmetadata.patch
@@ -0,0 +1,78 @@
+From 731256d7517f0d9cf0b999bb22f864080d5e8690 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 18 Jul 2020 10:00:50 +0200
+Subject: [PATCH] meson.build: fix linking with libmetadata
+
+libmetadata is built as a static library and depends on libgvfscommon so
+change the dependencies order to put libgvfscommon_dep after
+libmetadata_dep or gvfsd-metadata will fail to link on:
+
+FAILED: metadata/gvfsd-metadata
+/home/naourr/work/instance-3/output-1/host/bin/arm-none-linux-gnueabi-gcc  -o metadata/gvfsd-metadata 'metadata/45447b7@@gvfsd-metadata at exe/meta-daemon.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wl,--start-group common/libgvfscommon.so metadata/libmetadata.a /home/naourr/work/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libgio-2.0.so /home/naourr/work/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libgobject-2.0.so /home/naourr/work/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libglib-2.0.so -Wl,--end-group '-Wl,-rpath,$ORIGIN/../common:$ORIGIN/' -Wl,-rpath-link,/home/naourr/work/instance-3/output-1/build/gvfs-1.44.1/build/common -Wl,-rpath-link,/home/naourr/work/instance-3/output-1/build/gvfs-1.44.1/build/metadata
+metadata/libmetadata.a(metatree.c.o): In function `safe_open':
+metatree.c:(.text+0x9c8): undefined reference to `gvfs_randomize_string'
+collect2: error: ld returned 1 exit status
+
+Apply this change in the whole source code and not only for
+gvfsd-metadata to avoid any other build failures.
+
+Fixes:
+ - http://autobuild.buildroot.org/results//fa892c41b6b9285839a0164b000e37fb04dcc194
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.gnome.org/GNOME/gvfs/-/merge_requests/92]
+---
+ client/meson.build   | 2 +-
+ metadata/meson.build | 5 +++--
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/client/meson.build b/client/meson.build
+index 8f57d0d3..1d251481 100644
+--- a/client/meson.build
++++ b/client/meson.build
+@@ -33,8 +33,8 @@ sources = uri_parser_sources + uri_utils + files(
+ 
+ deps = [
+   gio_unix_dep,
+-  libgvfscommon_dep,
+   libmetadata_dep,
++  libgvfscommon_dep,
+ ]
+ 
+ cflags = [
+diff --git a/metadata/meson.build b/metadata/meson.build
+index 4e120d18..5699e6f2 100644
+--- a/metadata/meson.build
++++ b/metadata/meson.build
+@@ -72,8 +72,8 @@ libmetadata_dep = declare_dependency(
+ )
+ 
+ deps = [
+-  libgvfscommon_dep,
+   libmetadata_dep,
++  libgvfscommon_dep,
+ ]
+ 
+ if enable_gudev
+@@ -105,8 +105,8 @@ if enable_devel_utils
+       app + '.c',
+       include_directories: top_inc,
+       dependencies: [
+-        libgvfscommon_dep,
+         libmetadata_dep,
++        libgvfscommon_dep,
+       ],
+       c_args: cflags,
+     )
+@@ -119,6 +119,7 @@ if enable_devel_utils
+       include_directories: top_inc,
+       dependencies: [
+         libmetadata_dep,
++        libgvfscommon_dep,
+         libxml_dep,
+       ],
+       c_args: cflags,
+-- 
+2.27.0
+
