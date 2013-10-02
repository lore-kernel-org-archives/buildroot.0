From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2013 14:33:47 +0200
Subject: [Buildroot] [git commit] m4: bump to version 1.4.17
Message-ID: <20131002125021.00A4A9B914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85571429f732a54788e266e7f06a6f9d62f30d20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove MB_CUR_MAX patch since it's unnecessary/insufficent for non-wchar
compilation since c29e01e61e5754c446eb524f65b01195cf25cbcc

no-gets patch unnecessary also since it's been fixed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/m4/m4-1.4.16-001-MB_CUR_MAX.patch |   13 ----------
 package/m4/m4-1.4.16-no-gets.patch        |   38 -----------------------------
 package/m4/m4.mk                          |    2 +-
 3 files changed, 1 insertions(+), 52 deletions(-)

diff --git a/package/m4/m4-1.4.16-001-MB_CUR_MAX.patch b/package/m4/m4-1.4.16-001-MB_CUR_MAX.patch
deleted file mode 100644
index fce3673..0000000
--- a/package/m4/m4-1.4.16-001-MB_CUR_MAX.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- m4-1.4.8.orig/lib/regcomp.c	2006-09-24 06:28:37.000000000 +0200
-+++ m4-1.4.8/lib/regcomp.c	2007-01-06 20:53:10.000000000 +0100
-@@ -871,6 +871,10 @@ init_dfa (re_dfa_t *dfa, size_t pat_len)
-   dfa->state_table = calloc (sizeof (struct re_state_table_entry), table_size);
-   dfa->state_hash_mask = table_size - 1;
- 
-+#ifndef MB_CUR_MAX
-+#define MB_CUR_MAX (0)
-+#endif
-+
-   dfa->mb_cur_max = MB_CUR_MAX;
- #ifdef _LIBC
-   if (dfa->mb_cur_max == 6
diff --git a/package/m4/m4-1.4.16-no-gets.patch b/package/m4/m4-1.4.16-no-gets.patch
deleted file mode 100644
index a057377..0000000
--- a/package/m4/m4-1.4.16-no-gets.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Since the 2.16 release of the glibc, 'gets' is not any more defined in the gnulib.
-No m4 version synchronized with gnulib since [1] has been released yet.
-
-This patch avoids the following error occurs when building m4 <=1.4.16 on host using
-a glibc >=2.16:
-
-make[4]: Entering directory `/opt/buildroot/output/build/host-m4-1.4.16/lib'
-/opt/buildroot/output/host/usr/bin/ccache /usr/bin/gcc -std=gnu99  -I.     -O2 -I/opt/buildroot/output/host/include -I/opt/buildroot/output/host/usr/include -MT gl_avltree_oset.o -MD -MP -MF .deps/gl_avltree_oset.Tpo -c -o gl_avltree_oset.o gl_avltree_oset.c
-/opt/buildroot/output/host/usr/bin/ccache /usr/bin/gcc -std=gnu99  -I.     -O2 -I/opt/buildroot/output/host/include -I/opt/buildroot/output/host/usr/include -MT c-ctype.o -MD -MP -MF .deps/c-ctype.Tpo -c -o c-ctype.o c-ctype.c
-/opt/buildroot/output/host/usr/bin/ccache /usr/bin/gcc -std=gnu99  -I.     -O2 -I/opt/buildroot/output/host/include -I/opt/buildroot/output/host/usr/include -MT c-stack.o -MD -MP -MF .deps/c-stack.Tpo -c -o c-stack.o c-stack.c
-/opt/buildroot/output/host/usr/bin/ccache /usr/bin/gcc -std=gnu99  -I.     -O2 -I/opt/buildroot/output/host/include -I/opt/buildroot/output/host/usr/include -MT clean-temp.o -MD -MP -MF .deps/clean-temp.Tpo -c -o clean-temp.o clean-temp.c
-mv -f .deps/c-ctype.Tpo .deps/c-ctype.Po
-/opt/buildroot/output/host/usr/bin/ccache /usr/bin/gcc -std=gnu99  -I.     -O2 -I/opt/buildroot/output/host/include -I/opt/buildroot/output/host/usr/include -MT close-hook.o -MD -MP -MF .deps/close-hook.Tpo -c -o close-hook.o close-hook.c
-In file included from clean-temp.h:22:0,
-                 from clean-temp.c:23:
-./stdio.h:477:20: error 'gets' undeclared here (not in a function)
-make[4]: *** [clean-temp.o] Error 1
-
-References:
-[1] http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commitdiff;h=66712c23388e93e5c518ebc8515140fa0c807348
-[2] http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-devel/m4/files/m4-1.4.16-no-gets.patch?diff_format=h&revision=1.1&view=markup
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
----
-diff -purN host-m4-1.4.16.orig/lib/stdio.in.h host-m4-1.4.16/lib/stdio.in.h
---- host-m4-1.4.16.orig/lib/stdio.in.h	2012-07-21 19:11:40.196541826 +0200
-+++ host-m4-1.4.16/lib/stdio.in.h	2012-07-21 20:46:05.405850751 +0200
-@@ -162,7 +162,9 @@ _GL_WARN_ON_USE (fflush, "fflush is not
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
- #undef gets
-+#if defined(__GLIBC__) && !defined(__UCLIBC__) && !__GLIBC_PREREQ(2, 16)
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+#endif
- 
- #if @GNULIB_FOPEN@
- # if @REPLACE_FOPEN@
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index d06d2c9..2600728 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-M4_VERSION = 1.4.16
+M4_VERSION = 1.4.17
 M4_SOURCE = m4-$(M4_VERSION).tar.xz
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPLv3+
