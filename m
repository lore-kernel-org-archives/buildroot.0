Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D39DCD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B83F240591;
	Mon,  1 Jun 2026 20:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZVbiWqI5JRk; Mon,  1 Jun 2026 20:47:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB750404F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780346869;
	bh=MyntN9eJOLOlkArm4TGtV0NDrGSDU8WNcmlpal6d51A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=MLth9alnV3unvel+oO01yfMsNLF/M2x7T0GhXS9xvU1uhrd2s0UYLqjTTJSfV/Au+
	 jafwDzbF3D3w5Jses6mGIC69x2SbYySvqaolPSkNysM6gdCxRg1tyLfGvQT7ranhZF
	 3cg8dsIVUUQilfHA+9EcP4dRTfM2kZejuAL49zH6ZZJi6wpckIeKG5kE49dIWcNNNr
	 qpe2602vl0S5g/87J9dyglH6MGX9PZ4Ckz6dQMjNIG7jsN0mkIHexRf+A3eopd4P0x
	 7ewhAcKbX8CsPgkDTmF8r+XpwC42AabuAUkpACDfbs+rfqqHqO/OITXIHnDZI5CxD1
	 dVoB3qPSLsyfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB750404F2;
	Mon,  1 Jun 2026 20:47:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBA72F4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD08C4056D
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FP6MRbUQKylY for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:47:46 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E8F5404E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E8F5404E7
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E8F5404E7
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:44 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-39677242021so18850301fa.1
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 13:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780346862; x=1780951662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Wyyi0mUgWSawnNGcjVyEPmsSabj2a12HvkwioKAVyQ=;
 b=ZtD5usji93R5blHXm6YPEWUD4G8M0bfSueiPaQxDYrTOfKu3YA3BDWFbhSe1eGlrW9
 y6jWMw18F3Er+Zb5RpfI7opdRkYgeXIkbGxI3e2XNARdvouaF3pGsZRUhPd32IiR7C/m
 iOa0alKlcFghrh55GBGmFlAzyj4UcpnY8hY+mlUyayrUT55pcKJvanUZOYuGgaAcdv3g
 QXJuwN6giVSOwhPljeXtTHIo234RGULkArTu1/STEYRV6sJNr19WWVWGnxfV33vmdOPg
 z61fWkeQf2sJcYVFlQlSS98UrkP4QlLJxjnRsIYnUGaTq3p1+Cadm5M3Rwl+zKVZNoY5
 6cPA==
X-Gm-Message-State: AOJu0YwzKfPGq43O5OwiuCMwGUygZO9RorqYeJgNst321seTKtA5By6b
 7aku2Q0tPrXB7E4EEM8FeFCLGFelI/n4yHiavqWuZBTjp84CNuM3Ej/Drt5NzhMvi0eFb/hX1wa
 0sSMtFBx+rg==
X-Gm-Gg: Acq92OFSbAJ7tY5tKXBBKUe7BdRvvHUzXq6qht/AUrtP79hxhwBdVWZCJGwGXGodEBM
 ZTQZ7kYFQDKl686swuwik9xWjkjWUgJq3zXKdWRBNs3H84mJuBRHSjDnBg6kMN3oDckbhoawtGf
 to8bAPO2GReGUowrGm5EIftrxSOp7kZ/LZ6nHvlnhCQhBgA/9IyIh+fD678MJrA2QcHjRmn3PeI
 gBYnJK3LdibRPAshmvV8wjYqF/rEGcUISJra0koZYCahQ5+u+EDN5lL/s/9pi5bmWPdbZYlZbGL
 S8Aein6hI3pRbJD7Njh2YBArsCH0oY+YkhA8qNccpjSPXevSNLwAkF8QBnp936eWOmZAIQKg6Vf
 Tl2uIXKFHD7RLcniepUaNh0ykZQTqbmfllF5iEWaeMUChfeNmZ+GK9eum+L0KaI32oG9On9aIKN
 ZwxgtqhlUWjmV7WgwSCRzbrECJL9D4sukJ9jJXJTopB2tYNGmh80sKG3qp6OsN/w==
X-Received: by 2002:a2e:9e0f:0:b0:393:5ada:4605 with SMTP id
 38308e7fff4ca-39664fed972mr27929501fa.25.1780346861899; 
 Mon, 01 Jun 2026 13:47:41 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 38308e7fff4ca-3967e43b351sm13133231fa.23.2026.06.01.13.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2026 13:47:41 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Date: Mon,  1 Jun 2026 22:47:26 +0200
