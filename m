From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  8 Oct 2018 23:05:07 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] brltty: use gcc instead of ld to link shared objects
Message-ID: <20181008210507.13811-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 5.6 has reintroduced the issue fixed by patch 854093 on
version 5.5.

Indeed, third patch was merged upstream but it was then reverted:
https://github.com/brltty/brltty/commit/9e7d62c869d3c1cbe12dda8b0291a4692c193416

Moreover, since commit 3a2e3f6fa5ef0a210ffeba5ed05c79965d0cc3c7, MKOBJ
was renamed into MKREL. So, patch again brltty, overwrite
MKREL to use "gcc -shared -o" instead of "ld -r -o" if gcc is available
(as suggested by Arnout: https://patchwork.ozlabs.org/patch/972614).

Fixes:
 - http://autobuild.buildroot.org/results/31f682838b3d3b2c7103b5c51f2aba0b89d4f630

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (following review of Arnout Vandecappelle):
 - Add an upstreamable patch that checks if gcc is available before
   using it

Changes v1 -> v2:
 - Fix patch (missing -o)

 .../0002-Fix-linking-error-on-mips64el.patch  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/brltty/0002-Fix-linking-error-on-mips64el.patch

diff --git a/package/brltty/0002-Fix-linking-error-on-mips64el.patch b/package/brltty/0002-Fix-linking-error-on-mips64el.patch
new file mode 100644
index 0000000000..4882a22608
--- /dev/null
+++ b/package/brltty/0002-Fix-linking-error-on-mips64el.patch
@@ -0,0 +1,42 @@
+From ddb06335935ef1458fe98f99cdc5d5fe6757fd02 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 3 Oct 2018 19:06:40 +0200
+Subject: [PATCH] Fix linking error on mips64el
+
+Patch that was fixing build on mips64el was reverted:
+https://github.com/brltty/brltty/commit/9e7d62c869d3c1cbe12dda8b0291a4692c193416
+
+So fix the issue again, this time by checking if $(GCC) is available as
+suggested by Arnout during review of buildroot patch:
+https://patchwork.ozlabs.org/patch/972614
+
+Fixes:
+ - http://autobuild.buildroot.org/results/31f682838b3d3b2c7103b5c51f2aba0b89d4f630
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/brltty/brltty/pull/149]
+---
+ configure.ac | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1e2774abf..a488d3d52 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -481,7 +481,12 @@ AC_CACHE_CHECK([for make relocatable object command], [brltty_cv_prog_make_objec
+ case "${host_os}"
+ in
+    *)
+-      brltty_cv_prog_make_object_relocatable="\$(LD) -r -o"
++      if test "${GCC}" = "yes"
++      then
++         brltty_cv_prog_make_object_relocatable="\$(CC) -shared -o"
++      else
++         brltty_cv_prog_make_object_relocatable="\$(LD) -r -o"
++      fi
+       ;;
+ esac])
+ MKREL="${brltty_cv_prog_make_object_relocatable}"
+-- 
+2.17.1
+
-- 
2.17.1
