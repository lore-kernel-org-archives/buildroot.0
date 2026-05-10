Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77AACD3427
	for <buildroot@archiver.kernel.org>; Sun, 10 May 2026 19:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8495060823;
	Sun, 10 May 2026 19:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZTGYXwcljpS; Sun, 10 May 2026 19:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2530B60596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778441915;
	bh=sOuTnWW6T0dWh+OoW7Q6QBkA9QPyl2yPTp0Sj6e7SoQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=de1GXQYhxVi8U+AprFim7HAf/hRKQeq+2+rEb01d2xWudm4EBB9sUrT+d14lANBVW
	 d7a3a++Xco2o/3TFCfM/slmGTyJEd8pxlGM7qnuTCeE0LGFyjiTjRiN5wvomZ3F2Em
	 OJVxXprlyUa7IqL8d6oGHPb+yS72RjfaY3bzrgxN/P4Qwhqa7/0Ec1mdrZvJ+w51BM
	 4OvtUXr5TYDHIBSBBFXwdBxabJp+XX3uAEEmk3kQkH64eYqMb8r1JOjN0L00etloY2
	 NEHV9GBP+NL0N0EQhru7aKDkHsbHtgnFUoKzloImg62KTUzovINgSIWBGTjQmk4z+Y
	 lJFj0vY6mbjHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2530B60596;
	Sun, 10 May 2026 19:38:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AC82223
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF4B784556
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w-EzVtpewLWg for <buildroot@buildroot.org>;
 Sun, 10 May 2026 19:38:33 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B846284489
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B846284489
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B846284489
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:32 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5a877510541so3765842e87.2
 for <buildroot@buildroot.org>; Sun, 10 May 2026 12:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778441910; x=1779046710;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=610jhf/UvLhvzBKVZjryCRnwbH0zHtAS4jBQ+qoAffo=;
 b=GCRdkYIO4uvDRWGF5Tq06VkGhnYDlkNjWWW/0lMDERTYHig69mtiF7/bszn1EQ1OJZ
 K/Xl8xEMQ+jKYljnO5NYkNHOfwOXT/qRYE9OCZ48j4Jz/wQWNjmESBr5nP79wNMaacbM
 OLHCgxKuLEW3zczRjrvULLWegAfRE/60+ymhBMV8+Vj7l3DPxoBWFwoASkDUjzHmqQm+
 WL73A+XIj54tspdzKGGn1vhm6fkC2LPtJAvV/f7zXRovQMhu3GlNHS2MKqz34Mrs8knp
 g/liIgi3GiECZdBJQSYcVGNIZ5qI1FFI4lT6ozCz8ChoiQoDZEiqqshnmj46JCKog+aJ
 PP+g==
X-Gm-Message-State: AOJu0YyPSjSW3A0ygXlRO9A24ilqbzIei7AMJ6l9Z+1Ghwc+OHZ3NP88
 uY6wqj/Gj9DouDul4ynloONQzkfuAmptDQQRjd0xI8UehIRgo5QRSqAtyjfeDCZy831KSvkmj4s
 yfA0BHr7inw==
X-Gm-Gg: Acq92OGlf60moBSvYYly41IuoU9hY0LMP6gPiskF7q0kmqVJRZpEs835E2cCtHprAh2
 qMvSdi3ePXW7vaEBS+CSvKmcfGg3xLQANHuRUoEJJEtTcqz+21i8tYSr68iDdP36BTof4/h4VjU
 XiYZEN7gkkdrD8s2FjIX24cVivrICnL9J3velQ5VAy56tdL5y7rct08AcVnHW3Q635zFqBLuvs6
 OUto1Rc0tdkKNPMSPnn67w/JZzuv7/bdE/txXUrY+YTAOB/lkODF2liXwXlNlG2DjGLz+ZGTByB
 nsEASJhzhtmC1lMwPWUoW8pnO26NGh+/mXdpoogxoNZApZZXVrAu0HPh7+Jay7UYnJBtxN8QlkQ
 lqXGHML2yuF/+mcG8UIH9rfhfJaCrcUJImjcwb24A6l7eRyXvvtMFzqhH+O7DHvtn/aHKKVJaQ6
 Yf+p+CTmv68yPIxWXu7zkJrU9pCMFdvr9O6aXhIgCU8UrnXWavd4A=
