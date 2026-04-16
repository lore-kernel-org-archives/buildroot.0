Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FDFF8D75D
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 16:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33137607AF;
	Thu, 16 Apr 2026 16:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLQYCAvIzgrs; Thu, 16 Apr 2026 16:00:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 945D660794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776355244;
	bh=PdZIAOAchvH52DC5DI+NB7Zp5Lzks1jv6T/J0Lqp374=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dKrV3fHV0pIhCeWd2/DMU5fst9MCr1D4CSU40rm0GhOPp4urYFF3xXgNNpf8BXn6x
	 ZHA5W1/RW+bztLIa6TqbOdsF6SXueuxmGaEoX5YxcIfAF+U8ZgL6DL7811peqO7KJQ
	 LiJTp2rVMma71LPrlNVkrtEraUiyuUmbO3wucB4fyK/XiXpEpSY4bxzmGNhFazbgt+
	 VSiEOFSS7FuoddjXxXX2uRho9bj6WyHgv1TH1POmYXVZs5MDrOe3aQBy74d8ESgZ3l
	 kq9KByt12xMqRwYgbrojmLe8K9qMTeA5pWaB50Ob+S/KUs3jU5EWyiaOV57xAcUSE3
	 FvzcJltK+SFsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 945D660794;
	Thu, 16 Apr 2026 16:00:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FEC82CF
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 16:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1582860794
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 16:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVbPIL3nNJIj for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 16:00:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 273706076D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 273706076D
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 273706076D
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 16:00:42 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5a40b2d268bso1679426e87.3
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 09:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776355240; x=1776960040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1qG9MACVUOHmzANUuphucbgnLWDx7ftFpdIl/oKrxN8=;
 b=tIIIEyixItXZF0oDVHUoxKRQLM8nX4BMJU0N2sFowXJHkeFmlJF3hMlc6XqrI4/r5G
 dOU+Z9OwdXNVtlVI89YE3dgVvFIlXbnHGDn2HWlzHHWnhpeGVk//tKJfI15xINEDOe/O
 Aj0VnyggBaIhnJ00WkqJioBAvDcbmOYTa7CiG+SZRTh63l7pqK6BDYsBxjxVP+luYd/E
 8r5NnSMJFqtt3kcLp5wvQSMDAB+mKxjmCQb/NPjB9df6PeqQp8WasUpuEINwLYC32lnd
 QiiENE9IyvpGUuIIa0wStqETmeF+4sbiXTCalwHde02wiKc9x19zwgnb5WanZIHRY7Vr
 NemQ==
X-Gm-Message-State: AOJu0YzmOaT5u9zpmadi6A50WJuUGtF04SeH7M8tVLb6iqk118yx8URa
 TIOVaWKGgFcE+8hRwmkvbQHuTX/iHIhBCYSahR505yuGWGGES81n0PxOj3EK
X-Gm-Gg: AeBDiesTFuwcJa+5Ltahp+00SgaltBufbHKFd9PtjGOmdU1OFSVAVJlOWzTECyBrK7a
 xkxLl11Twz6qdFZ5Fe+7C86zFvMRqvDY4hvQdImx+on9H6AGSxAhLWaYi6bGIhgPKMOr6bS7MuH
 XOm/bA6TLSosLE+c3tkSco9yTua2EvceiCbSMep9M1vEQOp74xM5LDt0zVBhaD6HjDmNWIBzDX8
 PVs+pDIZq6a/49EoqczxRpYDcokCzygnm1GJ0LtaAqQLmWVmyNdW8FSAqUmEp4XUUyZTR/MIQPD
 XbmTLmlkq52rf1WGZposFsd2efLxL39ymkoG3VlotiuKkoKDAk4ljfU/9+k7o2ccCYlzMJ3eXyQ
 ezsJwoVREjBuLIZ3XySfZyrfXaOtse0uETzrnROlWD3eU9hXJYnO6eYtK4vxalrrvP78COB9D4A
 GGj/J/auMIidZXNnk066VLWpxg+V5O1MW5acYdXA==
X-Received: by 2002:a05:6512:8006:10b0:5a4:a4c:658b with SMTP id
 2adb3069b0e04-5a415270a2amr7046e87.40.1776355239931; 
 Thu, 16 Apr 2026 09:00:39 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a40f358286sm693646e87.48.2026.04.16.09.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 09:00:39 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Thu, 16 Apr 2026 17:58:27 +0200
Message-ID: <20260416155848.456776-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776355240; x=1776960040; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1qG9MACVUOHmzANUuphucbgnLWDx7ftFpdIl/oKrxN8=;
 b=PCgi5BDdLEhXQIzvnaNzsqqhTQc8sn+1Wfln+NHTWRWhwugWT964mHSbZjCrnmAa+i
 sRC/SEq1nbR+Ux1N2orJEtkiSF6OwFoHpeH2J46FWWctP+R3U/oHm9k7nnx8YSbZnoNH
 ec295J40t9QTOXVykzEaljJT0j+nlwurzvgrAQQS4JkHXhvYceQ+89SfFXrojnJmTk/E
 RS4lAJI8fV9T9/Djz21ufLeJu57O3+2TBCjENoLFarQcrpjWje4ZMmxjsiq54g3RVjCF
 TT+QVuvDc9MX55qe0+ktBAh5yHfOLrJGn6jybQMfff80TvQAOaKsDxsPGvEcbP3i1SZk
 z7rQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PCgi5BDd
Subject: [Buildroot] [PATCH 1/1] package/zellij: bump to version 0.44.1
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

Changelog: https://github.com/zellij-org/zellij/blob/v0.44.1/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/zellij/zellij.hash | 2 +-
 package/zellij/zellij.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
index e0aaceeee2..03b647f7bf 100644
--- a/package/zellij/zellij.hash
+++ b/package/zellij/zellij.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  ee8fb9d36f07f00a3f21e65aadcb85911132a1de1666c18c0c5afe23f63c49d7  zellij-0.43.1-cargo5.tar.gz
+sha256  7c17759e1be5ce0b73cd2a33c7c111c9b7ce08d4c7f2efce12a0d7a7815b8b6b  zellij-0.44.1-cargo5.tar.gz
 sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
index 2ddefc6049..2d76b89891 100644
--- a/package/zellij/zellij.mk
+++ b/package/zellij/zellij.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZELLIJ_VERSION = 0.43.1
+ZELLIJ_VERSION = 0.44.1
 ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
 ZELLIJ_LICENSE = MIT
 ZELLIJ_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
