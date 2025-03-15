Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAA0C28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 19:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8877F607C8;
	Sat, 15 Mar 2025 19:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kONMeLQKt1NS; Sat, 15 Mar 2025 19:57:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5419B607BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5419B607BE;
	Sat, 15 Mar 2025 19:57:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC94FEA
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AACE9411C9
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uA6Obumz9rfB for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 19:57:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC52741147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC52741147
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC52741147
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43bb6b0b898so7858105e9.1
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 12:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742068631; x=1742673431;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SngFbQS7SFA3Qj5NYN841qZ/aUzx+5eDC3KjQTfE9rQ=;
 b=D7skp4dIj8KLExV3YvgM2whHUFZhRK2Yz9oy3ChBH9OkdZKLFoMiVZEdUFD2y6bdMY
 MxSCLRFInpJSVgiu3H1M15j3+/z/mzWdprGkPlMQxBBTrboYeKraCA5pNplnghSB4imv
 P34wu16cYFhLsgL8zePUccr8dD/FB9hHwuI/2KghGYBJjIv1sOluYSxlEGghdh2V/g84
 d6kyZopGVZGGKgys3ZAfcIPQoIZAZh/L44apaLbsVlGADY/D11usz/5da3V1ACzGBXSX
 tzCJuPyVcOUeLgGLRTfijTI+Cu9H0XkT09/FopwJLGWELBS/LEQz/psO/o6mM7p1BGLk
 s8SA==
X-Gm-Message-State: AOJu0YzBEzWWumad5J6xiCwmLqQbONpUSVgr/x2OaK+9qPjUGuo1kozd
 MCre3TF8h+TY7eWTZ8ZiOx1aWexe96593/YC9SDhON4o9lUAINNwa7dD5g==
X-Gm-Gg: ASbGncthX6r4JtMh0+Rbo588jcxp8A+wS0p7gdZZWzsJ3SolLjaJJSJ8RV4mLOlcKwv
 fnT8V3oX00N92+/CfiHaJlT/YhIxr1DR35YT0v8CqUa6hu2p3XrBFzQnbS2v9I9hzoPPvr1tcKb
 DRAVgHpAM4jpcCTDD3uhRCz8CU6l7sj9JbzlTO5YFprMBOyiawS0x+wBeevEFRY8aarhsk2pCLt
 ioETJg6/4cYzs+Z77aQsRYujDGdpSO8KyUt3qD2Dl8IvtKRMta4h6C5mWMvD6GrMmMfC8QncAxw
 mu2u+dBNYyo+vnVaLYjCy+Cru8evj7/tZTugSy1w21bsic74jQXnCWTS
X-Google-Smtp-Source: AGHT+IFCwzBchjZZ/uPchHjuCpXCh5N2o+RANMOo5RqZWYjBl1ao1NW/MWipbv+o39H7JLBd+zubMw==
X-Received: by 2002:a05:600c:1994:b0:43c:f470:7605 with SMTP id
 5b1f17b1804b1-43d1ec80e5cmr85379985e9.12.1742068631084; 
 Sat, 15 Mar 2025 12:57:11 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fd301edsm29313365e9.0.2025.03.15.12.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 12:57:10 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 20:57:09 +0100
Message-ID: <cover.1742068624.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742068631; x=1742673431; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=SngFbQS7SFA3Qj5NYN841qZ/aUzx+5eDC3KjQTfE9rQ=;
 b=kIWfcN0vQ/CSuOTApfGVlO6W8CaKXmd15gB3Pt9ophBmEWBi/eoC3wM8TPZTJc0Cwh
 W9LcYMT1GhYBSzt02Yffn2jEfeBaIp/rrh6UQgmztGXdCyLN4n2BLcDnHfn2j3WvdM/h
 yGGm7JLZ6rsoCrhHNLtgDM/E0cbbRg+oE7NMYflIPd1Nf13sSf0UhVJHHZHuV8a70JFG
 e8toRVpoAAxT6qUeRMqcdX9NlhF8Mxx9drPGobLtABXY33O1xYYYWtDsToV5vwc0UTBB
 XL8o6CQziXgA1V6lLXCJiPVifY3vVHoBROLsHY6F3UZLBsit2D5horIF0ggAZ0BUfyGS
 h7Vg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kIWfcN0v
