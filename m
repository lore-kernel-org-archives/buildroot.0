From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 09:01:02 +0100
Subject: [Buildroot] [git commit] package/libseccomp: security bump to
 version 2.4.0
Message-ID: <20190324081038.4AF6F82B3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02300786c2fcba2cf641a040a2d87c4022ddb7fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the advisory:

Jann Horn  identified a problem in current versions of
libseccomp where the library did not correctly generate 64-bit syscall
argument comparisons using the arithmetic operators (LT, GT, LE, GE).
Jann has done a search using codesearch.debian.net and it would appear
that only systemd and Tor are using libseccomp in such a way as to
trigger the bad code.  In the case of systemd this appears to affect
the socket address family and scheduling class filters.  In the case
of Tor it appears that the bad filters could impact the memory
addresses passed to mprotect(2).

The libseccomp v2.4.0 release fixes this problem, and should be a
direct drop-in replacement for previous v2.x releases.

https://www.openwall.com/lists/oss-security/2019/03/15/1

v2.4.0 adds a new scmp_api_level utility, so update 0001-remove-static.patch
to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libseccomp/0001-remove-static.patch | 18 +++++++++++-------
 package/libseccomp/libseccomp.hash          |  2 +-
 package/libseccomp/libseccomp.mk            |  2 +-
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/libseccomp/0001-remove-static.patch b/package/libseccomp/0001-remove-static.patch
index 9f0ac210c7..60a1ff00b6 100644
--- a/package/libseccomp/0001-remove-static.patch
+++ b/package/libseccomp/0001-remove-static.patch
@@ -1,4 +1,4 @@
-From 8632287cf6863b580340f846ac14adf2609abdb0 Mon Sep 17 00:00:00 2001
+From 5d010fb06eae43b284e5ccc322f6de47eb42b751 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sat, 2 Jun 2018 13:45:22 +0200
 Subject: [PATCH] remove static
@@ -14,16 +14,18 @@ and slighly updated to work with 2.3.3
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Peter: updated for v2.4.0 which adds scmp_api_level]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
- tools/Makefile.am | 2 --
- 1 file changed, 2 deletions(-)
+ tools/Makefile.am | 3 ---
+ 1 file changed, 3 deletions(-)
 
 diff --git a/tools/Makefile.am b/tools/Makefile.am
-index 70b4aed..ef74270 100644
+index f768365..5f9d571 100644
 --- a/tools/Makefile.am
 +++ b/tools/Makefile.am
-@@ -35,8 +35,6 @@ scmp_bpf_disasm_SOURCES = scmp_bpf_disasm.c bpf.h util.h
- scmp_bpf_sim_SOURCES = scmp_bpf_sim.c bpf.h util.h
+@@ -37,10 +37,7 @@ scmp_bpf_sim_SOURCES = scmp_bpf_sim.c bpf.h util.h
+ scmp_api_level_SOURCES = scmp_api_level.c
  
  scmp_sys_resolver_LDADD = ../src/libseccomp.la
 -scmp_sys_resolver_LDFLAGS = -static
@@ -31,6 +33,8 @@ index 70b4aed..ef74270 100644
 -scmp_arch_detect_LDFLAGS = -static
  scmp_bpf_disasm_LDADD = util.la
  scmp_bpf_sim_LDADD = util.la
+ scmp_api_level_LDADD = ../src/libseccomp.la
+-scmp_api_level_LDFLAGS = -static
 -- 
-2.14.1
+2.11.0
 
diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index 0362ce9ba4..0823903c36 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 5a52495207f00d1254707f11226e17c16ec53f5038d65bbabf1892873fa2fe5b libseccomp-v2.3.3.tar.gz
+sha256 b7ee0299157fb7a6a81c99f2e0d7e64429b7d7c0eae43c3a6ef91e87eeed2868 libseccomp-v2.4.0.tar.gz
 sha256 102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b LICENSE
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index afa2d36122..90b981f042 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = v2.3.3
+LIBSECCOMP_VERSION = v2.4.0
 LIBSECCOMP_SITE = $(call github,seccomp,libseccomp,$(LIBSECCOMP_VERSION))
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
