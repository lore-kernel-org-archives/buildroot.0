Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E765E7718F
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 10:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B45360ADA;
	Mon, 30 Dec 2024 10:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDDC5iJ1H8DA; Mon, 30 Dec 2024 10:35:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F2BC60AE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F2BC60AE5;
	Mon, 30 Dec 2024 10:35:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B458CA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 398E08148A
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SoB1QibnI2Ju for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 10:35:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 548AF81203
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 548AF81203
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 548AF81203
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:35:51 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aaeecbb7309so796158766b.0
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 02:35:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735554949; x=1736159749;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s4/oidBKsMJXhGZVGtHRr6ygvlsuKkzRmQ8lrAh8kmA=;
 b=KxG8EFAmkiHddbG6Xp72k9E6qomkaLoCDTK1WzjZmjySdu71+GnNjn9rczb9daLC/C
 +k+IL5qV+8VZAkg0TkIJuU7XgwgW2YGVWG8jm3ipAukRAoSEDk1mzWwBlHwBEF3FJcP8
 U36Ei+lx6XztCe3jMqJ1Im6aDpxboRVvOPyuf3olUK8HKG3n98P5ZBis7hFlon9PKUF4
 15g6BW3QTKvRm3czru6JsH7FQp4/w/NWctgoIdu969EtZDRkNCffNmLQXJyA84GZ9WVY
 4S6oxEnvy6PoffII5TcZqt91EDQ/vr7RWzSykSMn69+nsF28pnM9bBscnnMENkHGvIbD
 QLUw==
X-Gm-Message-State: AOJu0YyMCXNiCA1fH9s25CC2jgQ15aBiuJumKma0NJ1AxQpq8j0oR7Eu
 h4y8Eef9ygiFKQNfKFEIJJWCbBLQjVZARFDSOkhGbmOENYZ2eGvf1NKVVg==
X-Gm-Gg: ASbGncvp9Ho5DyCAnZpA8WIex4irETMQZSXW/gcYp1dyYTzxDoxPOe/lULkYy/wpvZp
 hZwl3wsX92sWrl4DmDTD/kJm63Tn3MtlZVDPBla3GyNE/DmtUC/D9Ogr5r7/h6XuGP4MCkCIiHJ
 PTpck5IyU2ImRM7Kop2mmdDucKWh0FSk2hEJFcl/PwIPGpplZ6IYoST3iDDgffKtuc+NlMJTle1
 a7jurpdr0JzwHkeXJn6ZkMqll6Gr8FXcNsFtuHQo1Hw3RwMPtD5CixOv4xKGFiH7mjAH743
X-Google-Smtp-Source: AGHT+IGJLCWzonOIYkauIjF6kizBeDqDrYjbneyn6x69k1MfZD/px4uvcA32FpXizcphmtbG2TrXRg==
X-Received: by 2002:a17:907:c10:b0:aa6:74a9:ce6e with SMTP id
 a640c23a62f3a-aac2ad7fa23mr3123913666b.16.1735554948642; 
 Mon, 30 Dec 2024 02:35:48 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a04:dd00:18f9:775f:be73:a0e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e89617bsm1437781766b.76.2024.12.30.02.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 02:35:48 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2024 11:35:29 +0100
Message-Id: <20241230103534.671602-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735554949; x=1736159749; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s4/oidBKsMJXhGZVGtHRr6ygvlsuKkzRmQ8lrAh8kmA=;
 b=gDSfgIjor18aWE0SJ5Ri5hh0B2lvUFjqmd2CLOrRVPKZDTJYz40cB5o9o9ZIR3F4uA
 mMROO5zSItmb2JrKx/KhGYvPZe3gJUKlV+kiIyxvU48F9l/6niwqmY8odNzxjALvMBm8
 KmvGJTfYSDOKxNvLQZyAy6W7XxHgS9/IBcElK8pr5zjdI1wH7Bypb9bRKqTbkqSKrn5y
 u3rLov1L5sI6aQQIleRDht4WJdnx2tiCAs95ZKq9qUAdN6KNz5MHvSqSICm8aDsz9Des
 wBg9Rk1J+m5TbxKRXTtqI79C1iUl8p8TF2wPydXElCx3d7o25rJtIJMg+WjsyKcvbv6s
 WNxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gDSfgIjo
Subject: [Buildroot] [PATCH v2 0/6] netopeer2 package update
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

Heiko Thiery (6):
  package/libyang: bump to version 3.4.2
  package/libnetconf2: bump to version 3.5.1
  package/sysrepo: bump to version 2.11.7
  package/netopeer2: bump to version 2.2.31
  support/testing/tests/package/test_sysrepo.py: add new test
  support/testing/tests/package/test_netopeer2.py: add new test

 DEVELOPERS                                    |  2 +
 package/libnetconf2/Config.in                 |  1 +
 package/libnetconf2/libnetconf2.hash          |  2 +-
 package/libnetconf2/libnetconf2.mk            | 26 ++++--------
 package/libyang/libyang.hash                  |  4 +-
 package/libyang/libyang.mk                    |  2 +-
 package/netopeer2/Config.in                   | 20 +++++++++-
 .../{S52netopeer2 => S52netopeer2-server}     |  2 +-
 package/netopeer2/netopeer2.hash              |  2 +-
 package/netopeer2/netopeer2.mk                | 12 ++++--
 package/sysrepo/Config.in                     | 21 ++++++++++
 package/sysrepo/S51sysrepo-plugind            |  3 +-
 package/sysrepo/sysrepo.hash                  |  2 +-
 package/sysrepo/sysrepo.mk                    |  5 ++-
 .../testing/tests/package/test_netopeer2.py   | 40 +++++++++++++++++++
 support/testing/tests/package/test_sysrepo.py | 25 ++++++++++++
 16 files changed, 136 insertions(+), 33 deletions(-)
 rename package/netopeer2/{S52netopeer2 => S52netopeer2-server} (92%)
 create mode 100644 support/testing/tests/package/test_netopeer2.py
 create mode 100644 support/testing/tests/package/test_sysrepo.py

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
