From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 23:11:01 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] systemd: fix build with
 gcc <= 4.7
Message-ID: <20181203220745.6B1308A68F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdfc31752d74646c623192289b42a7019ddd456f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Pass -Werror=shadow in args of cc.compiles in meson.build otherwise test
will always succeed, causing -Werror=shadow to be passed, even on older gcc versions.

GCC 4.8 changed the behaviour of -Werror=shadow to no longer complain about
local variable declariations shadowing functions, which systemd has.  From
the changelog:

  The option -Wshadow no longer warns if a declaration shadows a function
  declaration, unless the former declares a function or pointer to function,
  because this is a common and valid case in real-world code.

https://www.gnu.org/software/gcc/gcc-4.8/changes.html

Fixes:
 - http://autobuild.buildroot.org/results/ffd71c473d3b29618c18cd2e04705370266696f2

[Peter: extend commit message, add gcc 4.8 link]
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 76cf905c7bbded4a0eaf48da27b475ab51fc60d9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...eson.build-fix-detection-of-Werror-shadow.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

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
