Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF6DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 15:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3376A607A8;
	Sun, 21 Nov 2021 15:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MD8a9zOG1ifS; Sun, 21 Nov 2021 15:38:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C84260775;
	Sun, 21 Nov 2021 15:38:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D161E1BF38E
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 15:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF9E34017A
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 15:38:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RdgV6UtZhak8 for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 15:38:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8802840010
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 15:38:12 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so2636604wmc.2
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 07:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SRuwc/7CWVz8Xo7h3r+K5xF5AWZ5L1IL262bre0wk0c=;
 b=CHDOqwCIKN1IetPt/rty4uYjsfm0RV+uJL9BZ8znSNWu6+aESDoThHyizI8jns7F9P
 DbCTgkT9NhBJ+3BITgkurfcBpK4EH+RGhJtbnYUu/jMWp5z3Y+VAMO1TBL6xjJR+3tN0
 TGUa7dPiy7bqbO6acgRPTVLDUZzIY7ejgEQc2nOjfFMqnCm7pxgkEZBtrLj+4QDK2/Ld
 6ZDVe/Q7kDDGB3sArqky9fZzCO6+5PAYXR3sIIMKyHf/s46/aYTeZZOMSzCIkK/5O6+0
 8z+ohYHK/exkkIOjgD4ikpT7Ls9vGASuW3HR0d/SSQ11w1tZyi2tajqA949FJaAUbS+K
 SIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SRuwc/7CWVz8Xo7h3r+K5xF5AWZ5L1IL262bre0wk0c=;
 b=3l5vpS3IVua5DV5AUVybHTnymr8uGCvY30enk7OQHLK1aKFgBFHYWkF2SqwrW6DbYS
 F7jD1MVTmw5YWpBI9Egs7LZN6cKTFhnzR3GWSLNEeVO6mtshWi5Bzer3qJoLNp3Fzwwu
 liuVJkEfHqrgiv25l0JE2BlViEwZtsNLFztELNitcarVwPVv0BqDh09kfmWO5P5eJTGS
 mFJQkSAvJqJM7l5Cp5+S2ni/D9G4CAsvRyH7X216oOexyfCsvAL6FWC683Fr/GOc4r26
 MYhVSpuTivrLX10J1p/x5/5wq4jVb24s1OHvim0nXCqs2Nwv9gLNfwEDdUmqvpv9IupR
 9Trg==
X-Gm-Message-State: AOAM533Xra/W+rW7wteLaorlYcoiKw6euuQmN1487bLf9tvdOHZHQWfD
 eOBKS2/sTT58dhO7EmZ7rj9iYMJlZ04=
X-Google-Smtp-Source: ABdhPJyuZRTNFjMqUWQtHA9PYPw+skBfnJCB+zrqaikKaFz8heQ2eEGd0kPLyLcog9Y9QC0s+J6mpw==
X-Received: by 2002:a1c:7405:: with SMTP id p5mr20003281wmc.152.1637509090343; 
 Sun, 21 Nov 2021 07:38:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id t8sm6062844wrv.30.2021.11.21.07.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 07:38:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 16:35:26 +0100
Message-Id: <20211121153526.3435455-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/smack: fix
 SMAKE_LINUX_CONFIG_FIXUPS typo
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typo added by commit 2bac81f0cb776aca8e575459d07158a8d958737d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/smack/smack.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/smack/smack.mk b/package/smack/smack.mk
index b7b656e644..fec3ef98c9 100644
--- a/package/smack/smack.mk
+++ b/package/smack/smack.mk
@@ -14,7 +14,7 @@ SMACK_DEPENDENCIES = host-pkgconf
 # Sources from GitHub, no configure script included.
 SMACK_AUTORECONF = YES
 
-define SMAKE_LINUX_CONFIG_FIXUPS
+define SMACK_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SMACK)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
