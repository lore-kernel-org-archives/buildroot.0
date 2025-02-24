Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE1EC021A4
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 21:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF6A88175C;
	Mon, 24 Feb 2025 21:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9qxir4eRBAw; Mon, 24 Feb 2025 21:22:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A5A8816A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A5A8816A3;
	Mon, 24 Feb 2025 21:22:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ACD5F1531
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 902A840BE1
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mqq1ifv5eCdt for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 21:22:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2CAFD40BC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CAFD40BC4
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CAFD40BC4
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:23 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38f3ac22948so2460026f8f.0
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 13:22:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740432141; x=1741036941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h+WRfPUIPgghaiiHjCpd+vfnKAz+4mCfb6qjLrsEVxs=;
 b=vz5WpsKbgme/h9TYulhH3YWsNYEBp9T/pPE7JGJ3z3F3KsvnYNLtv4nzu4gdS2Wu2e
 8p7VRi0GStboyepYA2CV9gy290g+4tCPsWSKHQOJTl/bCdm9oMI8PpTaEoc3JvkAkw/N
 hnKb8n24jaAIB9Jd9SHIw7ZxY9/ATHaPRu61IkrDTEaAKkoRiyOGQ3tJSHWYcHJZfF7Q
 PlzBCZWxF+IXw+70K+ZVCxgn8v0A3iJxl+pbbIoU6jep73pdFhysJXW35ym7QZ+X+p7F
 v9mAFLmsOKoObEjGc7hqjahytAACu7dBQouWKPzCdmg9dmFimp+5Knm/MfMqtzr9HJg0
 nRXQ==
X-Gm-Message-State: AOJu0YzooE6r5ryxpS3eII1zCMYOeXU3emgaudllJ/7fsMRTdesvRA/U
 614oFrjkSAniKF5Ilznt2wjOpXNH8P0n/2Nggf3qkw3FQHjIJlFQeTCREg==
X-Gm-Gg: ASbGncs1303K/w4pJnVO557FM7lPgAKJ5MjcJH/k4PpZciJ282NSgrUuGbVhNla7yNQ
 ExUBY0w0erhXjzfBS4pd9qMQnBEy6qKGnHTKo9Kpa+ffJ85Vu5w61ZlEHEH+/bCVlFCLv/kz37J
 K3xL7h0oG9lKFugGCxKJLFPLlamMpmziu8axSLiZajw+vGiwbcmiE2W0sz33xK2YuvFhTmXyAWS
 bv9xKbVfBYye+0PD0ey+e5XW2FGJcRDMMuEiFkhl5dkHzXfPJcs6WE0Gmb9M3szLc71nbZ4voZA
 AX3MkaoMG9zjsX3yszt9TgtMLRWP12yBG2rQ
X-Google-Smtp-Source: AGHT+IGhZIgsJOt8EgFmhUq+1SEIqPyaV7WDTw9j23qNi3ThfvyXLHq59/2kI4svMOpQM+6I8YTs5w==
X-Received: by 2002:a05:6000:1a86:b0:38d:e6f4:5a87 with SMTP id
 ffacd0b85a97d-390cc5ef3c8mr561158f8f.10.1740432140856; 
 Mon, 24 Feb 2025 13:22:20 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8fb497sm135762f8f.81.2025.02.24.13.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 13:22:20 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Fiona Klute <fiona.klute@gmx.de>, Julien Olivain <ju.o@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "Yann E . MORIN" <yann.morin@orange.com>
Date: Mon, 24 Feb 2025 22:22:19 +0100
Message-ID: <cover.1740432132.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740432141; x=1741036941; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=h+WRfPUIPgghaiiHjCpd+vfnKAz+4mCfb6qjLrsEVxs=;
 b=hWiNm3ICkPfxGKriAyu1SlVVWen+vf/l7Ob/XJ7GEz2XiyeOUdcX569mwNLPayhXV9
 f3eKlIXV1s+3Us3IpguiaTzO0R6KMEO2Hxc610kxyIeFkYvBYyXdU0+eF6LFMACNPtuO
 bflab2SOYDjpbbgw4k+Jalms/782cEr9+0GNVXSv1wuCqGh4MAZbzodXnutlTu7S+amy
 aG2yq2zn3jOsjsv8HfiXXPQosMmifSWPo4q4CMGEMMb1/m86iNp+C26+doxwyBAYMTWS
 nO6uzfsjbrqbTshB/Q2YseGlkCnXJ4PDGLxUwhqu8II5khF6tu/hzUqeRFRje2kCBfWL
 MAOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hWiNm3IC
Subject: [Buildroot] [PATCH 0/8 v2] package/podman: new package (branch
 yem/podman)
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

Hello All!

This series introduce podman, an alternative to Docker. Podman is
daemon-less, and does not need root either.

The series starts with preparatory commits in existing packages and the
testing infra: then it introduces new packages on which podman will
rely.

Not required by podman, skopeo is made a target package as well, as it
was of help debugging podman (and Docker in a separate series).

Changes v1 -> v2:
  - add licensing info for netavark and podman  (Julien)

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (8):
      support/testing: set date in emulated machine
      package/shadow: install to staging for subids
      package/conmon: depends on systemd when enabled
      package/skopeo: add target variant
      package/cgroupfs-mount: tweak the kernel config
      package/cgroupfs-v2-mount: new package
      package/netavark: new package
      package/podman: new package

 package/Config.in                              |   4 +
 package/cgroupfs-mount/Config.in               |  12 +--
 package/cgroupfs-mount/cgroupfs-mount.mk       |  11 +++
 package/cgroupfs-v2-mount/Config.in            |  10 ++
 package/cgroupfs-v2-mount/S30cgroupfs2         |  43 +++++++++
 package/cgroupfs-v2-mount/cgroupfs-v2-mount.mk |  16 ++++
 package/conmon/conmon.mk                       |   4 +
 package/netavark/Config.in                     |  10 ++
 package/netavark/netavark.hash                 |   3 +
 package/netavark/netavark.mk                   |  19 ++++
 package/podman/Config.in                       |  38 ++++++++
 package/podman/podman.hash                     |   3 +
 package/podman/podman.mk                       | 112 ++++++++++++++++++++++
 package/podman/policy.json                     |   7 ++
 package/podman/registries.conf                 |   1 +
 package/shadow/shadow.mk                       |   1 +
 package/skopeo/Config.in                       |  25 +++++
 package/skopeo/skopeo.mk                       |  10 ++
 support/testing/infra/emulator.py              |   5 +
 support/testing/tests/package/test_podman.py   | 124 +++++++++++++++++++++++++
 support/testing/tests/package/test_skopeo.py   |  41 ++++++++
 21 files changed, 488 insertions(+), 11 deletions(-)
 create mode 100644 package/cgroupfs-v2-mount/Config.in
 create mode 100644 package/cgroupfs-v2-mount/S30cgroupfs2
 create mode 100644 package/cgroupfs-v2-mount/cgroupfs-v2-mount.mk
 create mode 100644 package/netavark/Config.in
 create mode 100644 package/netavark/netavark.hash
 create mode 100644 package/netavark/netavark.mk
 create mode 100644 package/podman/Config.in
 create mode 100644 package/podman/podman.hash
 create mode 100644 package/podman/podman.mk
 create mode 100644 package/podman/policy.json
 create mode 100644 package/podman/registries.conf
 create mode 100644 package/skopeo/Config.in
 create mode 100644 support/testing/tests/package/test_podman.py
 create mode 100644 support/testing/tests/package/test_skopeo.py

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
