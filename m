From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 23:48:46 +0200
Subject: [Buildroot] [PATCH 03/19] Fix computation of REAL_GNU_TARGET_NAME
In-Reply-To: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ece1f4225ce2af0a274943753d9c2e7ced5d3262.1280440124.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current computation of REAL_GNU_TARGET_NAME is incorrect for
non-ARM glibc platforms because it generates something such as
mipsel-unknown-linux- as the REAL_GNU_TARGET_NAME.

So we correct this by :

 * Adding "gnu" in the suffix when glibc is used, so that in the
   previous case we will have mipsel-unknown-linux-gnu

 * Improving the ARM_EABI code to correctly append "eabi" when glibc
   is selected, so that we have arm-unknown-linux-gnueabi, and to
   append "gnueabi" when uclibc is selected, so that we have
   arm-unknown-linux-uclibcgnueabi. The little trick here is that LIBC
   and ABI aren't completely orthogonal on ARM.

This fixes problems such as :

checking host system type... Invalid configuration
`mipsel-unknown-linux-': machine `mipsel-unknown-linux' not recognized

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 36f2f24..bb2aafa 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -93,11 +93,20 @@ LIBC=uclibc
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 LIBC=uclibc
 else
-LIBC=
+LIBC=gnu
 endif
 
+# The ABI suffix is a bit special on ARM, as it needs to be
+# -uclibcgnueabi for uClibc EABI, -uclibc for uClibc OABI, -gnueabi
+# for glibc EABI and -gnu for glibc OABI. This means that the LIBC and
+# ABI aren't strictly orthogonal, which explains why we need the test
+# on LIBC below.
 ifeq ($(BR2_ARM_EABI),y)
+ifeq ($(LIBC),uclibc)
 ABI=gnueabi
+else
+ABI=eabi
+endif
 endif
 
 REAL_GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)
-- 
1.7.0.4