Message-ID: <20260601204735.888967-1-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1780346862; x=1780951662;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+Wyyi0mUgWSawnNGcjVyEPmsSabj2a12HvkwioKAVyQ=;
 b=vHAQwjKTOkceokKsO22bESTmrxFzPBQB17rNOYSi749BQqo3aPqCYJAjXKgtyc4OXc
 Wh+cL9Pa2FkdrbxyQ/XT/KdZ55HVWAHG1XGiUNq2ZXBLyih0b7yABuHBJ7febRscnFUt
 W6ph1nKnjsUQXfLzCknpNae7Wq7pbYK50E2mmqAmIIMJODuKlouUDaEMDRhz2L0zAp1W
 XDzLzmcnA4w6i1AyzUCcVQ08XhP5Ea2hKStWM0PkyWlB9bt0RJMNjiGXUf94Veh+qB7m
 kjBQcyem10RjQBMwJ6sLvKN1oQLw+4dGTnKNp7NKtgCN3htkzBNCHZz39lO4CwezhTyN
 gmSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=vHAQwjKT
Subject: [Buildroot] [RFC PATCH 0/9] Second set of fixes for build failures
 and PPD file conflicts
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
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Carlo Caione <carlo.caione@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Julien Olivain <ju.o@free.fr>,
 John Ernberg <john.ernberg@actia.se>,
 James Hilliard <james.hilliard1@gmail.com>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 John Ernberg <j@j-ernberg.se>, Norbert Lange <nolange79@gmail.com>,
 Sen Hastings <sen@hastings.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

This is the second set of changes in preparation for for syncing less
dependencies in PPD builds, to avoid the package rebuild problem as
originally proposed at [1].

This set is a bit hairier as I can't quite tell if I've done the right
thing for each package to solve the build failure or PPD conflict, hence
it is being sent as an RFC, to signal that applying these without a bit of
thought could be dangerous.

Most patches have a specific questions attached to them with my concerns.

Since the patches are technically free standing developers are only CCd on
the cover letter and the patches touching things they maintain.

[1]: https://lore.kernel.org/buildroot/20241227160622.1654822-1-john.ernberg@actia.se/T/#u

Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Cc: Carlo Caione <carlo.caione@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Sen Hastings <sen@hastings.org>
Cc: Yegor Yefremov <yegorslists@googlemail.com>


John Ernberg (9):
  package/foot: Prefer ncurses terminfo if ncurses is selected
  package/libest: Drop java support
  package/rtl8188eu: Select linux-firmware for the firmware
  package/{skeleton-init-,}systemd: Install legacy.conf from the systemd
    package
  package/libcamera-apps: Only enable EGL if both epoxy and xlib_libX11
    are selected
  package/util-linux-libs: Do not install to target
  package/jailhouse: Drop the package
  package/python-xlib: Drop the package
  package/python-html5lib: Drop the package

 Config.in.legacy                              |  33 ++++++
 DEVELOPERS                                    |   3 -
 package/Config.in                             |   3 -
 package/foot/foot.mk                          |   4 +
 package/jailhouse/Config.in                   |  28 -----
 package/jailhouse/jailhouse.hash              |   3 -
 package/jailhouse/jailhouse.mk                |  71 ------------
 package/libcamera-apps/libcamera-apps.mk      |   6 +-
 package/libest/libest.mk                      |  10 +-
 ...y-fix-version-parsing-on-Python-3.14.patch |  42 -------
 package/python-html5lib/Config.in             |   8 --
 package/python-html5lib/python-html5lib.hash  |   5 -
 package/python-html5lib/python-html5lib.mk    |  16 ---
 package/python-xlib/Config.in                 |   7 --
 package/python-xlib/python-xlib.hash          |   5 -
 package/python-xlib/python-xlib.mk            |  14 ---
 package/rtl8188eu/Config.in                   |   2 +
 package/rtl8188eu/rtl8188eu.mk                |   8 +-
 .../skeleton-init-systemd.mk                  |   1 -
 .../legacy.conf                               |   0
 package/systemd/systemd.mk                    |  13 ++-
 .../util-linux-libs/util-linux-libs.mk        |   5 +
 .../testing/tests/package/test_jailhouse.py   | 103 ------------------
 23 files changed, 60 insertions(+), 330 deletions(-)
 delete mode 100644 package/jailhouse/Config.in
 delete mode 100644 package/jailhouse/jailhouse.hash
 delete mode 100644 package/jailhouse/jailhouse.mk
 delete mode 100644 package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch
 delete mode 100644 package/python-html5lib/Config.in
 delete mode 100644 package/python-html5lib/python-html5lib.hash
 delete mode 100644 package/python-html5lib/python-html5lib.mk
 delete mode 100644 package/python-xlib/Config.in
 delete mode 100644 package/python-xlib/python-xlib.hash
 delete mode 100644 package/python-xlib/python-xlib.mk
 rename package/{skeleton-init-systemd => systemd}/legacy.conf (100%)
 delete mode 100644 support/testing/tests/package/test_jailhouse.py

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