Subject: [Buildroot] [PATCH 00/14 v4] package/podman: new package (branch
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin@orange.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
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

Eventually, it adds a few optional packages that extend podman's
functionality.

Not required by podman, skopeo is made a target package as well, as it
was of help debugging podman (and Docker in a separate series).

Last but not least, the ultmate patch in th eseries moves the
/etc/resolv.conf symlink target to pont into /run rather than the
current /tmp.

Changes v1 -> v2:
  - add licensing info for netavark and podman  (Julien)

Changes v2 -> v3:
  - make rootless actually work (Raphael)

Changes v3 -> v4;
  - bump podman to 5.4.1 (from 5.4.0)
  - add support for nftables in lieu of iptables  (Raphael)
  - move iptables and nftables options from podman to netavark
  - ditto for related kernel config fixups
  - add json option to nftables
  - add aardvark-dns (for inter-container DNS) and passt (alternative to
    slitrp4netns)
  - extend podman's runtime test with network testing
  - move /etc/resolv.conf symlink to point into /run

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (14):
      support/testing: set date in emulated machine
      package/shadow: install to staging for subids
      package/conmon: depends on systemd when enabled
      package/slirp4netns: needs TUN support in the kernel
      package/skopeo: add target variant
      package/cgroupfs-mount: tweak the kernel config
      package/cgroupfs-v2-mount: new package
      package/nftables: add an option to force JSON support
      package/netavark: new package
      package/podman: new package
      package/aardvark-dns: new package
      package/passt: new package
      package/podman: add option to use passt as network backend
      system/skeleton: move target of /etc/resolv.conf symlink

 docs/manual/migrating.adoc                     |  14 ++
 package/Config.in                              |   6 +
 package/aardvark-dns/Config.in                 |   9 +
 package/aardvark-dns/aardvark-dns.hash         |   3 +
 package/aardvark-dns/aardvark-dns.mk           |  15 ++
 package/cgroupfs-mount/Config.in               |  12 +-
 package/cgroupfs-mount/cgroupfs-mount.mk       |  11 ++
 package/cgroupfs-v2-mount/Config.in            |  10 +
 package/cgroupfs-v2-mount/S30cgroupfs2         |  44 +++++
 package/cgroupfs-v2-mount/cgroupfs-v2-mount.mk |  20 ++
 package/conmon/conmon.mk                       |   4 +
 package/netavark/Config.in                     |  13 ++
 package/netavark/netavark.hash                 |   3 +
 package/netavark/netavark.mk                   |  93 +++++++++
 package/nftables/Config.in                     |   7 +-
 package/nftables/nftables.mk                   |   2 +-
 package/passt/Config.in                        |  19 ++
 package/passt/passt.hash                       |   4 +
 package/passt/passt.mk                         |  41 ++++
 package/podman/Config.in                       |  92 +++++++++
 package/podman/podman.hash                     |   3 +
 package/podman/podman.mk                       | 122 ++++++++++++
 package/podman/policy.json                     |   7 +
 package/podman/registries.conf                 |   1 +
 package/shadow/shadow.mk                       |   1 +
 package/skopeo/Config.in                       |  25 +++
 package/skopeo/skopeo.mk                       |  10 +
 package/slirp4netns/slirp4netns.mk             |   9 +
 support/testing/infra/emulator.py              |   5 +
 support/testing/tests/package/test_podman.py   | 253 +++++++++++++++++++++++++
 support/testing/tests/package/test_skopeo.py   |  41 ++++
 system/skeleton/etc/resolv.conf                |   2 +-
 32 files changed, 887 insertions(+), 14 deletions(-)
 create mode 100644 package/aardvark-dns/Config.in
 create mode 100644 package/aardvark-dns/aardvark-dns.hash
 create mode 100644 package/aardvark-dns/aardvark-dns.mk
 create mode 100644 package/cgroupfs-v2-mount/Config.in
 create mode 100644 package/cgroupfs-v2-mount/S30cgroupfs2
 create mode 100644 package/cgroupfs-v2-mount/cgroupfs-v2-mount.mk
 create mode 100644 package/netavark/Config.in
 create mode 100644 package/netavark/netavark.hash
 create mode 100644 package/netavark/netavark.mk
 create mode 100644 package/passt/Config.in
 create mode 100644 package/passt/passt.hash
 create mode 100644 package/passt/passt.mk
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
