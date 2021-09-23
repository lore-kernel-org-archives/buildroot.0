Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC320C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 18:38:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61A8E61152
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 18:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61A8E61152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33E39840A4;
	Thu, 23 Sep 2021 18:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sj2TiN44m_-W; Thu, 23 Sep 2021 18:38:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89DD18408B;
	Thu, 23 Sep 2021 18:38:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF9C91BF389
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 18:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC7CD41596
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 18:38:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5zkOk2N0cpHx for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 18:38:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06D10406CC
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 18:37:59 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id g16so19926336wrb.3
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 11:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lfTb8L4zzmEqe5HAHLhIAkP6A3eDIsFCq8y8i9S0Wi4=;
 b=Zfww1C6Ig1EQtpvcYq1ZvmW1HABQEXBQSNtm2/tK9dEu/NYyaaJK0gvqC992tb3w6G
 j0ye/LrBSTCQO8n2U7GBCCzGkHr9djyKpk+gAKeS9wCNAVO6lnb5bTp5GeU2NXzh4mxO
 P3SU0HV0r0B6vvdEYrtUuOJ81iDe6B4mcJdOpzsG3HVQ9TVA+GEX9U70fXPwmaut2ULm
 qdhrjsksCVR19DbbVqxaGtqXzEGHPcC+3Y1O14ZCdPG5lWl40yCV34zQXfEXXPni59uJ
 U8Pn1a1lPVHr4ofbK5HY+G0r1FZClxoTBkLc9gSXTx5wjYpPlpj4thtEIO8RMQOUR02/
 acvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lfTb8L4zzmEqe5HAHLhIAkP6A3eDIsFCq8y8i9S0Wi4=;
 b=NnanqTbQ8/sshRWA+Zd3ZR77u2TAXJ5K2Tnoa33/24dc+o+WwX9Yai17ZpfQ2lx86G
 Zp1lPkXk1SYqT22+FWaZYq40YQ3LOC3GUfc98ijfAxkKbzJYxRWrkbn0JZZvmBwo5zOE
 mwvynNqY80UxPRRLqKf6safoXjNGIuo7ELOZlYMVzh3elBeKMxFoaix1pjzWsRYoy9mZ
 NPlVZAmvE4A5wAbq6R4R5hP54Hv/bUHB59nyjocuOET02Rve/fGKh2CFzYoalQFdSG9L
 jpNNI3jVncS17T4Doo05zRd+WmSbgLh7e+aRAgX5qrLhaBx+HC9D+NOwLR8T7d/ZTE3y
 7prw==
X-Gm-Message-State: AOAM530h+ARzMBLJQSNARxAtSpYZUNhD066SfdLDOpKZyWKfnaeCCq/S
 eNv9+bnYOsgqSNZC3bxzMHH3FWNLX7U=
X-Google-Smtp-Source: ABdhPJxZx2bacI78kgLQUrqQMnGn8n/FKkL4g98mjClOPyXPC5qIAWKgxp6D9t4udVjVhOQWsOTo+A==
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr6952983wrs.121.1632422278016; 
 Thu, 23 Sep 2021 11:37:58 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:f83a:8b82:715:ac42])
 by smtp.gmail.com with ESMTPSA id h18sm6469531wmq.23.2021.09.23.11.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 11:37:57 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 21:37:50 +0300
Message-Id: <20210923183751.361386-2-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210923183751.361386-1-asafka7@gmail.com>
References: <20210923183751.361386-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-packaging: depend on python3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The latest version of this package requires python 3.6+.

Fixes:
 - http://autobuild.buildroot.net/results/217157f4dd9fd56d0a13d47e6373f4c478f26757/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-packaging/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-packaging/Config.in b/package/python-packaging/Config.in
index 12170df84e..74d5205e8d 100644
--- a/package/python-packaging/Config.in
+++ b/package/python-packaging/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PACKAGING
 	bool "python-packaging"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	help
 	  Core utilities for Python packages.
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
