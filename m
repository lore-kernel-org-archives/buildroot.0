Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4ABCFC535
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 10:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 665DA6059C;
	Mon, 14 Oct 2024 10:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dlOl4DtAulWq; Mon, 14 Oct 2024 10:21:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D86760619
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D86760619;
	Mon, 14 Oct 2024 10:21:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2720D1BF2F0
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 10:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2255D4029F
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 10:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlA_UO4A0cGQ for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 10:21:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82CD340286
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82CD340286
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82CD340286
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 10:21:28 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4312484334eso2927295e9.0
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 03:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728901286; x=1729506086;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yeueu+VABeNGObpvrgjBa1uhSX+0eaJTBasJ4a3gvTA=;
 b=ZiNiD6Zq1fgsxO60RQkMHpMUYsPZToCMSQu4K3/mtliK9d29FF+4xhj6aDbukgQvsa
 Wnqco4PR6RQmT/8fDr8mTnaUoi260jxSM6yD92FgwqTYLSmw3TGNkx1uEZjcjzz2P40w
 CCQhjFS26vwcEqZh73HC7MXPH8h0DW31nR5Tl8HSppK8c2Q9khsc4/uAvYQhxgxylUuN
 QGoyBLGD04VOrYe57eO62dB5SxEX1O/X+ohQT5ezJhy6C+UxpDyYyzKbkbdLx/1cb/Sz
 jAeacyEnPD119SVggCHIK37FJwAYHV4zQvSoWTJdmy9ExJQ+rGmBEhA25fsk+8rW6538
 KpKA==
X-Gm-Message-State: AOJu0YwxMhIzp3xq7WE3yyvPqA1UBwBHxyHrnSCdRCRThOkdb4zaaw7H
 BBj7JD5Fg09PGQw8KClwjST4/e2GZzoxuYUHU0YgJqXi5leY8XwsYpYMwAWmiQTv5beu+O/rsy6
 FSbk=
X-Google-Smtp-Source: AGHT+IFSAUXBAGg5SJKcq0v3828Dxo5AInTqeZhuIJtpDmLLdwr+ZUK1OG85jKHTRIiU49fEvvrAdA==
X-Received: by 2002:a05:600c:1551:b0:42c:aeee:80c with SMTP id
 5b1f17b1804b1-4311dfcf26dmr40329435e9.9.1728901286325; 
 Mon, 14 Oct 2024 03:21:26 -0700 (PDT)
Received: from adam-laptop.amarulasolutions.com
 ([2001:b07:6467:4426:e642:fe3c:c003:b424])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431182d7ca3sm116402605e9.2.2024.10.14.03.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 03:21:26 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 14 Oct 2024 12:21:17 +0200
Message-ID: <20241014102123.3727883-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728901286; x=1729506086;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yeueu+VABeNGObpvrgjBa1uhSX+0eaJTBasJ4a3gvTA=;
 b=fEYSRb7gLu46imYolaE9kGbFYKF8068bpXSKlOFaF6TIccc5GE3dOueWoS+lgULeiZ
 TTz/GoODyQlgeljjMKTpWAs4ohWx2f72Deae9NgAgZmnKLKA5H26TgoHEVsi/jeTGOZ7
 B1hrJ8D6wbJ/5rDLAgZ9hD3THVZqxvqVenEKY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fEYSRb7g
Subject: [Buildroot] [PATCH 0/6] mender cleanup and intermittent update
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
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Instead of updating mender directly to 4.x, which is far too large
of a change, update it to 3.5.3 which is the last of the GO version.

This not only provides security and bug fixes, but it makes the
transition to 4.x when someone picks that up much easier. This is based
off of previous work found here:

https://patchwork.ozlabs.org/project/buildroot/patch/20231219172446.498409-6-adam.duskett@amarulasolutions.com/

With the addition of more tests, cleaning up documentation, and adding some
information in the migrating.adoc file.

Adam Duskett (6):
  board/mender/x86_64/post-image-efi.sh: re-arrange write rootfs-image
    args
  package/mender: remove /var/lib/mender symlinking
  support/testing/tests/package/test_mender.py: Add RO fs test
  support/testing/tests/package/test_mender.py: Add a systemd test
  package/mender/readme.txt: update readme
  package/mender: bump version to 3.5.3

 board/mender/x86_64/post-build.sh             | 12 +---
 board/mender/x86_64/post-image-efi.sh         | 25 +++++++-
 docs/manual/migrating.adoc                    | 15 +++++
 package/mender/S42mender                      | 16 -----
 package/mender/artifact_info                  |  1 -
 package/mender/mender-client.service          | 11 ----
 package/mender/mender.conf                    |  1 +
 package/mender/mender.hash                    | 10 +--
 package/mender/mender.mk                      | 10 ++-
 package/mender/readme.txt                     | 60 ++++++-----------
 support/testing/tests/package/test_mender.py  | 64 +++++++++++++++----
 .../tests/package/test_mender/post-build.sh   | 25 ++++++++
 12 files changed, 148 insertions(+), 102 deletions(-)
 delete mode 100644 package/mender/artifact_info
 create mode 100755 support/testing/tests/package/test_mender/post-build.sh

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
