Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F089C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 23:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DFD74010E;
	Fri,  3 Dec 2021 23:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TtlbGQYuhvH0; Fri,  3 Dec 2021 23:17:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21E6B4029B;
	Fri,  3 Dec 2021 23:17:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACDFA1BF3FB
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 23:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 969DA41299
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 23:17:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9UoZ73ltFGR3 for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 23:17:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B79EF410B4
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 23:17:20 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id o13so8752378wrs.12
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 15:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hSzlN4PZznB8m5AnLn6O/vlmwI9gv9xLN2y4xC4dXnw=;
 b=UNmKHEtpJWFvLKJlkXU0Vu6ynS5mdRfWDjnmJw3uj5iDHBb/iEvy8+9uNouCBxb0QG
 KnF2cL0Fm9yDJuuYX8LZnhaHnCWAc+paknf1Euj3k4YML8b90OvzMqYDphuZYBdJ95Jh
 3785jBDWv+56mXnKzIrojbTahQtTSWMfMg+TBi0OflRBb3EaWtksau52b8vvYsvPZfzz
 lrhYWEM0kvBaG6j1zA4tgdO0cG91ZoXlTzDQohcycguiQWM5wkcINXVxSuN2b6c/wcy8
 DVk7wrNOlVeDV9Ogrih4gD97f2lHRR1TAMeQkaUT8dUQBUiZCiDQRKof6A3XNtbbOFfD
 V7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hSzlN4PZznB8m5AnLn6O/vlmwI9gv9xLN2y4xC4dXnw=;
 b=lz4fgbKlGkvyL7Wv64JvtEwQmGQLEAOEePOMDwtw2K5Pzy8rWUp+fRbgq87qBzpltQ
 ZOkT8lVcWhvjMLXGvsPkHNTaZCZ4pEC5LXTjeCX91RlTkZkfA4CuNpzZ74WwZUMN4+K7
 JB5+XdjPpQnms8WyI0XN3h9DlyzCS716fO2SE+q0wNkKJF+/MXRqOfkE3asIxHJ7HyXI
 3Hqtnq1B5qP6Huh6iAGGVqjlig9wZjDQCsN/ntzJFJdAYM2WpAbhysN/XmjM9mfE0+FP
 Lq9OD/FlMWN7BoUZTi7/HSzQ/cDPrPkrLRBijoNVi9gjMdbWZPJUSwisSa9I2T195MCK
 d2OA==
X-Gm-Message-State: AOAM530QABJIk75LbsTJqA46ZdoJZF/CXK1EVX2exq10YAO1LsiIwW3H
 k0hEF9/KpcDWwOzdwXUNgL6QOXH0yqM=
X-Google-Smtp-Source: ABdhPJwjCVfXexumLuGc6R0Arih4WMMPaO/qIeH5vNRlw1D6AJU7s4iEmG2/+sQKOOJtNnUh3cu89g==
X-Received: by 2002:adf:aa08:: with SMTP id p8mr24893598wrd.572.1638573439063; 
 Fri, 03 Dec 2021 15:17:19 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:28e3:e36b:4389:5725])
 by smtp.gmail.com with ESMTPSA id a1sm5203665wri.89.2021.12.03.15.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 15:17:18 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 00:17:17 +0100
Message-Id: <cover.1638573387.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] package/mender-grubenv: fix breakage after
 grub2 rework (branch yem/mender-grubenv)
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
Cc: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

The grub2 rework to support multi platforms in a single build, broke
mender-grubenv.

This small series, a joint work kick-started by Adam and slightly
reworked by me, is a proposal to eventually fix that mess.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Adam Duskett (2):
      boot/grub2/Config.in: add symbols to represent legacy and EFI boot
      package/mender-grubenv: fix grub module checks

Yann E. MORIN (1):
      package/mender-grubenv: fix modules list help and variable

 boot/grub2/Config.in                     | 22 +++++++++---
 package/mender-grubenv/Config.in         |  7 +++-
 package/mender-grubenv/mender-grubenv.mk | 57 ++++++++++++++++++++------------
 3 files changed, 59 insertions(+), 27 deletions(-)

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
