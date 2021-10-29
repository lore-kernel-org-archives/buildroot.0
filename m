Return-Path: <SRS0=WOAM=PR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAE1C433F5
	for <buildroot@archiver.kernel.org>; Fri, 29 Oct 2021 21:29:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3597060FF2
	for <buildroot@archiver.kernel.org>; Fri, 29 Oct 2021 21:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3597060FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D529F80DB4;
	Fri, 29 Oct 2021 21:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N5N2CLsLYjl7; Fri, 29 Oct 2021 21:29:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ECF580E7D;
	Fri, 29 Oct 2021 21:29:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B8B61BF41A
 for <buildroot@lists.busybox.net>; Fri, 29 Oct 2021 21:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5460C400CB
 for <buildroot@lists.busybox.net>; Fri, 29 Oct 2021 21:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xLcFdqM4NIGh for <buildroot@lists.busybox.net>;
 Fri, 29 Oct 2021 21:29:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46389400AF
 for <buildroot@buildroot.org>; Fri, 29 Oct 2021 21:29:46 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u18so18704399wrg.5
 for <buildroot@buildroot.org>; Fri, 29 Oct 2021 14:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5eGwcztoEt5W5e3zgDdqyH+mLsOrJjeNWO5OAlu0+Og=;
 b=MsqC+RWchQ8u/nMpTYVTismhz9KiJEneKQCxHfF+RNJJ38Ad3O9bFxMFA6iklHkTRh
 4C+Jrlp+K73Bbo8FXiDrSvrVMNAdSWfQ2aGQpWKdCQd6TZeZWGsjvUVuEGxVyJ3LnGWz
 fNvkMwhmy/koaF/DY4Clw5ieP12r0ltNCaSUMPrF9GrA8oPF2U8s9mubsJUUei1R/62F
 27mjognFkUMFXNVGmTi1Udv5hPIRTGlXfNyDeXFUsHkKkoZp9qVta8BbiXHfs0drw7fP
 m/8fCXUtZKxJtz9QY5EYEfV4WEiI/JtiOIB1iKGTr6ClGtBM2UEZrm4zpFDtG58qAMeM
 ZRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5eGwcztoEt5W5e3zgDdqyH+mLsOrJjeNWO5OAlu0+Og=;
 b=t5M1qAookuFioJ0HIv7mESh7GaefwuvPaR87hZIxhY8CX2xo2xPzAk/aJJc7Lg2LyX
 0SdwBTBsH81RG7JspHFO1qi/SPVMgw+hewQFYbvc83jLIEdTePCBWIXXX64TCFPRRQPC
 0KEoVW6EftFb++7veCEXIbXbJO3R5y6R9C02iixTsga23s4/rDw/N4j/RWdx/hEj13rK
 qFDIYnWCV1WDq7+Qe8Il2z+Arq0fpeaMUTNnCA4HloVDQn0PbXH9omZ4PNGBSfBQOwNp
 l5xoq5bDgHouJ+UIRK/bZtFI4kyf7c3ba8lsXA8Ay1deSMRERwfAOmJNq6a1sdoSskGL
 5lSg==
X-Gm-Message-State: AOAM531gJJw21DyiPBLjlM2DuXaH0rL/xMaSM8etqq6IAriujxN5pCmA
 bKu7kMIGuuPxzgJL0nsRDGBMjI8Ordw=
X-Google-Smtp-Source: ABdhPJxEE20BTBvE+Y4RDX/bm7r+x71g1XpaLP7J3af0N+ul0AwlSf9wx73sxo8TPpRDsl6lugSokQ==
X-Received: by 2002:a5d:400e:: with SMTP id n14mr4556870wrp.368.1635542984471; 
 Fri, 29 Oct 2021 14:29:44 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id o11sm10362015wry.0.2021.10.29.14.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 14:29:44 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 29 Oct 2021 23:29:41 +0200
Message-Id: <20211029212941.85822-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/testing: test_jffs2.py: update logical
 eraseblock size for qemu >= 2.9
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The test_jffs2 test fail for the same reason as test_ubi test with qemu >= 2.9
due to a qemu 2.8 bug. See commit d8447c38f53f98e1df4a209e9f70e54f8b60f36e.

Divide the erase block size by two.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590514

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/fs/test_jffs2.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_jffs2.py b/support/testing/tests/fs/test_jffs2.py
index f595e408d5..1806bd7e3c 100644
--- a/support/testing/tests/fs/test_jffs2.py
+++ b/support/testing/tests/fs/test_jffs2.py
@@ -16,7 +16,7 @@ class TestJffs2(infra.basetest.BRTest):
         """
         BR2_TARGET_ROOTFS_JFFS2=y
         BR2_TARGET_ROOTFS_JFFS2_CUSTOM=y
-        BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x80000
+        BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x40000
         BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
         BR2_TARGET_ROOTFS_JFFS2_PAD=y
         BR2_TARGET_ROOTFS_JFFS2_PADSIZE=0x4000000
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
