Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE4CCDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 21:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 355E5613DF;
	Tue, 17 Oct 2023 21:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 355E5613DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5mtH4VawuLuZ; Tue, 17 Oct 2023 21:01:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8945C61406;
	Tue, 17 Oct 2023 21:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8945C61406
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99DAB1BF397
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 21:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7128E40B31
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 21:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7128E40B31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r5jjFxAT9FDK for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 21:01:21 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1028040424
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 21:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1028040424
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso6613485e9.1
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 14:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697576479; x=1698181279;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OtatbA0Fn8pVE1PO5VvoVH+byO0n7c0b0nSHh9sKpBA=;
 b=mVF3A5RWG96YjoXBby62sr29IIMdBcBUIEQn5t4pzMtF2xPW3Kex93JTjCQ3q69WIJ
 gpmzktI+Tgge9RyTuwKITVpEdwNZqDNGf3NmsK4yaiTqflbKL1GQO6zea4IjTXoDcD+x
 RVS1z3Puqzz027f/4QomMPPHccw6vlfCzohOtssAOKFGPd5k2fTZlILWLxJBxWLTUJ5b
 ruyga6b/dD6SjqP73b7KXC5VzATqGYZQvc7CW7QdV9iGIJL7bMtj2gDLZ0Jtyu1ojOyG
 +9A1KapBhBX4sNs5AOQ3T1nRuvPW7icIpK0JwWVGtVj0dFnIeqEbzqsVSJqu+ArvB5Hh
 Nr8Q==
X-Gm-Message-State: AOJu0Yzo/6pE1pPuS6MMfcEjFQ/oPjGgkVQnwcMMvdb5WfBLs8qXjC7A
 MKFkPv/yU/hbVPaGj32dggTKJi/pVPY=
X-Google-Smtp-Source: AGHT+IGg0Gd8n50wadArfxFxaMPHYUsVaEposFkvrVEiM5/c/vaol06JVBFxGahQ01KxrrjPEwHP5g==
X-Received: by 2002:a05:600c:1c84:b0:405:784a:d53e with SMTP id
 k4-20020a05600c1c8400b00405784ad53emr2537263wms.20.1697576478881; 
 Tue, 17 Oct 2023 14:01:18 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8290:3800:fb7f:2f7a:afad:92ed])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a05600c429400b00402d34ea099sm10626753wmc.29.2023.10.17.14.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 14:01:18 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 23:01:17 +0200
Message-Id: <cover.1697576472.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697576479; x=1698181279; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=OtatbA0Fn8pVE1PO5VvoVH+byO0n7c0b0nSHh9sKpBA=;
 b=CuN2qg8+9P8N37eub6//TZxcz6B6qxEfRBuLcnIY89mRRVFysR/kB8gJLRcikOdUIN
 9j9LFWCHUdLSUAtsxo/jvuUC9huao1AukCYAB9wN2DARgcrKTTzcWSut/vlVAZpJ1Tda
 qcmatL+mPTPx6RnJMwPgc7/30JZt17AD9eEER8TMzG6uQxn6A0FmzYCgIUt8asg0XJ03
 8xysHwEOqbNRbv89HyQoBKsii9ZH2I6Qg9M2A2sdqrr9dZT8HCAwsJjed9Hxu1Prm2u5
 AbfkP4lVekv94cxu0gGu2z5DI6bYetf9pLQ+0jy/VAGk1YsqiHOMW9Ys0a66rN5D8UwW
 WM8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CuN2qg8+
Subject: [Buildroot] [PATCH 0/2] package/pkg-utils: fix regression in size
 and build time with PPD (branch yem/rsync-copy)
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This small series is a proposal to revert the huge regression in size
and (to a lesser extend) build dtime due to not hard-linking source
files whn preparing per-package directories, or when assembling the
final target+host directories.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      Revert "package/pkg-utils.mk: break hardlinks in global {TARGET, HOST}_DIR on per-package build"
      package/pkg-utils: teach per-package-rsync to copy or hardlink dest

 Makefile             |  4 ++--
 package/pkg-utils.mk | 13 +++++++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

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
