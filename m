Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FC6E7E0CD
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 17:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74AD9406F6;
	Mon,  9 Feb 2026 17:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhWYuXddvf_j; Mon,  9 Feb 2026 17:46:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEBC140675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770659215;
	bh=PFzH19/OELyzXkh142c/e9v75qbNYWPYATF5a09ngZA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U6MHyjmWfEGsWGSzhUFVyJhuR5A2af9bUoSm6kdt7JEzxy8yc11y7YhhDPzvtX53d
	 ymQ8fVP6Drz0w7MPSSHio1lVF9YnKvIWXdzAWctSpj4+A9ySyIv2KbusUwdbYVFCyn
	 C/+49KPFY95MS90t0XBVNfNz2fE4LNJRsyl2WfWADx/Cu61SzaIuWazpnzx8dpODHh
	 qxsgYXZ52/nd1orPW19+y4FPYygUJC11kxSq/zWCxvmWkNSCOpD9j4PCCY8+YKVX5d
	 qR6hPfok96+35vXbiSPF8VQFkop3JkWqhRPQMKmiXdTXaUsWI7v/0RPALTS+7DzmcT
	 npE2lLEpDhQJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEBC140675;
	Mon,  9 Feb 2026 17:46:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA95E219
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 17:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBCD0605E8
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 17:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1HkrqEb0L33 for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 17:46:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A8578605D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8578605D1
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8578605D1
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 17:46:52 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4806dffc64cso41015935e9.1
 for <buildroot@buildroot.org>; Mon, 09 Feb 2026 09:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770659210; x=1771264010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+VT+ck6FEYvVUCijMRPowVKBrQ4jurq8RQeFIne/WYM=;
 b=h5G6XbGE/Q2G4hblLpI2cagXyi+TsLt1ZumjbmHnx2TRnpLY5QieH/4GzqPV2Ht73Y
 zHMI+ilshG5aw7RTQTD46zENAapzN1rPv8FxmW9Io/S9DeiiWGgiCMVD6jM3LGJ3htwt
 OabSE1g40FQ8p5nU9wbgT1tKRI1o64udko6w4yP9vN6lqLzyXSEWIaig07ND6wnvrs3R
 fT8cbhsBBt5QOATBolUCdzURRy9YYFZeTOjlTGCUkc/2EmlEEK3Lqaz1U50b1o/PVSBO
 XgQZSuldAkiXpskONnnheKvNZzKhtSdY6XmyoTI8VVz0o/ibMACfw6vh2u4Kx3fEerBV
 MymQ==
X-Gm-Message-State: AOJu0YxOQiRUl5XXVQWiGPPgeHl6D7fOwwG3T/uwq3IUooX6wUKdAdlz
 6/Adziej0lqa1Kmqx+uboYt76uE8E69aL+VXIfJNaxnSTbAM/TUhIYEPY37eCciCnFt0SvhtUXY
 GMmpL
X-Gm-Gg: AZuq6aKFP01N6l2VlibXoVZLiDrPfFWUNNDZxa2qE7oaH4kmEVhuwxB3ER/sUnKSQud
 ePhOYQxC2YNZZg9US8uIANh4JGAdRpYu9a4k0foo20Q7on+Ib2luwKkTP0L69fzFQEP2wROyWHn
 3ssaPifXkpbKlw19v1CghGdCB5gRIFlAKtpB28vkJW/3cNHGo8lgnxqhsGoTSp56GmpuYxDzllf
 FAcdgbyJ8+3152Z9FjXeHVyqCiAF1zdYeVbkLJOzWY5ffDDQO+3fqHB4GHPeb6liox3keuHqyXt
 f5n5Ti6dp3VwZ9gZjlHFTK29p4V0LW4PiiMgaU0DX/scIvdnEUkgCGFwmkGhNzTYR6HJpyGNf58
 2HgXboVlyjIUkchDaianbqRHsPDU//YODU2OOhTS6pT7q4Dnf1O6h1zebTHoHV9UUiqCTbLNVx2
 MY8DBxer3i5mR7ofPOOmv19W93Yh5vfrpcpv12DEAS62jIyqg/9srZnRlV7PbOO8yN51fl7s/no
 Tdd1vNW6c6BKXxlcc9okWDu8C0LPug9+yc=
X-Received: by 2002:a05:600c:3e0b:b0:47a:810f:1d06 with SMTP id
 5b1f17b1804b1-483209291eamr172506095e9.4.1770659210093; 
 Mon, 09 Feb 2026 09:46:50 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.37])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483203e126dsm187724035e9.2.2026.02.09.09.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 09:46:49 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon,  9 Feb 2026 18:46:46 +0100
Message-ID: <20260209174646.2034961-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1770659210; x=1771264010;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+VT+ck6FEYvVUCijMRPowVKBrQ4jurq8RQeFIne/WYM=;
 b=X1RmoMvKUVy7bDY+oFB+yyyzWgEXmpW83IcJPImE5cXuINTvsdB/p5DxPsyqEXYFB8
 qcyoWGKPZj+uIJur9vZ5l9F+Ko2B+85zzJK48vZdMN/YG+4l0Sd6Kl/N92f9Jxhyl+7L
 mlJeTzp2FXzdemsnH+xeByxP2s79XwRHw5ER8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=X1RmoMvK
Subject: [Buildroot] [PATCH 1/1] package/less: bump to version 692
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://www.greenwoodsoftware.com/less/news.692.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/less/less.hash | 4 ++--
 package/less/less.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index 49dcaf28efe4..5f0b0f3846fc 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key F153A7C833235259
-# https://www.greenwoodsoftware.com/less/less-691.sig
-sha256  88b480eda1bb4f92009f7968b23189eaf1329211f5a3515869e133d286154d25  less-691.tar.gz
+# https://www.greenwoodsoftware.com/less/less-692.sig
+sha256  61300f603798ecf1d7786570789f0ff3f5a1acf075a6fb9f756837d166e37d14  less-692.tar.gz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index 6f78fb67c76e..49156a805bdc 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 691
+LESS_VERSION = 692
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
