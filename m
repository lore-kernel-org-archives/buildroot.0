From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Aug 2012 12:04:26 +0200
Subject: [Buildroot] [PATCH 1/4] uClibc: use BR2_ENDIAN to simplify
	endianess selection
In-Reply-To: <1344161069-19804-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1344161069-19804-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1344161069-19804-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/uClibc/uclibc.mk |   17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

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
-- 
1.7.9.5
