From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 29 Nov 2018 19:06:47 +0100
Subject: [Buildroot] [PATCH 1/1] systemd: fix build with gcc <= 4.7
Message-ID: <20181129180647.8422-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pass -Werror=shadow in args of cc.compiles in meson.build otherwise test
will always succeed

Fixes:
 - http://autobuild.buildroot.org/results/ffd71c473d3b29618c18cd2e04705370266696f2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...eson.build-fix-detection-of-Werror-shadow.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/systemd/0006-meson.build-fix-detection-of-Werror-shadow.patch

diff --git a/package/systemd/0006-meson.build-fix-detection-of-Werror-shadow.patch b/package/systemd/0006-meson.build-fix-detection-of-Werror-shadow.patch
new file mode 100644
index 0000000000..0aa3189206
--- /dev/null
+++ b/package/systemd/0006-meson.build-fix-detection-of-Werror-shadow.patch
@@ -0,0 +1,34 @@
+From 7bd6e6db3dbb980c099b444c61d9aff7fcc636cf Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 29 Nov 2018 13:22:08 +0100
+Subject: [PATCH] meson.build: fix detection of -Werror=shadow
+
+Pass -Werror=shadow in args of cc.compiles otherwise test will always
+succeed
+This fix a build failure with gcc 4.7.3
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ffd71c473d3b29618c18cd2e04705370266696f2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/systemd/systemd/pull/10993]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 37ae27b4a..980150ac8 100644
+--- a/meson.build
++++ b/meson.build
+@@ -396,7 +396,7 @@ if cc.compiles('''
+            struct timespec now;
+            return 0;
+    }
+-''', name : '-Werror=shadow with local shadowing')
++''', args: '-Werror=shadow', name : '-Werror=shadow with local shadowing')
+         add_project_arguments('-Werror=shadow', language : 'c')
+ endif
+ 
+-- 
+2.14.1
+
-- 
2.14.1
