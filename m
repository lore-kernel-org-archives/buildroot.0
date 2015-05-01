From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 16:20:07 +0200
Subject: [Buildroot] [git commit] argp-standalone: fix build issue caused by
	UCHAR_MAX definition
Message-ID: <20150501142049.BA8DC7FAE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a4ece2ed3e3766c463ef8f61a3362ba86c8a6cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The issue was simply that the patch from Max Filippov forgot to
include <limits.h> to get the definition of UCHAR_MAX.

Fixes:

  http://autobuild.buildroot.org/results/bd1/bd120ada4830fda3db96da945513d4f6f7b2d419/

and lots of similar build failures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/argp-standalone/0002-isprint.patch |   24 +++++++++++++++++-------
 1 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/package/argp-standalone/0002-isprint.patch b/package/argp-standalone/0002-isprint.patch
index a2962a1..9c08366 100644
--- a/package/argp-standalone/0002-isprint.patch
+++ b/package/argp-standalone/0002-isprint.patch
@@ -9,10 +9,19 @@ Restrict isprint argument range to values representable by unsigned char.
 
 Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
 ---
-diff -bu argp-standalone-1.3/argp.h argp-standalone-1.3-/argp.h
---- argp-standalone-1.3/argp.h	2015-04-28 10:31:39.015319337 +0300
-+++ argp-standalone-1.3-/argp.h	2015-04-28 10:27:46.526770624 +0300
-@@ -577,7 +577,7 @@
+Index: b/argp.h
+===================================================================
+--- a/argp.h
++++ b/argp.h
+@@ -23,6 +23,7 @@
+ 
+ #include <stdio.h>
+ #include <ctype.h>
++#include <limits.h>
+ 
+ #define __need_error_t
+ #include <errno.h>
+@@ -577,7 +578,7 @@
    else
      {
        int __key = __opt->key;
@@ -21,9 +30,10 @@ diff -bu argp-standalone-1.3/argp.h argp-standalone-1.3-/argp.h
      }
  }
  
-diff -bu argp-standalone-1.3/argp-parse.c argp-standalone-1.3-/argp-parse.c
---- argp-standalone-1.3/argp-parse.c	2015-04-28 10:31:39.016319380 +0300
-+++ argp-standalone-1.3-/argp-parse.c	2015-04-28 10:27:21.810818130 +0300
+Index: b/argp-parse.c
+===================================================================
+--- a/argp-parse.c
++++ b/argp-parse.c
 @@ -1292,7 +1292,7 @@
        int __key = __opt->key;
        /* FIXME: whether or not a particular key implies a short option
