From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 19:06:23 +0100
Subject: [Buildroot] [git commit] ktap: bump version
Message-ID: <20141101180637.551A2B2B14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30f43bed60ba48d62907a29f5af3a6e4d443a714
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We switch from a tag to a commit ID, because the last release is from
December 2013, even though many new changes have been made to ktap
since then (~80 commits). Ktap has had 4 releases in its history, all
made during the first 7 months of its existence, but then no more
releases have been made.

[Thomas: reword commit log, add patch to fix build with uClibc, remove
KTAP_SOURCE since we're fetching from github.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../ktap/0001-Add-missing-stdarg.h-include.patch   |   47 ++++++++++++++++++++
 package/ktap/ktap.mk                               |    3 +-
 2 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/package/ktap/0001-Add-missing-stdarg.h-include.patch b/package/ktap/0001-Add-missing-stdarg.h-include.patch
new file mode 100644
index 0000000..9c4566f
--- /dev/null
+++ b/package/ktap/0001-Add-missing-stdarg.h-include.patch
@@ -0,0 +1,47 @@
+From dc135d8f1f2a843cebd4da0d4b17828911e162a6 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 1 Nov 2014 18:53:47 +0100
+Subject: [PATCH] Add missing <stdarg.h> include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+In file included from userspace/kp_bcwrite.c:32:0:
+userspace/kp_util.h:74:14: error: unknown type name ???va_list???
+   ErrMsg em, va_list argp);
+              ^
+userspace/kp_util.h:76:42: error: unknown type name ???va_list???
+ const char *kp_sprintfv(const char *fmt, va_list argp);
+                                          ^
+In file included from userspace/kp_lex.c:28:0:
+userspace/kp_util.h:74:14: error: unknown type name ???va_list???
+   ErrMsg em, va_list argp);
+              ^
+userspace/kp_util.h:76:42: error: unknown type name ???va_list???
+ const char *kp_sprintfv(const char *fmt, va_list argp);
+
+Submitted upstream: https://github.com/ktap/ktap/pull/77
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ userspace/kp_util.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/userspace/kp_util.h b/userspace/kp_util.h
+index af0b221..5778dc4 100644
+--- a/userspace/kp_util.h
++++ b/userspace/kp_util.h
+@@ -1,6 +1,8 @@
+ #ifndef __KTAP_UTIL_H__
+ #define __KTAP_UTIL_H__
+ 
++#include <stdarg.h>
++
+ #include "../include/ktap_bc.h"
+ #include "../include/ktap_err.h"
+ 
+-- 
+2.0.0
+
diff --git a/package/ktap/ktap.mk b/package/ktap/ktap.mk
index 0c2652d..50ad222 100644
--- a/package/ktap/ktap.mk
+++ b/package/ktap/ktap.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-KTAP_VERSION = v0.4
+KTAP_VERSION = 5b16b61deb6c8a99d71e5167706a5f5566135828
 KTAP_SITE = $(call github,ktap,ktap,$(KTAP_VERSION))
-KTAP_SOURCE = v$(KTAP_VERSION).tar.gz
 KTAP_LICENSE = GPLv2
 KTAP_LICENSE_FILES = LICENSE-GPL
 
