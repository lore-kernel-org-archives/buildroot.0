Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3250C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CDD860790;
	Wed,  9 Apr 2025 20:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyaFkIY13CgF; Wed,  9 Apr 2025 20:03:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8923760D65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8923760D65;
	Wed,  9 Apr 2025 20:03:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F9F0201
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1134341231
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubB31iR6Il0g for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC31F405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC31F405A3
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC31F405A3
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:45 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so542785e9.1
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229024; x=1744833824;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+v6+EyDb0C2+EEGqr49ZaSEz2QdrJWlKAMEF1qQM8QM=;
 b=U0fZ2RK5GsWx4usLmKJAaRv5VZ0i08ith14iXKaRBDCsnAfDXu18JN64d1YuBrQod6
 FjgTxoCod0qsPOjLH+RHW76WlTIsSgUX3yVcFZj4mQh2L9A9m9nUmPDORWhH7e92B/Tg
 o91pfvd4wYD8T0COgSGGZD5zZaOD01zp7UqEEM4WZAyXhzbXG/Rtrvy8gUFTffQpSeEd
 d9YHRHQNXxGdxeu9s1LoJWZYRU93u6mpDCjErVp9BeEacZh2BqvZnyIUEjLGdwEhvQeK
 XuAe2HD3fsi8fYS/ASsrD1EhsbLJF7SA+iIAvM+w9p0GV3WLnjVD2/1S3q2hhr6nNZn+
 EM0A==
X-Gm-Message-State: AOJu0Yw4O8rHN3T0fFbNkQcA5owxofq9OtCUUG/vd7zH21QzT2WU0i4i
 rgoVhlBg7vMs3nKUhH7oLGqFOHxraLen5w6bKM6iKRDgGt+YBwr/Gxp64A==
X-Gm-Gg: ASbGnctmQ2hB3UnYkH8KesuCUvtILT+xD1Uqy9Dpdkzpj/ddsk+rBNlr2na3WvLj2AW
 WI/BtSfTL+Ccclh2w+lQP/Bhztjg+3Kgvv6qdjt1ZizgEPZAluImFm2vcGdJOPxkGycf8F3hqJx
 PJYCynyqgXJijPkR78WvmkmZ6U9roFMQjIXHKYs+XeLUaEArgEeQNlFCDbcb79VIEH+cBGAUTw6
 oNwA03FMTU1YcDq34/70AABTZ1H5fnEDjIaaKxxlEwHyt/jv9kuVxmMGgtYYy/kGLhJLVGGuKfa
 hIcepwFrm6X+rY42epqShkePk2lhZES+WE7w9NBkkeAbucdIL9sr
X-Google-Smtp-Source: AGHT+IHVlPRHbkRemn/+tEJ/a6bh+UwTZCrOSl/q/f3WWz38NLogeM4EmufycAznGoDLyHP8hhOubA==
X-Received: by 2002:a05:6000:248a:b0:39d:724f:a8cd with SMTP id
 ffacd0b85a97d-39d8f4993d5mr60651f8f.35.1744229023515; 
 Wed, 09 Apr 2025 13:03:43 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893fc88dsm2508024f8f.81.2025.04.09.13.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:43 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Apr 2025 22:03:42 +0200
Message-ID: <cover.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229024; x=1744833824; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=+v6+EyDb0C2+EEGqr49ZaSEz2QdrJWlKAMEF1qQM8QM=;
 b=hbrB9LgU1PmVT9oo1Zo1RUKW8itPx6I92qGo2Ceo2rG/lqwIqNXmt1Q5hn43IblhbT
 hNoMaN0zNeHdtNu1Yt66tM4NUSD9a/ytvwr+35klrImI+5Xi6dOQsfQr19Uz4RpBJ8zV
 dxaDi3zyPVpe9T/WgJrgdJ0PKue78XLB6akbvZfd8WZl8f5OtRxNkNL0R5xA4ODlUZwl
 dzs+NmmW6efCAvoLwnbrwPmkh7JxW47il9ZCqGjK2Mx1tSeQkZlY6ORXKtwAEcuMpl2D
 fI047s+Pm1jh+XlFhm8NN/mglqvhEn7Y2HdghKogvc8RfvOuqYAPNp3fvyLGwOc93qdp
 WRtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hbrB9LgU
Subject: [Buildroot] [PATCH 00/29 v2] package: improve for better pulseview
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
 1. cleanup and extend pulseview dependencies, notably the need for
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
to the latest release. Note that the next release is expected any day
soon... With a bit (a lot!) of luck, this series can prove to make that
bump easier...

To support this new use-case, where some Kconfig symbol are voluntarily
not explicitly referenced, we extend check-symbol to recognise symbol
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

Changes v1 -> v2;
  - beter explain how to update the list of Boost libs
  - a few typoes in commit logs here and there...

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (29):
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
      package/boost: explain how to maintain the list of libraries
      package/boost: bump to version 1.87.0
      package/sdcc: new package
      package/sdcc: add option for the mcs51 (aka 8051) port
      package/sdcc: add option for the z80 port
      package/sdcc: add option for the device lib
      support/download/git: use FOO_DL_OPTS
      package/fx2lafw: new package

 DEVELOPERS                                         |   4 +
 docs/manual/adding-packages-generic.adoc           |   4 +-
 package/Config.in                                  |   3 +
 package/Config.in.host                             |   2 +
 package/bitstream-vera/Config.in                   |   1 +
 package/boost/0001-unordered-fix-copy-assign.patch |  22 ---
 package/boost/Config.in                            |  43 +++---
 package/boost/Config.in.host                       |  18 +++
 package/boost/boost.hash                           |   4 +-
 package/boost/boost.mk                             | 166 +++++++++++++++------
 package/cantarell/Config.in                        |   1 +
 package/dejavu/Config.in                           |  11 +-
 package/font-awesome/Config.in                     |   1 +
 package/fx2lafw/Config.in                          |  11 ++
 package/fx2lafw/fx2lafw.hash                       |   5 +
 package/fx2lafw/fx2lafw.mk                         |  21 +++
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
 support/download/git                               |   6 +-
 utils/check-symbols                                |   9 +-
 utils/checksymbolslib/br.py                        |   1 +
 utils/checksymbolslib/db.py                        |  61 +++++++-
 utils/checksymbolslib/kconfig.py                   |  18 +++
 utils/checksymbolslib/test_db.py                   |  17 +++
 utils/checksymbolslib/test_kconfig.py              |  63 +++++++-
 38 files changed, 597 insertions(+), 120 deletions(-)
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
