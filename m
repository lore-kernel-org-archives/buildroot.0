Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC77FF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 15:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C86B5429D3;
	Sun, 26 Apr 2026 15:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dAFS9tpputn; Sun, 26 Apr 2026 15:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7D1442957
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777217639;
	bh=+urRwZ6BeIXJE63fRjYccyX02YOA+Qw669cYAW5MzA8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Cmt0P/V23+81qEUKsGf9rskEySnV2gsdYtXOodkFgMLM4YspsXd4KiH4ya0OUYN6g
	 bckSDKLF7iiRXbrw+pXl1nEf1Z8jRoBgluc5vKeXtgTu9oewhzH2Hd+vA4549xvK+c
	 bPvq8387+pGMn6qsDw0MqXZ2s03m7tDbVfw7OlOgmbyMKYP49GxshvhVCR8m+KuMCZ
	 9N4nLXY97k4hVT933cC/8LIzDNzys6DHsbVYQdZLogw9VAqaRS5VCUYYZnvnAC5J/Z
	 AjEI2LM5OyBdX/BNB7pLZ4JWRZn2702NFMd/RS99YQ4yRl2QAMbRqXljaR996T/c+s
	 7xkce2s7AKnrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7D1442957;
	Sun, 26 Apr 2026 15:33:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB006363
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF25F84CA0
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DAcQettf9hHg for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 15:33:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6991184C9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6991184C9F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6991184C9F
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:33:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4b1y-1wFNb10p9C-00GzQe; Sun, 26
 Apr 2026 17:33:49 +0200
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 26 Apr 2026 17:33:31 +0200
Message-ID: <20260426153334.1026982-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426153334.1026982-1-fiona.klute@gmx.de>
References: <20260426153334.1026982-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:E7EoryoHnLMBzy+Yt3jE+/hgyK3QT/78Vr4lHQMvF5Mfq5PAnly
 1cGxwK8V/JmTjLY9YkXKOEHYwNX7xxbnAshzi19FGIgfZ7IK/e9ylKyi482nwJ2YV6gCCqT
 5ZtZIK+OWhVw8t+sJagXuCP9AgH4a7N/EbU/1u+nl57ZIxTULQEe4lkp5/fosaa5OIsUK72
 gmjPV/zFZpNKB7Nkl49cQ==
UI-OutboundReport: notjunk:1;M01:P0:zb0qy4C04bA=;XY60+lcDBVV/Haof5ERbDXptEta
 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
 kMQigKG9O1yNn0jid4hdeQiBFQKMnF4noYAU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777217629; x=1777822429; i=fiona.klute@gmx.de;
 bh=FyIqnjU2bjQ1oCaFhy3DRhc42OxABrdfN+JTC7j4j3M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=h6f2CTDE/uUg28TFtloUl6cD/AfLJEsW9SqnjAqYay/zUjKSGbJOeIdSMOWw8BUN
 nWuJTHDSfNyFs5Rw+Mw2r5RmN/8yPxWnCAFpqgBI0gegBgwqFM+UNaRcKdN7d0GmK
 fGWw8mX5DOX5f0dk/gu2JZbfjd7CgzTBuF2LWyBzhHhHAlq1QG1kk1yP46gLIQgx9
 lHqX19BpxK26Iq5yvJ9adC7SVfkwVVm7tf8PET3k54xDYlIsccRrfZU3ZxLB2PjQY
 lU0OW5oPKfMHLHgbPkNsI1G5ACcfKhWX+rYc/x0NgPYvNJnMiCrR/bu3ujTnXeRUe
 rgWN5Fu7h398gLnYRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=h6f2CTDE
Subject: [Buildroot] [PATCH v2 3/6] linux/Config.in: add kernel.org URL as
 BR2_LINUX_KERNEL_LATEST_VERSION help
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This makes it the first URL in the file, so it shows up correctly in
pkg-stats output.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 linux/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 8633ddbc82..1104902b4b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -33,6 +33,8 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	help
+	  https://www.kernel.org/
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.246-cip66)"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
