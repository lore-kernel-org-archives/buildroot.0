Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8221DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 22:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 153454021B;
	Mon, 29 Nov 2021 22:41:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HX8OH0uyafLD; Mon, 29 Nov 2021 22:41:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F42A401BD;
	Mon, 29 Nov 2021 22:41:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0DA8C1BF384
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F06354057D
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SQBNsEVfK9bn for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 22:41:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5294640561
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 22:41:13 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so13431506wme.4
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 14:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WgONXFQZjZNh9HLf8XRRT2jyai1aSlWOAzlrQlkFHYA=;
 b=kCzHxs516TpB23Lg4IXQvTOKGWzrINFzJZqxHyVdE83LOBGtYPPdffp5OctPBcGs6w
 amvupDdfTmJkgwVRWhkIKRrzJSI50EXTE6Gn8AZE8G+QyY5wbpQFTi/bMIKmKB5B7UYe
 jgUYxImatoNrYO6XIsoHSwOMtwWUfCc8D/2NH/SKWaMgEtygKqp6hs2b7ZmR/Kag05IY
 OkCPEpMZdgQZ7qG7PB27tHcQCFfdntFwCLF0EGEi6bXZOCWKYz6/Gy4n1MpJcnuR5stJ
 N3EKxZw6rYPfpbiAK5CeFekzh45C0g/ITDmnh+krmn7B7J14hldbQqFOsq+WbOaPbSY3
 G4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WgONXFQZjZNh9HLf8XRRT2jyai1aSlWOAzlrQlkFHYA=;
 b=6PBrM7SQhNL374jOfzxav2IfAUt0M0RgS3XoCy3HyCvDB0TQhcA3gXsGhFftxafeIO
 NYYpJfcD9tVgiUkXpuAgbM0uM9fr83ETW/jbLOyHTDO3HlR9dSwkaRosXqDP4bBvI4Ua
 /n2XIaw52HUsluHZRiDe0wuN5nIpjDBf95FNjs8bm88gzVUZX3v8oTPUj2EEpB+Rh72c
 +bUFBpNadhvhCrwKxPmXgz/74ycl4C552PDdrKH0jBX8X//MRnaf/Ubr8pBcUvwminIh
 f4i4FTbIj0j4uhbPhkiVJzO/unRWvH4TC8kQS/QIdmV9yCnncsWgtwLCBxjXuKT+JWp6
 HfQw==
X-Gm-Message-State: AOAM5323UF4XcmrC20mVz+1AUiC+b8pyiUDvJkT39bEITZNmOs0U5HV6
 +8LYv/LOge3AMdpLHVABoEYrnbj+yBI=
X-Google-Smtp-Source: ABdhPJw70OiUO1lVtKjwk+KV9/FNGPuzhTZ+rSvpVx3ahht9pA25D9EiG6hGc8ei8rvzhioDc0yXyA==
X-Received: by 2002:a05:600c:1e87:: with SMTP id
 be7mr852179wmb.182.1638225671424; 
 Mon, 29 Nov 2021 14:41:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id m36sm604113wms.25.2021.11.29.14.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:41:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 23:38:37 +0100
Message-Id: <20211129223837.2186800-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/flare-game: drop spurious space
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
e930a61c21f4d7e4fd0c648c382c54ff3b02a03f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flare-game/flare-game.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flare-game/flare-game.mk b/package/flare-game/flare-game.mk
index 4bebc79595..d65e3d6c38 100644
--- a/package/flare-game/flare-game.mk
+++ b/package/flare-game/flare-game.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FLARE_GAME_VERSION = 1.11
-FLARE_GAME_SITE =  $(call github,flareteam,flare-game,v$(FLARE_GAME_VERSION))
+FLARE_GAME_SITE = $(call github,flareteam,flare-game,v$(FLARE_GAME_VERSION))
 FLARE_GAME_LICENSE = CC-BY-SA-3.0 (data files), GPL-2.0 (GNU Unifont), \
 	OFL-1.1 (Liberation Sans)
 FLARE_GAME_LICENSE_FILES = README
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
