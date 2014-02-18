From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 18 Feb 2014 23:31:52 +0100
Subject: [Buildroot] [PATCH v2 1/1] ncftp: fix cross-compilation test
Message-ID: <1392762712-29657-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The cross-compilation test is based on the ability to run
a test program on the host, which is wrong.

If it runs, then the configure script concludes
that we're doing native compilation,
if it doesn't run, we're doing cross-compilation.

Replace it with a more correct test.

Fixes
http://autobuild.buildroot.net/results/969/969a49ae97a50634ea846a82b9c360e4fb020ace/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2:
Add a cross-compilation test suggested by Thomas Petazzoni.

 .../ncftp-0001-fix-cross-compilation-test.patch    | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/ncftp/ncftp-0001-fix-cross-compilation-test.patch

diff --git a/package/ncftp/ncftp-0001-fix-cross-compilation-test.patch b/package/ncftp/ncftp-0001-fix-cross-compilation-test.patch
new file mode 100644
index 0000000..f92cce9
--- /dev/null
+++ b/package/ncftp/ncftp-0001-fix-cross-compilation-test.patch
@@ -0,0 +1,51 @@
+From 39396048bee3db9a29ec909aece1bdc6e6880e91 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Fri, 14 Feb 2014 02:21:57 +0100
+Subject: [PATCH 1/1] configure: fix cross-compilation test
+
+The cross-compilation test is based on the ability to run
+a test program on the host, which is wrong.
+
+If it runs, then the configure script concludes
+that we're doing native compilation,
+if it doesn't run, we're doing cross-compilation.
+
+Replace it with a more correct test.
+
+Fixes
+http://autobuild.buildroot.net/results/969/969a49ae97a50634ea846a82b9c360e4fb020ace/build-end.log
+
+Note: The case where --build and --host are used together is not handled.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/configure b/configure
+index 2f0fae0..2cfaa65 100755
+--- a/configure
++++ b/configure
+@@ -1273,11 +1273,14 @@ main(){return(0);}
+ EOF
+ if { (eval echo configure:1275: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   ac_cv_prog_cc_works=yes
+-  # If we can't run a trivial program, we are probably using a cross compiler.
+-  if (./conftest; exit) 2>/dev/null; then
+-    ac_cv_prog_cc_cross=no
+-  else
+-    ac_cv_prog_cc_cross=yes
++  if test "x$host_alias" != x; then
++    if test "x$build_alias" = x; then
++      cross_compiling=maybe
++      $as_echo "$as_me: WARNING: If you wanted to set the --build type, don't use --host.
++      If a cross compiler is detected then cross compile mode will be used." >&2
++    elif test "x$build_alias" != "x$host_alias"; then
++      cross_compiling=yes
++    fi
+   fi
+ else
+   echo "configure: failed program was:" >&5
+-- 
+1.8.5.3
+
-- 
1.8.5.3
