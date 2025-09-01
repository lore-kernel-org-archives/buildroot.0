Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D63CA1002
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7943141494;
	Mon,  1 Sep 2025 09:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwdE6OIRpofp; Mon,  1 Sep 2025 09:01:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2745412F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2745412F7;
	Mon,  1 Sep 2025 09:01:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC4F1169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCADD60DC6;
 Mon,  1 Sep 2025 09:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yS62aeK6yfI2; Mon,  1 Sep 2025 09:01:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D442B60DCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D442B60DCD
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D442B60DCD
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:28 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45b7ebe667cso23767075e9.3
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717287; x=1757322087;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MNDOIocS4i2ByZMzrDbZlbqBTZjXKO/Uui8ll+ZqZ44=;
 b=hnL4P+OzbFJP1WwDdyw9G0U1V404hU5SHowwbRdZUFR5Qm88ExRo7sPiUHK8/Ftxe4
 xaKakkwWFCS4SLrtQcMU2Yvaq7zCJWPa3t+f0fS2HcvhcwW0TXXIcxQgLS0Sd2UWoHbz
 JcNmw3ELCnYC9VllV83hD5PoSQfJiIcxytVOKB6xr9qh//ohZrPsCp1GlWQfD2akf70s
 +V/C8hbmcV+wE+HrjlesdcpOTiX9iflQoJs4keDeR9W5ppzHye9R5VmHUicezHD0Lruy
 ZQe7TA6xdLn23NO0bTpX/+NRohGGoiNIJOdHqDZAWrFZK422SNRN9hgOy2gj9G0/pyv3
 /fmg==
X-Gm-Message-State: AOJu0Yx3pJ9sKdGzAH6Vh525gVaMt4XUflCQj5FjsbmY90Iy5GBlcnSy
 I4AoSJw6jQ/PjqLNoZo6pbMnlQWw1s7IunPcY6l0OfAgUTiOHyuA+p+8TR+78Q==
X-Gm-Gg: ASbGncs80DWlX5AckZE/PEkvhUs6s0smeVYv+3uRPUWhowJFdWg3b5oqFo2QdooooM7
 UdlXI4FUgYeJwdG3jC1dGg9J0fW2HQsT0BmmnzsW4QhhBoV7eHigfA5cCvW3V+OIY2+dgNmCRNq
 ieIIAVc+ykKa1vmvev4aqhmUCCdd9rMtwRU3D3BUDH+IYhM61rH6YtlF0LPe/78jWWnRXLAq3xv
 7lT712pQ1qlO2fGecd4nB5KKARV8UHX48TJTOPBK4io/jKYTi83kh1AaFL7/m8YQKaQyPjhx8uD
 B3vxSpPC1EyGkEKRppobYysh+DfYQozCpMzjQESGrQ9ux1DkGHLXY3OftXlX1JdFdvY7oTKnokU
 eJp+sir+r7BHj8a0SPbaSoZw2r4SCgCpStJxUtU2xh8A=
X-Google-Smtp-Source: AGHT+IG8r4RYppCtc4CEUAMUUdQkhYwYfBzOu2PoFaSNq6oVY9lpQKKaPFImd+pHevWLL0BMF9LZ6w==
X-Received: by 2002:a5d:5d09:0:b0:3b8:893f:a185 with SMTP id
 ffacd0b85a97d-3d1df34f216mr6351462f8f.53.1756717286457; 
 Mon, 01 Sep 2025 02:01:26 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d0c344f6casm13416247f8f.36.2025.09.01.02.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:25 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  1 Sep 2025 11:01:24 +0200
Message-ID: <cover.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717287; x=1757322087; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=MNDOIocS4i2ByZMzrDbZlbqBTZjXKO/Uui8ll+ZqZ44=;
 b=cssfkwuO2oYyRSLboWGtQAX0jRluWarVN9z2BtWFLe19rj2uVCUqD1718bfl5NNmuf
 CLF/qbWZvyW4VDmRc2thnWGw7A/64qVjadkRpw3g5o4lf/7ORDdaLMjTIFlUy8U3JG1e
 dw+1p/eykDpoAMggnJI9BTvwXIKfTj408PNyQFHLna+kp7TfV07eXUj0fsSTMjldzqQo
 GrzsXOECXkPcU8iVE6FVrpsOFbHLT+NL2pedatMqId35gxebFYZZItxCrG8kScBWjmwy
 fpzcvMlRva/cnT3kzAU62wmK93RlnRLO02n9kklrssQAmnBvXbjELbTXGHb75IxTSINT
 Um2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cssfkwuO
Subject: [Buildroot] [PATCH 00/18 v3] system: add support for merged-bin
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
is merged with /usr/bin, as an extra step after merged-usr, now just
requested, but in the future required, by systemd.

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

 4. then, patches 13-17 introduce workarounds for a few packages to
    properly support merged-bin. For ease of review, those are separate
    patches, but that means the series _may_ break if the merged-bin
    support is applied but not these per-package workarounds; these
    require that all patches above be applied first, of course;

 5. the last patch makes merged-bin mandatory for systemd and extend the
    systemd runtime test to catch future tainted flag; again, that
    requires that everything before is applied, too.

The series was tested with a large set of packages and a large set of
toolchains, and although it is a critical change, it is still pretty
well confined to just a few spots.

Changes v2 -> v3;
  - add fix for merged-bin to net-tools

Changes v1 -> v2:
  - add Arnout's Acked-by tag where appropriate
  - totally rewrite the test for merged status
  - reject unexpectedly merged skeletons or overlays
  - add runtime test to catch systemd tainted flags
  - typos

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (18):
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
      package/net-tools: no need for ifconfig+route workarounds with merged-bin
      toolchain/external: support merged-bin
      package/systemd: require merged-bin

 Makefile                                   |  19 ++--
 package/coreutils/coreutils.mk             |   2 +
 package/kmod/kmod.mk                       |  12 ++-
 package/net-tools/net-tools.mk             |  10 +-
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
 14 files changed, 240 insertions(+), 84 deletions(-)
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
