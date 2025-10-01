Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729F0CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 16:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C806C83CA4;
	Wed,  1 Oct 2025 16:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzkRGC3_dLdn; Wed,  1 Oct 2025 16:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2C6683D0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2C6683D0C;
	Wed,  1 Oct 2025 16:52:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF11393C
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0EB641043
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2LIWZfgLBquW for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 16:52:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9E6A41040
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9E6A41040
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9E6A41040
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:52:22 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e3cdc1a6aso10047595e9.1
 for <buildroot@buildroot.org>; Wed, 01 Oct 2025 09:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759337541; x=1759942341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FZcnDeq+E9IywAFxWi6jL4w3wiGCWF7qoHaQGhqh3fE=;
 b=eVG5ixtdq1uMkMZOPxneQHBlkq7p9dN3jhdLj4rfLyhU4stPPhHu2YYhfl30QkUh6M
 4JvwBQiJZ7aAfEhY4SXsVIRgKBwBRcZp361feZnYKneqczp1RyrBXAUUNuShMX3ZyeJr
 dwIzOeeeh8fwbk0SQ5270KuvMIf6YEPcEnPHrgyCUF2K1riCEGcHlGkyyAgkdpVXpPIv
 htsQxJaKDQJeRj3fhSTI5TQFIMSIf+Qsdc0VIFb13/h2SCPPH6iczGJsAoi3lbFZcJk3
 dExtWL8rDLr7h3HxI8iu8ijK5Y0WBh25Y4ZZHVcdcEvqWAC3l+xiLRbOxPaLEnqo5AJG
 WQkA==
X-Gm-Message-State: AOJu0YyjatvYw4yka6Y+1QyHVtIJoLhR1TM0QlensLmMQrBGdq8cufqm
 1yGXjC1Nex5VCVqK4EJOIdiVY9Kxla9sLz1O5ap6+hn1IHk+v0mwUXHxR8H2aKRRn6iiEMXMPxK
 gGpn0P9M=
X-Gm-Gg: ASbGncvxEFBMgl+jeqUv9/J1n1EpuPBUpYmpN06hs1JSF6kaxrp20Dh7HySh7HNeGVO
 5vFXHl+bX87bFrVf0GI+N/wY/zOBFz/D6X+PerejZv1dgFdmqgvBIboZU6sDLDkS85hsme4nhdX
 bQl5gQcijBUEhcyiUZqoopED8GaY/hWuZdqXGfWDSP5bQdMAHxhlbczuZL4Q7peNg39Rix6dcAQ
 X/M5ll3A+OGatFwTl4KF5S4FDMg50gTQ3nn1eFzfb+6n3a8ORGIJ0OhTO6lwTJLEwys0bcFqSoz
 VpjKcqJUkhwLz1PZCiC+z+zuh/P8ZGEcWymcmy4YQCgptcAyCbCRyj+xx3AQN4bXjqI3mw1N+BE
 baQxHX7XZqRP0aeT3SBkbUlLkI6qRfxRhxlAemE9dHlKUXalzNkbcWa9AttJw9CxacbAEOJjTmL
 WmfHdS877jjHedaiHi7Ldw53c2V9/iFzdP61o=
X-Google-Smtp-Source: AGHT+IHxG7ObMsJJg9yuU4giVV846+zU1nk00e4xcdRjoy/IvVrxPbG1s5Q7d+MfP/8hWvmDF5XXoA==
X-Received: by 2002:a05:600c:8b76:b0:46d:34cc:e9c1 with SMTP id
 5b1f17b1804b1-46e68ba11cfmr2265715e9.4.1759337540627; 
 Wed, 01 Oct 2025 09:52:20 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.238])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fbb27sm27379959f8f.4.2025.10.01.09.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 09:52:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed,  1 Oct 2025 18:52:16 +0200
Message-ID: <20251001165216.3841723-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759337541; x=1759942341;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FZcnDeq+E9IywAFxWi6jL4w3wiGCWF7qoHaQGhqh3fE=;
 b=ksowlRNhxVPmAoMCscwf2TJrRB2q1bQe0NGGwIYX1nRR0vH/CJnf8qsuXwkGQ7evtg
 /OtZ5e8kO95nNh7Do2mhAZisdeLol5zDILX4UI+KdWXLGH0v1TefHg18P9BMpqcpdOm2
 WmZBQvNaKsMgSaR0KERsTmSj9a/B9+i2MuTUA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ksowlRNh
Subject: [Buildroot] [PATCH 1/1] package/faad2: bump to version 2.11.2
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

Release notes:
https://github.com/knik0/faad2/blob/2.11.2/ChangeLog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/faad2/faad2.hash | 2 +-
 package/faad2/faad2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/faad2/faad2.hash b/package/faad2/faad2.hash
index b7813130fd66..6a641dc10fc4 100644
--- a/package/faad2/faad2.hash
+++ b/package/faad2/faad2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  72dbc0494de9ee38d240f670eccf2b10ef715fd0508c305532ca3def3225bb06  faad2-2.11.1.tar.gz
+sha256  3fcbd305e4abd34768c62050e18ca0986f7d9c5eca343fb98275418013065c0e  faad2-2.11.2.tar.gz
 sha256  d3baf3a54943cf12a994c85867a18dec84f810901b2f2878ddfd77efcc3c150f  COPYING
diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index 0b249b3450c5..62c469e3ef03 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAAD2_VERSION = 2.11.1
+FAAD2_VERSION = 2.11.2
 FAAD2_SITE = $(call github,knik0,faad2,$(FAAD2_VERSION))
 FAAD2_LICENSE = GPL-2.0
 FAAD2_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
