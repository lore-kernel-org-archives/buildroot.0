Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96D5C3064D
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 10:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F200415D1;
	Thu, 27 Jun 2024 10:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gt1Fievo0LlV; Thu, 27 Jun 2024 10:35:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00E54415AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00E54415AB;
	Thu, 27 Jun 2024 10:35:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79CAB1BF977
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 10:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64E9F81467
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 10:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMpeagZFvbaG for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 10:35:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=spersvold@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF596813CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF596813CB
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF596813CB
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 10:35:10 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52cdd03d6aaso5745879e87.0
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 03:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719484508; x=1720089308;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=exIQB9EbjLzIAhX2fQmVPvI25dzB1dCOSBWkoAAa8Vw=;
 b=Pv34SlMMPb+Zsu93u4XWt/cHLGkqwNMj7myUvpk1Se2vCWV5wGCGC/ffOBSHcr1Nn9
 Jp+dc7PvIg3P60dQx7+Fk7fkqqLiDm0xRNG96TJhVpRv1ciCa8gPfpI+Kp5S6Wxyn0x8
 JSdHMlhac/NTmwbQQmYizVdc5526Y+MkqSDPBadX7Rc84LBxagciPzsPQBnmyHEpvNNP
 6mJp9MglaxnG3ZCVrrJFLwltWJIl+mT6T6haMFwxvlb7KFGfmDzgowZMjctd7vYqtghk
 lqu+pxguLZtt/YJx7uPoLdEt2713zUibZIY5UKsr+YYQM15tnx5PwUKdagNk9Unm8eCy
 goJA==
X-Gm-Message-State: AOJu0YzPIX4/tthxGUhkPHs9cZNHlMeK5C5x+p7yMlcIeAbzZ7h5J0Nh
 22YxTbLkuhBJ8S9HFFUEl7fGHS2GwgrZQYgND4Jw3uLRwrg1SlVZlaIWjQ==
X-Google-Smtp-Source: AGHT+IEFJsVWWndxBiw+pUFmQ/YEcZ9l6w6w7WV3Vo8TcG3ZHBxUvTJ2ZhT0cq/IaGuvoRApkw4j6Q==
X-Received: by 2002:a05:6512:118e:b0:52c:ab83:d783 with SMTP id
 2adb3069b0e04-52ce063d63emr10965097e87.6.1719484507315; 
 Thu, 27 Jun 2024 03:35:07 -0700 (PDT)
Received: from SP-RaptorLake.dyn.int.numascale.com (fwa5c4a-112.bb.online.no.
 [88.92.74.112]) by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-52e71327ef7sm153487e87.278.2024.06.27.03.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 03:35:07 -0700 (PDT)
From: Steffen Persvold <spersvold@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 12:34:57 +0200
Message-Id: <20240627103457.28001-1-spersvold@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719484508; x=1720089308; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=exIQB9EbjLzIAhX2fQmVPvI25dzB1dCOSBWkoAAa8Vw=;
 b=RvO4KbGL98zjOnFd8LQxLFonCLLvxNJhx5BFjiGafDjR5lQU/xDbEIrtES/lpNRPFr
 JKbgWmolBAaSdVJYxeOKdUHq29Ka7mcTgFM0RDDy8u73Y6gR7vDh1/CdYCz6GKsCA0LI
 br/GCfrOJ766KtEHTwmsuQ+HAXZB88JADMqe04Z2u2fTVMeqTU7exdo6KTXqb1lVvUtn
 RLAJDxEbljG4q6GrwxKfl7mThfLYqd5UzDxDOYiNDcS/Zbaj4gC211l3qZSypHFocsrh
 6FKITaodmdr2S4vaHpe2UK5DWwlfDKWGhpeNG0PvuRZ6XF/jON5e6MN4LFVdgh91y6pk
 g4aQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RvO4KbGL
Subject: [Buildroot] [PATCH] package/directfb: enable on riscv32 again
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
Cc: Steffen Persvold <spersvold@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Newer 32bit architectures like RISCV32 and ARC are using 64bit time_t
from the get go unlike other 32bit architectures, therefore aliasing
__NR_futex to __NR_futex_time64 avoids the build error mentioned
in cb6fd050.

Fixes:
 - http://autobuild.buildroot.org/results/c0f4168575fa85af933539441eea95a3b10dac91

Signed-off-by: Steffen Persvold <spersvold@gmail.com>
---
 ...-__NR_futex-on-32bit-architectures-u.patch | 40 +++++++++++++++++++
 package/directfb/Config.in                    |  2 -
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 package/directfb/0007-libdirect-define-__NR_futex-on-32bit-architectures-u.patch

diff --git a/package/directfb/0007-libdirect-define-__NR_futex-on-32bit-architectures-u.patch b/package/directfb/0007-libdirect-define-__NR_futex-on-32bit-architectures-u.patch
new file mode 100644
index 00000000..0dea27b7
--- /dev/null
+++ b/package/directfb/0007-libdirect-define-__NR_futex-on-32bit-architectures-u.patch
@@ -0,0 +1,40 @@
+From 8ffd68a8dfa1e8671dd8c01b96faffd681deca4e Mon Sep 17 00:00:00 2001
+From: Steffen Persvold <spersvold@gmail.com>
+Date: Tue, 25 Jun 2024 14:14:49 +0200
+Subject: [PATCH] libdirect: define __NR_futex on 32bit architectures using
+ 64-bit time_t
+
+Newer 32bit architectures like RISCV32 and ARC are using 64bit time_t
+from the get go unlike other 32bit architectures, therefore aliasing
+__NR_futex to __NR_futex_time64 helps avoid the below errors :
+
+system.c:242:21: error: '__NR_futex' undeclared (first use in this function)
+  242 |      ret = syscall( __NR_futex, uaddr, op, val, timeout, uaddr2, val3 );
+      |                     ^~~~~~~~~~
+---
+ lib/direct/os/linux/glibc/system.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/direct/os/linux/glibc/system.c b/lib/direct/os/linux/glibc/system.c
+index 32086a25..7143442b 100644
+--- a/lib/direct/os/linux/glibc/system.c
++++ b/lib/direct/os/linux/glibc/system.c
+@@ -213,6 +213,10 @@ direct_getenv( const char *name )
+ 
+ /**********************************************************************************************************************/
+ 
++#if defined(__NR_futex_time64) && !defined(__NR_futex)
++#define __NR_futex __NR_futex_time64
++#endif
++
+ DirectResult
+ direct_futex( int *uaddr, int op, int val, const struct timespec *timeout, int *uaddr2, int val3 )
+ {
+@@ -245,4 +249,3 @@ direct_futex( int *uaddr, int op, int val, const struct timespec *timeout, int *
+ 
+      return DR_OK;
+ }
+-
+-- 
+2.40.1
+
diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index f4d6b8cb..20481f56 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_DIRECTFB
 	bool "directfb"
-	depends on !BR2_RISCV_32
 	depends on !BR2_STATIC_LIBS # static link issues
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -162,7 +161,6 @@ config BR2_PACKAGE_DIRECTFB_TESTS
 endif # BR2_PACKAGE_DIRECTFB
 
 comment "directfb needs a glibc or uClibc toolchain w/ C++, NPTL, gcc >= 4.5, dynamic library"
-	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || BR2_TOOLCHAIN_USES_MUSL || \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
