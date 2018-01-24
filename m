From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 23 Jan 2018 22:09:48 -0600
Subject: [Buildroot] [PATCH v4 09/13] zlib: correct linker flag sequence
In-Reply-To: <1516766992-48428-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1516766992-48428-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1516766992-48428-9-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch corrects the sequence of -pie and -shared
options. When used together, -pie should be provided
to the linker before -shared. If -pie is provided
after -shared, the linker throws an error.

Upstream: https://github.com/madler/zlib/pull/328

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
--
Changes
v3 -> v4
 - New
---
 ...lib-patch-to-correct-linker-flag-sequence.patch | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 package/zlib/0001-zlib-patch-to-correct-linker-flag-sequence.patch

diff --git a/package/zlib/0001-zlib-patch-to-correct-linker-flag-sequence.patch b/package/zlib/0001-zlib-patch-to-correct-linker-flag-sequence.patch
new file mode 100644
index 0000000..b468175
--- /dev/null
+++ b/package/zlib/0001-zlib-patch-to-correct-linker-flag-sequence.patch
@@ -0,0 +1,109 @@
+From 07624ecd1914fc3c2df0ac21c5a9ef61f1416823 Mon Sep 17 00:00:00 2001
+From: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+Date: Thu, 28 Sep 2017 12:41:36 -0500
+Subject: [PATCH 1/1] zlib: patch to correct linker flag sequence
+
+Description
+ This patch will correct the sequence of -pie and -shared options.
+ When used together, -pie should be provided to the linker before
+ -shared. If -pie is provided after -shared, the linker throws an
+ error shown below as example.
+
+The patch fixes below pkgs:
+ - libz.so
+-------------------------------------------------------------------------
+/host/powerpc-buildroot-linux-gnu/sysroot/usr/lib/Scrt1.o:(.data+0x4):
+ undefined reference to `main'
+/host/lib/gcc/powerpc-buildroot-linux-gnu/6.4.0/../../../..
+/powerpc-buildroot-linux-gnu/bin/ld: BFD (GNU Binutils) 2.28.1
+ assertion fail elf32-ppc.c:8923
+collect2: error: ld returned 1 exit status
+make[2]: *** [libz.so.1.2.11] Error 1
+make[1]: *** [/build/zlib-1.2.11/.stamp_built] Error 2
+make: *** [_all] Error 2
+-------------------------------------------------------------------------
+
+Signed-off-by: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+---
+ Makefile.in | 3 ++-
+ configure   | 8 ++++++--
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 5a77949..18711ce 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -28,6 +28,7 @@ SFLAGS=-O
+ LDFLAGS=
+ TEST_LDFLAGS=-L. libz.a
+ LDSHARED=$(CC)
++LDSHAREDFLAGS=-shared
+ CPP=$(CC) -E
+ 
+ STATICLIB=libz.a
+@@ -279,7 +280,7 @@ gzwrite.lo: $(SRCDIR)gzwrite.c
+ 
+ 
+ placebo $(SHAREDLIBV): $(PIC_OBJS) libz.a
+-	$(LDSHARED) $(SFLAGS) -o $@ $(PIC_OBJS) $(LDSHAREDLIBC) $(LDFLAGS)
++	$(LDSHARED) $(SFLAGS) $(LDFLAGS) $(LDSHAREDFLAGS) -o $@ $(PIC_OBJS) $(LDSHAREDLIBC)
+ 	rm -f $(SHAREDLIB) $(SHAREDLIBM)
+ 	ln -s $@ $(SHAREDLIB)
+ 	ln -s $@ $(SHAREDLIBM)
+diff --git a/configure b/configure
+index e974d1f..09ece63 100755
+--- a/configure
++++ b/configure
+@@ -69,6 +69,7 @@ fi
+ 
+ # set defaults before processing command line options
+ LDCONFIG=${LDCONFIG-"ldconfig"}
++LDSHAREDFLAGS="${LDSHAREDFLAGS--shared}"
+ LDSHAREDLIBC="${LDSHAREDLIBC--lc}"
+ ARCHS=
+ prefix=${prefix-/usr/local}
+@@ -208,7 +209,7 @@ if test "$gcc" -eq 1 && ($cc -c $test.c) >> configure.log 2>&1; then
+   fi
+   case "$uname" in
+   Linux* | linux* | GNU | GNU/* | solaris*)
+-        LDSHARED=${LDSHARED-"$cc -shared -Wl,-soname,libz.so.1,--version-script,${SRCDIR}zlib.map"} ;;
++        LDSHARED=${LDSHARED-"$cc -Wl,-soname,libz.so.1,--version-script,${SRCDIR}zlib.map"} ;;
+   *BSD | *bsd* | DragonFly)
+         LDSHARED=${LDSHARED-"$cc -shared -Wl,-soname,libz.so.1,--version-script,${SRCDIR}zlib.map"}
+         LDCONFIG="ldconfig -m" ;;
+@@ -410,7 +411,7 @@ if test $shared -eq 1; then
+   echo Checking for shared library support... | tee -a configure.log
+   # we must test in two steps (cc then ld), required at least on SunOS 4.x
+   if try $CC -w -c $SFLAGS $test.c &&
+-     try $LDSHARED $SFLAGS -o $test$shared_ext $test.o; then
++     try $LDSHARED $SFLAGS $LDSHAREDFLAGS -o $test$shared_ext $test.o; then
+     echo Building shared library $SHAREDLIBV with $CC. | tee -a configure.log
+   elif test -z "$old_cc" -a -z "$old_cflags"; then
+     echo No shared library support. | tee -a configure.log
+@@ -838,6 +839,7 @@ echo EXE = $EXE >> configure.log
+ echo LDCONFIG = $LDCONFIG >> configure.log
+ echo LDFLAGS = $LDFLAGS >> configure.log
+ echo LDSHARED = $LDSHARED >> configure.log
++echo LDSHAREDFLAGS = $LDSHAREDFLAGS >> configure.log
+ echo LDSHAREDLIBC = $LDSHAREDLIBC >> configure.log
+ echo OBJC = $OBJC >> configure.log
+ echo PIC_OBJC = $PIC_OBJC >> configure.log
+@@ -866,6 +868,7 @@ sed < ${SRCDIR}Makefile.in "
+ /^SFLAGS *=/s#=.*#=$SFLAGS#
+ /^LDFLAGS *=/s#=.*#=$LDFLAGS#
+ /^LDSHARED *=/s#=.*#=$LDSHARED#
++/^LDSHAREDFLAGS *=/s#=.*#=$LDSHAREDFLAGS#
+ /^CPP *=/s#=.*#=$CPP#
+ /^STATICLIB *=/s#=.*#=$STATICLIB#
+ /^SHAREDLIB *=/s#=.*#=$SHAREDLIB#
+@@ -898,6 +901,7 @@ sed < ${SRCDIR}zlib.pc.in "
+ /^CFLAGS *=/s#=.*#=$CFLAGS#
+ /^CPP *=/s#=.*#=$CPP#
+ /^LDSHARED *=/s#=.*#=$LDSHARED#
++/^LDSHAREDFLAGS *=/s#=.*#=$LDSHAREDFLAGS#
+ /^STATICLIB *=/s#=.*#=$STATICLIB#
+ /^SHAREDLIB *=/s#=.*#=$SHAREDLIB#
+ /^SHAREDLIBV *=/s#=.*#=$SHAREDLIBV#
+-- 
+1.9.1
+
-- 
1.9.1
