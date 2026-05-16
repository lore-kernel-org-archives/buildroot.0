Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D834CD4851
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 19:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C700240768;
	Sat, 16 May 2026 19:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAN0F1sfQt7k; Sat, 16 May 2026 19:58:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E193C407D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778961523;
	bh=lz6Iqk2Myi845uqwcQC4jPWX+uWkLDYDw08sHvG/IdY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AisA6ZGImng8WBE75TRZFGYesgA73yI+uMoQTT8ZUncSNQq6fVUkReQUn5pSirH9U
	 uA7Cp7KXD1mpwrHFP/zvt9Nptv692+XYRuHmfQBSAc+o+QxrRu8AvTSt67nf2ZCMXN
	 yZeBOSf6YIEhDhegM8paB2I6cNYiir3stOC6udz5D/LHXpN+q0cRyYOrgwycAX4UCq
	 L1rj34ZF/IELiEScEozBBFfhm3j80EDhOH7JISEwBFiO1CADILQ5QySmy5ZGhUw0RD
	 1c2Ju4AHCOZpcNarMZvH9fUMpXUYjpkKEz8QVxngv34YE3ENPcKRV6uf4ZVYKt6h4J
	 48rCqOtRI3wyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E193C407D6;
	Sat, 16 May 2026 19:58:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41CEE206
 for <buildroot@buildroot.org>; Sat, 16 May 2026 19:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3322C60650
 for <buildroot@buildroot.org>; Sat, 16 May 2026 19:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHU4s8BqF-Cs for <buildroot@buildroot.org>;
 Sat, 16 May 2026 19:58:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.131;
 helo=smtpcmd04131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 92D576065F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92D576065F
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92D576065F
 for <buildroot@buildroot.org>; Sat, 16 May 2026 19:58:37 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id OL9ewkQ43JWrEOL9ewQNx3; Sat, 16 May 2026 21:58:35 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Sat, 16 May 2026 21:58:03 +0200
Message-ID: <20260516195803.292097-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDUqxAn5lhePwF2mMSK1vigKMNHCseodqEGCBzbjG81z1ZhIO/k2oRgLo+LX84YWcyAh2KhbN31egE2RiLZUSx2Fvg9XiBhwdPkZf/B+Uxt3Mpy+yktV
 W7hj+MU7S37mmKJd6/FcTewX3MCVoYXFsONGn/hBpx3snPtXYbaw/g7+85LGGjL83u3RHmjnixVZfIoOKm0cEhF9kot7PSPCV/ZXf7yUDEgxRhdZThKPL37w
 kG/CqtdjgVF3XCJAf+1FioZaTmypijr5NC+TVRDCrpVwQq9Zb9iSS34qr9r1gN6emTHCx510rPdX2x6F2RPBzw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1778961515; bh=3S6w6UzEyNiGItcsHu/jRUpmjA09zEO/N9N4zVfVsac=;
 h=From:To:Subject:Date:MIME-Version;
 b=d0BegVJ11+ytNJiGYX62ygU1z+8B3iX+TPDAbCBTm7c4hTPgspKhAz8CtDEOiFeME
 Oow42sufoFjR+X9DAMza/4tXVWkEfcTgxxSvOIA+O4eALafHoGGY6YPIBs94fWFNoL
 EFLOf7I2KF97RjQRfMXv1+x9MpTcYlFTv25auxCmuwi6o7G3tQGq3VXRfibISMXn9N
 W7qqyjywz0fjBPl1Kmi6351rc2Y10oo4K1uXKktAerJM4NfkDN2yh2J4M1yohoThh/
 5qIZpx8BolyzFyOKJmMi7EiykLmfX4x8+LnkkdeFNQnhamZvK8CvDmi6xMyJO28/2/
 klGy48GIc59eA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=d0BegVJ1
Subject: [Buildroot] [PATCH v2] package/libnss: fix build failure on big
 endian architectures
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch pending upstream to fix build failure due to missing gcm
stubs.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* update local patch with latest as pointed by Romain Naour
---
 ...build-failure-due-to-missing-gcm-stu.patch | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch

