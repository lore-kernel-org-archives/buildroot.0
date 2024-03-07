Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAE3C5475B
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 01:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4DDC60661;
	Thu,  7 Mar 2024 01:51:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xeOKLmz4c6al; Thu,  7 Mar 2024 01:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88AC0606D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88AC0606D6;
	Thu,  7 Mar 2024 01:51:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 834FF1BF5B5
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 01:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DFBB82085
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 01:51:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o_aKqBVb8Yxo for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 01:51:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9AE8082084
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AE8082084
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AE8082084
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 01:51:11 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1dc49b00bdbso3259075ad.3
 for <buildroot@buildroot.org>; Wed, 06 Mar 2024 17:51:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709776270; x=1710381070;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/9Tr3m5x4YOa+yPSYT1BLpeMO26Q3/NpVed8qfxyP4M=;
 b=kW+eGDVK0mkodVxSnt78+O4CX0MUPGJLkbixUx92PKg4nwPt/PM9e76J9EZA80Dy+p
 Kexqwk25WrKGkeAJ1p9cuOZ8gmnI/PxJgn5WDOOJrkb2L3n6m1JRwEze6k38w2aIGLYs
 eHSvSctY2NqIKOQ+DCSR6TQP9M22pWHgTupfeT4LnsKxeOtCfSF6izYFDXxjvHnDd7Dz
 AcTOmFOllU0T9NhOPkG7J1SSgP+qeUFgmcB17VT5PUFm4sFiSXn12XYJpcsNyiI/p8ns
 YDF3CRyomCxoBH9J1GpadI0DDRhr5+psUpmKVGpP1mTN5fooHxWBMF1MFake12BBbx+9
 bCbw==
X-Gm-Message-State: AOJu0Yzdz+I0gHNqdSQAZ4OiHJyoY2WPRi6qvxivWcKVvoaNjqvkXZ0x
 TT843RXyt56gi5AhmLbCIM54Hao54JbTHzAqTCOiH06leWYy1KS+Ys802ykEZGcHBZyz+I0Ccdl
 4LOs=
X-Google-Smtp-Source: AGHT+IHYSqhopaosHc+sm7u0C+jRnSJYZj0b8z4+z3b5Bedfl6iR8dvP8r0UBj/ulbH3lxYWUwFIag==
X-Received: by 2002:a17:902:d58c:b0:1dc:d116:1a3a with SMTP id
 k12-20020a170902d58c00b001dcd1161a3amr7879631plh.62.1709776270625; 
 Wed, 06 Mar 2024 17:51:10 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d8-20020a170903230800b001db5bdd5e33sm13280662plh.48.2024.03.06.17.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 17:51:10 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 17:51:05 -0800
Message-ID: <20240307015107.2908128-1-christian@aperture.us>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1709776270; x=1710381070; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/9Tr3m5x4YOa+yPSYT1BLpeMO26Q3/NpVed8qfxyP4M=;
 b=FgXhE3IDs5hbL0I4/9GAx7wKoHLGUqD3XrzCp93lcM4HOkMezNoUBddAjHieI07ULD
 QpJ7/PpdZvbYtWC6fXQfx8hXEaLjvaC8xEbTLQMxOhNcvanENWBcMaC6IxgtySUPGuCn
 x8FcY2UjSGlDfLMEh2dr/6R3q7UDKI6ekvXZdEwYkSUhrPjEun+CyRu1sasALonurAMZ
 gQp/LkD2cmAiEj5qqcjPP0sXCDo5UpJjAupTA6p3O1ThdagLaQXgRFkA4eTnqLFFBLEm
 HP99bxUaB2BkIIQ1rMgBWGOPdMfjmnL9KnAZAPp+Ognc8zXWMVCevATktuuFri4wSyAc
 C/XQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=FgXhE3ID
Subject: [Buildroot] [PATCH v1 1/3] package/go-bootstrap-stage2: bump
 version to go1.19.13
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
Cc: Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to the latest 1.19.x version available.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go-bootstrap-stage2/go-bootstrap-stage2.hash | 2 +-
 package/go-bootstrap-stage2/go-bootstrap-stage2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.hash b/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
index 6d4c718a40..d61663cac9 100644
--- a/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
+++ b/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  e25c9ab72d811142b7f41ff6da5165fec2d1be5feec3ef2c66bc0bdecb431489  go1.19.11.src.tar.gz
+sha256  ccf36b53fb0024a017353c3ddb22c1f00bc7a8073c6aac79042da24ee34434d3  go1.19.13.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk b/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
index 72f3200a2e..98bf624b57 100644
--- a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
+++ b/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
@@ -6,7 +6,7 @@
 
 # Use last Go version that go-bootstrap-stage1 can build: v1.19.x
 # See https://golang.org/doc/install/source#bootstrapFromSource
-GO_BOOTSTRAP_STAGE2_VERSION = 1.19.11
+GO_BOOTSTRAP_STAGE2_VERSION = 1.19.13
 GO_BOOTSTRAP_STAGE2_SITE = https://storage.googleapis.com/golang
 GO_BOOTSTRAP_STAGE2_SOURCE = go$(GO_BOOTSTRAP_STAGE2_VERSION).src.tar.gz
 
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
