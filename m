Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3990C3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 16:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 571F58374F;
	Wed, 14 May 2025 16:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQpy_Epj4cJV; Wed, 14 May 2025 16:58:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6673683530
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6673683530;
	Wed, 14 May 2025 16:58:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E69912A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E83D9819CC
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vyF7ozPlkD71 for <buildroot@buildroot.org>;
 Wed, 14 May 2025 16:58:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A749483530
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A749483530
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A749483530
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:28 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso295495e9.2
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241907; x=1747846707;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IuZebnWlwFjSD+TYdXO3OvghP+2vSUrgGZC0Gx6iS4k=;
 b=MpA+5mn+4xaPizWVLBZn6q3ZDrU5ULKiTVgc+ABImfgNS/yr8bkUWFbzOtB/Ie/5Pe
 z5z9yUKJ7CJ/Ebe2HF2SopN3LvRQG95KzHcWleTyKdntJd6QB9f8bBWYP9pIUT0jahZc
 E1/nKqkUzftRUbrp0BcPOnytqgI0Iax8oYWbaWzUrZm3lEzQoywuR58i1ILXaBTGd/KR
 /TeWrjT9AJt9IhHy6DgGXa3WbAY0D/e0JC4ZC9tanHDhZDn8+2NRTH6mXUNBGsxcWywt
 lVG4Cey00cfS18nUK3J2i3i7BKO/QfbzXoBnit6wTS6zZsFyAbqpOrExRG+TlbCXUMv3
 AJGA==
X-Gm-Message-State: AOJu0Yx27vr47FY2bQs3tETxNZu0W4oZn79BnOgNiF8zA9RLTOgqP/eS
 LONKy2ONplVzgkJOn0QXMLTVFY4f1Yz2eokWUYrfsHF/cxHGqACmwy91Rw==
X-Gm-Gg: ASbGnctVpBwKmaKlyo8n74z44LKM8f5VVQnmlJv5sl3Uih3tpP42RjbJAxf8ZTYsx9s
 fNqaP/8doZ6ssGkTEJXzGPyOB0GQyJ064rXA7qOk8zHg4sO8F+AkvwYdq6Jz4r3w4urdM+BbRWI
 YXVK+5SvA1BN+KufGEDNQYCO/3Qh7DnJ2cB8+FZPJTOvAA/cyg0/vyb11D5TbZTeZQkeC+603ZO
 dQIv0gzKs7RPnxTQaeVcOGsQpV93BrS+h0pE97u/gwF/YkkmqLWJSbb+xaHiAxoDj6XvAPhulY0
 VsGB/q8uGS+XAMJZIQMkJ9TNlioC9qlQjjAaFs7eZubDQ+jWOeMxj58REj+khbz3xHFHMXBa
X-Google-Smtp-Source: AGHT+IEeHdx8+ueNwwPm841TNtWInVsdl7wu5cawJN32pbHJUOZdw+hF7pIACaZTk8so4fTNIWuNCA==
X-Received: by 2002:a05:600c:a50:b0:43d:abd:ad0e with SMTP id
 5b1f17b1804b1-442f210753bmr44350955e9.18.1747241906513; 
 Wed, 14 May 2025 09:58:26 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3369a7asm38826285e9.4.2025.05.14.09.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:58:26 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 18:58:22 +0200
Message-ID: <cover.1747241900.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747241907; x=1747846707; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=IuZebnWlwFjSD+TYdXO3OvghP+2vSUrgGZC0Gx6iS4k=;
 b=VkZwKJ+YSmqEJ+XTziHwMNIl65NuDqFDaS5zziOGxl8jZDZeB/Rr5kAE0VTJ5n/KZ5
 nDCnTB1Ic2gl4oD72P4OjvkqwdKR+x/5sGR+mU936JDQl/erq+C0CKBdeuVfDH3AuM1u
 T5exAK7k8XsySugSki2xTdTBn8Bx7ai1bNGljaE9k0wfiqR/poZSLCL57ltmKoGqcfLo
 LOBw9XExfJzgXb6L1mb5hwgkNizcE2+7sP0o9MV/GmaVrXVUBZdOQ+G/MZa4ntX9ikbg
 rFGMJmpmDcBV/YkBlvNoTk84OttoTKiXFvNzs7F6mFT4H3rgCT/G1gXqOwUTzdTykg41
 c9jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VkZwKJ+Y
Subject: [Buildroot] [PATCH 00/13] system: add support for merged-bin
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This series introduces support for so-called merged-bin, where /usr/sbin
is merged with /sur/bin, as an extra step after merged-usr, now
requested, and later required in a relatively close future, by systemd.

The series is organised in 4 main steps::

 1. patches 1-3 are cleanups in the Kconfig menu, related to the
    merged-usr prompt, to the defaults for PATH, and to the rationale
    for selecting merged-usr with systemd; those can be applied without
    considering the rest of the series;

 2. then patches 4-6 prepare support/scripts/check-merged-usr.sh to
    check for more than merged-usr: a good cleanup, and better check the
    merged state; those patch can also be applied without considering
    the rest of the series;

 3. with patches 7-9, support for merged-bin is added, and made mandatory
    for systemd;

 4. finally, patches 10-13 introduce workarounds for a few packages to
    properly support merged-bin. For ease of review, those are separate
    patches, but that means the series _may_ break if the merged-bin
    support is applied but not the per-package workarounds.

Although the series was tested with a large set of packages and a large
set of toolchains, and although it is a critical change, it is still
pretty well confined to just a few spots.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (13):
      system: reword merged-usr prompt
      system: drop superfluous negative condition for default PATH
      package/systemd: select merged-usr from package, not init
      support/scripts: comonalise checking merged status
      support/scripts: fix and restrict conditions to accept merged dirs
      support/scripts: rename check-merged-usr.sh
      support/scripts; teach check-merged what to check
      system: add support for merged /usr/sbin (aka merged-bin)
      package/systemd: require merged-bin
      package/coreutils: no need for chroot workaround with merged-bin
      package/kmod: adjust paths for merged-bin
      package/util-linux: adjust paths for merged-bin
      toolchain/external: support merged-bin

 Makefile                                   | 11 ++---
 package/coreutils/coreutils.mk             |  2 +
 package/kmod/kmod.mk                       | 12 +++++-
 package/skeleton-custom/skeleton-custom.mk | 10 +++--
 package/systemd/Config.in                  |  2 +
 package/util-linux/util-linux.mk           |  8 +++-
 support/scripts/check-merged               | 65 ++++++++++++++++++++++++++++++
 support/scripts/check-merged-usr.sh        | 39 ------------------
 system/Config.in                           | 20 +++++----
 system/skeleton/usr/sbin/.empty            |  0
 system/system.mk                           | 11 +++++
 toolchain/helpers.mk                       |  8 +++-
 12 files changed, 128 insertions(+), 60 deletions(-)
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
