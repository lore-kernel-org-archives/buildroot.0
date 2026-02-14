Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350ACEF99FF
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 12:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA5E160A58;
	Sat, 14 Feb 2026 12:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OG_pqS_vpHaB; Sat, 14 Feb 2026 12:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5901C608E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771071608;
	bh=CgykhmpPm+wcVcwin7+kNM+Suo4NmXpYJNc62IqGxaI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S6bCHqJ7iP96cQOYHVkK1pYOSe99vmvP9CvivI1+H3VNDdSH6Aqf7pYGKtCbpdoyu
	 fTf4DdLwH/fulYJ+60AmIFu+NipyjTaqqMSuCOxgJAUorMSHRR+ndogr/69LRQsKME
	 qlRpSJMV3Xx/HosQJeeELE6ali8u5Mf1PvyzzCI66JTebKN6ira/rbd0Laa1p9KWbP
	 EgbgWKtnWpjaUj0P/hNSMS7yr/oh1Dc5kMIjAABW2iT13tNtepy6PbQ1wlBteNdFYn
	 O0/83qHBLdlzB0YbAsnD+GTRDSNVGoPkD9Zy11TvAW2D8Oe8sEOIjVK2Ib+S6Y3FqY
	 dTJ/twbC/QjJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5901C608E4;
	Sat, 14 Feb 2026 12:20:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CAD0270
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 12:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E69E40AC0
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 12:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1n1nXuEfdhMo for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 12:20:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0673E40AB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0673E40AB0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0673E40AB0
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 12:20:05 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-659428faa2bso3045372a12.0
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 04:20:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771071603; x=1771676403;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g8MEPSgqq68tO/VcsDSpVOTwBIcmTzyyquGiC1RSG14=;
 b=rL/Dl1PU7/864GCxaPjam9tKGHQmaQNIQryYVoQzHHjCsMK7XTFrij8eej/+Uo+3Zw
 4ujXpNYY4NJ5KBBv7pmfetxzgbZ1aZ1FZfO70FoJclrtbo0nB0ZaX+sQUnAIRbDCd6MR
 6oUNwCI1I0t+s0SPgk4iGmAkVYtas3hhxrybbWA0bk3tqoDk09wIZw1nPpBtbG7i11tr
 Ht+x0Aa3WCT2OVWzuSB/+NYMEikv6LSwJEBoCdUIiQkPZNyoKnW35QvgQNdALhzmWRBq
 8aeMFLdw6jo1kcomIMwxtyhWgi/xORbW5AiNff9VweD/MDE73zVzUfK5JKCEqYLWzmzY
 4aJg==
X-Gm-Message-State: AOJu0YwSHmwjSC4lUWWW2YwLwy4VWiWP/Q9+RpnO0yleCR8HBioIMCwW
 YeIc2CsInGaPJiq7r4VL2tnZYrSmspVShIdKzGh8bk/Vzhu+x7ypF87ndi/y
X-Gm-Gg: AZuq6aIr9EhLZy29m3oR6cUBrJEIQ6FBzKylYWUwcNPGPogBqyZz2L8Y5z2yTiXTeML
 MRVmvnNgQn6LPTV/vZsrc4QNceGL9LIUEtoy9ogE+SldL8Hk1Gva1nAqtCZkGWbIHH1uGBFTtaS
 dn39EvwJLCIgEydWmM2MDw3xFKhYvb80rvTmZDyqlpdTw++FI8RzQ0IMsJzSf5Zni6ag67jXgtR
 tijsm/LDE+teOlTLIaBCLw/m0Y9TNQsseM4cN0b11hNY6ZtD1V62yKJ2QDg04lIE7LRy4kxAWIS
 VfAu4xcL+SFMntOl7Kd3s0UoC78c3lq3/TA4IZ9rBVyVI9lL7YqJXgLbwUukgVeOtvABgOXw0Us
 tNXc8jrytlbBJk5VK1Qa1T1F8mIIZc8u80CZUG+Dn/GNUTPNfEwl+T9DsT7FhI8ZOSMRCLJRg1b
 ZcgHYSrhu1grlWKWAbZvaYYZjhdnrlnpqKqnBRylpK37h61Dmc
X-Received: by 2002:a05:6402:4409:b0:64f:d03a:9af4 with SMTP id
 4fb4d7f45d1cf-65bc784b0d8mr1221051a12.3.1771071603190; 
 Sat, 14 Feb 2026 04:20:03 -0800 (PST)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65bad2a9d1asm1240751a12.15.2026.02.14.04.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Feb 2026 04:20:02 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Sat, 14 Feb 2026 13:19:32 +0100
Message-ID: <20260214121958.212935-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771071603; x=1771676403; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g8MEPSgqq68tO/VcsDSpVOTwBIcmTzyyquGiC1RSG14=;
 b=Cq56i0Akqf1LtXZw+uQ9aXGEuEg/KiRu1P6wL+LbkRWMVxmkrNbK4eMmJZoGw07SAW
 iUY0cl9pJSTfdMGQ8pXJouIgmv/QkSMyw40qsFw296wdHKR/U4RbIczrldomcK+eADxK
 0fbinvxEgeDRIki0qMAPoY5uqOObmu1eHlqXteFNIHL3cGQBjT8Y1WAWVp4h1Y/c3X/n
 ZqbzoNQVp0pD2H/W1oHKaoQmPcjXD5HJvJ26z5hF2uVygfNBlfbT/r2otSnkWjFGVSj9
 BvDmQKHAM+5tiv1XE+y/9RWFGNPRLqQphm41y2/u/B1mwl1Ogz5hQR8bDQDtd03j5r0v
 rgQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Cq56i0Ak
Subject: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.55
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

Changelog: https://github.com/Canop/broot/blob/v1.55.0/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index f2a5b59263..e8113fca1f 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  e41a6e9c9bfac22ebbc55c7af1cbfeca08ce68d6a9935e05da5f38d224edb245  broot-1.54.0-cargo4.tar.gz
+sha256  4eabb24bd95af9f7ecf52e68b02d2afedc631bcf059f5fc8354c09a0878bcc0a  broot-1.55.0-cargo4.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index f8043ee02a..83b2e3443c 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.54.0
+BROOT_VERSION = 1.55.0
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