diff --git a/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch b/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
new file mode 100644
index 0000000000..1ddfc61576
--- /dev/null
+++ b/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
@@ -0,0 +1,114 @@
+From 974469740e6fa9b7ad15f6d9b3945370dc11fa1e Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 30 Mar 2026 17:06:14 +0200
+Subject: [PATCH] Bug 2027768 - Fix build failure due to missing gcm stubs if
+ on big endian
+
+Building gcm on Big Endian architectures lead to linking failure due to
+missing gcm stubs. This is because those stubs are guarded by
+DHAVE_PLATFORM_GHASH that at the moment is defined for every architecture
+that provides acceleration. But at the moment we can also build without
+acceleration but DHAVE_PLATFORM_GHASH is defined in any case.
+So let's add to coreconf/Linux.mk a runtime test to find out which
+endianness toolchain is by setting the new introduced LITTLE_ENDIAN
+variable. And later on, in lib/freebl/Makefile let's guard
+DHAVE_PLATFORM_GHASH definition depending on LITTLE_ENDIAN VARIABLE.
+
+Upstream: https://bugzilla.mozilla.org/show_bug.cgi?id=2027768
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ nss/coreconf/Linux.mk   |  8 ++++++++
+ nss/lib/freebl/Makefile | 28 ++++++++++++++++++++++------
+ 2 files changed, 30 insertions(+), 6 deletions(-)
+
+diff --git a/coreconf/Linux.mk b/coreconf/Linux.mk
+index dcb432415f..cf1f62378d 100644
+--- a/nss/coreconf/Linux.mk
++++ b/nss/coreconf/Linux.mk
+@@ -188,6 +188,14 @@ endif
+ endif
+ endif
+ 
++# Test toolchain for endianness and set LITTLE_ENDIAN variable accordingly
++ENDIANNESS := $(shell echo | $(CC) -dM -E - | grep __BYTE_ORDER__)
++ifeq ($(findstring __ORDER_LITTLE_ENDIAN__,$(ENDIANNESS)),__ORDER_LITTLE_ENDIAN__)
++    LITTLE_ENDIAN := 1
++else
++    LITTLE_ENDIAN := 0
++endif
++
+ USE_SYSTEM_ZLIB = 1
+ ZLIB_LIBS = -lz
+ 
+diff --git a/lib/freebl/Makefile b/lib/freebl/Makefile
+index 4ee9d61f50..39ef28ec8c 100644
+--- a/nss/lib/freebl/Makefile
++++ b/nss/lib/freebl/Makefile
+@@ -112,7 +112,10 @@ endif
+ # NSS_X64 means the target is a 64-bits 64 CPU architecture
+ # NSS_X86_OR_X64 means the target is either x86 or x64
+ ifeq (,$(filter-out i386 x386 x86 x86_64,$(CPU_ARCH)))
+-        DEFINES += -DNSS_X86_OR_X64 -DHAVE_PLATFORM_GHASH
++        DEFINES += -DNSS_X86_OR_X64
++        ifeq ($(LITTLE_ENDIAN),1)
++            DEFINES += -DHAVE_PLATFORM_GHASH
++        endif
+         EXTRA_SRCS += ghash-x86.c aes-x86.c
+ $(OBJDIR)/ghash-x86.o: CFLAGS += -mpclmul -maes
+ $(OBJDIR)/aes-x86.o: CFLAGS += -mpclmul -maes
+@@ -138,7 +141,10 @@ endif
+ endif
+ ifeq ($(CPU_ARCH),aarch64)
+     ifdef CC_IS_CLANG
+-        DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2 -DHAVE_PLATFORM_GHASH
++        DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
++        ifeq ($(LITTLE_ENDIAN),1)
++            DEFINES += -DHAVE_PLATFORM_GHASH
++        endif
+         EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
+     else ifeq (1,$(CC_IS_GCC))
+         # GCC versions older than 4.9 don't support ARM AES. The check
+@@ -146,18 +152,26 @@ ifeq ($(CPU_ARCH),aarch64)
+         # and then rejects any major versions prior to 5. Note that
+         # there has been no GCC 4.10, as it was renamed to GCC 5.
+         ifneq (,$(filter 4.9,$(word 1,$(GCC_VERSION)).$(word 2,$(GCC_VERSION))))
+-            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2 -DHAVE_PLATFORM_GHASH
++            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
++            ifeq ($(LITTLE_ENDIAN),1)
++                DEFINES += -DHAVE_PLATFORM_GHASH
++            endif
+             EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
+         endif
+         ifeq (,$(filter 0 1 2 3 4,$(word 1,$(GCC_VERSION))))
+-            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2 -DHAVE_PLATFORM_GHASH
++            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
++            ifeq ($(LITTLE_ENDIAN),1)
++                DEFINES += -DHAVE_PLATFORM_GHASH
++            endif
+             EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
+         endif
+     endif
+ endif
+ ifeq ($(CPU_ARCH),arm)
+ ifndef NSS_DISABLE_ARM32_NEON
+-    DEFINES += -DHAVE_PLATFORM_GHASH
++    ifeq ($(LITTLE_ENDIAN),1)
++        DEFINES += -DHAVE_PLATFORM_GHASH
++    endif
+     EXTRA_SRCS += ghash-arm32-neon.c
+ endif
+     ifdef CC_IS_CLANG
+@@ -290,7 +304,9 @@ ifeq ($(CPU_ARCH),arm)
+     MPI_SRCS += mpi_arm.c
+ endif
+ ifeq ($(CPU_ARCH),ppc)
+-    DEFINES += -DHAVE_PLATFORM_GHASH
++    ifeq ($(LITTLE_ENDIAN),1)
++        DEFINES += -DHAVE_PLATFORM_GHASH
++    endif
+     EXTRA_SRCS += ghash-ppc.c
+ ifdef USE_64
+     DEFINES += -DNSS_NO_INIT_SUPPORT
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
