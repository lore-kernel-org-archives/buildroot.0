Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46FAC46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 10:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 598CB813AD;
	Sat, 14 Jan 2023 10:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 598CB813AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hlQYm5-oVzah; Sat, 14 Jan 2023 10:49:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DF3B8137C;
	Sat, 14 Jan 2023 10:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DF3B8137C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A63221BF419
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 10:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FF84414CE
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 10:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FF84414CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXw_vrCH2gzu for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 10:48:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1569E414C4
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1569E414C4
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 10:48:54 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id vm8so57720352ejc.2
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 02:48:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p4Ders+Xx02yLx+e2fY4NNFxVaguZDTgRi+yjEOuVzs=;
 b=om4x/ver5+y4Rqkv5syM132XPSMx+oe4HDuuDiunSuUnvDj4OWjmh2cJbPumKiStxG
 GZeF0h877rF35wjnQB3LR2PC8pdXkWovE6fDZ4rqOJWA8ZduLBXb3FMN/UY/8/EJH/MC
 mdcTwFz5C3nHABfEG3/cIJQr8Kvt/N60RA4eDbrYGy3+6WnxsXMwX957WLDsfbTE7aHB
 qGB7z8aL3f7aegrcyFkCKCiKAAiqvfHODL6oWErlRMGQhJp3+C5Fjngvia7wJBpUca15
 UxkOqdjUUYRDNBqNbgsB9Jc4QZZebg/UudoD20NXs9aYKZe6y2tMaZEPvvSmxEm9X9ZW
 r9xg==
X-Gm-Message-State: AFqh2koca19mrxRu7cDXkVLn60Ytf2JhIEBADzMHIYjFEJ2/jRUjhF54
 PrSl3OR6MlLZlpJ794h81lQ/tBR7BNk=
X-Google-Smtp-Source: AMrXdXs+Xd5oibKZRJSWnelBX8LQOpf3ZEBbAieHEA+exMwwYDLO1zFrNm8oVPlFHDMpLvQohff6gw==
X-Received: by 2002:a17:907:d506:b0:86c:e07a:3cd5 with SMTP id
 wb6-20020a170907d50600b0086ce07a3cd5mr2054080ejc.15.1673693331459; 
 Sat, 14 Jan 2023 02:48:51 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 kw4-20020a170907770400b0084d397e0938sm8138825ejc.195.2023.01.14.02.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 02:48:50 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 11:48:32 +0100
Message-Id: <20230114104832.12702-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230114104832.12702-1-heiko.thiery@gmail.com>
References: <20230114104832.12702-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p4Ders+Xx02yLx+e2fY4NNFxVaguZDTgRi+yjEOuVzs=;
 b=jaEBX5BbTvgNugnKWQT8FKqC4bsPXTLX9BZnqK9akjZrO1aY8gXNJRHaET2CsNwu2T
 +kSZ0we9ki/7EmNxWw4PFSILFyIry1W5hlA7FLk9fyFCeSwOrl4OTaDknPsWj9kVZX+s
 c4+MoTYE0WzigU1tVlwoHdkKVleS2BiW3qJsWB8jZOrtre5zYJ6Nx3Ie5VYLeVqCT/75
 sS94LTNiTub58n/eyWgiVLnafESXH6uaoOGgaACwmcR8K4sukAe9zmEy9wNjT4XLdlGG
 HL+onBRXcziQFbDrr4b3fjDBhzjbwUhAFwMe3n3IFwU3Inj5syYlnWv2iHvu0wDBX5l2
 +luw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jaEBX5Bb
Subject: [Buildroot] [PATCH 2/4] package/libnetconf2: bump version to 2.1.25.
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
 package/libnetconf2/libnetconf2.hash | 2 +-
 package/libnetconf2/libnetconf2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
index 001a51d682..34e934089e 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0b0f0c84291710b0ca2497e1e02504a5ded7b83d49deeb4992bea7936e1d74b9  libnetconf2-2.1.11.tar.gz
+sha256  2f1a6559e8e43ea18ea337ab5f194f8443695c7ab4dde5d7b2560603f9bf702a  libnetconf2-2.1.25.tar.gz
 sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 6aa9aa9498..0d4294d8d3 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = 2.1.11
+LIBNETCONF2_VERSION = 2.1.25
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
