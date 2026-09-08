Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1874FC79F99
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 14:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF54F60739;
	Tue,  8 Sep 2026 14:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WW_fut62mSQC; Tue,  8 Sep 2026 14:13:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AAC266070D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788876799;
	b=hTrPBrqhF4u+RtMGw+0McR+TotGJo0hVCKwU540orWRyvA0HKVTXswgekm9p/lSbfDma
	 id2QAAx/PGMmcn0Ty2Y1C93NJTd5RTlAt3JGnOQYkmj8eR/KKRNb4v7IZXWHIyb7OiXpp
	 N/UcOk8GdwuCxW49xmsjwisKWtowrNENjnj99M8TyjniexU/IFFsHafOy1ghsnKvGmvlC
	 kIeau+QP8Xamwou+k+MOhwmZ9cT/XkxldHwjCjpGsaLfKU/JWH/swBhiJndpWDT/JSIXK
	 aSx1Y5AIAm2wO7EkFzwmtqvbcmWNAc+S1/6rW1WZUyMoWwS5QbaCWvxvbB7Zcd6eXCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788876799;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=UY5KaU+812IXDwczt6Uljqx0jlxOdAiSq+8g65sh1ug=;
	b=lj6NCmSfVuJ1Ib9wxOySvpW8fhJVyyL0N8j+CxWFOX92cv6D6emIPE1DHIlEbxEhaD6N
	 y2oMIT5J6HNpC76lbjI/k3EOETgyjSnL1Faw27Ek8FWJgumyXJ1qgI179Cnb0kD5RUsAy
	 bqgbHZsWxLcimimgw99YwjwQn+RYSVbyRhhV9ReWt0qV3U7ZehrvvLimtAbN2lPmbPype
	 07p/CwdVYslLW9N1KAUoL2mJMQ/FL4eKRGwGmq4HVcV3dhRsiHfM/TmYxBVvYqoO4QdzR
	 F/6NoB3y66PXHgSxP+1shvUE8nuDLAXfmLQEHNPnR5E3VhFhJpDbn7t7ICp1Umft7yg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788876799;
	bh=UY5KaU+812IXDwczt6Uljqx0jlxOdAiSq+8g65sh1ug=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Zoe3Os4yWcBPZQ5S2BvLdCF0h2pjH+c0Ednh5zWaKShy4LpgWMsyA8rgQluTfHUd8
	 I+70lihggotcEFtenlSj2eOZyvCBGVv6VVT9y15TGrmSCa09UjdwzUPhrWJ+PNDl0U
	 b1hC8M79sxGQ5ica8+MyC+2SXIqRTiRtD/ISqxh5wiQUPx+U4F4NGiMH0F/ETL+rg6
	 hChuSLG52kZF46XLf3iIwRAigAEhVrT7K9f3O/Nmy5uYlXll0EGujtNyOLEr9IvN72
	 FYtAJAbyJ/codzQMbsYcEBDLBgDVUvXZFqDriEotZTxc2zS+DkfkHQqy/kQ2PsKkUp
	 eyewXzvdN/ISA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAC266070D;
	Tue,  8 Sep 2026 14:13:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B185D5F
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CD1E40603
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRf88VKEkfUu for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 14:13:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EBA63405FF
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788876793;
 b=S63+tTIlIu2yalZ3OVm6pv7326dMRTL2rcp/PwwxANq/bew1khXH482R0tCfcR7vAJCb
 PiZH6mUnU/JtKqckQqOKj2OKrMDNhBdO4UD97YchaFzgVzcEjxe3WugsrDH7KHZeASMzD
 vMC1O3vgCVT6JQuqEL6oGP7yZm5w2UlNJYTsVeAqEeahZnshJLYrQLoi3ZtqKainjXxp7
 5OFiKH7REXaNrI3fpgGGIOT27Y0X7DXHWpYsargY4f+DtIlzIdpi0rlqa3TFLkKwcsvCd
 lS+V1waKcfcNYxPQiDB+ICTnlj5TIaPttpKBsvMnpx7TlFOPCX385uGsMsGJLz1Jxag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788876793;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=XxStztdtB0CWmieujVq63yCy34JqHrV8721oOyZNsGo=;
 b=rlfyuBBzsQ1+DiJ25lsRT5tskMKiktQncEyjB0E7d7JDqyGxxW3ThFQcHK73hPvGIylX
 i0GdlzC5OFRgvWBnTlMqv3qRYKoj5zCjXtZKtYaESI8busURoQTqqT7umHhoQJAoiIxj2
 /6Q6wJUAxFRUkySBcZEeWQIH/9O8FcFr1dY0Ggfw/duHTFBB0v8u9aa8EQtHImZJHvDD3
 caYTgHRLs0kCr40Wt7yDu29Wi/DEqSkYRzuZawR1yj9mdDrzbNWzxibFpMnmiOaFap3uU
 PUaTBegOR8AutFDkWJ2dGMdOiDAN3V58E3w1aYb5o5vvP1ae0hBrNfAq62DbieRupMg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=LPP6mhlD; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=LPP6mhlD
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBA63405FF
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:12 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49b8e527d63so56432085e9.2
 for <buildroot@buildroot.org>; Tue, 08 Sep 2026 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1788876791; x=1789481591;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XxStztdtB0CWmieujVq63yCy34JqHrV8721oOyZNsGo=;
 b=LPP6mhlDapsVplAzYOFuRBijSLXL/YIBFDw5MsQX97sc8KEBh05nD1W+LiXJADsSJv
 g87kxkI+nsM7W0IwYxQ9tdZafv2i5HVuAp/uha3Sh1xBRxBGPHCLyUDXkWJ6A85FQlxe
 qSY9VpqeB+PUO4y2lEESmN3iNdsYfIkshg4FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788876791; x=1789481591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XxStztdtB0CWmieujVq63yCy34JqHrV8721oOyZNsGo=;
 b=d6JjTcD4/oAOeCZ4hqXTZM+0rgkWsXOeH8CbCcETu4CyRfk3ch3FXD9jhktG3AI5mX
 QGZYPHDxdEPFa9NssgmFngvymHfosCdeHPaH88Q1RzKPw+8gSFXKWMAnLGDCuvhD4lfY
 PbUHRqWvjvh92q99RhcoCfay+lPOrH0+VW9DFMPWyozjLFlXXKbqFTpI1SRsvr9owZBR
 oiPsym1orJSg7tnXcFR7zBa2k2bBJq1owggzpMJ2o1tHMntPZr/aHZ9V4HfXWy9Swfku
 JOhV4Hll2ZK2rVrlzuLPVGdd1r/i7dXx7fLNo4TIxv+rBaZfKao/XL/L4rofAyzSwl6Q
 dJFw==
