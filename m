From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 13 Apr 2017 07:07:32 +0200
Subject: [Buildroot] [PATCH v2] glibc: fix sh4 compile issue
Message-ID: <20170413050732.GA11817@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  https://bugs.busybox.net/show_bug.cgi?id=9756

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
 - add patches for 2.23/2.25, requested by Arnout

In the past I remember some discussions about removing version
selection for all C libraries. Any idea why we still have more than
one glibc version?

---
 package/glibc/2.23/0001-sh4-fix.patch | 17 +++++++++++++++++
 package/glibc/2.24/0001-sh4-fix.patch | 17 +++++++++++++++++
 package/glibc/2.25/0001-sh4-fix.patch | 17 +++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 package/glibc/2.23/0001-sh4-fix.patch
 create mode 100644 package/glibc/2.24/0001-sh4-fix.patch
 create mode 100644 package/glibc/2.25/0001-sh4-fix.patch

diff --git a/package/glibc/2.23/0001-sh4-fix.patch b/package/glibc/2.23/0001-sh4-fix.patch
new file mode 100644
index 0000000..20bbfad
--- /dev/null
+++ b/package/glibc/2.23/0001-sh4-fix.patch
@@ -0,0 +1,17 @@
+Backport of 
+https://sourceware.org/git/?p=glibc.git;a=commit;h=d40dbe722f004f999b589de776f7e57e564dda01
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur glibc-2.23.orig/sysdeps/sh/dl-machine.h glibc-2.23/sysdeps/sh/dl-machine.h
+--- glibc-2.23.orig/sysdeps/sh/dl-machine.h	2016-02-18 18:54:00.000000000 +0100
++++ glibc-2.23/sysdeps/sh/dl-machine.h	2017-04-13 06:33:14.967668965 +0200
+@@ -389,7 +389,7 @@
+ 	  break;
+ 	case R_SH_DIR32:
+ 	  {
+-#ifndef RTLD_BOOTSTRAP
++#if !defined RTLD_BOOTSTRAP && !defined RESOLVE_CONFLICT_FIND_MAP
+ 	   /* This is defined in rtld.c, but nowhere in the static
+ 	      libc.a; make the reference weak so static programs can
+ 	      still link.  This declaration cannot be done when
diff --git a/package/glibc/2.24/0001-sh4-fix.patch b/package/glibc/2.24/0001-sh4-fix.patch
new file mode 100644
index 0000000..3c22e01
--- /dev/null
+++ b/package/glibc/2.24/0001-sh4-fix.patch
@@ -0,0 +1,17 @@
+Backport of 
+https://sourceware.org/git/?p=glibc.git;a=commit;h=d40dbe722f004f999b589de776f7e57e564dda01
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur glibc-2.24.orig/sysdeps/sh/dl-machine.h glibc-2.24/sysdeps/sh/dl-machine.h
+--- glibc-2.24.orig/sysdeps/sh/dl-machine.h	2016-08-02 04:01:36.000000000 +0200
++++ glibc-2.24/sysdeps/sh/dl-machine.h	2017-04-10 21:53:51.413196297 +0200
+@@ -389,7 +389,7 @@
+ 	  break;
+ 	case R_SH_DIR32:
+ 	  {
+-#ifndef RTLD_BOOTSTRAP
++#if !defined RTLD_BOOTSTRAP && !defined RESOLVE_CONFLICT_FIND_MAP
+ 	   /* This is defined in rtld.c, but nowhere in the static
+ 	      libc.a; make the reference weak so static programs can
+ 	      still link.  This declaration cannot be done when
diff --git a/package/glibc/2.25/0001-sh4-fix.patch b/package/glibc/2.25/0001-sh4-fix.patch
new file mode 100644
index 0000000..60d25c4
--- /dev/null
+++ b/package/glibc/2.25/0001-sh4-fix.patch
@@ -0,0 +1,17 @@
+Backport of 
+https://sourceware.org/git/?p=glibc.git;a=commit;h=d40dbe722f004f999b589de776f7e57e564dda01
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur glibc-2.25.orig/sysdeps/sh/dl-machine.h glibc-2.25/sysdeps/sh/dl-machine.h
+--- glibc-2.25.orig/sysdeps/sh/dl-machine.h	2017-02-05 16:28:43.000000000 +0100
++++ glibc-2.25/sysdeps/sh/dl-machine.h	2017-04-12 19:49:12.501756097 +0200
+@@ -389,7 +389,7 @@
+ 	  break;
+ 	case R_SH_DIR32:
+ 	  {
+-#ifndef RTLD_BOOTSTRAP
++#if !defined RTLD_BOOTSTRAP && !defined RESOLVE_CONFLICT_FIND_MAP
+ 	   /* This is defined in rtld.c, but nowhere in the static
+ 	      libc.a; make the reference weak so static programs can
+ 	      still link.  This declaration cannot be done when
-- 
2.1.4
