From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 12:05:11 +0100
Subject: [Buildroot] [PATCH 1/3] oprofile: fix nanosleep() issue on
	non-threaded toolchains
In-Reply-To: <1419851113-11865-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419851113-11865-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1419851113-11865-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch to OProfile that ensures <time.h> is included
whenever nanosleep() is used, which fixes a build failure on uClibc
toolchains with no thread support.

Fixes:

  http://autobuild.buildroot.org/results/d28/d28447c1241ce3dd237710e388d799139d7d613d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Include-time.h-for-nanosleep.patch        | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/oprofile/0001-Include-time.h-for-nanosleep.patch

diff --git a/package/oprofile/0001-Include-time.h-for-nanosleep.patch b/package/oprofile/0001-Include-time.h-for-nanosleep.patch
new file mode 100644
index 0000000..d4a9ca2
--- /dev/null
+++ b/package/oprofile/0001-Include-time.h-for-nanosleep.patch
@@ -0,0 +1,44 @@
+From c5b93c33a81d7c52dc6089387e415f2d653f758f Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 29 Dec 2014 11:43:51 +0100
+Subject: [PATCH] Include <time.h> for nanosleep()
+
+The nanosleep() function prototype is in <time.h>, so this header file
+should be included whenever nanosleep() is used. Not including it
+causes some issues when building OProfile against a non-thread capable
+version of the uClibc C library, probably because in such situation,
+<time.h> does not get included by another header.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ pe_counting/ocount.cpp | 1 +
+ pe_profiling/operf.cpp | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/pe_counting/ocount.cpp b/pe_counting/ocount.cpp
+index 07dfd0c..fba29eb 100644
+--- a/pe_counting/ocount.cpp
++++ b/pe_counting/ocount.cpp
+@@ -28,6 +28,7 @@
+ #include <getopt.h>
+ #include <sys/time.h>
+ #include <math.h>
++#include <time.h>
+ 
+ #include "op_pe_utils.h"
+ #include "ocount_counter.h"
+diff --git a/pe_profiling/operf.cpp b/pe_profiling/operf.cpp
+index 04a25d9..4238754 100644
+--- a/pe_profiling/operf.cpp
++++ b/pe_profiling/operf.cpp
+@@ -33,6 +33,7 @@
+ #include <sys/wait.h>
+ #include <ftw.h>
+ #include <getopt.h>
++#include <time.h>
+ #include <iostream>
+ #include "operf_utils.h"
+ #include "op_pe_utils.h"
+-- 
+2.1.0
+
-- 
2.1.0
