From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Feb 2019 15:53:45 +0100
Subject: [Buildroot] [git commit] package/safeclib: fix build with gcc 7
Message-ID: <20190217145202.8ED6F884AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed5aa81b5156fefcf948c1412c3ae3d4f7595fb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/f4fe6bf54d213ca75bc1f16df61f8f92e648288e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-pic_flag-to-RETPOLINE-cflags-and-ldflags.patch | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/safeclib/0002-add-pic_flag-to-RETPOLINE-cflags-and-ldflags.patch b/package/safeclib/0002-add-pic_flag-to-RETPOLINE-cflags-and-ldflags.patch
new file mode 100644
index 0000000000..f4f4eaab96
--- /dev/null
+++ b/package/safeclib/0002-add-pic_flag-to-RETPOLINE-cflags-and-ldflags.patch
@@ -0,0 +1,62 @@
+From 23ae79fe84a3fa5d995b8c6b9be70587e37a6cd8 Mon Sep 17 00:00:00 2001
+From: Reini Urban <rurban@cpan.org>
+Date: Mon, 26 Mar 2018 18:31:30 +0200
+Subject: [PATCH] add pic_flag to RETPOLINE cflags and ldflags
+
+This fixes the linke probe, and fixes #55.
+Also: libtool is stripping pic_flags from the shared link cmd.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/rurban/safeclib/commit/23ae79fe84a3fa5d995b8c6b9be70587e37a6cd8]
+---
+ configure.ac                    | 2 +-
+ m4/ax_compiler_flags_cflags.m4  | 4 ++--
+ m4/ax_compiler_flags_ldflags.m4 | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 33ed7326..10325dc6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4,7 +4,7 @@
+ # 2017  Reini Urban <rurban@cpan.org>
+ #
+ # Copyright (c) 2012, 2013 Cisco Systems
+-# Copyright (c) 2017 Reini Urban
++# Copyright (c) 2017, 2018 Reini Urban
+ # All rights reserved.
+ #
+ # Permission is hereby granted, free of charge, to any person
+diff --git a/m4/ax_compiler_flags_cflags.m4 b/m4/ax_compiler_flags_cflags.m4
+index 31e3ba8c..1dec00b2 100644
+--- a/m4/ax_compiler_flags_cflags.m4
++++ b/m4/ax_compiler_flags_cflags.m4
+@@ -66,12 +66,12 @@ AC_DEFUN([AX_COMPILER_FLAGS_CFLAGS],[
+     ])
+ 
+     # retpoline: clang-7. Note: requires lld-7 linker support
+-    AX_APPEND_COMPILE_FLAGS(["-mretpoline -DRETPOLINE"],
++    AX_APPEND_COMPILE_FLAGS(["-mretpoline -DRETPOLINE $lt_prog_compiler_pic"],
+         [RETPOLINE_CFLAGS],[$ax_compiler_flags_test])
+     # or the equivalent gcc-7.3 variant
+     if test -z "$RETPOLINE_CFLAGS"; then
+         AX_APPEND_COMPILE_FLAGS(
+-          ["-mindirect-branch=thunk-extern -mfunction-return=thunk-extern -mindirect-branch-register -DRETPOLINE"],
++          ["-mindirect-branch=thunk-extern -mfunction-return=thunk-extern -mindirect-branch-register $lt_prog_compiler_pic -DRETPOLINE"],
+           [RETPOLINE_CFLAGS],[$ax_compiler_flags_test])
+     fi
+ 
+diff --git a/m4/ax_compiler_flags_ldflags.m4 b/m4/ax_compiler_flags_ldflags.m4
+index d0287852..193f412e 100644
+--- a/m4/ax_compiler_flags_ldflags.m4
++++ b/m4/ax_compiler_flags_ldflags.m4
+@@ -66,7 +66,7 @@ AC_DEFUN([AX_COMPILER_FLAGS_LDFLAGS],[
+     dnl /usr/bin/ld: warning: -z retpolineplt ignored.
+     case $RETPOLINE_CFLAGS in
+         *-mretpoline*|*-mindirect-branch=thunk-extern*)
+-            AX_APPEND_LINK_FLAGS([-Wl,-z,retpolineplt],
++            AX_APPEND_LINK_FLAGS(["$RETPOLINE_CFLAGS -Wl,-z,retpolineplt"],
+                 [RETPOLINE_LDFLAGS],[$ax_compiler_flags_test])
+             if test -n "$RETPOLINE_LDFLAGS"; then
+                 AM_CFLAGS="$AM_CFLAGS $RETPOLINE_CFLAGS"
