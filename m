Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923E4C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 348144185C;
	Wed,  9 Aug 2023 21:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 348144185C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Eg0Lf4fnrdj; Wed,  9 Aug 2023 21:24:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20CFC417B6;
	Wed,  9 Aug 2023 21:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20CFC417B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 096131BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D721F83A6F
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D721F83A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0YNs-c7Bf_rR for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:24:51 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEB1A83A67
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEB1A83A67
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fe12820bffso1775675e9.3
 for <buildroot@buildroot.org>; Wed, 09 Aug 2023 14:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691616289; x=1692221089;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JeTCaUEJF3yYvQ+DxDtKAUr2tfWMtL9fSVCQxNHAszY=;
 b=AHHPE+GxYLPMghsmSbogkL9Zk0BCXiVa7LSGUYXqJ5PdyqvXUy4r2EvKr7QhYFBGrD
 w5szcWEsJBepFf2GvShnnYM5SU3q3TFliMBIX7g4IfCfuxdSkCMABXA7M94FbTUZvj4C
 K+huxUrFJrGuI0dUQJZLgMOJx5lBolsv9Hy34Htzlc20A9F89UCyWLLdGdlKJHS9kE1p
 znlISzEiqqaafv0Hvc5Qz9/1t+1fDdbKWZKvkzD/MU6gA8U4Ey95KATuJV4IM3L0tlOf
 sh4Z4RrtO+CTHIuv5WWNE8RQhQ0wB78YYlEfO45CPuIm4IzKjI9swc4/qWLrUwszN9V8
 lEYA==
X-Gm-Message-State: AOJu0YxcKDELaHkOC1gXMnksdO8VUraF19+ycMDkDoT6k2wnz083cTFu
 0wNuz2V9bR4w1V8MriZ4dIcAGrMzXk0=
X-Google-Smtp-Source: AGHT+IEZrhTxJ0S0GZpj7SQSSR9n8YeRmWH/bmzU7nBIRwYJOG2RCrK4/e6qaT+szuXlQ364/1v7hQ==
X-Received: by 2002:adf:e481:0:b0:317:51ff:c249 with SMTP id
 i1-20020adfe481000000b0031751ffc249mr499174wrm.13.1691616288787; 
 Wed, 09 Aug 2023 14:24:48 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:7f53:5cb:7a96:c3a1])
 by smtp.gmail.com with ESMTPSA id
 s11-20020adff80b000000b003179d5aee63sm17814043wrp.91.2023.08.09.14.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 14:24:48 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 23:24:47 +0200
Message-Id: <cover.1691616286.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691616289; x=1692221089;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=JeTCaUEJF3yYvQ+DxDtKAUr2tfWMtL9fSVCQxNHAszY=;
 b=dAleNnHkHGxSfS5qPPiG8+pSQ2LFiRbR64pK2eWR/K5dNjfkHiEN6tbknitYwYBF2y
 Un15gzBiJEbL1Y03JRSiN3g3ezZHSCRFBwdQGLc38H8JHLAvHHgS0FB/rhWMkjDaMBPw
 08YvUGlZnuCUpgOBXCsTxjhdWNyKWR0pnwu4Ackp7mVs9FaYKb6MzfdR7AmCbv8frr9K
 JSvC+Sh6JOxWsow+/zZEsxyTi9fQFVhD5l2OBsyIkxnU22plX+edgd1qoJCkxGBUC7f6
 jz5cF6M7mltPcGeorpLJsQWZB3fZdS6WtjghvUEaiW4vERXVGeHgEZgnIrId5OcwCRGO
 lCrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=dAleNnHk
Subject: [Buildroot] [PATCH 0/5] utils/docker-run: cleanups and improvements
 (branch yem/docker-run)
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
Cc: Nicolas Boichat <drinkcat@google.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This 4-patch series improves on our docker-run wrapper:

  - utils/docker-run: introduce sorted list of mountpoints
  - utils/docker-run: mount the download directory if specified
  - utils/docker-run: bind mount .git/objects if needed
  - utils/docker-run: also mount current working directory
  - utils/docker-run: make it compatible with SELinux

It gathers changes from Thomas and Nicolas.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Nicolas Boichat (1):
      utils/docker-run: bind mount .git/objects if needed

Thomas Petazzoni (1):
      utils/docker-run: mount the download directory if specified

Yann E. MORIN (3):
      utils/docker-run: introduce sorted list of mountpoints
      utils/docker-run: also mount current working directory
      utils/docker-run: make it compatible with SELinux

 utils/docker-run | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

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
