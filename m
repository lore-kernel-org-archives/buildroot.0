Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE9DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:51:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06BF860F6E
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06BF860F6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3F9A83EA1;
	Tue, 21 Sep 2021 20:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jStLtfqxdbIN; Tue, 21 Sep 2021 20:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2961083E9F;
	Tue, 21 Sep 2021 20:51:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 115761BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00C6F60EAA
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r5k3K1u1ltmA for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:51:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 556C760ABF
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:51:21 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id r5so1215878edi.10
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iXsUzlXKffs7PVobq+fIxv8atnfiOKs4U/OA4baS64E=;
 b=XNy4UjuK8wOIGuX04B1IEf5la/SLcNRtuG8giz0iqxiXuGKkUP74m5WF/iDRBREgGt
 RrCea79Z81ajjCJsJ3+zf3OcD8AzsUJh8BUKH1LrOPqQsA1kZw9okx9Xty/b9KJ/kGtb
 1ZEaAxKvbrkadFgpJbdz2wPJWAwqebWJVVAzvIGCDOnPF0SE+JIDrqgP+ddnbMGVGD9t
 1d73XynjhtUJGBfLEldSrc7qdKARIz1rfDDgK7FRnYmU6UETBR2NKRvByTBfCtNt9Ooe
 VCzaUzMkCJcFgxHomY7hq1T7/m987aLDUOQSVjoeXxuck462oAwbLGot5ATGy/bWgPKz
 pDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iXsUzlXKffs7PVobq+fIxv8atnfiOKs4U/OA4baS64E=;
 b=g7j5DnHyBi2SittswUeUtug6HO1HIIm4wT/KA7N0hggPM1+uM+WOr0CbeAnLNQIN15
 96zEP7k3rFu+DAVup/DWhyzX1t4pMjVvABd+RLCK84agUyUQFxWWCJNKZmqfcKm7vDVs
 T5lvMW5sHeDq+mbhrfJ9VOTFULGSPiqAnTDI+FvPJIgokwxRNe+0znsBdWHvloCFQ4+E
 Rzx8UWAM52h/JaB9ANJlvSLdLfYmasMlu6Tt7pvChCapa7ZkvO04IUHplh1Mdyi34caC
 0SMaEzb0uKuNXqOApTxEIllLH2IriJDWfkx7Ll8zvooXcFmYhdS6DKrvdCdmdaeOgER7
 uAIg==
X-Gm-Message-State: AOAM532/XU55qZZa4nS8X4gnMoS22aklrzdCMdnxN5TRIP++wYvnWtvw
 YTYP3AYZHTIPARmFoX2CGnxir2y967M=
X-Google-Smtp-Source: ABdhPJyOOEQMXgNq8+htpiFvjR6yTmlvYQom69gR/oanc29wv8fdrksBG6gELBEZiUHem8bWY87dpQ==
X-Received: by 2002:a17:906:f15:: with SMTP id
 z21mr37096288eji.177.1632257479597; 
 Tue, 21 Sep 2021 13:51:19 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id f18sm15093edt.60.2021.09.21.13.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 13:51:19 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:51:12 +0200
Message-Id: <20210921205112.39176-3-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921205112.39176-1-petr.vorel@gmail.com>
References: <20210921205112.39176-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH 2/2] support/dependencies: don't check for
 `which'
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

It's requirement has been removed in previous commit.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 support/dependencies/dependencies.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index c5dcb86231..a3e0b3ecc4 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -65,8 +65,6 @@ check_prog_host()
 	fi
 }
 
-# Verify that which is installed
-check_prog_host "which"
 # Verify that sed is installed
 check_prog_host "sed"
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
