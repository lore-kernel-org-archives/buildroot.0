From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 18:02:09 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/openldap: fix
 static linking wih atomics
Message-ID: <20190902161353.6D4D188EF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fc00278a8c44144fae93cce30cd941b8347947a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

openldap uses its own libtool, static build with atomic fails with our
patches since February 6th 2019 on:

/bin/sh ../../libtool --mode=link /home/buildroot/autobuild/run/instance-0/output/host/bin/or1k-linux-gcc -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os   -static  -static   -o idtest idtest.o liblber.la ../../libraries/liblutil/liblutil.a -L/home/buildroot/autobuild/run/instance-0/output/host/bin/../or1k-buildroot-linux-uclibc/sysroot/usr/lib -lssl -L/home/buildroot/autobuild/run/instance-0/output/host/bin/../or1k-buildroot-linux-uclibc/sysroot/usr/lib -lz -pthread -latomic -lcrypto -lz -pthread -latomic

/home/buildroot/autobuild/run/instance-0/output/host/bin/or1k-linux-gcc -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -static -static -o etest etest.o -pthread -pthread ./.libs/liblber.a -L/home/buildroot/autobuild/run/instance-0/output/host/bin/../or1k-buildroot-linux-uclibc/sysroot/usr/lib ../../libraries/liblutil/liblutil.a -lssl -lcrypto -lz -pthread /home/buildroot/autobuild/run/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/5.4.0/../../../../or1k-buildroot-linux-uclibc/lib//libatomic.so

To fix this error, revert the openldap commit that raises this issue

Fixes:
 - http://autobuild.buildroot.org/results/ab4f85fd21cacfaef6b0b43a38da6a4a1d32ecb6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6e609d37d31a2866ad4d76e8e098941b66e81f5a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...3977-fix-libtool-static-behavior-to-match.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/openldap/0004-revert-ITS-3977-fix-libtool-static-behavior-to-match.patch b/package/openldap/0004-revert-ITS-3977-fix-libtool-static-behavior-to-match.patch
new file mode 100644
index 0000000000..3a901c910d
--- /dev/null
+++ b/package/openldap/0004-revert-ITS-3977-fix-libtool-static-behavior-to-match.patch
@@ -0,0 +1,56 @@
+From 88a0442a0f01076914af80db40571fd52914ffa3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 28 Mar 2019 23:52:38 +0100
+Subject: [PATCH] revert ITS#3977, fix libtool -static behavior to match docs
+
+Revert
+https://github.com/openldap/openldap/commit/7b6a088a2590fdad10286d10050b769e48554e13
+as this patch does not work with our buildroot patches
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ab4f85fd21cacfaef6b0b43a38da6a4a1d32ecb6
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: Not upstreamable]
+---
+ build/ltmain.sh | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/build/ltmain.sh b/build/ltmain.sh
+index 1d079b91e..996dc7dad 100755
+--- a/build/ltmain.sh
++++ b/build/ltmain.sh
+@@ -1190,15 +1190,14 @@ EOF
+ 	  if test -n "$link_static_flag"; then
+ 	    dlopen_self=$dlopen_self_static
+ 	  fi
+-	  prefer_static_libs=yes
+ 	else
+ 	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
+ 	    dlopen_self=$dlopen_self_static
+ 	  fi
+-	  prefer_static_libs=built
+ 	fi
+ 	build_libtool_libs=no
+ 	build_old_libs=yes
++	prefer_static_libs=yes
+ 	break
+ 	;;
+       esac
+@@ -2602,12 +2601,8 @@ EOF
+ 	fi
+ 
+ 	link_static=no # Whether the deplib will be linked statically
+-	use_static_libs=$prefer_static_libs
+-	if test "$use_static_libs" = built && test "$installed" = yes ; then
+-	  use_static_libs=no
+-	fi
+ 	if test -n "$library_names" &&
+-	   { test "$use_static_libs" = no || test -z "$old_library"; }; then
++	   { test "$prefer_static_libs" = no || test -z "$old_library"; }; then
+ 	  if test "$installed" = no; then
+ 	    notinst_deplibs="$notinst_deplibs $lib"
+ 	    need_relink=yes
+-- 
+2.14.1
+
