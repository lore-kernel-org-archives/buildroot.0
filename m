From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 18 Oct 2013 15:36:09 -0300
Subject: [Buildroot] [PATCH] gcc 4.8.x: add PR57717 patches
Message-ID: <1382121369-17042-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Failure to build libc for PowerPC E500 cores, see:
http://gcc.gnu.org/bugzilla//show_bug.cgi?id=57717

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/4.8.2/840-PR57717.patch        | 23 +++++++++++++++++++++++
 package/gcc/4.8.2/841-PR57717-E500v2.patch | 21 +++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 package/gcc/4.8.2/840-PR57717.patch
 create mode 100644 package/gcc/4.8.2/841-PR57717-E500v2.patch

diff --git a/package/gcc/4.8.2/840-PR57717.patch b/package/gcc/4.8.2/840-PR57717.patch
new file mode 100644
index 0000000..f983f70
--- /dev/null
+++ b/package/gcc/4.8.2/840-PR57717.patch
@@ -0,0 +1,23 @@
+This backports fix from http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57717
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gcc-4.8.1/gcc/config/rs6000/rs6000.c
+===================================================================
+--- gcc-4.8.1.orig/gcc/config/rs6000/rs6000.c	2013-05-09 18:54:06.000000000 -0700
++++ gcc-4.8.1/gcc/config/rs6000/rs6000.c	2013-06-27 08:22:40.459021366 -0700
+@@ -5431,11 +5431,12 @@
+ 
+     case TFmode:
+     case TDmode:
+-    case TImode:
+       if (TARGET_E500_DOUBLE)
+ 	return (SPE_CONST_OFFSET_OK (offset)
+ 		&& SPE_CONST_OFFSET_OK (offset + 8));
++        /* Fall through.  */
+ 
++    case TImode:
+       extra = 8;
+       if (!worst_case)
+ 	break;
diff --git a/package/gcc/4.8.2/841-PR57717-E500v2.patch b/package/gcc/4.8.2/841-PR57717-E500v2.patch
new file mode 100644
index 0000000..96fa1da
--- /dev/null
+++ b/package/gcc/4.8.2/841-PR57717-E500v2.patch
@@ -0,0 +1,21 @@
+This backports fix from http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57717
+
+Upstream-Status: Backport
+Signed-off-by: Julian Brown <Julian_Brown@mentor.com>
+
+fix for PR57717 (PowerPC E500v2)
+http://gcc.gnu.org/ml/gcc-patches/2013-08/msg00668.html
+
+--- a/gcc/config/rs6000/rs6000.c	2013-05-09 20:54:06.000000000 -0500
++++ b/gcc/config/rs6000/rs6000.c	2013-08-28 01:25:24.865218744 -0500
+@@ -6337,9 +6337,7 @@
+       && GET_CODE (XEXP (x, 1)) == CONST_INT
+       && reg_offset_p
+       && !SPE_VECTOR_MODE (mode)
+-      && !(TARGET_E500_DOUBLE && (mode == DFmode || mode == TFmode
+-				  || mode == DDmode || mode == TDmode
+-				  || mode == DImode))
++      && !(TARGET_E500_DOUBLE && GET_MODE_SIZE (mode) > UNITS_PER_WORD)
+       && VECTOR_MEM_NONE_P (mode))
+     {
+       HOST_WIDE_INT val = INTVAL (XEXP (x, 1));
-- 
1.8.1.5