X-Received: by 2002:a05:6512:3b8b:b0:5a8:71ab:294a with SMTP id
 2adb3069b0e04-5a887ad9ff7mr6614107e87.2.1778441910452; 
 Sun, 10 May 2026 12:38:30 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5a8b6b2e8d9sm1302443e87.51.2026.05.10.12.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 May 2026 12:38:29 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Date: Sun, 10 May 2026 21:38:18 +0200
Message-ID: <20260510193826.2846038-1-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1778441910; x=1779046710;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=610jhf/UvLhvzBKVZjryCRnwbH0zHtAS4jBQ+qoAffo=;
 b=ZmFtiM1oRnVndB5yrBF1vib2XC731ewgreM9gTE16aizG1kl5ZVbNzWZKz7ricuH5N
 1+IBDI/KzFjTmaj1XJ8QtiyF7NNDHXfXZy6XHhlqbSezw/ReRROsoq4mw0zKM0ZjRc9K
 xp2jplluZstbQtyuFanBbnZzo6iCTuATLpsqtb4HKjYKAOaC8bc/yrVw+z4p7FCt6dom
 v2DtzWOdrgjVbBzGcZmilTh3o1cjq4eu0kLC96tYhy6dmeuiYLk+JXifWWDGXCL4MEpA
 a5Kimgt0AvJirgkSrtU2M8YI9/3vvyaGWBybblEBC18hZyW9SQ2e4PoTOnKfpJrC77Qe
 kVnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=ZmFtiM1o
Subject: [Buildroot] [RESEND PATCH 0/8] First set of fixes for build
 failures and PPD file conflicts
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Karoly Kasza <kaszak@gmail.com>, Antoine Tenart <atenart@kernel.org>,
 john.ernberg@actia.se, Andreas Ziegler <br025@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, John Ernberg <j@j-ernberg.se>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

This is the first set of changes in preparation for syncing less
dependencies in PPD builds, to avoid the package rebuild problem as
originally proposed at [1].

This is mostly solving trivial file conflicts between packages, and a
couple of "easier" build failures I ran into.

Package maintainers are CCd on this cover letter, and the patches touching
files they maintain, as the patches are free-standing.

[1]: https://lore.kernel.org/buildroot/20241227160622.1654822-1-john.ernberg@actia.se/T/#u

Cc: Daniel Lang <dalang@gmx.at>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Cc: Antoine Tenart <atenart@kernel.org>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Andreas Ziegler <br025@umbiko.net>
Cc: Karoly Kasza <kaszak@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>

RESEND:
 - Forgot to subscribe this e-mail to the list

John Ernberg (8):
  linux: Only run depmod during the finalize hook
  package/{clang,llvm}: Move removal of opt-viewer to the correct
    package
  package/libselinux: Adjust fstab during TARGET_FINALIZE
  package/mpd: Disable sidplay support
  package/openvmtools: Add patch to fix build failure with newer glib
    versions
  package/pkg-generic: Purge files that should not be installed by
    INSTALL_CMDS
  package/poco: Do not unpack libpq-fs.h
  package/tpm2-tss: Correctly depend on util-linux-libs for fapi support

 linux/linux.mk                                |  2 +-
 package/libselinux/libselinux.mk              |  4 +++
 package/llvm-project/clang/clang.mk           |  1 -
 package/llvm-project/llvm/llvm.mk             |  2 ++
 package/mpd/mpd.mk                            |  8 +----
 ...GLib-g_free-macro-redefinition-error.patch | 34 +++++++++++++++++++
 package/pkg-generic.mk                        |  8 +++++
 package/poco/poco.mk                          |  2 ++
 package/tpm2-tss/tpm2-tss.mk                  |  2 +-
 9 files changed, 53 insertions(+), 10 deletions(-)
 create mode 100644 package/openvmtools/0015-glib_stubs-avoid-GLib-g_free-macro-redefinition-error.patch

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
