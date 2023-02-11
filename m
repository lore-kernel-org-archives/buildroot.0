Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0637C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 10:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73D0640C0F;
	Sat, 11 Feb 2023 10:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73D0640C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yoEF_h_XAk1P; Sat, 11 Feb 2023 10:52:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D7C4403CA;
	Sat, 11 Feb 2023 10:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D7C4403CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA0241BF59A
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 10:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAE6041897
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 10:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAE6041897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jVh-r_bTH1qr for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 10:52:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61C214188E
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61C214188E
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 10:52:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so5802449wms.1
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 02:52:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HDpz/FB7oDbh1fdP3/mEqmwS6q467CMt0IJRcCrygOo=;
 b=S3qtdYP34ONHAw9OYIXeCWa3JtD4DbzQ7T+cKMVL3XlDzUuQBz7xF1GJKTMPhnjKte
 HlEvHNLESpK1lwI5rl814oPyvgUkKUrwmMBEs1LcSee4Y1ubSSkcfbhu7hJUp4OzSvhc
 76eZ3FxpM7hznHYzvE4Nh0TOLlFwN/pFBUEqNU1p/z7ozeWcxDF/oTPV612v4srhkBBf
 Yx+c2etB9xYof3U+4t3jSizS6j3435/GSmqJIJnthMwck2FP/CDEc8oQ+MRxXUEp4GAM
 RehQlivqYOAY4JJM9t8iJ2mGEZjgh3Q9kEw0e6UCw5Uix3Yns+DqtAhRYUamjw7n3oha
 rk0g==
X-Gm-Message-State: AO0yUKVaX55mjQgSCKgCYYcEKgfGQHhsdOu9NBIsQudCFfFH5ph0eRYf
 aiisgl5DgCkQgaLOhlEvXabGEkX3AwQ=
X-Google-Smtp-Source: AK7set/wBPFKFTp0pEry4xbNM3CW+8cEklhXuGuGAwnEMQk51wv5cm9pVMU4+YOdcd3nZCLg98lGhA==
X-Received: by 2002:a05:600c:707:b0:3df:ea9a:21c9 with SMTP id
 i7-20020a05600c070700b003dfea9a21c9mr16553131wmn.27.1676112764251; 
 Sat, 11 Feb 2023 02:52:44 -0800 (PST)
Received: from localhost.localdomain (1-1-22-171.ftth.cust.kwaoo.net.
 [171.22.1.1]) by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b003dff870ce0esm11963447wmq.2.2023.02.11.02.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 02:52:43 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 11:52:42 +0100
Message-Id: <cover.1676112761.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=HDpz/FB7oDbh1fdP3/mEqmwS6q467CMt0IJRcCrygOo=;
 b=OR9E0lJi5UTUHEVbo+3upgwp3scUpeXe7T3uDjCYaXRXJDME632H85fZfli2aEbm4o
 ZVrpzHg25kmAGpwlMYSgslkeqjOGYvHL8yXZ6aFHaQ3M3cx4YQl5DuqSG7zkUgJJU7rv
 cnXCetCWfMPt//xVz81QxIk7NVZaJHKvsbBunyEfveh2lpI9l2mlBwJm6hU/wiCHJVHK
 xRX+luSSA/Cpg0iXBEUBYgKSAXm5YlOXwKlkYGnYB24itIeMWfERS7U6MK5ZFTnNePO1
 IYecOaVhwFqIWQ8+M7FrOwE+7X9JyznxxstKM36ph8mqebS3NmuQG2YB9225vo+QT5k5
 Scug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OR9E0lJi
Subject: [Buildroot] [PATCH 0/2] br2-external: export list and versions of
 used extrenal trees (branch yem/br2-ext-name-ver)
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This small two-patch series extends the information exported about the
br2-external trees in use for the current configuration: the list of
br2-external trees names, and the version for each. They are available
in Kconfig, and thus in the .config file, as well as make variables that
are exported in the environment.

Note: we'd have liked to also have the origin of said trees, like the
git origin remote or such, but that is far from trivial to extract.
Indeed, a br2-external on a git tree may have more than one remote
configured, and may get checked-out from a hash that is reachable from
branches in more than one remote.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      br2-external: make the list of external trees public
      br2-external: make version of external trees available

 support/scripts/br2-external | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
