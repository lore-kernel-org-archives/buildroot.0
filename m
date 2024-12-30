Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FEDE77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 11:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 155EF407AA;
	Mon, 30 Dec 2024 11:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZW6ZkxfnhkKi; Mon, 30 Dec 2024 11:37:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7093407AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7093407AF;
	Mon, 30 Dec 2024 11:37:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DB06CA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DF4B60ABD
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4byZkECNbb7Y for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 11:37:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66EE060ABB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66EE060ABB
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66EE060ABB
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:37:20 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aa66e4d1d5aso1448150866b.2
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 03:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735558638; x=1736163438;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y14nUH9O8qNVRQKK4JL/vI4zOMKdM5uNJ8uYXAcsKbg=;
 b=KcjDENxrMyXiWA4DAS2PYIX7QENsvg2AAcPGyd+uzu+5Erla8ZYPhcjABR9F+hWwMb
 bTdl61MGUVZEYNXJ41ML6+QVoQdqUMwnAaJLl7fPjHvDvN/9gRNuf2ZHXsAw35jtruLY
 PFqhmLx1x/yEIydxTeBoB593ncvVXm4ig1VAs06SDT4smij10aEDSMY3maWA8GNJ7RxV
 XVbxzx1cTIpxb8wMciIFULN8/wU2idtDVOZbGbMbV1hRvvwFLhnmEdlZkBpv35JrKu4+
 RGHdkf/SnnIc2q6dn1BCNPQVJ3H6Fc4e7YwWvXbfAHomhXlrkCPDp6hir2StBtMPOAbv
 djNA==
X-Gm-Message-State: AOJu0YyjtuhjtC6ZMpHfAKTN8lF5Q7iJM5xMMPuDTdpdYPe2Bcyf60GH
 Gsr/nmWPLZZ4LLIHEpDDbn6RQnKnf836djmFVboPDzx+b2NCURwqYS6M7g==
X-Gm-Gg: ASbGncshDoFNYF4d5RAFB+1EKjPV9me8ByiAdJX9Mz+QGAJxdPYLYXLN6E5iKObjGnM
 dEplEnvMYR9mhZI6dgR1CnY4rBhmmTCRx+lG6fNzdlnzsIOdeY2bbQsd9mldnSuQnd6vflTXUZx
 mywA/d2+vssYYFOYnCMQh6phV1CJrcgCW7HtxKP6JN9mHAD9BnlK47eEkgAuMwkWq2nN8OT9Dzg
 lsDOUTx8C13mTIb4tSMKnMmk6zoYQc94YiF/IWrPsThy2tXtj67EdiNAprb0sDBpZyS/5mk
X-Google-Smtp-Source: AGHT+IH6l8VNp5gpNgEWrc8tiSu06El6f1PbWCKlJcrELW8MRtFIzANE2bSx+BZHDMQo1px68ye1Kw==
X-Received: by 2002:a17:907:d18:b0:aa6:18b6:310e with SMTP id
 a640c23a62f3a-aac33551c52mr2944278566b.38.1735558637664; 
 Mon, 30 Dec 2024 03:37:17 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a04:dd00:18f9:775f:be73:a0e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe46d5sm1471216666b.103.2024.12.30.03.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 03:37:17 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2024 12:37:05 +0100
Message-Id: <20241230113710.679717-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735558638; x=1736163438; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y14nUH9O8qNVRQKK4JL/vI4zOMKdM5uNJ8uYXAcsKbg=;
 b=RtjwtjOirBgw+FQ21u1JFgzRoAinEniT+Rzg4j5aJxzpyS3Vx8NaCSPHZw7xHHNW/o
 mmCsijV9DgS85hVwFZ2LY3FuJgxW7eJEeT1bMQkAcqIqEtXxPjh15ZB8Jgs5LtQ5jh7O
 mNoXceCU039uJrkSuIojKqwlk5I7JISDwD87EsjEEOTY0ui4xYOcKaY5fToX0qPbgpbf
 cyH6W671H39H+9VKj+QaI5JojHqu09UXHeysvI8qkTwrgLPzPcWpGWAjiIKWM2/f/KyJ
 gEVHgK0NwGPrMFspSxrWRlrCdSYgAkXeFwLM7vFE+QbZAtAk/RZVbIZlDz2Gup+f3SP7
 aBLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RtjwtjOi
Subject: [Buildroot] [PATCH v3 0/6] netopeer2 package update
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
 package/netopeer2/Config.in                   | 17 +++++++-
 .../{S52netopeer2 => S52netopeer2-server}     |  2 +-
 package/netopeer2/netopeer2.hash              |  2 +-
 package/netopeer2/netopeer2.mk                | 12 ++++--
 package/sysrepo/Config.in                     | 21 ++++++++++
 package/sysrepo/S51sysrepo-plugind            |  3 +-
 package/sysrepo/sysrepo.hash                  |  2 +-
 package/sysrepo/sysrepo.mk                    |  5 ++-
 .../testing/tests/package/test_netopeer2.py   | 40 +++++++++++++++++++
 support/testing/tests/package/test_sysrepo.py | 25 ++++++++++++
 16 files changed, 133 insertions(+), 33 deletions(-)
 rename package/netopeer2/{S52netopeer2 => S52netopeer2-server} (92%)
 create mode 100644 support/testing/tests/package/test_netopeer2.py
 create mode 100644 support/testing/tests/package/test_sysrepo.py

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
