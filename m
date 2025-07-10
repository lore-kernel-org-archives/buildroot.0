Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D4DC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA6EC613AA;
	Thu, 10 Jul 2025 20:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBTLfVivbzKl; Thu, 10 Jul 2025 20:23:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E231C610BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E231C610BB;
	Thu, 10 Jul 2025 20:23:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A16712E
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86F4D40D34;
 Thu, 10 Jul 2025 20:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1yUGUqL9u0y; Thu, 10 Jul 2025 20:23:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 043FC40D2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 043FC40D2A
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 043FC40D2A
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:00 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-450cf0120cdso11847775e9.2
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178979; x=1752783779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LGDrHhdsN+70vFt0RpVdBhu8eoxz7oO6t/1CVeAtsmI=;
 b=oFT1LdrKouRGN5HhmiCxOt0PKlkN8x92/COflr/H4evfOJ5wSsGO2TjKpKTf3XfS7z
 ttu46nxvGJO0dz75l9tVMQGsah8lFlWlltJPFbiVR0rSNGtLqyaWeAFXNJrzwQoepmZf
 08BW5QLZGHq1qPaUNvi8LaffGCCjpbY1nUtmNHk0gvBVqhMrAWwRroN1IVGDRHiY4J5Q
 9+HS/d3C6TEQmrUZmmXoeyxxJCuEqel4yp+6XGvHU6CDafCZMKRNKhN1I2u7dMWtgbOL
 YRSk8cWVA1NG4zpz+vBb3UFNdW3M+nX208hT35SFb8GR1kIwbVDgl0kvTOk9Kbe/k3jW
 Zpgw==
X-Gm-Message-State: AOJu0YwDC1h1i2uLAAxlq0qBy5PuPmuAj4zjWAYvmoj4NNsUvJUlI9EL
 zcj5tSCUCUNtSsrEKg3VvBokQtszBlZruiI7DiLrpmnljzgbuhdfRrDfJBXoiQ==
X-Gm-Gg: ASbGncuE7ZlNdxym6PhHw3wrIwDCoOttx1w1OstfT4rWRwNEPhdpvH3EXrlaPDP0Hnj
 QLE/WDyka8kQs2jEQg6bu75YpVTZBVnnnVtdpcB1t7cWmdMSvFsI2SzpxAmfFUPfKrVF9CNMjHl
 NoSAcNRKOuU6qVb7m49DSYP+Pq+nsdu0VLAosW8CT5FwBHL92HJ4WQO50HPvt7MKBEBRNvcqWWY
 L3AYPBQWZg2DoNugKdsuOCWj8YVyEXT0pZkk3OO+yA2foQ/Na+R9T2wowhd7PVMb5tSMoyNIFn1
 jCJbLX6D64I/JvgRRDIhRNKOML3An0pkYwC+sDOoDbeRiOslYS8aLsbuVQhQMjHf7nbTFeZG
X-Google-Smtp-Source: AGHT+IHjGAReZL55D/NK8bdBFsf6LlQZIIWYHeSvZC2PmI9hZI1uP+9c22P4y+k5P2qUzNl5E5ElXg==
X-Received: by 2002:a05:600c:628d:b0:442:faa3:fadb with SMTP id
 5b1f17b1804b1-454e7b603c4mr2263645e9.2.1752178978615; 
 Thu, 10 Jul 2025 13:22:58 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d88dsm2727905f8f.65.2025.07.10.13.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:22:58 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 22:22:57 +0200
Message-ID: <cover.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178979; x=1752783779; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=LGDrHhdsN+70vFt0RpVdBhu8eoxz7oO6t/1CVeAtsmI=;
 b=NHp9YjFIG4OlDfeT/1u8q41A1gh5sMQQ2yZOtJYX2lmz3JI8zllJv4Yg9cX+zwvMHi
 LlGeukQ8wdlXcL0syeZKwKFlXGug3LZQAF/L+RUbhhfWI9at42LK2w/bumRdFm9rS3rn
 44+zu4fM6klRbteGg1ZwI/AR1GiAgMpcllMHb0hOMzyq6QzKp+8pH8+wWm0MjMyoaq/7
 Po95+ZCG60pwk3qFMed1sDmuaPCBAXP5mFvmJz1L9OUqUew17zp/PBhJc+Krfb3FbIBv
 Sf3OAdNSKtMNJp9b9gfv4aL1Cvs4CQvzbdU5XVQnSIatji4A41YtPqmbFcTvJclJEztj
 jmFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NHp9YjFI
