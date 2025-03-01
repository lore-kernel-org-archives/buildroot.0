Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AC0C021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 15:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54EED84C45;
	Sat,  1 Mar 2025 15:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVltui77-Vf0; Sat,  1 Mar 2025 15:05:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D88984C3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D88984C3C;
	Sat,  1 Mar 2025 15:05:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05DEE181
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E909C4293D
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qzepiIdsxgK for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 15:05:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54B77426BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54B77426BA
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54B77426BA
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:45 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-390f69e71c8so602892f8f.0
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 07:05:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740841543; x=1741446343;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e1Hf/4xr8BZ3/fAntTzNj3Hq7Uwv4TTrBfiSDfjslnk=;
 b=BQD53aIqmcHLRo3DCEi8G59j8tgc1gl61EIcGd+oWOqK+ZBS1pEr2D7JhJpFj7mpAN
 JXSUdEmoMyUe7HZpfyoxBZN25FL5z6dqSkgsGf4QkIpbLefUTEBM/SuaHjWbuxTJdDBq
 DD1jyfqMp/szj8H90gVaahXnqmUCqrw8QMbHX+Ux2njYjmDEEmEfUMDZVoq5MV5nwBJK
 y7CBDgzZaq4lPek1ZiauT4kQPriaK82j4d0PePKaScbzd8ZErEAmzDrxLwW01aW4+/fx
 yjqNi1NUAvfUeFO5OMX/GsOeHlSrUaOQKxc5Qiz5LOq0CIWHOZDxsmc+wc+jEwophllb
 nBxQ==
X-Gm-Message-State: AOJu0YyDWnxZOryytNcMY2sEkJc5kHKuklh78Lr5RG7H08EPEvQDRN3w
 cCAEbtXRJsDgJ6SOeioRCEu8VvCgcW9UbIcsr0WVzHl7yllZxbJZjUFE5w==
X-Gm-Gg: ASbGncvCu3dYDaWeFyj43FuSbPidRrvNC9TXXPhf9OHQq7Rz9MV4y9BNqRjSTJltY5T
 an+o2TPLNjNgwhPEIse/x8dPXH+24AQe4Uue16cQnXvvl1VSraTdX18kBWiuo9CLdqnQ8ANDwq5
 yGo25pIgwtUTH0MgalTEf5k47Mup6AWtRA0xl7UCjnEkX6JphtH91H7UT3vsrByKZNG4YqMWQIY
 fuSCH9uRcQ92PbFR6dsx9fUgRVsMbE5uKDwa42FbFikL1n3MfHr9mWOfRSWeoreotNWCVZ9P52l
 ohfIqMKWwfvNBx3cS7pb5xphE6POfAi1kYxAZltUSdqM1+x9LSx2NSc=
X-Google-Smtp-Source: AGHT+IHn+envI4IgybCRIFnWSdTXoNW0blGT6d8bR0t/mUZx8s8Tf/oe3ggjf78h9sMUMQYTZVvYZQ==
X-Received: by 2002:a5d:598d:0:b0:38d:fede:54f8 with SMTP id
 ffacd0b85a97d-390ec155371mr5318833f8f.16.1740841542986; 
 Sat, 01 Mar 2025 07:05:42 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47965f3sm8513394f8f.9.2025.03.01.07.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 07:05:42 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Fiona Klute <fiona.klute@gmx.de>, Julien Olivain <ju.o@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "Yann E . MORIN" <yann.morin@orange.com>
Date: Sat,  1 Mar 2025 16:05:41 +0100
Message-ID: <cover.1740841539.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740841543; x=1741446343; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=e1Hf/4xr8BZ3/fAntTzNj3Hq7Uwv4TTrBfiSDfjslnk=;
 b=hxB94rng8vTAYOvBrKzZJP66/r7ozq3B9srkJE7ncNVB7aLW3iqwyNL97ewtcHE2qb
 pJd2sAxcUCcAB7Jnsk9OxWyOjtHMvmgHcVuImUicEGplSnoB/8AWTc+k9P+uB3AsRAtB
 p5WTyG7Zr8TVeTD3U+qe750dxQtb5mHXN3bJk5hz9BQUSGucI2MZ+rlLghhxMxpOQFd3
 WqPDBgvJNuT/7ekUOJWCfYHfS5giS4Jmyw7MZCrzZuoPhqwgOrQ5Pd7sFBnT78CyHOWg
 I1HCXHDEgTZsZG7ni4eXV5WnlevGFirUXUrY/x1KZphEIOKu/lWOof3o9hawhn+cW701
 rTuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hxB94rng
Subject: [Buildroot] [PATCH 0/9 v3] package/podman: new package (branch
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

Changes v2 -> v3:
  - make rootless actually work (Raphael)

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (9):
      support/testing: set date in emulated machine
      package/shadow: install to staging for subids
      package/conmon: depends on systemd when enabled
      package/slirp4netns: needs TUN support in the kernel
      package/skopeo: add target variant
      package/cgroupfs-mount: tweak the kernel config
      package/cgroupfs-v2-mount: new package
      package/netavark: new package
      package/podman: new package

 package/Config.in                              |   4 +
 package/cgroupfs-mount/Config.in               |  12 +-
 package/cgroupfs-mount/cgroupfs-mount.mk       |  11 ++
 package/cgroupfs-v2-mount/Config.in            |  10 ++
 package/cgroupfs-v2-mount/S30cgroupfs2         |  44 ++++++++
 package/cgroupfs-v2-mount/cgroupfs-v2-mount.mk |  20 ++++
 package/conmon/conmon.mk                       |   4 +
 package/netavark/Config.in                     |  10 ++
 package/netavark/netavark.hash                 |   3 +
 package/netavark/netavark.mk                   |  19 ++++
 package/podman/Config.in                       |  41 +++++++
 package/podman/containers.conf                 |   2 +
 package/podman/podman.hash                     |   3 +
 package/podman/podman.mk                       | 114 +++++++++++++++++++
 package/podman/policy.json                     |   7 ++
 package/podman/registries.conf                 |   1 +
 package/shadow/shadow.mk                       |   1 +
 package/skopeo/Config.in                       |  25 +++++
 package/skopeo/skopeo.mk                       |  10 ++
 package/slirp4netns/slirp4netns.mk             |   9 ++
 support/testing/infra/emulator.py              |   5 +
 support/testing/tests/package/test_podman.py   | 147 +++++++++++++++++++++++++
 support/testing/tests/package/test_skopeo.py   |  41 +++++++
 23 files changed, 532 insertions(+), 11 deletions(-)
 create mode 100644 package/cgroupfs-v2-mount/Config.in
 create mode 100644 package/cgroupfs-v2-mount/S30cgroupfs2
 create mode 100644 package/cgroupfs-v2-mount/cgroupfs-v2-mount.mk
 create mode 100644 package/netavark/Config.in
 create mode 100644 package/netavark/netavark.hash
 create mode 100644 package/netavark/netavark.mk
 create mode 100644 package/podman/Config.in
 create mode 100644 package/podman/containers.conf
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
