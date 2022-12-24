Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3B4C4332F
	for <buildroot@archiver.kernel.org>; Sat, 24 Dec 2022 09:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCD28820F6;
	Sat, 24 Dec 2022 09:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCD28820F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QmSTTBUz18ir; Sat, 24 Dec 2022 09:18:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13C1682029;
	Sat, 24 Dec 2022 09:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13C1682029
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46C3F1BF296
 for <buildroot@lists.busybox.net>; Sat, 24 Dec 2022 09:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 227D440124
 for <buildroot@lists.busybox.net>; Sat, 24 Dec 2022 09:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 227D440124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZXfffF74TgtB for <buildroot@lists.busybox.net>;
 Sat, 24 Dec 2022 09:18:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFA26400D8
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFA26400D8
 for <buildroot@buildroot.org>; Sat, 24 Dec 2022 09:18:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso1415896wms.5
 for <buildroot@buildroot.org>; Sat, 24 Dec 2022 01:18:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7iXRomfpwhbr1CqWiWRN4BJyxfUutCV6Mhj8AdSOaVM=;
 b=m/YdYawgCuOiXUhxZSlaoh4xwLtiAqEqaOHOSOYUxy7IyeYT3irhKlWrYpHodLABiX
 rzCBIoiXFaBaLjtKr1AYxKv2J/9T0DyG5cq6QyYiVIGwbVVF9EjyRByOjvhEcW+mSe/r
 bu7m6SZhaI8b0+9JDKxZEaQ0Zc56y5+yq2LUgXpnHzN4It9X7ubsExj/TE8sYhkeEbq7
 /td40xqdAfgcPE9auit5ZC3IFygtMQfkvbcdmmT2Ta2choIylGDVWKepwZDH6n6WFXLB
 JAAEo7lG5qDjE8dm42sey5zqIRmRb9G4dCgVixX27B9BljKe4A4hOt3p5gFpBTLj2gnd
 dCfg==
X-Gm-Message-State: AFqh2kp48Hxb/tcAL4sq/nNtNaP0dPsK4nv/bmOrLms4uHGkOtxXvPKU
 h5eJimbm0WAU3Uy8l+x7/39aAjfCURg=
X-Google-Smtp-Source: AMrXdXurvdVUPudkOReg9mgj4KVAph6ByYLqXo/i/lcXp3Tip4jvsOPOycfjg+vPEA+Q7NMBXp2HEA==
X-Received: by 2002:a05:600c:8507:b0:3d9:6c7d:c9ee with SMTP id
 gw7-20020a05600c850700b003d96c7dc9eemr3910859wmb.25.1671873491915; 
 Sat, 24 Dec 2022 01:18:11 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:9ce0:1380:e1bd:a6d1])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a05600c348100b003b47b80cec3sm11806473wmq.42.2022.12.24.01.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 01:18:11 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Dec 2022 10:18:10 +0100
Message-Id: <cover.1671873478.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=7iXRomfpwhbr1CqWiWRN4BJyxfUutCV6Mhj8AdSOaVM=;
 b=fit+zmIGK/JLJC9mOeUTmn7nfqdoDa8NG1DPWAf7BGYJIdqAS5jPO/CEYoTZ4f5vyC
 DxkKkTG+xnUoFFz/QIEM83FnylDpj2NxtdwwmJUp57EdqYq1qOfu4LmJvC6W2lZxnGTR
 FvjSLyuswboB97VsdbKN+MNwEz722uer1ZVSXIjXo0P6EHL2dNPpsv7qNwfixNpW+Unm
 VlCbLWZZKSFrSuluNLclJW177dSpCX2cqfUyXpPjQT4prx6r//ZvNVFQe9MSs7gXGo3u
 UlMFy45IsrEeAEaQOQi+nG4X0q5NFK8/GADm5w/2f6PhLszXAESAxVbH9ld7h4NeupE+
 H+cQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fit+zmIG
Subject: [Buildroot] [PATCH 0/3] support/testing: misc improvements (branch
 yem/runtime-test-ppd)
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This small three-patch series brings in two improvements to the runtime
testing infrastructure:
  - enable top-level parallel build (TLPB) for tests that have
    per-package directories (PPD) enabled;
  - display the failed commands and its output on assertRunOk().

Finally, it enables PPD, and thus TLPB, for systemd test cases.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (3):
      support/tests: print failed command and output on assertRunOK error
      support/tests: allow top-level parallel builds
      support/tests: enable PPD, and thus TLPB, for systemd tests

 support/testing/infra/basetest.py          | 13 +++++++++----
 support/testing/infra/builder.py           |  5 ++++-
 support/testing/tests/init/test_systemd.py |  1 +
 3 files changed, 14 insertions(+), 5 deletions(-)

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
