From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 10:25:38 +0100
Subject: [Buildroot] [PATCH 11/15] uclibc: add patch for uClibc snapshot to
	fix build issue
In-Reply-To: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
Message-ID: <67475b4ce6b25c10a255204a5ed5463c83ff1faf.1291541115.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On older glibc (like 2.7), the _SC_V7_* symbols are not defined,
making the build of current uClibc fail on Debian Lenny systems and
other systems using a fairly old glibc. So we make sure to only use
the specs names that are defined by the host C library.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...tconf-only-use-specs-names-when-available.patch |  131 ++++++++++++++++++++
 1 files changed, 131 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc.snapshot.getconf-only-use-specs-names-when-available.patch

diff --git a/toolchain/uClibc/uClibc.snapshot.getconf-only-use-specs-names-when-available.patch b/toolchain/uClibc/uClibc.snapshot.getconf-only-use-specs-names-when-available.patch
new file mode 100644
index 0000000..1086ca7
--- /dev/null
+++ b/toolchain/uClibc/uClibc.snapshot.getconf-only-use-specs-names-when-available.patch
@@ -0,0 +1,131 @@
+From 1b36ac390724a83455e349fdf6487dd513aeac05 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 4 Dec 2010 09:58:38 +0100
+Subject: [PATCH] getconf: only use specs names when available
+
+On older glibc (like 2.7), the _SC_V7_* symbols are not defined,
+making the build of current uClibc fail on Debian Lenny systems and
+other systems using a fairly old glibc. So we make sure to only use
+the specs names that are defined by the host C library.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ utils/getconf.c |   72 ++++++++++++++++++++++++++++++++++++------------------
+ 1 files changed, 48 insertions(+), 24 deletions(-)
+
+diff --git a/utils/getconf.c b/utils/getconf.c
+index 81566df..812783e 100644
+--- a/utils/getconf.c
++++ b/utils/getconf.c
+@@ -1014,18 +1014,42 @@ static const struct conf vars[] =
+ 
+ static const struct { const char *name; int num; } specs[] =
+   {
++#ifdef _SC_XBS5_ILP32_OFF32
+     { "XBS5_ILP32_OFF32", _SC_XBS5_ILP32_OFF32 },
++#endif
++#ifdef _SC_XBS5_ILP32_OFFBIG
+     { "XBS5_ILP32_OFFBIG", _SC_XBS5_ILP32_OFFBIG },
++#endif
++#ifdef _SC_XBS5_LP64_OFF64
+     { "XBS5_LP64_OFF64", _SC_XBS5_LP64_OFF64 },
++#endif
++#ifdef _SC_XBS5_LPBIG_OFFBIG
+     { "XBS5_LPBIG_OFFBIG", _SC_XBS5_LPBIG_OFFBIG },
++#endif
++#ifdef _SC_V6_ILP32_OFF32
+     { "POSIX_V6_ILP32_OFF32", _SC_V6_ILP32_OFF32 },
++#endif
++#ifdef _SC_V6_ILP32_OFFBIG
+     { "POSIX_V6_ILP32_OFFBIG", _SC_V6_ILP32_OFFBIG },
++#endif
++#ifdef _SC_V6_LP64_OFF64
+     { "POSIX_V6_LP64_OFF64", _SC_V6_LP64_OFF64 },
++#endif
++#ifdef _SC_V6_LPBIG_OFFBIG
+     { "POSIX_V6_LPBIG_OFFBIG", _SC_V6_LPBIG_OFFBIG },
++#endif
++#ifdef _SC_V7_ILP32_OFF32
+     { "POSIX_V7_ILP32_OFF32", _SC_V7_ILP32_OFF32 },
++#endif
++#ifdef _SC_V7_ILP32_OFFBIG
+     { "POSIX_V7_ILP32_OFFBIG", _SC_V7_ILP32_OFFBIG },
++#endif
++#ifdef _SC_V7_LP64_OFF64
+     { "POSIX_V7_LP64_OFF64", _SC_V7_LP64_OFF64 },
++#endif
++#ifdef _SC_V7_LPBIG_OFFBIG
+     { "POSIX_V7_LPBIG_OFFBIG", _SC_V7_LPBIG_OFFBIG },
++#endif
+   };
+ static const int nspecs = sizeof (specs) / sizeof (specs[0]);
+ 
+@@ -1177,41 +1201,41 @@ environment SPEC.\n\n");
+ 
+       switch (specs[i].num)
+ 	{
+-#ifndef _XBS5_ILP32_OFF32
+-	  case _SC_XBS5_ILP32_OFF32:
++#if !defined(_XBS5_ILP32_OFF32) && defined(_SC_XBS5_ILP32_OFF32)
++	case _SC_XBS5_ILP32_OFF32:
+ #endif
+-#ifndef _XBS5_ILP32_OFFBIG
+-	  case _SC_XBS5_ILP32_OFFBIG:
++#if !defined(_XBS5_ILP32_OFFBIG) && defined(_SC_XBS5_ILP32_OFFBIG)
++	case _SC_XBS5_ILP32_OFFBIG:
+ #endif
+-#ifndef _XBS5_LP64_OFF64
+-	  case _SC_XBS5_LP64_OFF64:
++#if !defined(_XBS5_LP64_OFF64) && defined(_SC_XBS5_LP64_OFF64)
++	case _SC_XBS5_LP64_OFF64:
+ #endif
+-#ifndef _XBS5_LPBIG_OFFBIG
+-	  case _SC_XBS5_LPBIG_OFFBIG:
++#if !defined(_XBS5_LPBIG_OFFBIG) && defined(_SC_XBS5_LPBIG_OFFBIG)
++	case _SC_XBS5_LPBIG_OFFBIG:
+ #endif
+-#ifndef _POSIX_V6_ILP32_OFF32
+-	  case _SC_V6_ILP32_OFF32:
++#if !defined(_POSIX_V6_ILP32_OFF32) && defined(_SC_V6_ILP32_OFF32)
++	case _SC_V6_ILP32_OFF32:
+ #endif
+-#ifndef _POSIX_V6_ILP32_OFFBIG
+-	  case _SC_V6_ILP32_OFFBIG:
++#if !defined(_POSIX_V6_ILP32_OFFBIG) && defined(_SC_V6_ILP32_OFFBIG)
++	case _SC_V6_ILP32_OFFBIG:
+ #endif
+-#ifndef _POSIX_V6_LP64_OFF64
+-	  case _SC_V6_LP64_OFF64:
++#if !defined(_POSIX_V6_LP64_OFF64) && defined(_SC_V6_LP64_OFF64)
++	case _SC_V6_LP64_OFF64:
+ #endif
+-#ifndef _POSIX_V6_LPBIG_OFFBIG
+-	  case _SC_V6_LPBIG_OFFBIG:
++#if !defined(_POSIX_V6_LPBIG_OFFBIG) && defined(_SC_V6_LPBIG_OFFBIG)
++	case _SC_V6_LPBIG_OFFBIG:
+ #endif
+-#ifndef _POSIX_V7_ILP32_OFF32
+-	  case _SC_V7_ILP32_OFF32:
++#if !defined(_POSIX_V7_ILP32_OFF32) && defined(_SC_V7_ILP32_OFF32)
++	case _SC_V7_ILP32_OFF32:
+ #endif
+-#ifndef _POSIX_V7_ILP32_OFFBIG
+-	  case _SC_V7_ILP32_OFFBIG:
++#if !defined(_POSIX_V7_ILP32_OFFBIG) && defined(_SC_V7_ILP32_OFFBIG)
++	case _SC_V7_ILP32_OFFBIG:
+ #endif
+-#ifndef _POSIX_V7_LP64_OFF64
+-	  case _SC_V7_LP64_OFF64:
++#if !defined(_POSIX_V7_LP64_OFF64) && defined(_SC_V7_LP64_OFF64)
++	case _SC_V7_LP64_OFF64:
+ #endif
+-#ifndef _POSIX_V7_LPBIG_OFFBIG
+-	  case _SC_V7_LPBIG_OFFBIG:
++#if !defined(_POSIX_V7_LPBIG_OFFBIG) && defined(_SC_V7_LPBIG_OFFBIG)
++	case _SC_V7_LPBIG_OFFBIG:
+ #endif
+ 	    {
+ 	      const char *args[argc + 3];
+-- 
+1.7.0.4
+
-- 
1.7.0.4
