Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822B3C4345F
	for <buildroot@archiver.kernel.org>; Fri, 19 Apr 2024 21:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD78F40B9A;
	Fri, 19 Apr 2024 21:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsbLszglw3Uc; Fri, 19 Apr 2024 21:18:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 012F341A52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 012F341A52;
	Fri, 19 Apr 2024 21:18:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B38311BF302
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC70640327
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZH-0vbm_yyV3 for <buildroot@lists.busybox.net>;
 Fri, 19 Apr 2024 21:18:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6CE214027D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CE214027D
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CE214027D
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 21:18:43 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-518b9527c60so2828475e87.0
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 14:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713561520; x=1714166320;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=enKcJxHrLb4/3kFhEDmw3o6Jb9habkGAzSJ93cDdUnM=;
 b=qmNRk1YgmCvGYLh9rggM/mSIkJXnbL2Gv3TZviZTsCc99yVSu4UhMwNf0dcKsX/D8I
 67tDvBzTjEMXQrUSE2WOBu49x+W2UrKH3nRND+382urd8CS/Kh/0xPJ13Qyl5//TA/fP
 z0UuKdI/87FLbAL8xW6PGB3z0fbO9vvFlPLL2kCsAcvxXGLYr5czd5KRtPm64lnfsQ7Q
 SaAqo8xKW/txNn+rFhnuZE+yicnjKTYnd92F4EBwqwJjmvmJPZWYZQAdB7A/KTOx1KvW
 f8jYSVfDKi1gF13WPvtCCAPm9W3dZoi8DDe/JdKBgT+TnJY4TUHULc2cwIQ9vUfM6Pqe
 uZPw==
X-Gm-Message-State: AOJu0YyaEGbAxUb552jrrQWOMQepz/CpD46UEvrcOyh3e8vQuEJfqTFR
 hmnpIKlMcfxifPujYciyco6kjc3ZiVFLYA/ugPvGOA+P1E/AawohsV+fog==
X-Google-Smtp-Source: AGHT+IFfbWUOcs4aULvYqJHm+PhXLm7kKeJyhtS3fU2VagSHOWkWv1U0p7CDGe85bLnvRwo7VLJJTA==
X-Received: by 2002:ac2:4e4f:0:b0:516:d1af:adc1 with SMTP id
 f15-20020ac24e4f000000b00516d1afadc1mr2512195lfr.9.1713561519916; 
 Fri, 19 Apr 2024 14:18:39 -0700 (PDT)
Received: from localhost.localdomain ([212.22.152.70])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a170907271700b00a556f2f18d6sm2556934ejk.57.2024.04.19.14.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 14:18:38 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Apr 2024 23:18:31 +0200
Message-Id: <20240419211833.498273-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713561520; x=1714166320; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=enKcJxHrLb4/3kFhEDmw3o6Jb9habkGAzSJ93cDdUnM=;
 b=D5bE4yELEaz9a3lLGMgdWgnNEh+uboOyL/OnCRylA5nO7imSmOAKA/b+y0kZbdbZ+c
 s3JZpNCyll7ccfHcnrkLbD4ww5eJq99HZPhIIdfEpQ2wGJO67H+5ZulL4iMV9uXa79+O
 Poq3+3Mk2Qlf3yTCfWWI7AsdhLh7QypIXtUonD1q2VsSBHnK+NPGwS4S6hN/aFJxMakX
 WY4olaX5W8A8ZS1xNBZuAc0g+vL7Y1xYR4l9eIGVr6JzqN+3pzfowbfVtKZN6xNStjuB
 ufvVmJY0Qiw6LJNrF50vBSA+7RtN+Oz0HStuk/AZWBK6Hs1utQfpB99SztINofxMaATW
 MJ/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=D5bE4yEL
Subject: [Buildroot] [PATCH 0/2] Fix fail2ban
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Angelo Compagnucci <angelo@amarulasolutions.com>

This series fixes fail2ban not installing configuration files in /etc anymore.
While fixing the problem, I discovered a bug in the way we invoke the
pyinstaller.py in pep517 compatibility.
Basically, pyinstaller.py will install data_files defined in setup.py
and tarballed in the wheel inside the directory pointed by the --data parameter,
which is nowadays pointing to /usr of TARGET/STAGING directory.

I consider this wrong, because the data folder shall point to the
TARGET_DIR/STAGING_DIR to be correct and we shall trust the destination path
expressed in the setup.py.

In the case of fail2ban, configuration files end up being installed in
/usr/etc/fail2ban instead of /etc/fail2ban.

Angelo Compagnucci (2):
  package/fail2ban: fix data_files installation path
  package/pkg-python: fix pep517 data files installation

 ...001-setup.py-fix-data-relative-paths.patch | 73 +++++++++++++++++++
 package/pkg-python.mk                         |  4 +-
 2 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 package/fail2ban/0001-setup.py-fix-data-relative-paths.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
