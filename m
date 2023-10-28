Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A82C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32B08417A5;
	Sat, 28 Oct 2023 21:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32B08417A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZwwgDdV8q2P; Sat, 28 Oct 2023 21:09:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FFAC417E0;
	Sat, 28 Oct 2023 21:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FFAC417E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A8401BF20B
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51540403EA
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51540403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oaAfOptm8mzj for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:09:08 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F280F40102
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F280F40102
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4083f613275so23699695e9.2
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 14:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698527346; x=1699132146;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=66XRthgEutbpkSm2dLf9qeZDjNoH4yY0MpLiu6to0QQ=;
 b=vyN7490bLPTH289FaTrhWNDPN/cZgLwr+tVIY/O0O9CoZ0APYyjpBpzR3qozOTZLbd
 s8kKcdsBSMVW5yoSB1EaGknvX+7fZBdnqx4HP7Knr77sMt/t46xQY56qr/eTKFjBTCpm
 hj1mb0VVVBlpGCY747Ac+2eHfHVYZM0eV8gi9ufj/TqZhdMsU2monPp+hrJcHFgjw5t3
 sl4bjvth2lw6A4rk8JfQN78/U2Vx3jOVko01AdixSqXcFjbuD6/qHwNd2G6UKQXn3rUT
 FczY0zO1N6APrw3AHfdtR4ehhkwBYUPTK7jAatlmyEPmNBLKaJZg8Fh5ywNbKL6lOlu8
 0K9g==
X-Gm-Message-State: AOJu0Yw1MORuEC69Uu3YPr+AA9BkjsN12bbas3ShUSi1naEnFWR0F6wu
 0yClNVQ5coweXsP9hUcfZVwhXLYNd60=
X-Google-Smtp-Source: AGHT+IGbZUaXboMh3cB6ZdvE2bvG2e1GdlCvRdDzG0PE+eSVEeBwfMn4uH0McWLFg8oa2grkFm07mg==
X-Received: by 2002:a05:600c:1d0e:b0:405:dbe2:df10 with SMTP id
 l14-20020a05600c1d0e00b00405dbe2df10mr5280749wms.35.1698527345843; 
 Sat, 28 Oct 2023 14:09:05 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 by smtp.gmail.com with ESMTPSA id
 r11-20020adfe68b000000b0032d9f32b96csm4568724wrm.62.2023.10.28.14.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 14:09:05 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 23:09:04 +0200
Message-Id: <cover.1698527340.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698527346; x=1699132146; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=66XRthgEutbpkSm2dLf9qeZDjNoH4yY0MpLiu6to0QQ=;
 b=Fzqejk91N4lgPDjvrLjIec9macIT8RoAwpyMJBP1dYoqG9U2o2fXVlaFVomOG8Hrw4
 z1ymTqyI8WBTqN6HiIOaEk6gIaDHxKov1LmpV0NR1tvF2imvkUCBU6P9198w46CWAKsK
 xpDO5/vCyjYDc2eJ9LpV3+iF3bdWmR07pLh1eaAj1o5QiGcgpWIvS0muRc7xi3ihjLSx
 uccZq0ueddt0DguziFNmiJf7voIbiuIWh92lVNsOVrHX82au1YGJQqADCIyU+ytOvrPD
 ocwJGITKTit7cEt8ejNuJOKwoWWqG5+vsSy6Ijm+JFgGzhhqTSP/ZlBU/0S32tjhugYV
 mWfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Fzqejk91
Subject: [Buildroot] [PATCH 0/4] support/download: accept user-provided list
 of extra hash files (branch yem/multi-hash)
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "Martin Zeiser \(mzeiser\)" <mzeiser@cisco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

For packages where the version can be specified by the user (e.g. with a
custom version string, a custom tarball location, a custom git tree and
changeset...), Buildroot can't carry hashes for those, and thus does not
check the integritiy of the downloads.

Add the possibility for users to provide hashes for those, by leveraging
the global patch dir setting, to look up extra hash files in a way
similar to how extra patches are looked up in there.

Users who provide such extra hashes will most probably be interested in
ensuring that no download ever gets used without an actual integrity
check, so also add an option the requires all downloads to have at least
one valid hash (and no invalid ones, of course), rather than ignoring
downloads for custom versions.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (4):
      docs/manual: svn downloads can be hash-checked
      support/download: teach dl-wrapper to handle more than one hash file
      package/pkg-download: lookup hash files in global-patch-dir
      pkg-download: add option to enforce hash checking

 Config.in                                  | 30 ++++++++++++--
 docs/manual/adding-packages-directory.adoc | 12 ++++--
 docs/manual/customize-patches.adoc         | 25 +++++++++++-
 package/pkg-download.mk                    | 15 +++++--
 support/download/check-hash                | 64 ++++++++++++++++--------------
 support/download/dl-wrapper                | 10 ++---
 6 files changed, 110 insertions(+), 46 deletions(-)

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
