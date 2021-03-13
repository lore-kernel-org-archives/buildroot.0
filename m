From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 13 Mar 2021 10:59:09 +0100
Subject: [Buildroot] [PATCH 3/3] package/janet: fix static build
In-Reply-To: <20210313095909.93871-1-fontaine.fabrice@gmail.com>
References: <20210313095909.93871-1-fontaine.fabrice@gmail.com>
Message-ID: <20210313095909.93871-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/a4f927f73a7b80e65408c992d7b6023609a1eacc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-meson.build-fix-static-build.patch   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/janet/0002-meson.build-fix-static-build.patch

diff --git a/package/janet/0002-meson.build-fix-static-build.patch b/package/janet/0002-meson.build-fix-static-build.patch
new file mode 100644
index 0000000000..bd335cad90
--- /dev/null
+++ b/package/janet/0002-meson.build-fix-static-build.patch
@@ -0,0 +1,37 @@
+From b0f1a4967db9d8910e0091adff5e40a2a147323f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 12 Mar 2021 08:46:05 +0100
+Subject: [PATCH] meson.build: fix static build
+
+Don't enforce -rdynamic when building statically to avoid the following
+build failure:
+
+/home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/arm-linux-gcc  -o janet janet.p/meson-generated_.._janet.c.o janet.p/src_mainclient_shell.c.o -Wl,--as-needed -Wl,--allow-shlib-undefined -Wl,-O1 -rdynamic -Wl,-elf2flt -static -Wl,--start-group -lm -ldl -Wl,--end-group -pthread
+arm-linux-gcc.br_real: error: unrecognized command line option '-rdynamic'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a4f927f73a7b80e65408c992d7b6023609a1eacc
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/janet-lang/janet/commit/b0f1a4967db9d8910e0091adff5e40a2a147323f]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index d3a2d399..a8a0a054 100644
+--- a/meson.build
++++ b/meson.build
+@@ -33,7 +33,7 @@ dl_dep = cc.find_library('dl', required : false)
+ thread_dep = dependency('threads')
+ 
+ # Link options
+-if build_machine.system() != 'windows'
++if get_option('default_library') != 'static' and build_machine.system() != 'windows'
+     add_project_link_arguments('-rdynamic', language : 'c')
+ endif
+ 
+-- 
+2.30.0
+
-- 
2.30.0
