Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B00CD4F3C
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 21:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD59260B5F;
	Sun, 17 May 2026 21:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Az5_32Hx9ZAB; Sun, 17 May 2026 21:55:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD8786F864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779054952;
	bh=dTgKF22h23m5nUxN2u9jSxHoa5fAIGERbVFkWGi+pVA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sB2168rW0ewlW6CYSJ/3mUaf+lSzYbFyB225VMxEpPvFJy7q36PGbKq076T6OPaMc
	 s1uMXFxxwueIedvQ4ThiMaBoTZW8SiLJCBwY/wcDpvn3vL2Nh2ZZ6UfBHN+8tVSqdF
	 d4+51cC6qh63wKnWvavsRudp4s4nfDNBZc90Z5maJTkuxVa4XFNQrmt+d4vQSkvcgn
	 yUdSBR/Yk4S9tFdHlrzkP4aYBZTRcTO9Ncl6g4RVkkAq213cfS605hmNmbAL1pp9eY
	 JmQyXjcYBgKNE3wIT7FzImn7RhsdRx85euILX8j+/skEtCsyXQDge0d74/QnYX4KrD
	 dE5tIrOuMBpfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD8786F864;
	Sun, 17 May 2026 21:55:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 537C9282
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3834F4208A
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-GT9FFBBKGK for <buildroot@buildroot.org>;
 Sun, 17 May 2026 21:55:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58E9540629
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58E9540629
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:55:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 831FB8658B; Sun, 17 May 2026 21:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 May 2026 23:53:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec694f8f6d817033a096e1bd4d73e33b3b8ceaa2
X-Git-Newrev: d0f43c052ca0cbeaa3f68710dcd794c2e93bc5e6
X-Patchwork-Hint: ignore
Message-Id: <20260517215543.831FB8658B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: fix build failure on big
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d0f43c052ca0cbeaa3f68710dcd794c2e93bc5e6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add local patch pending upstream to fix build failure due to missing gcm
stubs.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...-Fix-build-failure-due-to-missing-gcm-stu.patch | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
