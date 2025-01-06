Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2767E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 13:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FFD460742;
	Mon,  6 Jan 2025 13:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TaC9WXFh9uqW; Mon,  6 Jan 2025 13:42:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 453E360093
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 453E360093;
	Mon,  6 Jan 2025 13:42:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5E15DB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C457280582
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4dgrlfi76-5 for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 13:42:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2EAF80588
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2EAF80588
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2EAF80588
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:33 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aa67ac42819so2066730466b.0
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 05:42:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736170951; x=1736775751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cWR1KZHURTz7Edo2n8ViCtO4UZslYollYwwfdLFcpNQ=;
 b=Z6SDtict3JCqPK2BE0T8EqFhuQKEhLzQCzZz5ezHWmV4t6XI4KlgRvFAJwWNUs+HmC
 XY2JPpa7aUVu/kRch1rdNc1cklUl1zGwQe33MzbpWYfmOeMD3qqrMVM6CmmpjKM+Yd4P
 oRjN8jVC5Zg5SpEcaeXGgE+oQGsbJn3ynCHMmSrxWVJyzkOxqtVOtNGVk1u1KdhPlXYt
 U0v8RvLXWW6mk6u3s08MF3pYaqlUgqvKSz88H6xmF0svO01zBaOaj0swtO15I6D4tCL3
 jpca0rPSAzxGhMd4+aV8LAKUWDO0JAEPj+PR1P8VSq8g6h4snsAoPRl9MLk53RToXFIB
 DkyA==
X-Gm-Message-State: AOJu0YyyqqsPdbfn5UCnnVFFgGRQK1405wbZQZE0aLk0sGndE2Y23TD3
 TaZ0PyTBB7CxGnEx2CR+eqO58neHSqziABV5ArBHCE22MBGn7Mfr2+B0+w==
X-Gm-Gg: ASbGnctbjaLKyv6IA9wyejpegFLOd7VFR0p2CuFtT9CtF6s1Eys8ZuTbHDpvuMAk2kI
 u14DtBUvInxhj+mIj+BcZEcyDADoLHpEyMFNSLVzLToAPT3KYelJKD71hNSzvrv0/49rCOD3L/i
 liIBop3PmA5kyBV8BTsdjnBI6g2HXrnXLoWL96k888IcWq+6sDq6Etz5i5BoJyEJP0EHfQTP6oY
 vi3iBn17xaXiIiR+9TY7NLnr6jUDjynh7FEfQdARsIpqZi7ATqc/P80KTZQh6ob6SPhHIQCUg==
X-Google-Smtp-Source: AGHT+IEZJVY8YSacwVsPp4i2Mp4qoUM+IioRXbgGvQrOOXwxXTZmjw+wl2HOnW5VJMW7x+diCrGTrg==
X-Received: by 2002:a17:907:2d27:b0:aa6:7470:8efe with SMTP id
 a640c23a62f3a-aac2ad94a1amr5137124866b.13.1736170950694; 
 Mon, 06 Jan 2025 05:42:30 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae74e4sm2243847766b.91.2025.01.06.05.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 05:42:29 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  6 Jan 2025 14:42:11 +0100
Message-Id: <20250106134219.1914954-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736170951; x=1736775751; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cWR1KZHURTz7Edo2n8ViCtO4UZslYollYwwfdLFcpNQ=;
 b=RYAhv/7QS9thoczZqgwCxWQ+R0PQ8+kdwdY4zZXfF3H2Q9jihmeeKfD1E2DZCnNLnK
 kIRjFib5f44Ibh0xBjXgk7AoFAdMdEL32h30HvvhjV1Wcf+j9ZFye4IWNY8bz9OjsJJz
 sodsGuuMXzX1bzVwxY0gf0jdb1OBLX6bFXdqfVYr5z9xzvcTmHY+xoBBDHjp5mj41BMY
 HLRZ5nSWWh4qWbtoWN4r9B50xqzJ1SRZmRz0mxeSdNVEDbs0owSflhVL82ddZWSpTltd
 Z8H0d+weSNS0s9X2iksEYZg9J5xgPEpkhNvRwH8uw+zzmvOU3xBG+AZJMi/FepyUMjaJ
 uKFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RYAhv/7Q
Subject: [Buildroot] [PATCH v4 0/9] netopeer2 package update
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

This series contains the netopeer2 package update with the corresponding
dependencies: libyang, libnetconf2, sysrepo.

This series must be applied together due to API breaking changes.

Also minimal tests for sysrepo and netopeer2 are included in the series.

Heiko Thiery (9):
  package/libyang: add patch to solve issue with older cmake version
  package/libyang: bump to version 3.4.2
  package/libnetconf2: bump to version 3.5.1
  package/sysrepo: fix shellcheck warnings of init script
  package/sysrepo: bump to version 2.11.7
  package/netopeer2: fix shellcheck warnings
  package/netopeer2: bump to version 2.2.31
  support/testing/tests/package/test_sysrepo.py: add new test
  support/testing/tests/package/test_netopeer2.py: add new test

 .checkpackageignore                           |  2 -
 DEVELOPERS                                    |  2 +
 package/libnetconf2/Config.in                 |  1 +
 package/libnetconf2/libnetconf2.hash          |  2 +-
 package/libnetconf2/libnetconf2.mk            | 22 ++++------
 ...UseCompat.cmake-fix-list-REMOVE_ITEM.patch | 34 ++++++++++++++++
 package/libyang/libyang.hash                  |  4 +-
 package/libyang/libyang.mk                    |  2 +-
 package/netopeer2/Config.in                   | 17 +++++++-
 .../{S52netopeer2 => S52netopeer2-server}     |  2 +-
 package/netopeer2/netopeer2.hash              |  2 +-
 package/netopeer2/netopeer2.mk                | 13 ++++--
 package/sysrepo/Config.in                     | 18 +++++++++
 package/sysrepo/S51sysrepo-plugind            |  3 +-
 package/sysrepo/sysrepo.hash                  |  2 +-
 package/sysrepo/sysrepo.mk                    |  5 ++-
 .../testing/tests/package/test_netopeer2.py   | 40 +++++++++++++++++++
 support/testing/tests/package/test_sysrepo.py | 25 ++++++++++++
 18 files changed, 165 insertions(+), 31 deletions(-)
 create mode 100644 package/libyang/0001-CMCMakeModules-UseCompat.cmake-fix-list-REMOVE_ITEM.patch
 rename package/netopeer2/{S52netopeer2 => S52netopeer2-server} (92%)
 create mode 100644 support/testing/tests/package/test_netopeer2.py
 create mode 100644 support/testing/tests/package/test_sysrepo.py

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
