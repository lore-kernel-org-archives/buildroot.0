Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AC4C433FE
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 09:02:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C233611CE
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 09:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C233611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32A5440224;
	Thu, 11 Nov 2021 09:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uo4rV9TISQiD; Thu, 11 Nov 2021 09:02:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CCBB40227;
	Thu, 11 Nov 2021 09:02:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E12821BF282
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 09:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D837480DB0
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 09:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KaZNChDdCwbx for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 09:02:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E59180DAB
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 09:02:30 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id z200so4431590wmc.1
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 01:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tgHuf/GkvlWSeWV7PAYojG/1eNRPw84bVEMvUGC58vc=;
 b=Ph/W8ZRoxC7a/SV5q4xsY5k5iTld+Iu/GbJL7Lurk9W9Le0srgFMDQ4Xx9M/+QKTkI
 9XRq+Hx/IxXdqNrVax1UPXEiG4ysQej6XInGKL1pPgb3Fr3SY+QoiJGvli/b7dmWQKXL
 eW66DV3jK10/dr+g78wyTeecMozHWvlzf8R0w0AyOYUMAOl8PzweHC0gEz+8bUOVAWGY
 YWM5mtXqcNeIlzbihYH8OXJrDh/04GQCJ35rban1BqRTxVujMskfcInqp7xVwG5eTQrd
 6UJ4AmH860nFanrAtMYHdJo/8uaCkmX4pp5pVpoFB94MSVw2+JxJxUzpP6fm76kwcaFf
 HviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tgHuf/GkvlWSeWV7PAYojG/1eNRPw84bVEMvUGC58vc=;
 b=bE75XrFXluSTkahn/v9UkE5iZl+Zp82btvg36swo7YEukppYDEpmGHgWDmwCLe855W
 Udk6fTZ8g2q9l48Pvjyt3xtxagqX6ol4V2uHKvEf6T264YErqkoNLShxgV/Vk6T6UPqA
 WOl5F8T1wRiWHmJTJBchLIcnw8qLjjtVx12srCEpk2nKMgPBL5S/AudQETqNAcSsSq+s
 poA/vT6Jl/zGgDqaNa03b7lJbR3oHyzTyHHo6lundlXb3Jop2ZTuamaiCU/6oen4Onpb
 qnAzK8Hp+/B78UryJ4FE+LwwNjURoO+bbFuZhDxv+/lBvt9q8rzdZcCuuyqe0cC7P1CO
 L14g==
X-Gm-Message-State: AOAM531GHi/TfFrFAQjcCYSFsRAfsROM+pmShuOuG/I1J10RtiYro5k1
 KEdRtmF7BPEvPFiExB0GoY128PcnzGU=
X-Google-Smtp-Source: ABdhPJwTdC7aHa0z3H3yzMHq/diHBORnpWzARMA1RbvRiecw6LR/sPq44BMicciYbN78+NC0ShDxCw==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr24859139wmr.48.1636621348405; 
 Thu, 11 Nov 2021 01:02:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id z6sm2793882wmp.1.2021.11.11.01.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 01:02:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Nov 2021 10:00:31 +0100
Message-Id: <20211111090031.2253692-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/diffutils: fix build on microblazeel
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 3.8 in
commit 1f89c80417ad03127650b22c41ec4e30d42c549f:

sigsegv.c: In function 'sigsegv_handler':
sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
  979 |                       : vma.is_near_this (addr, &vma))
      |                            ^

Fixes:
 - http://autobuild.buildroot.org/results/5ecd55b7c72f9630a7acc72341ccb60e94ddb574

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rection.m4-fix-build-on-microblazeel.patch | 39 +++++++++++++++++++
 package/diffutils/diffutils.mk                |  2 +
 2 files changed, 41 insertions(+)
 create mode 100644 package/diffutils/0001-m4-stack-direction.m4-fix-build-on-microblazeel.patch

diff --git a/package/diffutils/0001-m4-stack-direction.m4-fix-build-on-microblazeel.patch b/package/diffutils/0001-m4-stack-direction.m4-fix-build-on-microblazeel.patch
new file mode 100644
index 0000000000..6e60beecbd
--- /dev/null
+++ b/package/diffutils/0001-m4-stack-direction.m4-fix-build-on-microblazeel.patch
@@ -0,0 +1,39 @@
+From 7fd9de7f12718db0ace575c15c3a0e061ef6c542 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 11 Nov 2021 09:46:41 +0100
+Subject: [PATCH] m4/stack-direction.m4: fix build on microblazeel
+
+Fix the following build failure on microblazeel with diffutils raised
+since version 3.8 and
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=e54aa6196947ed22ff66bcd714e4fc7bd0c5c3b4
+
+sigsegv.c: In function 'sigsegv_handler':
+sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
+  979 |                       : vma.is_near_this (addr, &vma))
+      |                            ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5ecd55b7c72f9630a7acc72341ccb60e94ddb574
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to bug-gnulib@gnu.org]
+---
+ m4/stack-direction.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index c90d69733..70286c8f5 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -37,7 +37,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+       m68* | \
+       m88k | \
+       mcore | \
+-      microblaze | \
++      microblaze* | \
+       mips* | \
+       mmix | \
+       mn10200 | \
+-- 
+2.33.0
+
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index db8a5070a9..3d86541295 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -10,6 +10,8 @@ DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 DIFFUTILS_LICENSE = GPL-3.0+
 DIFFUTILS_LICENSE_FILES = COPYING
+# We're patching m4/stack-direction.m4
+DIFFUTILS_AUTORECONF = YES
 
 # Since glibc >= 2.26, don't try to use getopt_long replacement bundled
 # with diffutils. It will conflict with the one from glibc.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
