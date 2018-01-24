From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 23 Jan 2018 22:09:43 -0600
Subject: [Buildroot] [PATCH v4 04/13] ncurses: correct linker flag seq
In-Reply-To: <1516766992-48428-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1516766992-48428-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1516766992-48428-4-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will correct the sequence of -pie and -shared options.
When used together, -pie should be provided to the linker before
-shared.

Upstream: http://lists.gnu.org/archive/html/bug-ncurses/2017-11/msg00024.html

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
--
Changes

v3 -> v4
 - New
---
 ...ses-patch-to-correct-linker-flag-sequence.patch | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/ncurses/0003-ncurses-patch-to-correct-linker-flag-sequence.patch

diff --git a/package/ncurses/0003-ncurses-patch-to-correct-linker-flag-sequence.patch b/package/ncurses/0003-ncurses-patch-to-correct-linker-flag-sequence.patch
new file mode 100644
index 0000000..34c1bbd
--- /dev/null
+++ b/package/ncurses/0003-ncurses-patch-to-correct-linker-flag-sequence.patch
@@ -0,0 +1,61 @@
+From bca0dfabe9a4fa21d5b3b8bed8c138822188564f Mon Sep 17 00:00:00 2001
+From: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+Date: Fri, 29 Sep 2017 11:02:32 -0500
+Subject: [PATCH 1/1] ncurses: patch to correct linker flag sequence
+
+Description
+ This patch will correct the sequence of -pie and -shared options.
+ When used together, -pie should be provided to the linker before
+ -shared. If -pie is provided after -shared, the linker throws an
+ error shown below as example.
+
+The patch fixes Makefile.am for below libs within setools:
+ - libncurses.so.6.0
+-------------------------------------------------------------------------
+/host/powerpc-buildroot-linux-gnu/sysroot/usr/lib/Scrt1.o:(.data+0x4):
+ undefined reference to `main'
+/host/lib/gcc/powerpc-buildroot-linux-gnu/6.4.0/../../../..
+/powerpc-buildroot-linux-gnu/bin/ld: BFD (GNU Binutils) 2.28.1
+ assertion fail elf32-ppc.c:8923
+collect2: error: ld returned 1 exit status
+make[3]: *** [../lib/libncurses.so.6.0] Error 1
+make[2]: *** [all] Error 2
+make[1]: *** [/build/ncurses-6.0/.stamp_built] Error 2
+make: *** [_all] Error 2
+-------------------------------------------------------------------------
+
+Signed-off-by: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+---
+ configure  | 2 +-
+ mk-1st.awk | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 29c61bd..aa42c0a 100755
+--- a/configure
++++ b/configure
+@@ -6204,7 +6204,7 @@ echo "${ECHO_T}$cf_cv_ldflags_search_paths_first" >&6
+ 		cf_cv_shared_soname='`basename $@`'
+ 	fi
+ 
+-		MK_SHARED_LIB='${CC} ${CFLAGS} -shared -Wl,-soname,'$cf_cv_shared_soname',-stats,-lc -o $@'
++		MK_SHARED_LIB='${CC} ${CFLAGS} -Wl,-soname,'$cf_cv_shared_soname',-stats,-lc -o $@'
+ 		;;
+ 	(mingw*)
+ 		cf_cv_shlib_version=mingw
+diff --git a/mk-1st.awk b/mk-1st.awk
+index 1b88127..054e9d5 100644
+--- a/mk-1st.awk
++++ b/mk-1st.awk
+@@ -170,7 +170,7 @@ function removelinks(directory) {
+ 		}
+ 	}
+ function make_shlib(objs, shlib_list) {
+-		printf "\t$(MK_SHARED_LIB) $(%s_OBJS) $(%s) $(LDFLAGS)\n", objs, shlib_list
++		printf "\t$(MK_SHARED_LIB) $(LDFLAGS) -shared $(%s_OBJS) $(%s)\n", objs, shlib_list
+ 	}
+ function sharedlinks(directory) {
+ 		if ( ShlibVer != "auto" && ShlibVer != "cygdll" && ShlibVer != "msysdll" && ShlibVer != "mingw" ) {
+-- 
+1.9.1
+
-- 
1.9.1