X-Gm-Message-State: AFuF++nfvVQhAcYJl0DDB3UMr2Q1W6G22ysFVRPgiS0GDsmTUh+azJWE
 zp0AOaCWniYMIra5Hc1bZh0V6aAUq37RdjLT7p9TERaqEAfZkekezJVgMmTEqM0g35NswjwKXZ7
 E0YiA1x8=
X-Gm-Gg: AYBFou00sI56ShoMhw05IZh5tiUI7EFZacuz2WBWHUJlKDI93YBCq0+uKcqR0/LlwOg
 Uio9Wvg1nFDUyy56wZ90rP2C2EgjdYMd+yrf3PVlz199aVRm4BQs+GO/iK58ZpFcq9eIM6l7iHL
 GRJeyv3W75jKh2M2J1a2wlaJ6vqF+uqiZZ8uvuiajQCHvOnQb0anc6npD6be7UP3A1bKE4WEjt8
 fjYT2Gh7tgN8RWhsAC0JfMV1EMdjXeMIM4t8Gi1uutvodTemt8unpasRZjXdKrrX4GgrdvCeP3O
 Y3ZrOXwC+u8sXNrl0c+QWDpexR6TrFU3YPEOKPisUUHrBUBWiYWZrKqYupap+l8BXfkfB4hOgN8
 h9JQvhcF3rAWoq21oX3b/Lr9cJb5dxbYuOnX8P73oJNdSn4xkJuuU0QhzTXnaSFxOnBsOV095Y6
 H9v06Tpwn8m8q9PKZ+/wptt77JyWxhJ2d5nWTqjqKgCEAvYNUUdgYrTDX98VSU+PH1shUGrRAkI
 CUMc4dQbzVjwrCY6+oPiSMXtnuBetNRv6THscK2r4yZh1YGUOkK5js4
X-Received: by 2002:a05:600c:1914:b0:49c:ff23:a6d5 with SMTP id
 5b1f17b1804b1-49cff23a70bmr252134355e9.0.1788876790521; 
 Tue, 08 Sep 2026 07:13:10 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c371:d703:6c9d:b3d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883a9b49sm30923335f8f.17.2026.09.08.07.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 07:13:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  8 Sep 2026 16:12:53 +0200
Message-ID: <20260908141253.1556634-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908141253.1556634-1-dario.binacchi@amarulasolutions.com>
References: <20260908141253.1556634-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 6/6] package/cutekeyboard: enable build with
 Qt6
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, richard.genoud@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable building of cutekeyboard with Qt6. With the merge of
QuickControls2 into qtdeclarative, the corresponding Kconfig option has
also disappeared in Buildroot.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Changes v4 -> v5:
  - Rebase on version 1.6.0

Added in v2

 package/cutekeyboard/Config.in       | 13 ++++++++-----
 package/cutekeyboard/cutekeyboard.mk |  6 +++++-
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/cutekeyboard/Config.in b/package/cutekeyboard/Config.in
index bd661b0cd42e..4f83316644a2 100644
--- a/package/cutekeyboard/Config.in
+++ b/package/cutekeyboard/Config.in
@@ -1,10 +1,13 @@
 config BR2_PACKAGE_CUTEKEYBOARD
 	bool "cutekeyboard"
-	depends on BR2_PACKAGE_QT5
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
-	select BR2_PACKAGE_QT5DECLARATIVE
-	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
-	select BR2_PACKAGE_QT5QUICKCONTROLS2
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE || BR2_PACKAGE_QT6 # qt5declarative
+	select BR2_PACKAGE_QT5DECLARATIVE if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5QUICKCONTROLS2 if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_GUI if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6DECLARATIVE if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6DECLARATIVE_QUICK if BR2_PACKAGE_QT6
 	help
 	  CuteKeyboard is a Qt virtual keyboard plugin for
 	  embedded applications.
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index 12a6573d52e9..908d371cbc2c 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -6,7 +6,11 @@
 
 CUTEKEYBOARD_VERSION = 1.6.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,v$(CUTEKEYBOARD_VERSION))
-CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
+ifeq ($(BR2_PACKAGE_QT5),y)
+CUTEKEYBOARD_DEPENDENCIES += qt5declarative qt5quickcontrols2
+else
+CUTEKEYBOARD_DEPENDENCIES += qt6declarative
+endif
 CUTEKEYBOARD_INSTALL_STAGING = YES
 CUTEKEYBOARD_LICENSE = MIT
 CUTEKEYBOARD_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
