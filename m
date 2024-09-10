Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45632EDE9BF
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 21:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04C7C606B1;
	Tue, 10 Sep 2024 21:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSX26PRbho84; Tue, 10 Sep 2024 21:06:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 027B5608D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 027B5608D2;
	Tue, 10 Sep 2024 21:06:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C0531BF359
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 21:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35D804047D
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 21:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNJrR34tG3U6 for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 21:06:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D1B524039F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1B524039F
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1B524039F
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 21:05:59 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42cba8340beso1245455e9.1
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 14:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726002358; x=1726607158;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NV10szUXdtV84DOt023cryE6ZB8ykhhNt27swq538w=;
 b=h9smnxxLoz5wRFQnQCmbuTEtm/MrkbRKrlZXb/0YqAEmyKOc2aBbDIBtJck0LzNiiD
 225CfywhsRWXnQZkzzLZ3z1bBC9w/IlgcfjAKX7Reqk0632+sT7r/4lU64zU7ffnbTbG
 6FQyh0EvJFHpFcQNTfULRDbNE4mVw+O0aVqtKgBJIXyiEeUU05jfNp6Qn7h5mPb8XRrc
 9VzlmhY846zqKv/370ioxeBJIKjm0kxQk4D5mOrGxrFi0hNpBYCheDG3er5RZLd2Xn+N
 MkeJ6X6frgAzYRvX+pwdhiq/bFKN6NiJhz1Tsmb4lAzc0TRpz9T6Fo6qUqCJ9uSyKpn9
 8sGg==
X-Gm-Message-State: AOJu0Yy5TExYCLFKFTpAxGbjdpYC9aRxMp95mn2VMYW4qchqimKRVyCI
 H4RwwywoB28r6b/kx+DAWUn1ofvCGbPCg9BNS8uXVJbrHV5chJK5yZDunQ==
X-Google-Smtp-Source: AGHT+IFD8vaHV/mUQ1fXYtm70fvnAq036jHSN5BUJ3Tu9FpSx54Y3tBNJBHD+WYeQtXk5dbG/FqQyg==
X-Received: by 2002:a05:600c:4f47:b0:42c:b7e1:a9c with SMTP id
 5b1f17b1804b1-42cbddd5f27mr28499775e9.5.1726002357459; 
 Tue, 10 Sep 2024 14:05:57 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cc8be465csm17377645e9.28.2024.09.10.14.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 14:05:57 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 23:05:56 +0200
Message-ID: <20240910210556.80476-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726002358; x=1726607158; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=0NV10szUXdtV84DOt023cryE6ZB8ykhhNt27swq538w=;
 b=TY0fDdmwujcu+/Rr/uiwf2QidpUKImuYo660JBDuBRrmEnLqkU/E1Qs1bIijvxp2Bd
 063rDxm8/9Q/uDB0wLnCQdJFCF0EKDS+WaPJKlygLjLBDnG5edq2p/xt1lQnZ4RrfXjK
 RA3et0R5eAe9JKETKn+oNSsFULOG7Dj2rSQk7/v1jzli0QKsMiRKehgrut5dL53PYGEK
 OKUFJUlCKN07mzDPVT4ZGQq53IaU4jh/SMMUeBjkI6AnWBAm5l8yaouo3dEfYZT9z53e
 87nOiizHlLE2tU8Ro3pWxZs7b6eJsrLjKzmnBs2aXPDKSoz9ow4+d59TCbb/oNSPN4Bp
 chdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TY0fDdmw
Subject: [Buildroot] [PATCH] paclage/genpart: change homepage and download
 location
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The old homepage is no more, and the download location has changed.
Update both to the new download location.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/genpart/Config.in      | 2 +-
 package/genpart/Config.in.host | 2 +-
 package/genpart/genpart.mk     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/genpart/Config.in b/package/genpart/Config.in
index 64288452ea..b8b8c16f66 100644
--- a/package/genpart/Config.in
+++ b/package/genpart/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_GENPART
 	  line arguments and dump it to stdout. No CHS magic is done,
 	  only lba entries are filled out.
 
-	  http://www.pengutronix.de/software/genpart/index_en.html
+	  https://public.pengutronix.de/software/genpart
diff --git a/package/genpart/Config.in.host b/package/genpart/Config.in.host
index d8b9eb61b0..f821bc9e8b 100644
--- a/package/genpart/Config.in.host
+++ b/package/genpart/Config.in.host
@@ -5,4 +5,4 @@ config BR2_PACKAGE_HOST_GENPART
 	  line arguments and dump it to stdout. No CHS magic is done,
 	  only lba entries are filled out.
 
-	  http://www.pengutronix.de/software/genpart/index_en.html
+	  https://public.pengutronix.de/software/genpart
diff --git a/package/genpart/genpart.mk b/package/genpart/genpart.mk
index 2aa2c710c0..b48a0ac358 100644
--- a/package/genpart/genpart.mk
+++ b/package/genpart/genpart.mk
@@ -6,7 +6,7 @@
 
 GENPART_VERSION = 1.0.2
 GENPART_SOURCE = genpart-$(GENPART_VERSION).tar.bz2
-GENPART_SITE = http://www.pengutronix.de/software/genpart/download
+GENPART_SITE = https://public.pengutronix.de/software/genpart
 # genpart has no license embedded in its source release.
 # However, their project page mentions:
 #   > This community portal offers an overview about our own OSS
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
