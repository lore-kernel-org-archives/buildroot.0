Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9F8C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 20:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEE9540466;
	Tue,  4 Jun 2024 20:17:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUiTEybXEbrs; Tue,  4 Jun 2024 20:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92CC54018A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92CC54018A;
	Tue,  4 Jun 2024 20:17:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B2331BF48D
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 20:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74FB840466
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 20:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNfbbflj7nze for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 20:17:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 21A384018A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21A384018A
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21A384018A
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 20:17:24 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1f4a52b9413so47344055ad.2
 for <buildroot@buildroot.org>; Tue, 04 Jun 2024 13:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717532244; x=1718137044;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HbtrjEeSEYfMk6y5AcOsAvTy0eMdWNF4/LuNSZEBooo=;
 b=n/F6XKzLOxKus5RFODomEj2eCLZvOrXebt68CcFeS/RA9KgNw1JSAgiz0C1cQb6DN7
 X6aZwHjoP6FlI2ik04+WfbBuYocu0AUL9VVRJV3oNa+Y+ZUPY/AjsRphagY5JNt8z6l6
 Fds0eC09y2Lwkq1PnG3x+lwmnW+CstsfyHPWSa7pwZk9di0pz1bdhEcc7FzwipuDVAJ3
 8gHSPG5KLebFBKd0oxaUwCW142tt8jfTySa6c1U1X5M/05cVgUPcie5gpj6MLg2akXFy
 7o5YEp86ofFbam+3tiTCVrgbefdwiSxinIwlJ0Y6GFqbsqJjxdFb27z211aUD1SzKYUs
 jRAQ==
X-Gm-Message-State: AOJu0YwMR/4P3he6c9yg09QPRAKjOt5pf4nbnWc8/fKk/h1xq3HgbiWi
 uGaJSvL7uzta9xYuYquZxGJvPgcAg4UmRNQ0zFi+VV6u6yNyD/QInzbtnMFLrg3cYpdH1M6DObR
 Jt5M=
X-Google-Smtp-Source: AGHT+IGjSI7IIws6kxgJYkvCbPlVQD3jq1rZcYnsaHxaEjDSHAO5fusV2UwE8FKKFMDcbIDiyD+71g==
X-Received: by 2002:a17:903:120d:b0:1f5:e635:21e8 with SMTP id
 d9443c01a7336-1f6a5901d28mr7134415ad.2.1717532243661; 
 Tue, 04 Jun 2024 13:17:23 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323feca1sm89897645ad.231.2024.06.04.13.17.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Jun 2024 13:17:23 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  4 Jun 2024 13:17:20 -0700
Message-ID: <20240604201720.64420-1-christian@aperture.us>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1717532244; x=1718137044; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HbtrjEeSEYfMk6y5AcOsAvTy0eMdWNF4/LuNSZEBooo=;
 b=U24IUU+Ir8dcJM8ixCkGItwoSsZO8BKnjdpbzYy1p78g+kRYQtPjMqFbuky2oakLAp
 PzIWtIWLXmp8qpy7dTmZT4ve+Qmq+nNYbGlYTCZ3iRlXkdxXyG2/0E7wALD/TohKqq3K
 Fi3VlMGjwkvlLmlOSiSASumGyQe4sRAwqsVpxx6EaIUlLby2DEzDv2+AUNtBHGQIR2w5
 uvZUeHGqbXeLckfTxXmFJnc509p0I7rF9t2pF2uI7xCBWG9iHTvg3QBP2Z2QY2ltqQie
 dGIUTq4cFZS0KfLJGuLUjOC2NnpJIKSMhjnaaUuIlsbNpodRlA59D/hFQGD7W6BTxYEH
 qu/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=U24IUU+I
Subject: [Buildroot] [PATCH v1 1/1] package/go: security bump to go1.22.4
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following CVEs:

CVE-2024-24789: archive/zip: mishandling of corrupt central directory record
CVE-2024-24790: net/netip: unexpected behavior from Is methods for IPv4-mapped IPv6 addresses

View the release notes for more information:
https://go.dev/doc/devel/release#go1.22.4

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 6bbde5b589..7952461f2d 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  80648ef34f903193d72a59c0dff019f5f98ae0c9aa13ade0b0ecbff991a76f68  go1.22.3.src.tar.gz
+sha256  fed720678e728a7ca30ba8d1ded1caafe27d16028fab0232b8ba8e22008fb784  go1.22.4.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 43dfe1eae5..461a472dd4 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.22.3
+GO_VERSION = 1.22.4
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
