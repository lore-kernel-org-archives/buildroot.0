Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181D8C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 14:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9E1A610BD;
	Wed,  5 Jun 2024 14:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RL1HqrF0mpjV; Wed,  5 Jun 2024 14:18:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9701A61113
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9701A61113;
	Wed,  5 Jun 2024 14:18:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4E01BF23C
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24E0D84815
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwoL4yqm5ZUz for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 14:18:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD25084812
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD25084812
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD25084812
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 14:18:18 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4210aa00c94so61015305e9.1
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 07:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717597097; x=1718201897;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kix8/UfkLgpKJBy3xnbHOY3ZW+rTDNe4fuKLSUW1ij0=;
 b=HOWimq6G9pu5wKk5zTaPr7sil8TRweATYRhoo6/33IME4nU1IrB5ZK/563pg7tGbzf
 XogZ785ullCL+codyvJhxy201zuZ/kd/YC6Lcx5HrTh00JttCO/ecOCHmt0ndPQJ8Ccc
 Fll3wo6r33phPAYYmJ8gsurh11ZzMFrZsptWfA4MTytRUTO4dseTX361WrIcWdqrvJ1p
 oa6xPw1gjL/ueOLWNlkBLGtV+pl8q68rhzPX2HnZ0OG8/vGc6PX9bfsAANh/eUcmZf6B
 JLI7bZcJelteFjvIJDVlxh4lkAdlBOaKUMaHErH/x1PA2KSHiaJv8E4zRsCDxaeGUwkp
 tDQw==
X-Gm-Message-State: AOJu0YyKRAHAvGSIPTgyzkKKPCMSDfsMuVKZkfV7r/VEOB/grm56+Fhq
 1SACGhI5nkir2nB03wFOfldMilLlQ3uwg/6PAIEQcB4lh+HrLbvotoxk7g==
X-Google-Smtp-Source: AGHT+IGib/uNKEVTcq6U8zfkxj1ngo8ES9iStHV5+qA1x3fUOXSKbnvmm+++cwW4omIBjAM/hSGz2w==
X-Received: by 2002:a05:600c:3b06:b0:421:29f4:4f14 with SMTP id
 5b1f17b1804b1-421562df232mr21344485e9.6.1717597096507; 
 Wed, 05 Jun 2024 07:18:16 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158149008sm23071455e9.29.2024.06.05.07.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 07:18:16 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 16:18:15 +0200
Message-ID: <cover.1717597094.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717597097; x=1718201897; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=kix8/UfkLgpKJBy3xnbHOY3ZW+rTDNe4fuKLSUW1ij0=;
 b=Oa5dWQqNsL1sxPRDM4GHWl8asnBJoAqcn9vodeyj/tdr7nuKhH38UaO82pI0vaq2jK
 ISCdw2mppkDBLeMLRfJqu5ObMufIL5aD6OFI71s/wWO4br0cTq2FSUTnbq195tyoDomi
 mXawqfHhx7oA/jc3PcmbZeJZsXoy1VhZ4jkgkWCR2LWC+ZjlMN7SKwniiJ0RQNVNxJFV
 NTQ7A9/H7WpLWCuMfn/znhVJkD3Ggy6TEdjKabormb+adCpDY8wIbgmufGTrTn5VH9h4
 7Eh/fk+DtHO8cGbe175CyTL2dv22qFvBA6ysNy6oqcisKgXJdo3kpmSA0TAU3sagZV+n
 XXWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Oa5dWQqN
Subject: [Buildroot] [PATCH 0/9] everywhere: use $(TAR) not tar (branch
 yem/tarTAR)
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

To allow for reproducible archives, and to ensure we can extract all
archives, we require that we use tar 1.35 or above.

There are then two cases:
 1. the system has a suitable tar: we use that;
 2. the system has no suitable tar: we build our own host-tar, and use
    that (it ends up in HOST_DIR/bin so is in the PATH).

However, to avoid building host-tar again and again, people can set the
TAR environment variable, to point to a tar version they believe is
suitable (if it is not, we fallback to case 2, above). If the user
provides a suitable tar, then we do not build our own host-tar and use
the one provided by the user.

However, there are a few places where we do hard-code calls to 'tar'
without considering the one provided by the user. This breaks cases
where an unsuitable tar is available on the system, as that unsuitable
tar is then used to create and extract tarballs. This breaks generatign
tarballs from VCS (git, svn) or from vendoring (cargo, go).

Fix all those cases.

How to find calls to tar:

    $ git grep -E '\<tar '

There are a lot of false positive:
  - CHANGES
  - comments
  - docs
  - patches
  - misc (e.g. a script with a $tar variable)

After this series, we still have a very few locations which directly
call to a plain tar:
  - Makefile: the 'release' target
  - scripts not called as part of the build
  - boards readmes
  - patches

The first will be addressed in a separate patch, as it is not critical
(users do not nromally cut Buildroot releases!). The others can't be
changed, as they execute outside Buildroot's control.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (9):
      fs/tar: use appropriate TAR
      package/cvs: use appropriate TAR
      package/flutter-engine: use appropriate TAR
      package/pkg-download: export TAR for download backends
      support/download/helpers: use appropriate TAR
      support/download/cvs: fix shellcheck
      support/download/cvs: use appropriate TAR
      support/scripts/apply-patches: use appropriate TAR
      package/sunxi-mali-utgard-driver: handle patching the Buildroot way

 .checkpackageignore                                |  1 -
 fs/tar/tar.mk                                      |  2 +-
 package/Makefile.in                                |  2 +-
 package/cvs/cvs.mk                                 |  2 +-
 package/flutter-engine/flutter-engine.mk           |  1 +
 package/flutter-engine/gen-tarball                 |  2 +-
 package/pkg-download.mk                            |  4 ++-
 .../0001-build.sh-do-not-apply-patches.patch       | 39 ++++++++++++++++++++++
 .../sunxi-mali-utgard-driver.mk                    |  3 +-
 support/download/cvs                               |  5 +--
 support/download/helpers                           |  4 +--
 support/scripts/apply-patches.sh                   |  2 +-
 12 files changed, 54 insertions(+), 13 deletions(-)
 create mode 100644 package/sunxi-mali-utgard-driver/0001-build.sh-do-not-apply-patches.patch

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
