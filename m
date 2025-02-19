Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FEFC021B0
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CC054F390;
	Wed, 19 Feb 2025 08:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PCcawA9rAyBQ; Wed, 19 Feb 2025 08:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB1F3503A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB1F3503A3;
	Wed, 19 Feb 2025 08:50:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A8E7C8
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48C3D606A3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4deUK6MsEAa for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C0A060071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C0A060071
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C0A060071
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:43 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38f504f087eso1526042f8f.1
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955041; x=1740559841;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FwzIxmG+bWJBCnsB5iUsLwHDaaAu/fHuZtmgcANINkQ=;
 b=wQm1k8N7ixShvzaANO+gm9K1JYkGdQcB9jPlVihSTNgG4IZIH0hcsFN+0xXp8YMAGd
 LxMe3C3xxxkSOvbLkMUC32wRcDeJExnCf3hSc8Z22kUUxNAhr5h1jDAVUH7fdGlrdi6L
 JWulItaxBCo7tvywhhr0TN57e0NXg0fqe53f7r/8gR+X1WOhSKdN5J3Bwvt8jVOMxG3x
 BTHq0m+yx/oDx1c7dinXVv84yWcZj4pNkjtRdnjPkb0swlwhjdLiLikveYwWvVvFDq/C
 rY0gjhxgWB/llNFh87Q9Xtr6NgAD/r04qX4fF1+5quAnjBp309p/3p6Cgwm4zGm1awkl
 zf1Q==
X-Gm-Message-State: AOJu0Yz3FxVChGdbRzkmgG86j1uf/mgo6G+HZWlCz6B2Z8WvNoij9+M2
 H0kTbEk7f/z0es11vK+QyYVntzLFBlpfowSmstffB2Y1dtPGoHOXwpjoeQ==
X-Gm-Gg: ASbGncsg5QEmsHTeCZTXaBvpImb/O2yozz30B6LIVGUppf3vnRmHqXnKoZqadotGfET
 36IUFyF0LZ4shupdKhj4SVpSksFGsDeCK2qUBnXpOO2ZW01AhKWpP3w1xpaDNAWcSouZBme6gRG
 rnMMHAFewj8SPJUwQ87MhiTpD75RN7LFvDNvPiICFeVwb6SeQsvQRONvX/MDeKaNpCB/gVvoNgg
 jvWIRvqddPgMyOYl3Xa86X8GAqnoitT2PW8WSPI45o/9P/lHkcAsEKmnNrXk1HShX/dbovhRwnZ
 3I4RpQDbPkbMZ6p+49FoNM1uRA==
X-Google-Smtp-Source: AGHT+IEg7HqTkyFx8L5sBe3vqefHy3gShxIHMc0dC6RgetkPtouaZskzhl/j8/fm6ERDHgVYiiWwBA==
X-Received: by 2002:a05:6000:1788:b0:38f:2e78:450c with SMTP id
 ffacd0b85a97d-38f5878df68mr2025904f8f.19.1739955040880; 
 Wed, 19 Feb 2025 00:50:40 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25913eb6sm17367806f8f.51.2025.02.19.00.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:40 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 09:50:39 +0100
Message-ID: <cover.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955041; x=1740559841; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=FwzIxmG+bWJBCnsB5iUsLwHDaaAu/fHuZtmgcANINkQ=;
 b=jMgVuSWd0DAMi2rfOeduTRU8e7/Ibd31UmrCB7qQkSzbRLCJ7gdDZBPhPzWmy4M3CO
 3YqzqE+Q7FuGOBN6CcPsr2m3hxp8AkyWmEKIwO4PYQl35Afi/3lASI0bY0lYWpZS/Q0p
 8+ylv30AWacDjOBkE+MHhR1yXLBg5+e6qFfslCgJ/CTWm8jy4DeRaQXItH8kF0tiL1OA
 gI0eKoTsymaklQ9+hrkFbhvuV4LcqxyCggMzYVLNPXetNhe1vAJAuQSEPVctgSW9yJCM
 KNPP2/6EWPW0kkbRmlpzXMS17d7YZIi02yMxMj5G6sygN5MtdjXVDlQxid0h9uEdgS15
 2TSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jMgVuSWd
Subject: [Buildroot] [PATCH 00/27] package: improve for better pulseview
 integration (branch yem/sdcc-fx2lafw)
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This series aims at making the pulseview and other sigrok-related
packages more integrated. The series is articulated around three main
goals, the details of which are expanded later:
 1. cleanup and extend pulseview dependencies, not ably the need for
    fonts;
 2. extend the boost package, for a better host variant, and better
    maintainability;
 3. introduce sdcc and fx2lafw, to allow use of Cypress FX2-based logic
    analyzers.

Below are the details of the series, starting with the utimate goal, and
then going backward with its dependencies and the foundational changes
it required (i.e. git-log style).

fx2lafw is "an open-source firmware for Cypress FX2 chips which makes
them usable as simple logic analyzer and/or oscilloscope hardware.
It is licensed under the terms of the GNU GPL (version 2, or later)"
[0], so we want to be able to build it (rather than use the pre-built
blobs).

To build fx2lafw, we need host-sdcc, "a retargettable, optimizing
standard C [..] compiler that targets a growing list of architectures
[...] microprocessors" [1]. sdcc contains a few utilities, that are not
all always needed, and can target many architectures, that too are not
all always needed. So we introduce a basic sdcc package, and add options
for those few features and ports we need as a we go.

