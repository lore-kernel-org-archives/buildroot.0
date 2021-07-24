Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B5BC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:19:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFF2960E90
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFF2960E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 846BE401B3;
	Sat, 24 Jul 2021 21:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zSWKgW1VOsHb; Sat, 24 Jul 2021 21:19:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C989F400EA;
	Sat, 24 Jul 2021 21:19:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74D1D1BF2AA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 638E3401CE
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nb8JokfEUFiQ for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 21:19:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4081540130
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 21:19:24 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 o5-20020a1c4d050000b02901fc3a62af78so5650520wmh.3
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 14:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rpU4xOuNUGD7WIHoGnORo0L/c2KSTxpaBsoOIGZXVJg=;
 b=Iu4HFe+Y7r0H8D/QQHObI0ctyLwn2A9PBswDJwZDQ6bb0E51lnZieRnUa/UbB4q1Mb
 3JlDdgMPWYij+aNs5W34HvZl4FybT1iSEaYYBGg/IgdI7JfNU12QoFaN5k/WsQgSE0Jo
 a+U/Th6NsNd5AWczRnTU/6oaRtTzQO6pb9b716U8G95YmC3qK4JX8QKlcLIyobXV+U7d
 lNHiPI7bvbaejJm0oI5uFWMJXqNpdHbhotow94jL51Kv1UMP/H5RFh+YH/2xFOo4Wzu2
 3vLe8wNlZ/YEakdYGVeg9iruIsDx1NDTUDUMjZ1ubSxgx4tEXTWP/I5n63zj0nG4nGCy
 Y2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=rpU4xOuNUGD7WIHoGnORo0L/c2KSTxpaBsoOIGZXVJg=;
 b=rRQg+0c+lMK4kHkm4GlIJdmmvkzMdzwK48oc4bwVHRhKDiwq/q3T+evF2F/SUzLXO6
 IWwaBvn5Tf96l4SN8u4uA3d0p1eTfaVrEUiDgiNkS0g+dzK79xD1MCW/6hzwQ+DWyfJ7
 6MVPbwrxxvLgJed/BMcgQCsFMp2o4gO5JAxDxYN6PBrdS4eVk4kjQUAt8/JvLkuTrapV
 g+TgMHIuRoM/At3a2ooIAxtvX4TeGIjo5Znyiqag+P3HiwusgSclz/ov2vFvnzJDPL+L
 3ppT1Bg466ehMrnqClMm5lDnUrDsuEJg0VUEXf5dWO8b6rCcOUtoB9842C9J7ONdqFY3
 y/AA==
X-Gm-Message-State: AOAM533EAMVnzzvfwd8DnkI4bkIOek2/7LI/QfiNfltHP5OjR2A2YuWr
 7SbF+nTnzS6IN9OPxon8+aPvUxYo9eQ=
X-Google-Smtp-Source: ABdhPJxafq+W5b+dcIfv/m+he1A5Nq3EX9QCubATWBFq2yy7QQbErgCBpepMScCULtNTbvItaNwFsg==
X-Received: by 2002:a7b:c3d3:: with SMTP id t19mr9971085wmj.156.1627161562322; 
 Sat, 24 Jul 2021 14:19:22 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:4802:7ee4:40b0:1519])
 by smtp.gmail.com with ESMTPSA id a7sm27113689wru.67.2021.07.24.14.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 14:19:21 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 23:19:20 +0200
Message-Id: <cover.1627161553.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/4] package/pkg-kconfig: introduce generic help
 (branch yem/kconfig-help)
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello All!

This is a counter-proposal to an eariler patch from Thomas, which adds
and fixes help entries for kconfig packages:

    https://patchwork.ozlabs.org/project/buildroot/patch/20210703194001.693553-1-thomas.petazzoni@bootlin.com/

Compared to that patch, this series ointroduces a generic help generator
for kconfig packages, and removes all existing custom help commands for
those packages.

As a cherry on the cake, it adds a new configurator to uClibc, which as
supported nconfig for some time now...

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (4):
      package/pkg-kconfig: move defaults before calling pkg-generic
      package/pkg-kconfig: generate generic help
      package: use the generic _HELP_CMDS for kconfig-based packages
      package/uclibc: add nconfig as a kconfig editor

 boot/barebox/barebox/barebox.mk         |  5 -----
 boot/uboot/uboot.mk                     |  6 -----
 docs/manual/adding-packages-kconfig.txt |  3 +++
 linux/linux.mk                          |  7 ------
 package/busybox/busybox.mk              |  5 +----
 package/pkg-kconfig.mk                  | 40 ++++++++++++++++++++++++++-------
 package/uclibc/uclibc.mk                |  5 +----
 7 files changed, 37 insertions(+), 34 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
