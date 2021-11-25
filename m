Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72240C433F5
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 12:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F9D4403E3;
	Thu, 25 Nov 2021 12:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7V8u2jmKXDIs; Thu, 25 Nov 2021 12:57:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B8524027D;
	Thu, 25 Nov 2021 12:57:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDF421BF30B
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBAB1827A5
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uWttUk7JrlTo for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 12:56:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36887827AF
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 12:56:37 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id s13so11487996wrb.3
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 04:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SSl0CDTg9BUCwtWp0aR0L+3h5ud92CqBD396geNn3Yc=;
 b=KLSCMEjoKWOc49Vb3bYzW6rdRJtcSPla4qxYXfRLweeelPX2DxAWH/mRv9tfGAHbi8
 FIrGjRkEWbg7c+iRFG3Hk0BAwbHb9Kh+aE1FAHa+BTidoBu34VBLU3Txmmc8Mzprt2z4
 Sb/q6xFw/dgY5Lz/1omOUtYQ6O9IqyuEYNbBeMm+9UENEbAJTFslsaJb5J6oSeWdSVoW
 Rz3vSxXlYj66NbVgLSJTkA5w/IumBJd2AefxXWoNNVR7QqchCB47LsrCum5mcbUMQEvu
 mCl14Anz+38r0GnIQWL2H+qyQUe1yHTsx+nrCQ0TTzgx9PBT/bTOxIoHclYmsnVI2brR
 oUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SSl0CDTg9BUCwtWp0aR0L+3h5ud92CqBD396geNn3Yc=;
 b=bJQvrJbfPEXY+eQU5y24f3PHgcC1vqZOyNLkEK4VB83gmsdGxK0dIPP/3oSJRinRLE
 Oqlk9rd0F6K0PPrLALNSqzv1o7qQnOR/XeNyIFzunOZRDXQNCr2KyNxFBij2DHLdVoE+
 ix1hev/JodfDwgYuDibrSyvryYHNigEvoZFPkAv9WmdHgvU2LEClaFNRod/JYGgVWkhj
 92ZfsNbZ0fOz5ig07PilJRIj2nFBvspoMveDwD213LxzNHgCtc4h3ZSZA+mo+QnZli77
 bqMj5x6soufR0C/4hJjjf1y3/5Hvh+WqC505GGZE01GpIghcP6p5iPFpOFm89g3usaUJ
 llvQ==
X-Gm-Message-State: AOAM533vYxVn3czDQASfSF7cpzuS5tti5Bgx4mmvk3Gv2PFWepj9w2WL
 Hk6dYTKGIUh6qFF1a2C199+G46BNBMg=
X-Google-Smtp-Source: ABdhPJzu1hv/XCgqqEnuWs9nAY2+iYEeDQdI7tPJIDO4MSuZ2nUOpx4VYuIk1UfTb5hFBMRK161iXw==
X-Received: by 2002:adf:f708:: with SMTP id r8mr6294820wrp.198.1637844995261; 
 Thu, 25 Nov 2021 04:56:35 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810c:8d40:ec0:e54:15ff:fe38:2651])
 by smtp.gmail.com with ESMTPSA id r62sm2909178wmr.35.2021.11.25.04.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:56:35 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 13:56:03 +0100
Message-Id: <20211125125558.1087094-5-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211125125558.1087094-1-heiko.thiery@gmail.com>
References: <20211125125558.1087094-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] package/netopeer2: bump version to 2.0.35
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Vadim Kochan <vadim4j@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/netopeer2/netopeer2.hash | 2 +-
 package/netopeer2/netopeer2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2.hash
index 4386e5661c..2895bc51d0 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7fc1a3520ee4bb488112f502e34cea465464dc933d2a5742a72eb32a6dfe3b3f  netopeer2-1.1.70.tar.gz
+sha256  dedae40419cfddd09c1be7bb536b3a762ec8dcd568c2bfe803c0f6789a5ca834  netopeer2-2.0.35.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index c9fa097606..c8b6763313 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETOPEER2_VERSION = 1.1.70
+NETOPEER2_VERSION = 2.0.35
 NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
