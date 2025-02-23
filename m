Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C4FC021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 21:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F18EC80BB8;
	Sun, 23 Feb 2025 21:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2AtJD9u-ziX8; Sun, 23 Feb 2025 21:14:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F264F80BC2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F264F80BC2;
	Sun, 23 Feb 2025 21:14:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30D76920
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1563B80BC2
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8HmN736c4PP for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 21:14:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0AC9780BB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AC9780BB6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AC9780BB6
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:33 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38f2b7ce319so3190707f8f.2
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:14:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740345272; x=1740950072;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ujwm8+g/3mBc9JBek8Cn5gqlkil804MKFgXrUqteOf0=;
 b=p4PeUfg+T8ic5Vm0T5hskM+iJB9gONLVxVYYC4VaU9FWb2zIVabeEpQ6xk2uCHlGkU
 JSjJSIaIcGRYqnrL5UsWCKvTDPGXUS5gq7HvgdWlj2i0CfQMnTasaZqb26zgH/5w29y8
 cbn8P6mYmvwmZVYwEppEy3zF0RjvyzIKoTHbNHKe9b69pWl8bZnKCUSzlYN9wvc7iUi0
 qxwgyKq72Bwvs5YHRfmXVSCSePiwp1R7KGpQ+1MfPz9ZfbEcBaN5npVh0Vls/f4pu97M
 /3Bq7/oReayGG1p2gS0Yd8UIJB3t9Kouy+Ps+QzWL0HTWDr+iw65cQF/ZiWASkqLaWhO
 LhCg==
X-Gm-Message-State: AOJu0Ywh/AZ4bEdhzn/JDSndZr+J0ICCaqKfA4GPIh9r46gGw0TXGsXB
 CpvrEXFCwSj3fuXfvqXQEk9UmqjbmGqdOnbntxgmEGXx4wTgknYXh9RIow==
X-Gm-Gg: ASbGnct4wi2lbbkbWFj7wt8g9ROg/D7BaQcKg4JfuhIxw7VRWl320WjX9e14JqAxMdi
 Z/unXjnSeLfNIHXGc7aWqQj7MQRfSE3MbTTpqHR5u7aj/Zmvtctr5RCAMuuejshIlq5Ln+hffln
 5BPFjtzaszdg9zt5ZcNW9bYl6iL3kENvrYPeB5FGQ5RVzgxHpWw0z1yF0PnkFXAE74cyUAb7VPf
 rHMygMd93nS+M6YXBgSO6DFiZNJrGfleNrLxhUgGHJc6dSQGWvAGT/MWD2qvjoYdKA+mDA9O889
 0CRpyF465UVENY1Lv9F3ULpmUaeRR21KQ5vN
X-Google-Smtp-Source: AGHT+IEcLMpeJg35jsj/7AcmDQt8WEWf/jltbQF+gr5x8YRq94knFrSQ6FSlfmoM1O38W04aX4gxVA==
X-Received: by 2002:a05:6000:1f8a:b0:38f:27e9:7918 with SMTP id
 ffacd0b85a97d-38f6f03e611mr8587420f8f.26.1740345271597; 
 Sun, 23 Feb 2025 13:14:31 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25913f5asm30209228f8f.52.2025.02.23.13.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 13:14:31 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Fiona Klute <fiona.klute@gmx.de>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "Yann E . MORIN" <yann.morin@orange.com>
Date: Sun, 23 Feb 2025 22:14:30 +0100
Message-ID: <cover.1740345268.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740345272; x=1740950072; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=Ujwm8+g/3mBc9JBek8Cn5gqlkil804MKFgXrUqteOf0=;
 b=Sz+39udq4f3wyWUukZx7Kx1NF3R5NTSoaKTUHbl9aZUKsuM/EGmhAIW+sSDaUDM/Zx
 O2LGMNFEH/r66uUoz3ok/xf3SXzYxJDqmJ24nrkUDUYqlv16wRpo81i8luGfRNriJrBB
 VS3pUUgDbcW/QQj6CW6vBTuXjxs5mLz/9FZw/pfDAakpkC/a5u/ewyVTeOdoG5aM4r4d
 /X5NKNenVcCz+XRN3JHqkyNmNwKGHXLQ82jrOMKwbWqYCj7XPOIKv8cw8aZF70VumUxY
 4TmvaugIJCktBNL4dU/X86/Vn6ht4sfeS6k38DcEbjMmqFJ8KtCRQmpCfQMtTCtjM+fE
 w6ww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Sz+39udq
Subject: [Buildroot] [PATCH 0/8] package/podman: new package (branch
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
 package/netavark/netavark.hash                 |   2 +
 package/netavark/netavark.mk                   |  16 ++++
 package/podman/Config.in                       |  38 ++++++++
 package/podman/podman.hash                     |   2 +
 package/podman/podman.mk                       | 109 ++++++++++++++++++++++
 package/podman/policy.json                     |   7 ++
 package/podman/registries.conf                 |   1 +
 package/shadow/shadow.mk                       |   1 +
 package/skopeo/Config.in                       |  25 +++++
 package/skopeo/skopeo.mk                       |  10 ++
 support/testing/infra/emulator.py              |   3 +
 support/testing/tests/package/test_podman.py   | 124 +++++++++++++++++++++++++
 support/testing/tests/package/test_skopeo.py   |  41 ++++++++
 21 files changed, 478 insertions(+), 11 deletions(-)
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
