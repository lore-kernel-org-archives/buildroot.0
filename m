From: Martin Banky <martin.banky@gmail.com>
Date: Sat, 18 Sep 2010 19:53:27 -0700
Subject: [Buildroot] [PATCH 05/21] bison: bump to 2.4.3
In-Reply-To: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284864823-18993-6-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 .../bison/bison-2.4.3-00-spawn-sched_param.patch   |   20 ++++++++++++++++++++
 package/bison/bison.mk                             |    2 +-
 2 files changed, 21 insertions(+), 1 deletions(-)
 create mode 100644 package/bison/bison-2.4.3-00-spawn-sched_param.patch

diff --git a/package/bison/bison-2.4.3-00-spawn-sched_param.patch b/package/bison/bison-2.4.3-00-spawn-sched_param.patch
new file mode 100644
index 0000000..d43db9f
--- /dev/null
+++ b/package/bison/bison-2.4.3-00-spawn-sched_param.patch
@@ -0,0 +1,20 @@
+"Apparently, glibc's headers expose the full definition of "struct
+sched_param" in cases not required by the standard, and gnulib attempts to
+optimize based on this. uClibc does not share glibc's behavior in this one
+case, but since it defines __GLIBC__, gnulib sees no need for caution."
+
+Per Michael Deutschmann
+
+See http://lists.busybox.net/pipermail/uclibc/2010-March/043721.html
+
+--- bison-2.4.3-orig/lib/spawn.in.h	2010-04-11 11:31:37.000000000 -0700
++++ bison-2.4.3/lib/spawn.in.h	2010-09-18 15:42:05.000000000 -0700
+@@ -31,7 +31,7 @@
+ 
+ /* Get definitions of 'struct sched_param' and 'sigset_t'.
+    But avoid namespace pollution on glibc systems.  */
+-#ifndef __GLIBC__
++#if defined __UCLIBC__ || !defined __GLIBC__
+ # include <sched.h>
+ # include <signal.h>
+ #endif
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 9e28e85..075a078 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -3,7 +3,7 @@
 # bison
 #
 #############################################################
-BISON_VERSION:=2.3
+BISON_VERSION:=2.4.3
 BISON_SOURCE:=bison-$(BISON_VERSION).tar.bz2
 BISON_SITE:=$(BR2_GNU_MIRROR)/bison
 
-- 
1.7.2.3
