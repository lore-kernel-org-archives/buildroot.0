Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CD5CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55B8E607AA;
	Tue, 13 Oct 2026 16:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZweKi5Um8Qz; Tue, 13 Oct 2026 16:43:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6978C6078C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909800;
	b=BRP52TXqFCbLtOSoVY9pBlQBnTcVlB3d+HdrYSZWPhAzRr/pLrwcfa4Nv0VrIr1OTf3Z
	 yWw15cdbUvl4PRD9Tq549bVZ3CXVBCTXq4oNycW+I1OKtev2bPXoRgfprP0Uqj5a0dPQ1
	 mP/9TJG73b6/YDd97lJQ3B7XAe1wCqA/RCLWarSGagP/53wXam8h1P1AFl04PNWXsu6DV
	 pERWIl3ZPPWDrPAn/CGAyUK57EdJOKMmgpZsmjC+/sVrvzN83lODop1pibTrwk3Qqxb+n
	 VdktdQVCqALvE2+bS2WZ15xYN27I11LouX24w39VMDyWsP0BA9a2Sk4dl3ZklidQ9YQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909800;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=x70mg5Nez2axP7f6YUBqswjwLkYwmO9vfKQ+HteEcu8=;
	b=fspWoW27GJFDVGTffQhCBa5pMCJubHc2BkEAXrnIQCnrfJly4X/l+XW8/s3wGDmk/W3O
	 RgI+WCf9m8oekL/t6VQFcYzw5+CZOtxnVu0rr73QaK5f8no1XMuZc94nUau3fWXDRC+O9
	 XAZTl1So0ZdDuJjyIppaYPWyaicuZNjdAiJzmQGaGTqKj7RVBgG3MSepl0v/+GDEZr1+Q
	 D9up62rYID7QrlOJr2UFppRCR74tmF0gGZ0AgtFQXueYEhAGYYKXrZluRM/4nhj3J+6Ws
	 czzbiFw1qqyjLHl5mP03bUAyjCcLUn8GDKJ28T3Os9DkJbSF+dc6Ja4CgLCRTp4AQYg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909800;
	bh=x70mg5Nez2axP7f6YUBqswjwLkYwmO9vfKQ+HteEcu8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=i9/UOQy9nt3/mgnTHbslvllek6byslgK3+pFV1p2Zxt6j5nA2mQI24zHON8M3vKKX
	 r5sOAI4pfvLnFTG9vTwkZd2Jl0Oqodlm+yyMNeO5XCgwkhlHv7i3vf1vWyeyitGb82
	 PdsmhZx3eliimYPWSd6f9+FMLrK7F4wpt/sTMYACJZzi7x9ydHsZJ9Pgm/boAkrRuo
	 l9VMHucd8A0+INpSLzsH3iqfZviM6k8catX4x62KeDsrc0u3YbzX4dZwxIMO/B/NVZ
	 w1aXE5uTsVwHTupzM09b1JoH2P51c4bwgtclRQdCXPdVUvwPGfAEoue90+hB05UPi6
	 ltuXw9i1oRboQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6978C6078C;
	Tue, 13 Oct 2026 16:43:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 030AC1DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E99AE4007D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WmZEF5ctvcdi for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1D78740049
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::2d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909793;
 b=ZGQrxAVgzajWhgzJ3g8RMHmAksH4BLdQXSzrITUUWmc+5QHBUXaUIsdVJgtL2S+eFGGl
 m/vVxBeEZdoDRjnWLG1kVfELcQvUrO3lSngmKlTAZvpBTFBtfyoQDukctL4cCxwQbXeEu
 Z+9qce9VCQa0bOuT5OhHxTFuPu8+WMZtyieZYqqmywOl0/QrWuw/uH0F+mFO8KdKappIY
 nHZoIPw1h2CxZ9vZ06McTlVpn+RSOPOa1EWSrApmQGi1vQUFiRFRBOznp2QLu2gOofE2f
 m9VcaXDVCA7+kSZevc3Ni75R8UI6t/KoxL9Nq9pgmZMcDwbcfIpkIdeQLrpyyAFUDgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909793;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Ne0h2pLEwswc26BatlIhw3OmbLd752DZ+yG5YfHxNsY=;
 b=cc95DkwMgGESaDbIn1X7Mj4oUmnBU75UU48ZBaLqJoty+bZhW3kJIqlF3rrieS6FWAg6
 dhu8mRX/ILOPj55qavLSU/GS8BEIp4+R8t8lTYKG1NHN95mhvtAJXfSxHTaPTW8qj5TjE
 UuAXj74bAiz3kUV2mSzSFZ0R4lvAm8vv1v6KjWosiO44rSJru7+2EefPvLvUKQbhdKgj7
 YD8OEyI7lASWNoCVLuy0InLeaYsg0M+AFIICQa7tr40DafdtCFpkDrfIQ/e44iNA/K8s2
 z0CAJfgI1W1p4ztJ2ltu380cPbiUUPQ6QC5werHpG4SqeqPYVstdXGKzcYd4YcAYtsg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=FTX00BvL; 
 arc=none smtp.remote-ip="2001:4860:4864:20::2d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=FTX00BvL
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D78740049
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:12 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-49e13495e5cso3679273fac.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909792; x=1792514592; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ne0h2pLEwswc26BatlIhw3OmbLd752DZ+yG5YfHxNsY=;
 b=FTX00BvLEmPPElbdJLI9vlP7qnn34VYOC6O8OCtPGaYMnTHuhrEqccpyBQQqkFcoUA
 58vSa+cqwX5wLjzngrTKm0Ov459Eod1s+JixjCyL0hO0wGl3Y+42mLpzjvVaYiK/b17c
 rrDhuADyHImjMI5ew9s2HK3OXGC5cfTbhrNE6QOfNCM9qbUuIba0ERotu0CTnmudnsJW
 bX5js7scy8P16g++EEcQWYjVnf8FBwlv//loOsre0leK4+pPBpyg3fTybXdXA60THMM2
 S6MmAF1KLkAf6phuZliaTiHBPk1k6147nSopZO/RrlXkC9SWHUPV25Y8b907zcbVllsU
 iCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909792; x=1792514592;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ne0h2pLEwswc26BatlIhw3OmbLd752DZ+yG5YfHxNsY=;
 b=LLH1jo6FRV344/wK7e77ZZvqnNCAcMKxzsrLGPM9AajnebGuZW5AEFoAeqa0/qXOa6
 pxbJT1GD03VB/jeuXDWuDpqRSP1KVFM7CungpOmMGVNk069BsvoZGk/xsvZJ6pRdx/q0
 ma8XkIahqmSTIlE9YAkSQ+71thitSk8KFpbQ6iZz8e7pkHZ3wj9oIXlJeHCAJuESeL0l
 P6uip86O6z2+t8KG+B5/DFcjV+azHGaXSFqRculoUrYYY1B4P2MaXvrPKuwliTO1J91Z
 3qsEof7JGgLjSzbomjq8eYl643MnxBK4XMqf6jxwbcp4Yf/K1tcfRi+PptSRnEbor3bs
 T7Og==
