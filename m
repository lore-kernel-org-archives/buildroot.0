From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 14 Jul 2012 23:34:36 +0200
Subject: [Buildroot] [PATCH v2] libplayer: fix handling of cflags in
	configure
Message-ID: <1342301676-23857-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Problem was found when compiling libplayer with GStreamer support
on x86_64 with a Sourcery toolchain.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: document error situation in commit log
 .../libplayer/libplayer-fix-configure-cflags.patch |   41 ++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/libplayer/libplayer-fix-configure-cflags.patch b/package/libplayer/libplayer-fix-configure-cflags.patch
new file mode 100644
index 0000000..186afd5
--- /dev/null
+++ b/package/libplayer/libplayer-fix-configure-cflags.patch
@@ -0,0 +1,41 @@
+From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+Subject: [PATCH] libplayer: Fix handling of cflags in configure.
+
+The cflags returned by pkg-config or another config script may consist
+of several arguments for the compiler.  These should not be quoted together
+into a single argument.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+Sent upstream to devel at geexbox.org on July 11, 2012.
+---
+diff -rup libplayer-2.0.1.orig/configure libplayer-2.0.1/configure
+--- libplayer-2.0.1.orig/configure	2010-10-03 19:26:11.000000000 +0200
++++ libplayer-2.0.1/configure	2012-07-10 23:33:02.783701852 +0200
+@@ -342,7 +342,7 @@ check_libconfig(){
+   err=1
+   if `which "$config" 1>/dev/null 2>&1`; then
+     cflags=`$config $ccflags`
+-    [ -n "$cflags" ] && check_cflags "$cflags"
++    [ -n "$cflags" ] && check_cflags $cflags
+     libs=`$config $clibs`
+     if [ -n "$libs" ]; then
+       temp_extralibs "$libs"
+@@ -364,7 +364,7 @@ check_libconfig_exists(){
+   err=1
+   if `which "$config" 1>/dev/null 2>&1`; then
+     cflags=`$config $ccflags`
+-    [ -n "$cflags" ] && temp_cflags "$cflags"
++    [ -n "$cflags" ] && temp_cflags $cflags
+     libs=`$config $clibs`
+     if [ -n "$libs" ]; then
+       temp_extralibs "$libs"
+@@ -386,7 +386,7 @@ check_pkgconfig(){
+   err=1
+   if `which pkg-config 1>/dev/null 2>&1`; then
+     cflags=`pkg-config $pkg $ccflags`
+-    [ -n "$cflags" ] && check_cflags "$cflags"
++    [ -n "$cflags" ] && check_cflags $cflags
+     libs=`pkg-config $pkg $clibs`
+     if [ -n "$libs" ]; then
+       temp_extralibs "$libs"
-- 
tg: (b8b57bb..) t/libplayer-cflags (depends on: master)
