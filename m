From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 May 2020 21:43:44 +0200
Subject: [Buildroot] [PATCH v1] package/gupnp: add libuuid to linking
 dependencies
Message-ID: <20200510194344.13852-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  - http://autobuild.buildroot.net/results/cbb9ed09ba5c2cbee8c7c1eb8c781d8f05437e8c

    CCLD     rygel
  .../arm-buildroot-linux-uclibcgnueabi/bin/ld: .../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgupnp-1.2.a(guul.c.o): in function `guul_get_uuid':
  guul.c:(.text+0x20): undefined reference to `uuid_generate'
  .../arm-buildroot-linux-uclibcgnueabi/bin/ld: guul.c:(.text+0x2c): undefined reference to `uuid_unparse'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...d-dependency-from-guul-fixes-static-.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/gupnp/0001-build-add-libuuid-dependency-from-guul-fixes-static-.patch

diff --git a/package/gupnp/0001-build-add-libuuid-dependency-from-guul-fixes-static-.patch b/package/gupnp/0001-build-add-libuuid-dependency-from-guul-fixes-static-.patch
new file mode 100644
index 0000000000..43684c7de8
--- /dev/null
+++ b/package/gupnp/0001-build-add-libuuid-dependency-from-guul-fixes-static-.patch
@@ -0,0 +1,30 @@
+From 0cd45d9c5c9a19a5336348151ce5d6bc233588cb Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 10 May 2020 21:30:38 +0200
+Subject: [PATCH] build: add libuuid dependency from guul (fixes static
+ linking)
+
+Fixes:
+
+  /usr/lib/libgupnp-1.2.a(guul.c.o): in function `guul_get_uuid':
+  guul.c:(.text+0x20): undefined reference to `uuid_generate'
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ subprojects/guul/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/subprojects/guul/meson.build b/subprojects/guul/meson.build
+index aea40c4..cc1a498 100644
+--- a/subprojects/guul/meson.build
++++ b/subprojects/guul/meson.build
+@@ -29,5 +29,6 @@ guul_lib = static_library(
+ 
+ guul = declare_dependency (
+     link_with : guul_lib,
++    dependencies : dependencies,
+     include_directories: include_directories('.')
+ )
+-- 
+2.26.2
+
-- 
2.26.2
