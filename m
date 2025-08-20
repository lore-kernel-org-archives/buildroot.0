Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9E2CA0EE4
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 16:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8D3D40704;
	Wed, 20 Aug 2025 16:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmjf4YFsCOs9; Wed, 20 Aug 2025 16:39:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13B2B40B6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13B2B40B6D;
	Wed, 20 Aug 2025 16:39:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15815DE6
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 079BD60D64
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCig75yYz9Kf for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 16:39:47 +0000 (UTC)
Received-SPF: Temperror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 31B7560E18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31B7560E18
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31B7560E18
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:39:27 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45a1b065d59so423455e9.1
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 09:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755707965; x=1756312765;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FJNoQA9gDgSwzdI/IZW5a55OO9hm4VMFRcOXtz/tbzQ=;
 b=wpagiJiRaaVTRDvvfNCLhsxZf0diEcISzMYAIqR5GjnFq08Z3K4H40X6hYld+GzsDE
 A/s8Q/gQ/iC/bndCpNzslUs3j5HnCdCGTy7M/Axws0FKOKOVoH1tzl+Z2Z5NHjCU1rgI
 ojUgnVkgDNyKrzUmUxp5YoGK7mmTEBQNLkG1lZWMhgkqiY8MUyC2BcJ/HHqEibXd/gRA
 19z1ECurhKft6e6a0Cs7oEXzADmDwS+ZvDGOFKNWkv84jU19q1zCt1HkDoWOssQkSbn/
 BwBA37E1ZVlZ8m0Lub2lnKcNbctcPdj4W4K+TIRaqgmvmCcru1h+qcFXqoANFAWbBq6n
 GFkQ==
X-Gm-Message-State: AOJu0YwbQAiC3YpF7vgw4kFgvBWuZpFZOfDZaj/xp0+/zjf57gFD213R
 In/BuJaykB+MS5ecYpi/bnapBuQS0ygqwPuCXwqSVUt0gJZWjkIYfoFE79yRi8J8
X-Gm-Gg: ASbGncuVAnz/AC/3/9zvlH4CZu5PB5o/iJdKEQQmJ17JZjszXBJ/ctkAJde4wIbjg+0
 FLc4kSzU4m0YskVmZEbkKOBwEckTKTpAGgB7DQbRV/FV/56chdWIRbUmhspO0cxVCME6quroFfz
 nTwyYUlBvM4H3nqxetGplzhtzRrMmvzy6fBsxWcfn9bKQxKm/Ue9SuGC/LKlLNKmcTsub36vRGA
 ZD/qnC1vhfI2tZ89Ur+P+3TFZrFWWJnZVZLcVIxAU7S9AXJRB1Xe/3WQ6FGT6rlvm23CfdTHZH7
 Sx5VCPVzeEqj7rk1HNqCnM41bhIvkRhw+UvRP/cMGYGb8S3SxqBHx5UJKqEP2JxjJltrW4qW4E9
 yH0l2O+G7b54IYMOiOPREbOWyU73ng6Le7F+VZW4SABGGxw==
X-Google-Smtp-Source: AGHT+IFjZxi2NY7gl586grHfPGMBdWayK9KDwPBIP1aRPWscwoK7lCrpWS+OAdycA7QPqrsl5rmdqA==
X-Received: by 2002:a05:600c:3583:b0:458:bbed:a806 with SMTP id
 5b1f17b1804b1-45b4b1b2366mr16355175e9.22.1755707964682; 
 Wed, 20 Aug 2025 09:39:24 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b47c6d857sm37412195e9.26.2025.08.20.09.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 09:39:24 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 20 Aug 2025 18:39:17 +0200
Message-Id: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755707965; x=1756312765; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FJNoQA9gDgSwzdI/IZW5a55OO9hm4VMFRcOXtz/tbzQ=;
 b=d6sGvahSXEMVqjeA562uWbX75fKg7xA+v8nIzg32uiEuYKl12T4+4MzmWDZrki6c11
 Im66rciTA5ijLJMYeQwXguWKa5jLCLOBMXVw60emRb7y3w/ZVNQ/pQ4upQnLGN3dEbyu
 VcKOAtLo2IkcGLDapQUiG8e4N9rsuq8J3F7sVJfvFnT0nWRW1RBW9P4PidWwKhoLkgaI
 kLhnIoFocybU7uQNx2knEO+LW0r3JgRVwjeS2r+5LJrZFqiQiyDtZMJFsmqDjfY12Bh/
 Ee24fJ+Gg8p5R+Yg3acEuqfvKZ51aC74kA+A5SV8zzSbaJyHJqE3eZJdLvT48qTwzOFL
 YidA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=d6sGvahS
Subject: [Buildroot] [PATCH 0/4 v2] Bump cups-filter to the latest version
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

cups-filters went though a lot of changes lately, therefore bumping to the latest
version wasn't as straightforward as I hoped.

Angelo Compagnucci (4):
  package/qpdf: bump to version 12.2.0
  package/libcupsfilters: new package
  package/libppd: new package
  package/cups-filters: bump to version 2.0.1

 DEVELOPERS                                    |   3 +
 package/Config.in                             |   2 +
 ...ecv-instead-of-system-CVE-2023-24805.patch | 208 ------------------
 package/cups-filters/Config.in                |  16 +-
 package/cups-filters/cups-filters.hash        |   2 +-
 package/cups-filters/cups-filters.mk          |  70 +-----
 package/libcupsfilters/Config.in              |  34 +++
 package/libcupsfilters/libcupsfilters.hash    |   3 +
 package/libcupsfilters/libcupsfilters.mk      |  93 ++++++++
 package/libppd/Config.in                      |   8 +
 package/libppd/libppd.hash                    |   4 +
 package/libppd/libppd.mk                      |  24 ++
 package/qpdf/qpdf.hash                        |   4 +-
 package/qpdf/qpdf.mk                          |  26 +--
 14 files changed, 193 insertions(+), 304 deletions(-)
 delete mode 100644 package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
 create mode 100644 package/libcupsfilters/Config.in
 create mode 100644 package/libcupsfilters/libcupsfilters.hash
 create mode 100644 package/libcupsfilters/libcupsfilters.mk
 create mode 100644 package/libppd/Config.in
 create mode 100644 package/libppd/libppd.hash
 create mode 100644 package/libppd/libppd.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
