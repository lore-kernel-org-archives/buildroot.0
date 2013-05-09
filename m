From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 May 2013 17:53:05 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/gcc: the ARC version of gcc needs
	host-flex/host-bison
In-Reply-To: <1368114785-14666-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368114785-14666-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368114785-14666-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    4 ++++
 1 file changed, 4 insertions(+)

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
-- 
1.7.9.5
