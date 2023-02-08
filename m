Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7180FC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 19:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D9DC403AF;
	Wed,  8 Feb 2023 19:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D9DC403AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XyQ3cLyIqKU1; Wed,  8 Feb 2023 19:31:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3435C40332;
	Wed,  8 Feb 2023 19:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3435C40332
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C486A1BF2FE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 19:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAD8F6117C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 19:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAD8F6117C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wnQ-TuY0--7O for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 19:31:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 732C561178
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 732C561178
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 19:31:35 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id j25so14356072wrc.4
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 11:31:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OKZbwT+t9Pxfn0BikEok8y/EgEPrnmeCgG0/+9M+RkY=;
 b=g7MZoBxdsVMpRxHLNbkgc918J9EpRPNt3iBVWhgVBLp6oWx5tbi7D2rDYFU2kODJam
 S+2onnJCG6mX6AN0/dmSRrQECDVlQSy68FTcSDNxEt02AKRwG+osB8DwY1JGcnjEC3SL
 i8JRbjlS+BmQ1dx4HArVi3nbnsTT6x20IuDI27kApVZ5g+9Hv6FPof3ZjLuX0GpC6PMt
 9Ydww2+TtcNASE+FP1tWnlkk1w/9qSIKzjpqt6bkM5N35IlBUJkIYlHNMdEd5fDAj10X
 o3vUPJWD+q5UWJF5k13/s+MQ1rP14L4rSvvudLnTW6SIVF0BIbulh30besaykqgMccsi
 zRUQ==
X-Gm-Message-State: AO0yUKVxQLjFxLA989h36jblB6W3s9HEXGAyDOAXnNBPnjBknFF+U4YO
 guqkNuMH+cbTEyzmO+GsdoEVASqc77wo4A==
X-Google-Smtp-Source: AK7set/Ax/n8WDbEyo45H2g01YTemNynbrAlJwZz4h+XcWMbGVLX4QGXoRwRcdjO1jJuae26OcHzsg==
X-Received: by 2002:a5d:488b:0:b0:2c3:db9e:4b07 with SMTP id
 g11-20020a5d488b000000b002c3db9e4b07mr7423075wrq.64.1675884693659; 
 Wed, 08 Feb 2023 11:31:33 -0800 (PST)
Received: from localhost.localdomain (pop.92-184-112-65.mobile.abo.orange.fr.
 [92.184.112.65]) by smtp.gmail.com with ESMTPSA id
 o15-20020adfa10f000000b002bddaea7a0bsm14470352wro.57.2023.02.08.11.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 11:31:33 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 20:31:31 +0100
Message-Id: <cover.1675884676.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=OKZbwT+t9Pxfn0BikEok8y/EgEPrnmeCgG0/+9M+RkY=;
 b=MzV9HjL4ugNyJ3YLTHOc/5MrP6zmOmYeiDWnonQh8c35HOe5G8vZ2oXuUR/ak7RQXk
 k3p1nNhQ5F1Z//CeCJBIReWvo/N69YeVbf0DiOdQ7FYZSyIqBHMKHLc2Q4Bus2b0c/AD
 v52UTn3kMRx34u66S1pzK1c+K+UD6KjfqpoNoJoeQVccEE1QnYLy/ZPnJ1X384EgTxFK
 gg4kfHrN9ICxOVeXH+n4PYRF/GGyxp+vgwvoXEdhMc8Ok/dfamQaCzhuy+s/ElAyXN6x
 rVjgn6CXRhFF3+zCMgFxpXYOu54vJaLume2I2y2NA3b8s73j4WUOZs2LmzeivHox+wL/
 1HNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MzV9HjL4
Subject: [Buildroot] [PATCH 0/3 v2] package/dmalloc: cleanups and ssp
 workaround (branch yem/dmalloc)
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This short series cleans up (a bit) our dmalloc package, and disables
SSP altogether to avoid build failures due to limitations in the dmalloc
build system.

Changes v1 > v2:
  - explain why we patch both configure and configure.ac

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (3):
      package/dmalloc: convert existing patch to git format
      package/dmalloc: use actual patches rather than sed-ing
      package/dmalloc: don't use SSP

 .../dmalloc/0001-configure-fix-build-on-mips.patch | 90 ++++++++++++++++++++++
 package/dmalloc/0001-mips.patch                    | 45 -----------
 ...003-configure-allow-overriding-some-tests.patch | 80 +++++++++++++++++++
 ...e-the-configure-detected-or-user-supplied.patch | 50 ++++++++++++
 ...onfigure-use-LD-instead-of-hard-coding-ld.patch | 67 ++++++++++++++++
 package/dmalloc/dmalloc.mk                         | 24 +++---
 6 files changed, 299 insertions(+), 57 deletions(-)
 create mode 100644 package/dmalloc/0001-configure-fix-build-on-mips.patch
 delete mode 100644 package/dmalloc/0001-mips.patch
 create mode 100644 package/dmalloc/0003-configure-allow-overriding-some-tests.patch
 create mode 100644 package/dmalloc/0004-Makefile-use-the-configure-detected-or-user-supplied.patch
 create mode 100644 package/dmalloc/0005-configure-use-LD-instead-of-hard-coding-ld.patch

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
