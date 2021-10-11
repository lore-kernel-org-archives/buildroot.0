Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44F6C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 22:01:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 839F060184
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 22:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 839F060184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 336FB60A36;
	Mon, 11 Oct 2021 22:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8XMvcwF9p8b6; Mon, 11 Oct 2021 22:01:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 833E0608EC;
	Mon, 11 Oct 2021 22:01:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 722561BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 22:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DC2240404
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 22:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJj3kSfHrGja for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 22:00:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC2ED403C8
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 22:00:39 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id y3so27407903wrl.1
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 15:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YvgJTxfEGfjVKOPZwiJYSt20UTkKMknhqfVqTfTCs/w=;
 b=kLWBPwW9lXYI0PPOZ5iSu8zqbxsgATHvt7AZ9BEkmKBlT+o7exbO/t6OMbRM77YbY2
 LGimbzW84ZUvTADetRgbs+VmmmRdc/fENiUBtNKZpuAyQfBeeAv2KZPI7wgBhGCFX5aw
 SduufUQeGyRCKJFed0agptgCk+LfFDzgqjfkcgkjAPEbzuGyP3BNKq8C9bs92sRx5w1Y
 D1C7kwuoEzGCGPm677R1+3h4tHdXyeck14RbMHYs7pCk9Y6Tyn5M4FinLNXo7biR+6dg
 g5IgHm0LTc55pDCWGrpio4sP3nA1ceCanAIbf1jEpa6aGwyo92CqjV2U/fXL1NYjMu+d
 0n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YvgJTxfEGfjVKOPZwiJYSt20UTkKMknhqfVqTfTCs/w=;
 b=5TdXrmzWvVuBNIMcNTAkBY6gllja21thVyDLMJwURtRI5rKSkiyMlgqEE3igXxm4mz
 YpaI+vGuG4eASuBem3+6A5+0MkJFMtDqAB0an3QdqjNM2eHm/Xb0gaqv8uLeeIRnObH3
 nz/u9yab8c6XtZxXu+8znko0Xe0JOfr+VWZeCf9HN3D0+w9twTnxVeXIgZR/KMOxF7SC
 9hcDRNBScQVfhxNakn7HVykBg+hgiS+CiKYA5+aLWUpAHk+4VYfAbb8lQoNBi9ifHMoj
 +QY46A9hmTJVBCH7oK2ilBx6MFIvRmqyyEJpaSM6tB4TUNK8EsvVTufImUVntzTILQgg
 zBaQ==
X-Gm-Message-State: AOAM533FUfuB5yAEPWTY8YNI2R0aHyWyS8flJIigpRlyoxscmZj4QEB9
 FQqdnYDme54OqoPOUguIEb1lIh92LG8=
X-Google-Smtp-Source: ABdhPJyYuB84axaP5GO8HoNgp3nPvm32ynhDauSnu0Xud9TfJHmkjke6NTsFLOdLxbZWWiruRkgVoA==
X-Received: by 2002:adf:8b1a:: with SMTP id n26mr27427683wra.182.1633989637880; 
 Mon, 11 Oct 2021 15:00:37 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id g25sm9214992wrc.88.2021.10.11.15.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 15:00:37 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 00:00:25 +0200
Message-Id: <20211011220025.7998-4-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211011220025.7998-1-petr.vorel@gmail.com>
References: <20211011220025.7998-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH 3/3] support/dependencies: don't check for
 `which'
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It's requirement has been removed in previous commit.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/dependencies/dependencies.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index e720e9372e..0502dcc9bb 100755
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
