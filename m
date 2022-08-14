Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BC3C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 052F4410A5;
	Sun, 14 Aug 2022 23:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 052F4410A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RccwiM7dsXyH; Sun, 14 Aug 2022 23:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E146C408A9;
	Sun, 14 Aug 2022 23:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E146C408A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 640EA1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F0C960C09
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F0C960C09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5fUW04fSvfW6 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:40:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83735605AE
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83735605AE
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:40:39 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id 66so5849743vse.4
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=poj+F+ITXPK7//qoFY53spX3NBGgdpVkLUwQkK1XzOc=;
 b=u+0B/X05yZlpxxKZQpJgRT0VmUReMIx725ilUpj5WlsKnUsvEgVMejTbTHYozohMNk
 6l2xTZXlRYuygqLc0FqBXrBn2roB769qqOJSX205j/pcm8HrTvge4r4DjObdSX1N5px2
 P5HbWckkIoi3XgR/DiieZWTFLR92zPVPgdG5big1nU8o29kl2eC0oGjzaMo/nPQmJiPK
 gkyvMw1rUdMoxI0KQEit5rN2yeW9NOx1/WLRCWUW8amv1raFd6etEPc9mrRQ/n2ChSO7
 SBv4bSdoxoGmPbQHuIeVHARCQi1EJ0pRWd03L2DHhYmSoWvZb6dc1aIMiVEDSqp68cVb
 0vMA==
X-Gm-Message-State: ACgBeo1J2+SZl8Dpbn8t6hidAvk8P+CTIyuvCfFxMYvQVHgeoD0i26rb
 vBQOBwxlPHcbv6q2p6gtuTaXgTzorOA=
X-Google-Smtp-Source: AA6agR4frG77xkNYIKZCi48RLJ7T9ebCscircT//8pVlF7qY9EzpkPQQhTo33XAkpqG7qPLe6jSuLg==
X-Received: by 2002:a67:ec82:0:b0:388:fefa:2467 with SMTP id
 h2-20020a67ec82000000b00388fefa2467mr5409304vsp.67.1660520439218; 
 Sun, 14 Aug 2022 16:40:39 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:40:38 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:44 -0300
Message-Id: <20220814233845.2247022-33-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=poj+F+ITXPK7//qoFY53spX3NBGgdpVkLUwQkK1XzOc=;
 b=EZNdGrU2iE8kzoZYeePxpUc1Toioi3CbW+4a2rPCq4yYFS+3r76QKraIrzlmsnR0iA
 jEpOK1A79OxxQbrU5pvFtvzjL47v1qhL1mh6bK0QKiX+M1qZc3k+u5zhBd+4LASt7wq8
 LuHGlgVAhdFeOmgeh1rmLjQTk3hqAHj7HvO+gANDJX1fnQSkOLLpQ7+O+qL/ux4vRMkz
 n5vINFBAtsjLaIhvanO/ot5H6KyC3/lvhd+/RkUvump5CzuN20miiW8uY440yHlFG8JU
 ujLnXfRH/QolTo/pr39O1P0Vl/EdKmHa0ycb7zdEJJdhBPSsImEGmGQtON5wI+kxvSX9
 oOew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EZNdGrU2
Subject: [Buildroot] [PATCH 32/33] package/python-pygame: drop bogus
 BR2_PACKAGE_PYTHON_PYGAME_MIXER_MUSIC
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The symbol does not configure anything, so drop it.
It was added in 2012 by commit 'dda08e492d Add pygame package'

Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/python-pygame/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
index 0a738527ea..57eb020742 100644
--- a/package/python-pygame/Config.in
+++ b/package/python-pygame/Config.in
@@ -41,12 +41,6 @@ config BR2_PACKAGE_PYTHON_PYGAME_MIXER
 	  pygame module for loading and playing sounds.
 	  Will autoselect sdl_mixer.
 
-config BR2_PACKAGE_PYTHON_PYGAME_MIXER_MUSIC
-	bool "pygame.mixer.music"
-	depends on BR2_PACKAGE_PYTHON_PYGAME_MIXER
-	help
-	  pygame module for controlling streamed audio
-
 config BR2_PACKAGE_PYTHON_PYGAME_SCRAP
 	bool "pygame.scrap"
 	depends on BR2_PACKAGE_SDL_X11
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
