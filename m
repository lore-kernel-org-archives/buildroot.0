Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D9F6C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:11:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA4A46058D
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA4A46058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50DA5826AA;
	Sun, 12 Sep 2021 14:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QnPkCZBeTjeW; Sun, 12 Sep 2021 14:11:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B370A825BF;
	Sun, 12 Sep 2021 14:11:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6948C1BF471
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 654A64014E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqtgawIt3ohR for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 14:11:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F1D64013A
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 14:11:47 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q11so10381199wrr.9
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jDFq4uW8y84lqXQbG1jqB+UMTaZHZlInySTN82ZiOY=;
 b=q5hcWVqoWgPhiuFuTWYerKjAEBXvvHfN/pqrk2Rtn5+TjmsoMqOLD35WrnKwXdSJAP
 oOdhoS8oTEuBtwTB4vJbDMD/vu50yfsj6nXRmgiUpxnqArr1MLh8K3c1ITYS5w4vraf1
 YFfpbyE8HWqTP7eGob65i3mpw1Q9kSilsPOZho4cg8OxZIyJ9JAn9lZSVvSTc7k8hNgJ
 xEwc/oTnrwPHV3LYfymo9RZUCAR8dhzWOairUTVHdtDeHIIhv4m8pbxlkh961tBXU2Gb
 HCVat9wlbWHK0k1jUdIXSchhaabtu1ohSxhm0AokKZhoWP2fcJw+bzsT3RbI9eO5pOWa
 91IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jDFq4uW8y84lqXQbG1jqB+UMTaZHZlInySTN82ZiOY=;
 b=dZw51txM2hAQnezaEkOCkTJLlAXeWxppIOFJCg8zNW8nDXVRVAAz6rwqhO6GpRhDDJ
 L4Qwv4jVyePLjFHFwE7b4ww5NrSIr8Y4ruRcuB3x0tjEa3Q7iC/2f5Hxx6n/iArMcrz4
 m39wH5Lx0td2+7kuPbfXnBBMokKnbS7pshyglcbw8syffCnql8MQ4EhKT4p+lbjUEodN
 MR9WtskqSN+DVoeudlxHcnpoAoZP5O7WLjEyM1Dkd9MLpXJ9BttDwdcd9dJ2/LpbYPdv
 AABbRTMglB5F2+OSXOvFU5qTKMDnIpu3U6yzmaEygK8y4UMrzjfhr2Mk2QTKgTLDb8UF
 MrWA==
X-Gm-Message-State: AOAM532CPC2PV4N1zdmQHc3Sgr/w2xWoB6BsiIF5hYlwbiwM2S6Nfhgw
 tjMczAZpBFbG+lC8nGeZwY9z62ejegs=
X-Google-Smtp-Source: ABdhPJy669AkcIIdZ63H/hprdzImiHfMxwgaUWEDb7ogFX+AUEOhs9KAhWmcISx2oWPNJ0Hpp8FHaw==
X-Received: by 2002:adf:dd01:: with SMTP id a1mr5759735wrm.132.1631455905596; 
 Sun, 12 Sep 2021 07:11:45 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id i5sm4570062wrc.86.2021.09.12.07.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 07:11:45 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 16:11:27 +0200
Message-Id: <20210912141140.253778-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 03/16] support/testing: test_f2fs: bump to
 kernel 4.19.204
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The kernel 4.16.7 curently used by the test doesn't build with host
gcc >= 10 due the gcc default -fno-common. See GCC 10 porting guide [1].

/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

Bump to the next LTS release.

[1] https://gcc.gnu.org/gcc-10/porting_to.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/fs/test_f2fs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_f2fs.py b/support/testing/tests/fs/test_f2fs.py
index e6872f39c1..2d05a86418 100644
--- a/support/testing/tests/fs/test_f2fs.py
+++ b/support/testing/tests/fs/test_f2fs.py
@@ -20,7 +20,7 @@ class TestF2FS(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
         BR2_LINUX_KERNEL_USE_DEFCONFIG=y
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