X-Gm-Message-State: AFq9FYKvD/UcD3KtVt4GCI0285pfbtoQkLTEjcGNySm5VRqT4U0gKAme
 BAW1hdtsDVLbXUASB5OeoFjK+xQ119LBM+rBQVUl1w3VHnsQeDE4cdb4sTefPg==
X-Gm-Gg: AYBFou1/hCxfoKZYg5rb8qf4sHq1iqfXAR/iKLmo5Ps8RFytkkETiNuzqXLDCXRBYIC
 ZavVC42UVo3Igk0ReBgDtJiHaRkX8YYWaPWrARWzOLb5rkjBFcM8BgtP7poEg46AaHp9BzWACLP
 98dZHoIQez9cwAjhVgFku/utw40jpl/BiOwaCvxQGiERY0uLno0yI4QywpU4MjVu99WaotM/Qzr
 wh89ZvxlcoVULfv7p0DVp8sW30OEMoHzM2hygXAYZqBT2zmUQWhEIpd+DqKKLUF8gbe+QZcYO+V
 972v9hNZYNxRlSuxWsdQn7sjpuK475EEG4gLVWRezSLw4ovsbGU0bhr8sxxDK22Wq7N3infXYmd
 hXY0Qsru8wy9N2DZb6LfC1Mj30XfSt0Xo8d4BD7PVnGWLpr3Jai/L3u8lHm6Dw79XQclkNMF7GE
 jnu1/IEh4t55+n0fuZk7zAfGno08SiBpILF1FUM8ND+iB1Ua/CSgwkcfgeotIY9x5paSKJXhB6g
 7UTfuZQbrB0aR5wLP+0YMsq1wuQeUW7W+JuwOPcBMq76xZPyuhMMnYmeQS+icnz53s/HMWMoEGj
 /W/USWMkcwuuIuVN9vDg5QZR+xlY4/b//ZlRSd/tL84iBdJtCXfUX1l4qcaSQbxNOvWwbY3V7fM
 e9+r9+7+vML+2UW46TJYNNlDwlzr3Oqw/Cgp4Nkpru/IlCig6KJsIOw==
X-Received: by 2002:a05:6870:f21b:b0:464:13bb:5b63 with SMTP id
 586e51a60fabf-4a2a4506f00mr8762154fac.5.1791909791700; 
 Tue, 13 Oct 2026 09:43:11 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:41:57 -0600
Message-ID: <20261013164254.1476592-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-gobject: bump to version 3.58.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 755b51bb32..2081c1fda6 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.58/pygobject-3.58.0.sha256sum
-sha256  45068697de3ffe46840ca369705f23118b34db4f7deb63f6eff079a6734ddcca  pygobject-3.58.0.tar.gz
+# from https://download.gnome.org/sources/pygobject/3.58/pygobject-3.58.1.sha256sum
+sha256  4c80598ade17fbaa7798e01a25d0bf29ce109740786026a074c5c62bb3e79d23  pygobject-3.58.1.tar.gz
 sha256  f4cac31434b287b10a70b81c62cfa973d250417f8f248c4c1b5566d061ecfb2f  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index f15129a076..6f2271ad86 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_GOBJECT_VERSION_MAJOR = 3.58
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).0
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).1
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
