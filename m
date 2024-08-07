Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BDDC52D71
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBC4E608AC;
	Wed,  7 Aug 2024 14:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7S7W_dKq-mQ; Wed,  7 Aug 2024 14:34:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB644608CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB644608CD;
	Wed,  7 Aug 2024 14:34:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0481BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EDF7607A7
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56lggJkOCbyI for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:34:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8CAA360703
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CAA360703
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CAA360703
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:34:23 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f15dd0b489so26206141fa.3
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723041261; x=1723646061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+C+JufP7byIupoTUNHTSx48LWpx8sefThxRqsETkUCg=;
 b=GtUw+5BXIGka6oRpPJoi0dDywHW4yKWrBdGqr+fN6ietse+aiX75fp0J8K2sG2hDu9
 yk4x0sUtv4SRv+rTLp9uAPd7ffI2DCSMcp6oXhrDX6QcgipPd03JFuWLNasSpqP/sr2u
 y+kaLGsxaLMjRFNVNVrNnPwI0bMD8p3M0y7tdmu3J3LVsbsDrmVu3GkKbVpvNDBT1dek
 dj07HPJJoclxkQDWEIuI4w3XdHcoBh9kKrNUSfg391Q0gR6nLZyT2mkIII8riuJsmxx6
 u8W7zRd8W3rUpJa4mnmHon6td0GxJ0t7/sNs8ZuiJdeRB5LMTPgAkfIEnPMmSJQcrJ3f
 vHDQ==
X-Gm-Message-State: AOJu0YyLI7BUbw6Fd926NAIFZBA959kQonUmM5fX5cdwBNZRLG8+1xoo
 uArqGZiaH4/mudQOOoYrJJW2vWfzPfndaaYRy2Lmp4+9ubwxwBliXyx3Hw==
X-Google-Smtp-Source: AGHT+IGJQlJZjHF19WT1gnqXdPXnShguWmdG/86qTEmbcTGo6XN34eULJPDjUBYbNeLiq23SNhjMig==
X-Received: by 2002:a2e:b60a:0:b0:2ef:281f:ba60 with SMTP id
 38308e7fff4ca-2f15aaa71c9mr131049171fa.20.1723041261025; 
 Wed, 07 Aug 2024 07:34:21 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:b409:e7b0:306e:2d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905796a29sm33289995e9.10.2024.08.07.07.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:34:20 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:33:04 +0200
Message-Id: <20240807143318.439619-5-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807143318.439619-1-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723041261; x=1723646061; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+C+JufP7byIupoTUNHTSx48LWpx8sefThxRqsETkUCg=;
 b=hg+DZvabhs8X4SQtZCgkyLeggAyJX0BDS8mwR1XOkZunxPhE7NuQOYsXozKKv+EmZo
 vk3tUoZVx7KfhNiq8g9e59WPYANkArS35hHQglgVhYsmnGxW0rHgiJoCS0MPosk4wEpz
 brjGuYmac4c27VpvZpcbC9qkbEL7vpm9BNtG3iAAN6iNDA2SxcfVTcfJXdy/IzWB6m7T
 1QH8fJ464YTfqg+/FG9bNf+pUm/uU9aT6Wic1Fkug4hcsuwnOdxQiZevI/SGQ6NCE0l5
 K6ecNpgpbAmJMlBmu7hbcubZMv7IYvzn6nveqXbz1+B12P9a9YCVNZY2h/aGOyxEEwro
 RLgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hg+DZvab
Subject: [Buildroot] [PATCH 04/18] package/erlang-p1-utils: bump version to
 1.0.26
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-utils/erlang-p1-utils.hash | 2 +-
 package/erlang-p1-utils/erlang-p1-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-utils/erlang-p1-utils.hash b/package/erlang-p1-utils/erlang-p1-utils.hash
index aa8d25bfa6..7f5d213693 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.hash
+++ b/package/erlang-p1-utils/erlang-p1-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c62f93ab5ea8d9251d9acda2abf576352d50f4a3299972549180a5387656746a  erlang-p1-utils-1.0.25.tar.gz
+sha256  bf00dced9f892ec5972c0ff4f9861b391cbffe1a763c73dcfa622c500a1cc55b  erlang-p1-utils-1.0.26.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-utils/erlang-p1-utils.mk b/package/erlang-p1-utils/erlang-p1-utils.mk
index 8b00ee1462..fd9a8f1684 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.mk
+++ b/package/erlang-p1-utils/erlang-p1-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_UTILS_VERSION = 1.0.25
+ERLANG_P1_UTILS_VERSION = 1.0.26
 ERLANG_P1_UTILS_SITE = $(call github,processone,p1_utils,$(ERLANG_P1_UTILS_VERSION))
 ERLANG_P1_UTILS_LICENSE = Apache-2.0
 ERLANG_P1_UTILS_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
