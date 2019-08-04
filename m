From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  4 Aug 2019 22:41:01 +0200
Subject: [Buildroot] [RFC v1] libdrm: fix static build (tests/nouveau)
Message-ID: <20190804204101.7238-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...0005-meson.build-fix-libdl-detection.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/libdrm/0005-meson.build-fix-libdl-detection.patch

diff --git a/package/libdrm/0005-meson.build-fix-libdl-detection.patch b/package/libdrm/0005-meson.build-fix-libdl-detection.patch
new file mode 100644
index 0000000000..2a4efa43ea
--- /dev/null
+++ b/package/libdrm/0005-meson.build-fix-libdl-detection.patch
@@ -0,0 +1,29 @@
+diff --git a/meson.build b/meson.build
+index 7aa5f8c..87e9e01 100644
+--- a/meson.build
++++ b/meson.build
+@@ -168,6 +168,7 @@ endif
+
+ # Among others FreeBSD does not have a separate dl library.
+ if not cc.has_function('dlsym')
++  # failes with br-arm-cortex-m4-full, empty libdl provided
+   dep_dl = cc.find_library('dl', required : with_nouveau)
+ else
+   dep_dl = []
+diff --git a/tests/meson.build b/tests/meson.build
+index fdf950b..9250cfd 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -44,8 +44,11 @@ endif
+ if with_etnaviv
+   subdir('etnaviv')
+ endif
++lib_type = get_option('default_library')
+ if with_nouveau
+-  subdir('nouveau')
++  if lib_type != 'static'
++    subdir('nouveau')
++  endif
+ endif
+
+ drmsl = executable(
--
2.22.0
