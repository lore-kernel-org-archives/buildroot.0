From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Sep 2012 22:03:51 +0200
Subject: [Buildroot] [git commit] uClibc: use BR2_ENDIAN to simplify
	endianess selection
Message-ID: <20120904200552.7BFD799503@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9df50486c0e5a7a36531aacf49c2a57ac21c7fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uclibc.mk |   17 ++---------------
 1 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 9d0b6db..583d199 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -41,22 +41,9 @@ UCLIBC_TARGET_ARCH:=$(shell $(SHELL) -c "echo $(ARCH) | sed \
 		-e 's/cris.*/cris/' \
 		-e 's/xtensa.*/xtensa/' \
 ")
-# just handle the ones that can be big or little
-UCLIBC_TARGET_ENDIAN:=$(shell $(SHELL) -c "echo $(ARCH) | sed \
-		-e 's/armeb/BIG/' \
-		-e 's/arm/LITTLE/' \
-		-e 's/mipsel/LITTLE/' \
-		-e 's/mips/BIG/' \
-		-e 's/sh.*eb/BIG/' \
-		-e 's/sh.*/LITTLE/' \
-		-e 's/sparc.*/BIG/' \
-")
 
-ifneq ($(UCLIBC_TARGET_ENDIAN),LITTLE)
-ifneq ($(UCLIBC_TARGET_ENDIAN),BIG)
-UCLIBC_TARGET_ENDIAN:=
-endif
-endif
+UCLIBC_TARGET_ENDIAN:=$(call qstrip,$(BR2_ENDIAN))
+
 ifeq ($(UCLIBC_TARGET_ENDIAN),LITTLE)
 UCLIBC_NOT_TARGET_ENDIAN:=BIG
 else
