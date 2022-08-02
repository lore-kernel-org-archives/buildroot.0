Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F684C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 13:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C145760D69;
	Tue,  2 Aug 2022 13:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C145760D69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-eLIXIVnDu5; Tue,  2 Aug 2022 13:30:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9825160C22;
	Tue,  2 Aug 2022 13:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9825160C22
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 757121BF329
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 13:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59E65408EB
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 13:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59E65408EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sighf4TUbWte for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 13:30:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3381D408A6
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3381D408A6
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 13:30:22 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id i4so10666651qvv.7
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 06:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DnGNNYFKcQpvxLOCnSnFbFkILFZZ1RRYkZJKhr/qbs0=;
 b=Zwazc1zdvlkVE6wsC8GfdvP9ZiZk5vAM3sEI0kRGZvey9TWR2y4Vaqciz0KwZuiuq7
 KRnURzNXN6dFbvLnK2Tza0etXexdi58X5EdnRS3aea6jDv2Glm0q7LzA1KSsBpHhHIgv
 dMqr3gh2FD36lez7BD3guQrxViPNozkL8hUW4i8sR7AENRcwHN7vdi9KMQKWrQZMcAmX
 bvfUa/J/EMybTakG6o7Es4iT9Ub1zgE1l36cJofNya/CsVknD2fY0BKAku9rUlEr+9xe
 FA8/w4TX2n3HjE07ZV4pE6DXNnXFrP5PD/aJDgk0zkModHynD3JyBCapg0LmYsJDv7j9
 7JQQ==
X-Gm-Message-State: ACgBeo3QidaDOUEPKDNlvn3yaD+kCun5iVF1Z2HYGKkVSmKzqfPAtJYu
 B5FwyLA3KAWog7ACRbKvCfMnKDByW6QvdQ==
X-Google-Smtp-Source: AA6agR7GjcnQ1dfqvON1IEbNFPI7tIeGDEW6fZ7pHTg9jr5N3FvDmbGZBlRoJxdYtMkAGdnfbExzzQ==
X-Received: by 2002:a0c:ab17:0:b0:474:8a27:ed53 with SMTP id
 h23-20020a0cab17000000b004748a27ed53mr17799972qvb.56.1659447020843; 
 Tue, 02 Aug 2022 06:30:20 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 t17-20020ac87611000000b003051f450049sm8894638qtq.8.2022.08.02.06.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 06:30:20 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Tue,  2 Aug 2022 09:30:08 -0400
Message-Id: <20220802133009.1282520-3-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220802133009.1282520-1-Ben.Wolsieffer@hefring.com>
References: <20220802133009.1282520-1-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DnGNNYFKcQpvxLOCnSnFbFkILFZZ1RRYkZJKhr/qbs0=;
 b=x4C/no6+1mpBLIcZU3Is4oJPa3l924xPiaBo+lY+MQeGUyjqlG5AuhZXTqPWPMrpc2
 FBzge9GdN0oIExEaivEDVX8VGKjlZ0Ar6xDUD5aBrEAriI+ASeMFtUUVIpciTzgKUswq
 sEMxoPG9WgIRq62FbzuVpqMsr76fE5g1mu94BRVN0ir509aM1RFhkc4DNS2iJ+xUdIDM
 O1Cpog6q1PUB6Z990n2Wbghb/8A/PZUJw3WfYk4230FBRfanfVy+QG0pl9S+rw18mHsd
 lYowATEg5PrAGEyPJJCAd6eWeW73a+4v7lgdfN6gM+mncnXt36ZauTjdNxYfmYwh/I7Q
 FzEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=x4C/no6+
Subject: [Buildroot] [PATCH 2/2] arch/arm: add support for FDPIC
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linux on ARM supports FDPIC binaries intended for use on no-MMU systems.
This patch enables support for building a toolchain that produces FDPIC
binaries.

Unfortunately, the target name for an FDPIC toolchain is a bit
idiosyncratic and must be arm-<vendor>-uclinuxfdpiceabi. This requires a
few special cases in the target construction code, since there is no
separate TARGET_OS field.

According to the kernel help for CONFIG_BINFMT_ELF_FDPIC, "It is also
possible to run FDPIC ELF binaries on MMU linux," so FDPIC support is
available on all ARM platforms, not just no-MMU.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
---
 arch/Config.in      |  1 +
 package/Makefile.in | 30 +++++++++++++++++++++---------
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index c5d481b9e5..8dab58cf04 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -39,6 +39,7 @@ config BR2_arceb
 
 config BR2_arm
 	bool "ARM (little endian)"
+	select BR2_ARCH_HAS_FDPIC_SUPPORT
 	# MMU support is set by the subarchitecture file, arch/Config.in.arm
 	help
 	  ARM is a 32-bit reduced instruction set computer (RISC)
diff --git a/package/Makefile.in b/package/Makefile.in
index ff60f85092..d75f620d82 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -36,18 +36,21 @@ $(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
 	It might be confused with the native toolchain)
 endif
 
-# Compute GNU_TARGET_NAME
-GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
-
 # FLAT binary format needs uclinux, except RISC-V 64-bits which needs
 # the regular linux name.
 ifeq ($(BR2_BINFMT_FLAT):$(BR2_RISCV_64),y:)
 TARGET_OS = uclinux
+# FDPIC binary format requires no OS field in target
+else ifeq ($(BR2_BINFMT_FDPIC),y)
+TARGET_OS =
 else
 TARGET_OS = linux
 endif
 
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+# FDPIC suffix must be -uclinuxfdpiceabi
+ifeq ($(BR2_BINFMT_FDPIC),y)
+LIBC = uclinux
+else ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 LIBC = uclibc
 else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 LIBC = musl
@@ -59,12 +62,14 @@ else
 $(error No C library enabled, this is not possible.)
 endif
 
-# The ABI suffix is a bit special on ARM, as it needs to be
-# -uclibcgnueabi for uClibc EABI, and -gnueabi for glibc EABI.
-# This means that the LIBC and ABI aren't strictly orthogonal,
-# which explains why we need the test on LIBC below.
+# The ABI suffix is a bit special on ARM, as it needs to be -uclibcgnueabi
+# for uClibc EABI, -gnueabi for glibc EABI and -uclinuxfdpiceabi if FDPIC is
+# used. This means that the LIBC and ABI aren't strictly orthogonal, which
+# explains why we need the test on LIBC below.
 ifeq ($(BR2_arm)$(BR2_armeb),y)
-ifeq ($(LIBC),uclibc)
+ifeq ($(BR2_BINFMT_FDPIC),y)
+ABI = fdpiceabi
+else ifeq ($(LIBC),uclibc)
 ABI = gnueabi
 else
 ABI = eabi
@@ -90,6 +95,13 @@ TARGET_ABI += -mabi=spe -mfloat-gprs=double -Wa,-me500mc
 endif
 endif
 
+# Compute GNU_TARGET_NAME
+ifeq ($(TARGET_OS),)
+GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(LIBC)$(ABI)
+else
+GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
+endif
+
 # Use longcalls option for Xtensa globally.
 # The 'longcalls' option allows calls across a greater range of addresses,
 # and is required for some packages. While this option can degrade both
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
