From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 22:22:18 +0200
Subject: [Buildroot] [git commit] toolchain/gcc: the ARC version of gcc
	needs host-flex/host-bison
Message-ID: <20130512202410.E97AC9A164@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c6232658a61c33d4746ace8f479916f957a5a6b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some reason (probably because the ARC changes modify some lex/yacc
files without updating their pre-generated variants, or because the
date/time of the pre-generated files is not correct), building the ARC
gcc requires host-flex and host-bison.

We have tested 4.2 for AVR, 4.3 and 4.4 for ARM, and none of those
need host-flex or host-bison to be installed, so only the 4.4 for ARC
seems to be affected.

Fixes the build failure visible at
http://autobuild.buildroot.org/results/673c6262e3dde8ee8dd28204d814097e6ba8f8e9/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 8cacc32..21679ef 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -180,6 +180,10 @@ endif
 GCC_HOST_PREREQ += host-mpc
 endif
 
+ifeq ($(BR2_GCC_VERSION_4_4_7_ARC),y)
+GCC_HOST_PREREQ += host-flex host-bison
+endif
+
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 GCC_SHARED_LIBGCC:=--enable-shared
 else
