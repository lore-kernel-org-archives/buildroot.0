Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF47FC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 17:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44CF840042;
	Wed,  5 Jun 2024 17:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJCX34bHBeug; Wed,  5 Jun 2024 17:53:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 955304199A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 955304199A;
	Wed,  5 Jun 2024 17:53:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E32571BF5B3
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB25981F56
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FDZF4tJMUAx for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 17:53:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E48E81EAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E48E81EAF
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E48E81EAF
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 17:53:23 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-421555a4454so1191335e9.3
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 10:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717610001; x=1718214801;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MpdXIHk50cKvkuPd6H9lWLntQfCvXu+BrKj1Zq+AuOo=;
 b=Frzht8j3BzfEvTPHSLex0AH+FlX8E1tuxmQf5TdXP+UeWD7Oggfr0KjmeXvCxPPVgZ
 wpytzGaA7pI1zdyOcZnlFFDzVdJzYkogQUrZMiV/bJCLaTjsBP8G3Fw8qOeh8znWsEEr
 xe9jvHE+HN/2FDHerSmdXvSpF3XY+EQEQpUySC5goCogwUaaiawVSmWzITfb6IuaBzwU
 GMWisbHVzn8iryD/2qH/pvj2LCU3nCVzh5w0l/0U7WprY8LEQTT32mLRm0QuspShi49F
 jhw84wASDaediUiF0nC5S7rsKm9TLz3KmIyJpCcMjjzY7LrpmAXLZNok4UuwFplwMohT
 faLQ==
X-Gm-Message-State: AOJu0YwpluN1UUPYg8t1olfWN1caomVauTu/kQP7dE/R3K5Z+6cDbwPE
 ffMmmEEGd5QrVHo7ropREJJ5GbIopEx3S3NJxgRqY8kGl448LipJrvtouw==
X-Google-Smtp-Source: AGHT+IHdSEupiYjT70YmZUFzkl+/0252wWpwDh+aS0gCYO3ZZ2QQjKufd2L2NzVbzmX6PF64fZWGsA==
X-Received: by 2002:a05:600c:3108:b0:418:f991:8ad4 with SMTP id
 5b1f17b1804b1-421562d3ef6mr26087075e9.6.1717610000986; 
 Wed, 05 Jun 2024 10:53:20 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215814e7cbsm30522135e9.39.2024.06.05.10.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 10:53:20 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 19:53:19 +0200
Message-ID: <cover.1717609998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717610001; x=1718214801; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=MpdXIHk50cKvkuPd6H9lWLntQfCvXu+BrKj1Zq+AuOo=;
 b=ch2Vz9loqegPpRKeLtP3OWyY4akV8ASaWZnjsLWknrG07/7U9wzMu/KVgOnq2a74xT
 CXfaWLLdtW+xh+eWM75WRTKmLXyeMYZNphtv09SudTnS4PX9t+Jhs3ueCGOpPoeofJYR
 /lBnUOBA4fot020DsWgajhwIHIgvAd0wGPFxNyKB+c/ph3mQHqfI3/wKNv7ZylrJYP+j
 EOk9aarxb1DbKTPVagpJMQQSqPR0rUi6rc9GpukM9g0uwpsuDP+6dA32SbyjX0x0uRBX
 efQ4JluURyN9yL27Jxoupl+M25BQxoeZ5tvayPa5Lgs6JLkFhGCTwhbVn53i38sWWrJi
 hi4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ch2Vz9lo
Subject: [Buildroot] [PATCH 00/10 v2] everywhere: use $(TAR) not tar (branch
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>, "Maier,
 Brandon L Collins" <Brandon.Maier@collins.com>,
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

Changes v1 -> v2:
  - fix apply-pathes  (Brandon)
  - drop useless tarball-patch for liblockfile

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (10):
      package/liblockfile: drop empty patch tarball
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
 package/liblockfile/liblockfile.mk                 |  1 -
 package/pkg-download.mk                            |  4 ++-
 .../0001-build.sh-do-not-apply-patches.patch       | 39 ++++++++++++++++++++++
 .../sunxi-mali-utgard-driver.mk                    |  3 +-
 support/download/cvs                               |  5 +--
 support/download/helpers                           |  4 +--
 support/scripts/apply-patches.sh                   |  2 +-
 13 files changed, 54 insertions(+), 14 deletions(-)
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
