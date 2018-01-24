From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 23 Jan 2018 22:09:50 -0600
Subject: [Buildroot] [PATCH v4 11/13] tcl: correct linker flag sequence
In-Reply-To: <1516766992-48428-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1516766992-48428-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1516766992-48428-11-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When used together, -pie should be provided to the linker before
-shared.

Upstream: http://core.tcl.tk/tcl/info/eb2c85495faaa9ed

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
--
Changes
v3 -> v4
 - New
---
 ...tcl-patch-to-correct-linker-flag-sequence.patch | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 package/tcl/0002-tcl-patch-to-correct-linker-flag-sequence.patch

diff --git a/package/tcl/0002-tcl-patch-to-correct-linker-flag-sequence.patch b/package/tcl/0002-tcl-patch-to-correct-linker-flag-sequence.patch
new file mode 100644
index 0000000..5f2b6f9
--- /dev/null
+++ b/package/tcl/0002-tcl-patch-to-correct-linker-flag-sequence.patch
@@ -0,0 +1,87 @@
+From 66fd0c72620c9ab17c528b34fb4a2ccf6a82c116 Mon Sep 17 00:00:00 2001
+From: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+Date: Thu, 28 Sep 2017 10:38:51 -0500
+Subject: [PATCH 1/1] tcl: patch to correct linker flag sequence
+
+Description
+ This patch will correct the sequence of -pie and -shared options.
+ When used together, -pie should be provided to the linker before
+ -shared. If -pie is provided after -shared, the linker throws an
+ error shown below as example.
+
+The patch fixes below pkgs:
+ - libtcl8.6.so
+ - libitcl4.0.5.so
+ - libtdbc1.0.4.so
+ - libthread2.8.0.so
+
+-------------------------------------------------------------------------
+/host/powerpc-buildroot-linux-gnu/sysroot/usr/lib/Scrt1.o:(.data+0x4):
+ undefined reference to `main'
+collect2: error: ld returned 1 exit status
+make[2]: *** [libtcl8.6.so] Error 1
+-------------------------------------------------------------------------
+
+Signed-off-by: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+---
+ pkgs/itcl4.0.5/configure   | 2 +-
+ pkgs/tdbc1.0.4/configure   | 2 +-
+ pkgs/thread2.8.0/configure | 2 +-
+ unix/tcl.m4                | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/pkgs/itcl4.0.5/configure b/pkgs/itcl4.0.5/configure
+index 39a994b..8c67865 100755
+--- a/pkgs/itcl4.0.5/configure
++++ b/pkgs/itcl4.0.5/configure
+@@ -7346,7 +7346,7 @@ fi
+ 	    CFLAGS_OPTIMIZE="-O2 -fomit-frame-pointer"
+ 
+ 	    # TEA specific: use LDFLAGS_DEFAULT instead of LDFLAGS
+-	    SHLIB_LD='${CC} -shared ${CFLAGS} ${LDFLAGS_DEFAULT}'
++	    SHLIB_LD='${CC} ${CFLAGS} ${LDFLAGS_DEFAULT} -shared'
+ 	    LDFLAGS="$LDFLAGS -Wl,--export-dynamic"
+ 	    if test $doRpath = yes; then :
+ 
+diff --git a/pkgs/tdbc1.0.4/configure b/pkgs/tdbc1.0.4/configure
+index 94dfd63..fe7d7b3 100755
+--- a/pkgs/tdbc1.0.4/configure
++++ b/pkgs/tdbc1.0.4/configure
+@@ -7421,7 +7421,7 @@ fi
+ 	    CFLAGS_OPTIMIZE="-O2 -fomit-frame-pointer"
+ 
+ 	    # TEA specific: use LDFLAGS_DEFAULT instead of LDFLAGS
+-	    SHLIB_LD='${CC} -shared ${CFLAGS} ${LDFLAGS_DEFAULT}'
++	    SHLIB_LD='${CC} ${CFLAGS} ${LDFLAGS_DEFAULT} -shared'
+ 	    LDFLAGS="$LDFLAGS -Wl,--export-dynamic"
+ 	    if test $doRpath = yes; then :
+ 
+diff --git a/pkgs/thread2.8.0/configure b/pkgs/thread2.8.0/configure
+index 2aa66a8..58b5ffd 100755
+--- a/pkgs/thread2.8.0/configure
++++ b/pkgs/thread2.8.0/configure
+@@ -7422,7 +7422,7 @@ fi
+ 	    CFLAGS_OPTIMIZE="-O2 -fomit-frame-pointer"
+ 
+ 	    # TEA specific: use LDFLAGS_DEFAULT instead of LDFLAGS
+-	    SHLIB_LD='${CC} -shared ${CFLAGS} ${LDFLAGS_DEFAULT}'
++	    SHLIB_LD='${CC} ${CFLAGS} ${LDFLAGS_DEFAULT} -shared'
+ 	    LDFLAGS="$LDFLAGS -Wl,--export-dynamic"
+ 	    if test $doRpath = yes; then :
+ 
+diff --git a/unix/tcl.m4 b/unix/tcl.m4
+index ec7218e..1c286f8 100644
+--- a/unix/tcl.m4
++++ b/unix/tcl.m4
+@@ -1403,7 +1403,7 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
+ 	    # get rid of the warnings.
+ 	    #CFLAGS_OPTIMIZE="${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES -D__NO_MATH_INLINES"
+ 
+-	    SHLIB_LD='${CC} -shared ${CFLAGS} ${LDFLAGS}'
++	    SHLIB_LD='${CC} ${CFLAGS} ${LDFLAGS} -shared'
+ 	    DL_OBJS="tclLoadDl.o"
+ 	    DL_LIBS="-ldl"
+ 	    LDFLAGS="$LDFLAGS -Wl,--export-dynamic"
+-- 
+1.9.1
+
-- 
1.9.1
