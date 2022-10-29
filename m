Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3A6C433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 08:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFD6F403C8;
	Sat, 29 Oct 2022 08:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFD6F403C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WtcYphLcdWGa; Sat, 29 Oct 2022 08:14:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 079D8401A0;
	Sat, 29 Oct 2022 08:14:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 079D8401A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 256111BF348
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 08:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0125740297
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 08:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0125740297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WxDLBHOMJnva for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 08:14:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 276B940017
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 276B940017
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 08:14:01 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id t1so717279wmi.4
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 01:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JS5dcu7Wsm94JJf6RdQTOe444reqHoDdYChv90m+GqI=;
 b=OCupCxyWnWzwOySkO1dyzO95WHUk7k7bH5WbEkme58XEB7IelIACWM0b3AZBDl0Fhn
 mwcuPOZ4KGUsPqO3gW8bNpQT8d43kXzftSZce+t/CBYIuvLqVuSVhTlG+yYWFVXgG9Bh
 oVbNjerNbvZfiZwJMHVieFF5OmnTDLdiQ4GcQYHdrvLln6TIcnQF2yJpdOtoUtQ3KK5e
 QJxYflS3sskMIV9r+eSIXLB3sw5ysfWdb8RlAlv9VELFsw6aZu+UvNS1v0nGEqyEaIr7
 Emgx3TpXPwQcUWjyHG/vb89AaWgSGNwAQXUMiudfU4FtlmV6WeJY4NW9N0sRMfY1Iq1E
 SX2g==
X-Gm-Message-State: ACrzQf0HegnBm3M4n9iqGvs5VdMvO7FqwlpHYNaF5c1co0a7N8Ddje2w
 1/RwDR2ZC6hr7yGTzf+eYjeLwlpxHxQ=
X-Google-Smtp-Source: AMsMyM7MLXY09AF1sUVL4mJew76O48D560zkuhtC63Uca/Dlf7kQQmP5BT74en81eIuk0NTzrLGbgQ==
X-Received: by 2002:a7b:c8d8:0:b0:3cf:691a:c4b3 with SMTP id
 f24-20020a7bc8d8000000b003cf691ac4b3mr392817wml.120.1667031239647; 
 Sat, 29 Oct 2022 01:13:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b003c70191f267sm880636wmn.39.2022.10.29.01.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 01:13:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 10:13:07 +0200
Message-Id: <20221029081307.36714-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JS5dcu7Wsm94JJf6RdQTOe444reqHoDdYChv90m+GqI=;
 b=qnoP2Zyf60JzeVhFUG6MvvQq+fPNhfbtqgs8xQJeqaeAF72g6r03ZfMOmC/5VHjGwb
 BbIGB/tHUCdt9LrsQeoqbmIYM+B6i3owAjLq+r4FqOpA1vqRazz/uyDVLQZFE4OlKm3I
 dmPV7fM2vKGr1EHJ0AJigGzu82LAS7PlGqtfeuzSJ9dbCt88BVJRo7QTrZvTdCW2X93O
 tmWDISuCe1avpANLvCwe1LW9spbaFZpPhb5e5sInJbG6+2GR5Gu6D7e445MLooI8WT9M
 vsDf3u7UODo2mkE9bJeYyxpUf8UsO77lEuuApjv76ydZKTK4fkPvn62ub29P+eElrOWB
 4oEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qnoP2Zyf
Subject: [Buildroot] [PATCH 1/1] package/zsh: security bump to version 5.9
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
Cc: Phil Eichinger <phil.eichinger@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Security and bug fix release with several feature additions.

https://zsh.sourceforge.io/releases.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zsh/zsh.hash | 2 +-
 package/zsh/zsh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zsh/zsh.hash b/package/zsh/zsh.hash
index 5c661ded25..e04aa388d3 100644
--- a/package/zsh/zsh.hash
+++ b/package/zsh/zsh.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b6973520bace600b4779200269b1e5d79e5f505ac4952058c11ad5bbf0dd9919  zsh-5.8.1.tar.xz
+sha256  9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba10ab863842d45acd5  zsh-5.9.tar.xz
 sha256  d06fdf3ef9b1ec69d6b9e170b0a9516fbad3523261ff1668bde3bfea6e0ef5f5  LICENCE
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 8e6f713780..e790bf4c5e 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSH_VERSION = 5.8.1
+ZSH_VERSION = 5.9
 ZSH_SITE = http://www.zsh.org/pub
 ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
