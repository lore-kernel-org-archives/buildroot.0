Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5EFCE8379
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 19:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F3C6400BF;
	Mon, 30 Sep 2024 19:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SJHOdCVHsGK; Mon, 30 Sep 2024 19:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4C2E402D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4C2E402D2;
	Mon, 30 Sep 2024 19:02:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E8B91BF2F5
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 19:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 657A880ED0
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 19:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qs8Rcs10n4tc for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 19:02:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 563CB80E2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 563CB80E2C
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 563CB80E2C
 for <buildroot@busybox.net>; Mon, 30 Sep 2024 19:02:40 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8d29b7edc2so665208466b.1
 for <buildroot@busybox.net>; Mon, 30 Sep 2024 12:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727722958; x=1728327758;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rvhmgyDRbwMhu4ZGX2RwqfcwGpGs582wko128zdqOK4=;
 b=kW1apwmRDW8dNx5ehAYIj96jBSwp0N9P8zuKj+hcAwXFw5e4UQ6wXgteiDGuPfTY2J
 2qi1UPApQuQjg+0W0NAn1s996ecB0Y0JHD0gAMxzlA5i4b7/HHbgAHorpk4qY8rJOOw5
 L1p2+y79z9c6HVf6UoRoVb03r5H4wM39FqVBXPRnn4e8HWoKd2vZ08oot0nkZKQ2bN/H
 Ppsij79zN6Na7z/mQ7kYjMxXv6g8Po67soGYT15WSn02ArSSyiMgfXcnzmYaYxN07yhO
 ErRlZgk2Rst2gAuFnIr9f2yHtNFCv3KJjlX50t/SHHGolc6p4CVpmnI8/jXnXiBzmYDU
 T1kA==
X-Gm-Message-State: AOJu0Yy9xUdvoUIOP6dteQKfktkPt6+vwhkX3Dof2X3PBBUtItgtNV8s
 L+apYIaD7wR0C7AZQOgmg4FawRjwj4COjpmyd3jsjD+fwoNzp6p8bCv57XJGXgeIuMy6KSPOZWz
 u3A==
X-Google-Smtp-Source: AGHT+IHvhl0/gULdk6sp1sijQHFD16SDCDtK18UvmSHc9gIoYOfuEU/EYM72MtjWNrLaCz11Pa4umQ==
X-Received: by 2002:a17:906:c104:b0:a86:b762:52ec with SMTP id
 a640c23a62f3a-a93c4adf8ebmr1375582866b.51.1727722958207; 
 Mon, 30 Sep 2024 12:02:38 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2776dd4sm582060466b.16.2024.09.30.12.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 12:02:37 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 30 Sep 2024 21:02:34 +0200
Message-ID: <20240930190234.3923303-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1727722958; x=1728327758; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rvhmgyDRbwMhu4ZGX2RwqfcwGpGs582wko128zdqOK4=;
 b=A5+Jdj7iQblYtt4K/5X05t1jgLWmTFlvOdtpomRNPr8cOtPCLbEJqJn525nEtJXRzY
 fcJz+3auR5bPoRPH3s+80eEN4P4y+nZGrgQtUR47LMYuffoKjmQoip5KMvH3XdexyVkX
 QZTvl+XjNEIzVbwL7vCijv2Sf+J4Xncgq0v5Yunh/tJLVnVsiwD2FIDR80+I7kqx1A1O
 WqlFyIMVpfO8HWQHTAAHsfEs5x8CVsCKy26tQzr5NlBtWmUvq2Gpz5QpAFsqMT2cqYkK
 U93tg3Hf7c7XeTcGTvDa0u+yV4ovX9tiTcJowxpDcib3uHy0GKcj9x4Je5j0gqvLVlJE
 TrfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=A5+Jdj7i
Subject: [Buildroot] [PATCH] package/kbd: bump to 2.6.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/kbd/kbd.hash | 2 +-
 package/kbd/kbd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
index 63f7286d3..25866751f 100644
--- a/package/kbd/kbd.hash
+++ b/package/kbd/kbd.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
-sha256  ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683  kbd-2.5.1.tar.xz
+sha256  519f8d087aecca7e0a33cd084bef92c066eb19731666653dcc70c9d71aa40926  kbd-2.6.4.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5a16340fe773f422144b436df90319114a2884933c56e9be6fad642e59be5e1f  CREDITS
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 15912419f..953adccd0 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KBD_VERSION = 2.5.1
+KBD_VERSION = 2.6.4
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 KBD_CONF_OPTS = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
