Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F74C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:21:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B00E60F12
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B00E60F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B7BA407FF;
	Fri,  3 Sep 2021 16:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uIYfvyxWkowa; Fri,  3 Sep 2021 16:21:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38C784073D;
	Fri,  3 Sep 2021 16:21:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BD681BF327
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96C1E4073D
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GJthfBdNyxk7 for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 16:20:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5684400C7
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 16:20:40 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id r2so5995246pgl.10
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 09:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DvuXWTm3SB6cQ4/PhpZjL1LA/FnhOYWY42zqGqqrs74=;
 b=LFKHEAhVFn6BN4zfGulSnXd/wyRVq1VwjyWNUrxNtQhW8Yyfjp9b1ppEAd4vzYivPJ
 QFUC1cFhSo4OQT1B0yZrttZkwNnWufHQviA5LGPrxVkRfiysLXaU6NUWfxJkTQCpgUmw
 jseIdbsNaODMzFB7v8aE3j7ogAiSVH0d0wDKW1fhQXurmBlza4oixtYf7uRix1n4DLPx
 XP7OK5gZXWiolT1/FM6TxuvRaTN6W3NhbEOskxkQeghvvncz4YH2hrkcM0mI6NybWkLc
 vRNxuJiCeFxO6n1e+1Sz0/UIWutH4C/5a5yFfOjQgR6l1iXY/9sJGfA4frGgyVESaMyc
 5d6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DvuXWTm3SB6cQ4/PhpZjL1LA/FnhOYWY42zqGqqrs74=;
 b=CSNsIoAMAgsVMqrZKHt7Hw67CAxCmOF5z/Agvqe1tqE69els8mvtRTJuqHxqiLRCTS
 uKFzSI+uUakBUPnxkrSaideizsiy+H8I/KyeO+NFDdsdSNJpmgP+w2OqcgJOZYxsbess
 xmZoo0YGAZNED8xjtpeWrnODK7tAaDb4ZBYBYrlct1qfNBmeEmVP80Xj3Ua5nqUuJ1KO
 ockIReaCKRspLZgvrtHlfy8Fmj2KSzu/YbnygodTCPruX9oFflmB+1V7zUEEo1y3F8Dd
 s4DTgRzc8oWU0GiV9RdWiUL1pGe1OzlHdDYmuHMOBf8Kavtlpb0vlrvdxG9BDbWyNyed
 ohhQ==
X-Gm-Message-State: AOAM531COQKwQ00YJPdxKqtDlWpwHNtZ90PFz9hfL4m+XGkIXbGoul34
 sMlSgvDKW/0rmtmDryXQ85syHKQyyb3xpA==
X-Google-Smtp-Source: ABdhPJxn/KRHD0KcFs+7iDET70ij8lStSly9xFDS4+6kMvnP8Kd6v9hMTWD9Qb31h1u903adKcwBTA==
X-Received: by 2002:a63:595f:: with SMTP id j31mr4259155pgm.109.1630686040176; 
 Fri, 03 Sep 2021 09:20:40 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id q7sm5586184pja.11.2021.09.03.09.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:20:39 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 09:20:26 -0700
Message-Id: <20210903162027.1935040-7-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903162027.1935040-1-aduskett@gmail.com>
References: <20210903162027.1935040-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/master 6/7] package/qemu: add
 BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS string
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
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

For specific architectures, running qemu in user mode without any additional
options may fail if the host processor does not have the necessary instructions
to properly run qemu in user mode, which results in the following error:
"qemu: uncaught target signal 4 (Illegal instruction) - core dumped"

CoreI7 is one such architecture that has had consistent auto-build failures.

Add a new string in qemu/Config.in.host: BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS.
The default for the Corei7 architecture is directly from the OpenEmbedded
project found in meta/conf/machine/include/x86/tune-corei7.inc:
"-cpu Nehalem,check=false." Other architectures may be added to this string at
a later date if other failures occure.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/qemu/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 2dcf5631e5..fedf90d8b7 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -73,6 +73,10 @@ config BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
 	  the running host kernel, you may run into invalid system
 	  calls, which may yield surprising effects.
 
+config BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS
+	string
+	default "-cpu Nehalem,check=false" if BR2_x86_corei7
+
 config BR2_PACKAGE_HOST_QEMU_VDE2
 	bool "VDE2 support"
 	help
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