Subject: [Buildroot] [PATCH 00/17 v2] system: add support for merged-bin
 (branch yem/merged-bin)
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, Sen Hastings <sen@hastings.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Arnout Vandecappelle <arnout@mind.be>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This series introduces support for so-called merged-bin, where /usr/sbin
is merged with /sur/bin, as an extra step after merged-usr, now just
requested, but in a relatively close future required, by systemd.

The series is organised in a few steps:

 1. patches 1-3 are cleanups in the Kconfig menu, related to the
    merged-usr prompt, to the defaults for PATH, and to the rationale
    for selecting merged-usr with systemd; those can be applied without
    considering the rest of the series;

 2. then patches 4-9 prepare support/scripts/check-merged-usr.sh to
    check for more than merged-usr: a good cleanup, and better check the
    merged state; those patch can also be applied without considering
    the rest of the series;

 3. with patches 9-12, support for merged-bin is added, and the merge
    level of skeleton and overlays properly enforced to match the
    configured merge setup; those require the two set of patches above
    to be applied first;

 4. then, patches 13-16 introduce workarounds for a few packages to
    properly support merged-bin. For ease of review, those are separate
    patches, but that means the series _may_ break if the merged-bin
    support is applied but not the per-package workarounds; those
    require that all patches above be applied first, of course;

 5. the last patch makes merged-bin mandatory for systemd and extend the
    systemd runtime test to catch future tainted flag; again, that
    requires that everything before is applied, too.

The series was tested with a large set of packages and a large set of
toolchains, and although it is a critical change, it is still pretty
well confined to just a few spots.

Changes v1 -> v2:
  - add Arnout's Acked-by tag where appropriate
  - totally rewrite the test for merged status
  - reject unexpectedly merged skeletons or overlays
  - add runtime test to catch systemd tainted flags
  - typos

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (17):
      system: reword merged-usr prompt
      system: drop superfluous negative condition for default PATH
      package/systemd: select merged-usr from package, not init
      support/scripts: comonalise checking merged status
      support/scripts: prepare for a more complex check for merged directories
      support/scripts: also exit in error on improperly merged-usr
      support/scripts: move merged-usr errors message into check-merged-usr.sh
      support/scripts: fix and restrict conditions to accept merged dirs
      support/scripts: rename check-merged-usr.sh
      support/scripts; teach check-merged what to check
      system: add support for merged /usr/sbin (aka merged-bin)
      support/scripts: reject skeletons or overlays that are unexpectedly merged
      package/coreutils: no need for chroot workaround with merged-bin
      package/kmod: adjust paths for merged-bin
      package/util-linux: adjust paths for merged-bin
      toolchain/external: support merged-bin
      package/systemd: require merged-bin

 Makefile                                   |  19 ++--
 package/coreutils/coreutils.mk             |   2 +
 package/kmod/kmod.mk                       |  12 ++-
 package/skeleton-custom/skeleton-custom.mk |  25 ++---
 package/systemd/Config.in                  |   2 +
 package/util-linux/util-linux.mk           |   8 +-
 support/scripts/check-merged               | 146 +++++++++++++++++++++++++++++
 support/scripts/check-merged-usr.sh        |  39 --------
 support/testing/tests/init/test_systemd.py |  19 ++++
 system/Config.in                           |  20 ++--
 system/skeleton/usr/sbin/.empty            |   0
 system/system.mk                           |  14 ++-
 toolchain/helpers.mk                       |   8 +-
 13 files changed, 232 insertions(+), 82 deletions(-)
 create mode 100755 support/scripts/check-merged
 delete mode 100755 support/scripts/check-merged-usr.sh
 delete mode 100644 system/skeleton/usr/sbin/.empty

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
