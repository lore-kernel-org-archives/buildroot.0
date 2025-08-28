Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8D3C8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 11:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF82F60DD2;
	Thu, 28 Aug 2025 11:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6YoIlvNrvGra; Thu, 28 Aug 2025 11:56:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33D6760DBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33D6760DBC;
	Thu, 28 Aug 2025 11:56:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69F7F1B0
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51BD181A6A
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pyudLuXv_vgr for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 11:56:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7892F81A5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7892F81A5F
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7892F81A5F
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:56:25 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3cbb3ff70a0so528384f8f.2
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 04:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756382183; x=1756986983;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XbHk6YHrfUXcYmdKTDANpnCal9nJJxf3+rDAqh3N/Qs=;
 b=lChwYChSCZD2mUbktxO2zpUL6dIVPm0SwTe8LHOOql8qmIobsBzY1iueNsQz6rr/J1
 TNst6uubG1Q8joh1VuHCUIS6bn3LdyomULi/2mZC0YmD50C0ygkPrQK5EL9vMJdwYd1N
 PD/4QxcNeTt4Lw3ycIB6EfNK2X5nG80u3iZ8Bgve7PcvkKH+vmS0B/CnX3B0WclGhqpP
 5eZ5ZLps4WtuiS3bRoYNzmfiNxq/L5XpAX65wd0f0WF9Wmt6gDw6NxQqY4EqTS3KXGe1
 jhLf89cezg7UiwZ24Ggq1wtrF0BtcKO68UJgxGC3UOk/E7gTNYpXa+6EFp6r8d6ScJFv
 iK6Q==
X-Gm-Message-State: AOJu0YwiqejGiVKOnJvQcRxCMZyvjYI7hm6nS1pe2Z9fEFt5dEDVuFGe
 Tey9TUfL89bGHG8zr2qauM8dVBIAjhYrDr4N3EQoyPyvToulUOrk03VYA5B9P6t7TAZ82tW/oFb
 tH1Su
X-Gm-Gg: ASbGncuA9+Ur13R1dAqoSTTwG0tMTiVV+vPL/zpgW66xGIr27IY/spe3Atv3O0zfKqe
 ekLJZiXqSzZ6OPhFlCnwhW0y7DvYfkI3HCukx0bFdSYy5VA2exBO8d3Kq9DixXzBPNsKKApWYCU
 PsHbfn/2rX/acsxIubLzwoHsduN2RuVXrMADsM+qZlCM2+X3o0z+1i0/yyamSvUdNSBHj855o6a
 BinWDNJ+tjvg8/dvbnei50KvK52FNsdlYj9CDip4F7iIT5O1I9hwQPGtGoxBpqL2JxAi4jzA7Kc
 Erko++7JsDDwfcbctw1wqB4VTsc3JLwaJ+SA3I5XbvXY55Bql+qW00Nr79/HBOu25Cr/DyKpqwa
 6/CLVQNiS5Pb3KZOzOz9Ad9jM5xE/Q8f0M6nzDyJmahlilfxQUNle+sjHfwRYd4l6+Z5mcGDaFo
 ts88aif+0vSG+1p2XDtIH7NKnHKck=
X-Google-Smtp-Source: AGHT+IGIZFbxULIRYF61gorRpuDdajM9XeaORJDn4tbYdAopTkUt94C9lwVxxF8mKb83dshSNnlACQ==
X-Received: by 2002:a05:6000:290b:b0:3cd:fd51:f6dc with SMTP id
 ffacd0b85a97d-3cdfd51fa22mr1947799f8f.45.1756382182960; 
 Thu, 28 Aug 2025 04:56:22 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cde21c4867sm2894024f8f.11.2025.08.28.04.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 04:56:22 -0700 (PDT)
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Thu, 28 Aug 2025 13:56:06 +0200
Message-ID: <20250828115606.361868-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756382183; x=1756986983; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XbHk6YHrfUXcYmdKTDANpnCal9nJJxf3+rDAqh3N/Qs=;
 b=z7R+0lFTyfw4C18vy6On26OhZUzDwlTFHm/NdfCtY/IknPNED1tKRwb5xiaWZhVdNi
 g4I/sBlP8xHhQA6p0ww09JdYmdYLngDeIKTDwLSMtW71YKuvduFSzjoyyaftEWtvb4hr
 u2CC2fbzK7u40+fDiF4KLbuSTh4XLisGjj/S0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=z7R+0lFT
Subject: [Buildroot] [PATCH 1/1] package/dust: bump version to 1.2.3
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some fixes:
https://github.com/bootandy/dust/compare/v1.1.2...v1.2.3

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/dust/dust.hash | 2 +-
 package/dust/dust.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dust/dust.hash b/package/dust/dust.hash
index a25176a9dd..83b01447b6 100644
--- a/package/dust/dust.hash
+++ b/package/dust/dust.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  06cb47200dce72a51ceebc5fb97094b20afacf6c303758540809808f24e59435  dust-1.1.2-cargo4.tar.gz
+sha256  275c2d7bd06205588b7e20e4b478e0df7213f426a1441923e3f2dfaa80cf4828  dust-1.2.3-cargo4.tar.gz
 sha256  aee6e2d13d3a55c7881630c09b41ca7b3b44bb1437b5d36695d22decc3655160  LICENSE
diff --git a/package/dust/dust.mk b/package/dust/dust.mk
index a6b6f43c40..e83d15c95c 100644
--- a/package/dust/dust.mk
+++ b/package/dust/dust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DUST_VERSION = 1.1.2
+DUST_VERSION = 1.2.3
 DUST_SITE = $(call github,bootandy,dust,v$(DUST_VERSION))
 DUST_LICENSE = APACHE-2.0
 DUST_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
