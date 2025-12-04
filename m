Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F956D20694
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 13:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E37DF84689;
	Thu,  4 Dec 2025 13:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gjQ8Q9rWXf22; Thu,  4 Dec 2025 13:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54AA984662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764856081;
	bh=rl1VU3eJGSXYxkqMkrc7ZRcGcNdgNrFHw6YcxbgkTkU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m1p6onLwXBBCnyTM3xvI7ljPtvw5kc/40bwOL27tOGexTyQYV3xAPseNBKl518RPt
	 jRHZ0L27P1CJ8d6yeKHjGlxpbg9mqKWlk/q+qPMV3cYrijozsfzib6PMy1pEjMWE9M
	 rPBZJMSqcfG+QBc1nnmA1Qci8IgXwBb8TSzcZm4wszubCADXSzxPyNsYEgIvyTGIZl
	 FOCwYVZ5YcnfjTZsaQ+ak4W+9vDvP9GJxkfdYl102H9R2G02XMf2v8BWcDy3xCFVQO
	 Pgjxkhp8Hp/g9B+Xss22gzcSHIA6Iahgqarih6HSOVZtTLJ8h2coMCm3KJz/2l0Om5
	 ZvqP8IqAfP3wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54AA984662;
	Thu,  4 Dec 2025 13:48:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE1F5E7
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4F1A40C72
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MhVJPLGemQ4l for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 13:47:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AA79B40082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA79B40082
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA79B40082
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:47:58 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477aa218f20so7128395e9.0
 for <buildroot@buildroot.org>; Thu, 04 Dec 2025 05:47:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764856076; x=1765460876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xsv0hXF3g1HdC9A9Yj+i+8LyBXKq+0u5VFFIe4/hRrA=;
 b=pnXwBTiWLpsVrL/3Ii47RcpP+9Hb8Khm/SH7Qa/jAsDz9EYz2nSY1kye1td42H4zGB
 aCmnCn2Srkp/O/dVMVueW8IRpCAHBhiFaPYpbjWOiKCvn+B2jU8y+XXqkY+NzKm1bK9w
 64uqXHE6GZghQdaqeUwqvSIblbrU7IDqldC8sv8x1f6bHJZ9m/1w+VneH+pagPEbahAQ
 Rk3RAuq3Nq5IScfXw9f2Vzr9Hp2TQhnHHf6WaXLdTsE7K4KwVegDFvZpw/3pZia4w1G5
 Lrptt+kDDk2K4FUYh0dJ3nz0VOHI92cDog5vQmvB6wB39BW1AG3Wi4rIF06XRe9SO646
 rP+Q==
X-Gm-Message-State: AOJu0YzwhhCVD+gaXs/2VMgzuLpFrIydesCElBJsOkBeQBSCtm255zd+
 axmrNh8huN6BUhBw4lYB07DT3Nnv2cDMcJ4x+Sxo5jouoeYnOWI96nJrkwkdkg==
X-Gm-Gg: ASbGncuLP2V/1yIJiWYCvmuhmNanQQKtjMuX9evDKGlBpZG4RtQsQv1P9r/MOHgrFp6
 887p1NN5VlAZxLY8Y5MyqrZLMQma0KCJlumYkr44mSRzCwaN0xfplRSl5/0X2aFoTSfSsIjJ/lF
 z521xiIaIO7YzFt6n6gq4DRyoaXVFrIvCh+nNJJFGUGPxAU6uFNtEWWwflLeI/B94lEEbSBy01J
 M90QKCv3S9yw72U53MBY2xy2ggdAWycOXAN6tHEfYU/KFi5KZLgcnOqRd7mHs+QF5JCeIqy3Xah
 /TWkhyjAfB0BYOn72YzDSNHKIo4x69qWLo6yQfRdzEyRjxH2D49Qhd/4zsrSZpO1THnIC6iFHZL
 sdm+I1UvtVpb5HjhVngRk8PmS8mT+XOsoYKCQSrWYtTcRCuYqaWwlOVRtNbFUBASpe27Lli8DBL
 fIcZz68uVE8qy9kw==
X-Google-Smtp-Source: AGHT+IFXfaRrpwN5XtRHB8Ot8dYFGTMsS3zPUWZnvHOzzXqbDjnbA5NQvY2Br/Ccv7MWkviw10fxZg==
X-Received: by 2002:a05:600c:1909:b0:475:de12:d3b5 with SMTP id
 5b1f17b1804b1-4792af48313mr57740025e9.34.1764856076507; 
 Thu, 04 Dec 2025 05:47:56 -0800 (PST)
Received: from freepad.proxad.net ([213.228.1.188])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311fbaf4sm28817255e9.15.2025.12.04.05.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:47:56 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Maxime Leroy <maxime@leroys.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>
Date: Thu,  4 Dec 2025 14:47:35 +0100
Message-ID: <20251204134742.406507-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764856076; x=1765460876; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=xsv0hXF3g1HdC9A9Yj+i+8LyBXKq+0u5VFFIe4/hRrA=;
 b=ea/EZJnXJO8QbfKHpWIQrwgn0CEsD0BVCDjA2Bt9S4O+8uI67SmqNZWGv/zzwdXXAb
 SrhXrBda/1iNkg2+F7wWq4zj7J44WbytuQaV/cAYJJxdbWXEbYnv3vEM4Jn/DJlisjr3
 elJaybInHN/FGMmG0MKtEszZdjsDMO16IDGtYlxyIGNi8HKJCaA2uoyL+g8isYLuiQQ4
 p5Q4RPVN+bRH6Mo50ou5f42x1hoi3le4QhZsbcCyadEX7aXE3l2LrQw/+yDnw7oYU6Xh
 CKrT5d1XN1/FZ71tUgFgEyk+vDNeTug5esMV9ZVMC8HsXYGb0Jz0T5xzMx58CxX3xjsG
 vQgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ea/EZJnX
Subject: [Buildroot] [PATCH 0/7]  Bump DPDK and Grout package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series updates both the DPDK and Grout packages in Buildroot:
 - DPDK is bumped to 25.11, including multiple packaging improvements:
   - Drivers, libraries, and applications can now be selected individually to reduce footprint and build time.
   - Option added to disable target installation (useful when DPDK app is linked in static to DPDK libs).

 - Grout is bumped to 0.14.1 and Grout is now linked against static DPDK libraries.

All changes have been tested in GitLab CI:

 DPDK 25.11 compilation has been tested here:
 - https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2195912020

 DPDK compilation with options has been tested here:
 - with libs: https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2194482682
 - with apps: https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2194508748
 - with drivers: https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2194482682

 DPDK functional tests has been tested here:
  - https://gitlab.com/maxime-leroy/buildroot/-/jobs/12292248212

 Grout compilations has been tested here
 - https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2194879962

Maxime Leroy (7):
  package/dpdk: bump to 25.11 version
  package/dpdk: make drivers selectable
  package/dpdk: make libraries selectable
  package/dpdk: make apps selectable
  package/grout: bump to 0.14.1 version
  package/grout: link against DPDK static libraries
  package/dpdk: add option to disable target installation

 package/dpdk/Config.in   | 76 ++++++++++++++++++++++++++++++++++++++++
 package/dpdk/dpdk.hash   |  4 +--
 package/dpdk/dpdk.mk     | 35 +++++++++++++++++-
 package/grout/Config.in  |  1 +
 package/grout/grout.hash |  2 +-
 package/grout/grout.mk   |  5 ++-
 6 files changed, 118 insertions(+), 5 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