To introduce host-sdcc, first some changes in how we handle host-boost
are needed: indeed, host-sdcc needs yet another boost library, but we do
not want to enable it unless sdcc is actually enabled. So, we extend the
host-boost variant to have configurable options, that host packages,
when they are enabled, can select. This causes a bit of preparatory
churn in the few packages that do.

Then we rework the way the boost libraries are handled, so that it is
easier to update the list for both the target and host variants in one
go, which we exercise and demonstrate by indeed actually bumping Boost
to the latest release.

To support this new use-case, where some Kconfig symbol are not
explicitly referenced, we extend check-symbol to recognise synbol
definitions that should be ignored.

Now, pulseview, the Qt5-based UI for th esigrok ecosystem, is brought
up to more up-to-date dependency handling, and new dependecies are added
to ensure fonts are available at runtime. This is achieved by adding a
pseduo-package (by lack of better infra and wording) that ensure that at
least one font is actually installed.

This eventually led to some minor fixes in two font packages, that could
be configured to install nothing.

Finally, a trivial missing runtime dependency is added to
libsigrokdecode, which contains protocol decoders for the other sigrok
packages.

[0] https://sigrok.org/wiki/Fx2lafw
[1] https://sourceforge.net/projects/sdcc/

PS. This is a huge series, that's true. It all started "just" because I
wanted to build and install the fx2lafw firmwares, which ultimately
build in "just" a few seconds, and install "just" about 160kiB... And
from fx2lafw, it all snowballed to this huge series...

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (27):
      package/libsigrokdecode: needs python3 w/ zlib support
      package/dejavu: update homepage
      package/dejavu: ensure at least one typeface is installed
      package/liberation: ensure at least one typeface is installed
      package/some-font: new pseudo-package
      package/pulseview: fix, update, and reorganise dependencies
      package/pulseview: needs some font, and fontconfig support in qt5base
      package/boost: move host variables closer together
      package/boost: move taget library selection variables closer together
      package/boost: prepare for a configurable host variant
      package/boost: add host symbol
      package/libodb-boost: afirm host-boost dependency for host variant
      package/thrift: afirm host-boost dependency for host variant
      package/riscv-isa-sim: afirm host-boost dependency
      pakcage/boost: make host variant slightly configurable
      utils/check-symbols: allow ignoring some defined-but-unused symbols
      package/boost: commonalise list of libs
      package/boost: add graph option for host variant
      package/boost: headers-only libs are always installed
      package/boost: check that known libs match Boost's list
      package/boost: use positive logic to enable libraries
      package/boost: bump to version 1.87.0
      package/sdcc: new package
      package/sdcc: add option for the mcs51 (aka 8051) port
      package/sdcc: add option for the z80 port
      package/sdcc: add option for the device lib
      package/fx2lafw: new package

 DEVELOPERS                                         |   4 +
 package/Config.in                                  |   3 +
 package/Config.in.host                             |   2 +
 package/bitstream-vera/Config.in                   |   1 +
 package/boost/0001-unordered-fix-copy-assign.patch |  22 ---
 package/boost/Config.in                            |  43 +++---
 package/boost/Config.in.host                       |  18 +++
 package/boost/boost.hash                           |   2 +-
 package/boost/boost.mk                             | 164 +++++++++++++++------
 package/cantarell/Config.in                        |   1 +
 package/dejavu/Config.in                           |  11 +-
 package/font-awesome/Config.in                     |   1 +
 package/fx2lafw/Config.in                          |  11 ++
 package/fx2lafw/fx2lafw.hash                       |   5 +
 package/fx2lafw/fx2lafw.mk                         |  18 +++
 package/ghostscript-fonts/Config.in                |   1 +
 package/inconsolata/Config.in                      |   1 +
 package/liberation/Config.in                       |   6 +
 package/libodb-boost/Config.in.host                |   3 +
 package/libsigrokdecode/Config.in                  |   1 +
 package/odb/Config.in.host                         |   1 +
 package/pulseview/Config.in                        |  44 +++---
 package/riscv-isa-sim/Config.in.host               |   3 +
 package/sdcc/Config.in.host                        |  44 ++++++
 package/sdcc/sdcc.hash                             |   7 +
 package/sdcc/sdcc.mk                               |  92 ++++++++++++
 package/some-font/Config.in                        |  17 +++
 package/thrift/Config.in                           |   1 +
 package/thrift/Config.in.host                      |   3 +
 package/wqy-zenhei/Config.in                       |   1 +
 utils/check-symbols                                |   9 +-
 utils/checksymbolslib/br.py                        |   1 +
 utils/checksymbolslib/db.py                        |  56 ++++++-
 utils/checksymbolslib/kconfig.py                   |  18 +++
 utils/checksymbolslib/test_db.py                   |  17 +++
 utils/checksymbolslib/test_kconfig.py              |  63 +++++++-
 36 files changed, 581 insertions(+), 114 deletions(-)
 delete mode 100644 package/boost/0001-unordered-fix-copy-assign.patch
 create mode 100644 package/boost/Config.in.host
 create mode 100644 package/fx2lafw/Config.in
 create mode 100644 package/fx2lafw/fx2lafw.hash
 create mode 100644 package/fx2lafw/fx2lafw.mk
 create mode 100644 package/libodb-boost/Config.in.host
 create mode 100644 package/sdcc/Config.in.host
 create mode 100644 package/sdcc/sdcc.hash
 create mode 100644 package/sdcc/sdcc.mk
 create mode 100644 package/some-font/Config.in
 create mode 100644 package/thrift/Config.in.host

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
