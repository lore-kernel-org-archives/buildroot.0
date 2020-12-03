From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  3 Dec 2020 21:28:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/rhash: fix build failure due to gcc
 -v
Message-ID: <20201203202853.616174-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/8605c16cc28316954ce8b9dcc266974390c5da20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-configure-allow-cross-compilation.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/rhash/0001-configure-allow-cross-compilation.patch

diff --git a/package/rhash/0001-configure-allow-cross-compilation.patch b/package/rhash/0001-configure-allow-cross-compilation.patch
new file mode 100644
index 0000000000..e33353f8b3
--- /dev/null
+++ b/package/rhash/0001-configure-allow-cross-compilation.patch
@@ -0,0 +1,45 @@
+From 0605ddf795330c03ff52e993726de99a984cf2f4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 10 Oct 2020 11:07:39 +0200
+Subject: [PATCH] configure: allow cross-compilation
+
+Update configure to allow the user to pass a cross-compiler such as
+--cc=/home/fabrice/buildroot/output/host/bin/riscv64-buildroot-linux-uclibc-gcc
+
+First, use --version instead of -v to avoid a build failure and set
+cc_vendor to gnu if CC compiler contains gcc
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure b/configure
+index 2783b85..c8e1ea7 100755
+--- a/configure
++++ b/configure
+@@ -512,9 +512,9 @@ else
+   CC_TMP="$CC"
+   test -n "$OPT_CC" && OTHER_CC= || OTHER_CC="gcc cc"
+   for CC in "$CC_TMP" $OTHER_CC; do
+-    if run_cmd "$CC -v"; then
+-      cc_name_tmp=$($CC -v 2>&1 | tail -n 1 | cut -d ' ' -f 1)
+-      if test "$cc_name_tmp" = "gcc"; then
++    if run_cmd "$CC --version"; then
++      cc_name_tmp=$($CC --version 2>&1 | head -n 1 | cut -d ' ' -f 1)
++      if echo "$cc_name_tmp" | grep -q "gcc"; then
+         cc_name=$cc_name_tmp
+         start_check "$CC version"
+         cc_vendor=gnu
+@@ -538,7 +538,7 @@ else
+         finish_check "$cc_name $cc_version"
+         break
+       fi
+-      if $CC -v 2>&1 | grep -q "clang"; then
++      if $CC --version 2>&1 | grep -q "clang"; then
+         start_check "$CC version"
+         cc_vendor=clang
+         cc_version=$($CC -dumpversion 2>&1)
+-- 
+2.29.2
+
-- 
2.29.2
