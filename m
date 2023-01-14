Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F7AC3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 10:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F5914154D;
	Sat, 14 Jan 2023 10:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F5914154D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o1ODO5CmTCTe; Sat, 14 Jan 2023 10:48:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F436414C4;
	Sat, 14 Jan 2023 10:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F436414C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 958581BF419
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 10:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E892404D8
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 10:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E892404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N14THR8yyZ6e for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 10:48:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A736240474
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A736240474
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 10:48:46 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id v6so14722089ejg.6
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 02:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QDaZaGnma3+3RJEVGFWMdCdXJ2F9FUy/9P6UTRQh8yw=;
 b=SD+3IGUvmUB+FkWH/MSLNcxiXkC0UqbF+K2rTO3PcVH3I5MGFq3wXrkWiJcR9SiKUL
 xsgEPf3hNjZy03ZgZC0fgHJ8WUgZGKg/iQLYAsydl8W0FOIE0fOy12fB5ab0ZXn2NcHB
 HA5j3ewHEGgvi0F7DdC+BQjfJSIelJu4WYYAqVPTSH/pETPRSIoeLa3ZU3KANilTBwL8
 kjLCojLUBD8LlmkeWabauYZlKukFlub4Pb/5NsSzAWa9MBILAowVlAUdQIRuU7R6GaVQ
 fuM+5m4dYAvpQ0W2NaAB1dlz/OQuwO2rwvyJDctNDpOtrc8HO2QDECc4vq5EQBB62eVo
 brRg==
X-Gm-Message-State: AFqh2komJM9dUGgGCi0BFBa5VKAkUeRM4uckaqW9754XyRJTT948jkAl
 wGdTarF0bmvrUR+sElaZ5Db9CGIIeLg=
X-Google-Smtp-Source: AMrXdXvxleAq4P1ZbHHzuEPs0sgL6R8W3BkZabRjpnwx1cnHkLHvUt2XQjjR2zstishVyT8pdSO8Sw==
X-Received: by 2002:a17:906:850c:b0:7c0:f44d:984 with SMTP id
 i12-20020a170906850c00b007c0f44d0984mr91618667ejx.74.1673693324014; 
 Sat, 14 Jan 2023 02:48:44 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 kw4-20020a170907770400b0084d397e0938sm8138825ejc.195.2023.01.14.02.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 02:48:43 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 11:48:30 +0100
Message-Id: <20230114104832.12702-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QDaZaGnma3+3RJEVGFWMdCdXJ2F9FUy/9P6UTRQh8yw=;
 b=NoyMIs0JVyu7FilEwfkt/JPHTli+K+j9l3B4ve4bLIfuYc1IUdywg4CNdxsHHnKxYQ
 lltw+EzfgjI0ilfUiGc4JQa3DzlCMcwxYrq5WrK2sdWqLKjVsMLbkxGX+Hu0CfTE5rit
 I5WkFaGOlqcfc0zR9PSTAFQDPY8l47Kqndg9Ew6Bg+kdogb2/iTJlhFFMUa6HxMIuWqq
 uQ66xSLuKkT1exrLeyE/KB3MbGLZSmQMq7KAfRFPUn4jH03SzcwVUNDJ4Cs2MSkG9kfj
 6SWOkAtBnDWzjNZplz3eAT7J+XekPc/pZtvXXO1kDMgYEcGSk245VswiE/mm6GNXFryC
 Lmng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NoyMIs0J
Subject: [Buildroot] [PATCH 1/4] package/libyang: bump version to 2.1.4
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
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libyang/libyang.hash | 2 +-
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index c064c2e69c..da8600351b 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  94898ee391c238dcd29ff21092e5dcab4e17b9623e88862a55b72fc6168846f8  libyang-2.0.194.tar.gz
+sha256  f30ee1c3e13f0c5d25c4d2fb628e4b262b483d0a500464a7c12008ccc393a69e  libyang-2.1.4.tar.gz
 sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index 36f452ca07..6c57a2dd42 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 2.0.194
+LIBYANG_VERSION = 2.1.4
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
