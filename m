Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC8FCD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 15:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A50E860F6F;
	Sun, 31 May 2026 15:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7gmuJywacKN; Sun, 31 May 2026 15:36:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 792B260EF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780241784;
	bh=3xcKbpitCkpVDfKlfhsgdKkd3Xp73X+IzecLbW5MQrQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Wp7j0O8enXeubb10R0WJqKRsi/x1mLI4dOKxnGEMAcrH8/m1OfN+EqroD0wg0W4TX
	 gkUke+YHzSGSflCS1hIJNlkyxnEZCCS2iMJYXnQotPdBuL/SbY/iUY43wFC/WuQPHh
	 9Y9QyS6v36MSWWfjT9LUcq3gIIGqjXpAgwHuUu7VYA38QRjk6aGKl5RTdqJ4+Fx+s9
	 Plwiobcslm4O9uq3QB9XdcxEBJ9Xre82lLXnbA6c9YZDnuhV7rIZxdOLo1bONkyQOI
	 wUTA3qlWCiphLMYLRAINgI+KfkNynoarreB/gX5nK45h35hoB3krX0Anz2q/NkyLly
	 TVTHfzMwhYAaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 792B260EF4;
	Sun, 31 May 2026 15:36:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5241C257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F11440183
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozwA2ImvwE12 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 15:36:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E9327405DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9327405DC
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9327405DC
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:17 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-49039a8851fso95650355e9.2
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780241775; x=1780846575;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LhJZB/NRVqHjz0LxfkXpNvZiH9s28bMX1W8xXSAhU9A=;
 b=O8cOdm2vofcKDiH+LYYhmRuCaKwfAeUGP72X7WhKThzXRxZ/Cx0/+mGivEhbwV4Uox
 vilNoE8A5R0w+f9RjbfoojSsOTmlGII7+zvYokoHI4dPaZFsatY694n1WqQe4JmWgsII
 dt9Q2j7+p89DeiwJa5k6x+NAXMg7b54BC2L7AwBFadfzJRF71n3WSsjpl3qqNVJ30zhg
 IoORZ+BVF8/nmRuRDhsZ51BasqOLzH6RrIau2RCXYl3/kcBAbNKu8YHSrrosVnXfcNIQ
 JXxdUIM2Fp/aV9uNhC/W46t6SeE4awzk+idXO9HBsCmE+qsdumBw0Y8rJ99Zn5Dxr+yt
 19Qg==
X-Gm-Message-State: AOJu0YzQr7Om4t/Ya8GjHqt/FiAgivyZDsQa3jZXw7AI46aXVooT/ZT2
 b9uVTqYc4KqVyBf4MMFHfMG5h20qvtRVICDhKodOrNNw9yaEM4DfKGrCq7//S0AoDv3uznG3Pbe
 1U47J4v4=
X-Gm-Gg: Acq92OEEnVJVAyb/3oZIHJ+oWs6ynensuX2ks66GYbZuseSxyQ1tKQqUXLx2/gyhCN1
 cyVBP/rR+xa4oXrxsb1bAn62h1TgHusB1gkXo+7THYbISq9xyulAXPP6i8EGr6JloX1FPPrCnhN
 t2xeBPnr33Nm9eV5tkTPSTJ1EE2F7KzPzcMBj86R7U31qWJ85LBDC8LAToPgtTxZVJ/+d+K74BI
 QNx5eAjkbEJpkS/xwlPJkmJVqijknmYuQSdVAx/2xLUV5uj7aoTrhZnQK9ZI3TMdFhCmGze8fUb
 UXGyzHRZiIW0quPvuZt6wn/MP1Opu0zsUtRtYjFc5rkxoWNW0EgiGlT2E1BkJ0zNX52WIDQPtNB
 DJwr0UhS1dmkCb+ftgGHI89Cppy30mgcbSaUJUud8MMpXn7rNV95PaCcGr+jbf5rJQAo991a2SM
 IjdmrRNf0RePrACbWbDKh9/Xru0YLkELbxEJUgqex0nb83l9DD9FObrmBGM0imBqciX9wcIkWPl
 qRJMaGmjB1wRqdfiWKCdYxOd+LU5c6X
X-Received: by 2002:a05:600c:3b8f:b0:490:688b:f9f8 with SMTP id
 5b1f17b1804b1-490a29513efmr167469355e9.27.1780241775273; 
 Sun, 31 May 2026 08:36:15 -0700 (PDT)
Received: from dragon.localdomain
 (lputeaux-658-1-173-117.w92-154.abo.wanadoo.fr. [92.154.108.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909ca6575csm278098585e9.4.2026.05.31.08.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 08:36:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 17:35:44 +0200
Message-ID: <20260531153557.2375580-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780241775; x=1780846575; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LhJZB/NRVqHjz0LxfkXpNvZiH9s28bMX1W8xXSAhU9A=;
 b=T9KrBU3KZSFMN3mrweC8X13OD5BqoZ+baviDOH0/5hq4pF9NidiQxc8RY5vG5k0I36
 WUEQeFEp/6ygHIc3zjcVrPUBo4EiEl57BaEoS84U3Z9UpEDMgm7HD0R5tPCCmvG6Uxgl
 k2FtLrDE4Un7jCdGrTAOFDoYRbZkFhyxReHqy9OArQKM/MjeDZlFwyuBvtsxP3tl73YD
 nrnu8Fy9y/MtEeUJY9HnJMrNgmo21PLo8rFPeNxYasYPX5qlOtfoqlmZ9oCFK587k1HV
 RPe9ZDTXhr90dtndFAnls2ZmiVEcJUqXFujVdxee7sw0pt0+0FBOVfsQOjvQfwsTTVBj
 1ExQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=T9KrBU3K
Subject: [Buildroot] [PATCH v4 0/9] Update kconfig infrastructure to Linux
 6.9
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: yann.morin@orange.com, ps.report@gmx.net, thomas.petazzoni@bootlin.com,
 petr.vorel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an update of Peter Seiderer's series [1], rebasing the v2 [2] on top
of the latest Buildroot master.

The main changes introduced here are:
- update support/kconfig to match what's in Linux 6.9-rc5
- add support for Zephyr's kconfiglib as a new configuration interface
- fix remaining issues or merge conflicts from the former series

[1] https://lore.kernel.org/buildroot/20240506144555.31709-1-ps.report@gmx.net/
[2] https://lore.kernel.org/buildroot/20240513091950.30116-1-ps.report@gmx.net/
--
Changes v3->v4:
- Include Yann's patch https://lore.kernel.org/buildroot/ZjyqwNLypWWS21v5@landeda/
- Include Peter's patch https://lore.kernel.org/buildroot/20250521094004.4fb92fe1@gmx.net/
- Define the CONFIG_ env variable for yellowconfig
  (see https://github.com/zephyrproject-rtos/Kconfiglib/blob/main/kconfiglib.py#L969-L973)
--

Peter Seiderer (4):
  Config.in: do not expand TOPDIR, BASE_DIR and CONFIG_DIR
  support/kconfig: bump to linux-v6.9-rc5 version
  support/kconfig: reference environment variables directly (remove
    'option env=')
  package/openssl: move libopenssl/libressl/.br2-external.in.openssl
    source statements outside of the choice

Titouan Christophe (5):
  Makefile: always use a base config file for defconfig
  support/kconfig: fix invalid filenames in patch 23
  toolchain-external: do not expand ARCH
  docs: update the Buildroot manual for kconfig variables expansion
  Makefile: add new target "yellowconfig" based on kconfiglib

 Config.in                                     |   57 +-
 Config.in.legacy                              |    6 +-
 Makefile                                      |    5 +-
 docs/manual/customize-outside-br.adoc         |   12 +-
 docs/manual/migrating.adoc                    |    7 +
 docs/manual/quickstart.adoc                   |    7 +
 linux/Config.ext.in                           |    2 +-
 package/amlogic-boot-fip/Config.in.host       |    2 +-
 package/erlang/Config.in                      |    6 +-
 package/flutter-sdk-bin/Config.in.host        |    2 +-
 package/go/go-bootstrap-stage1/Config.in.host |    6 +-
 package/google-breakpad/Config.in.host        |   12 +-
 package/jpeg/Config.in                        |    2 +-
 package/kvm-unit-tests/Config.in              |    2 +-
 package/libopenssl/Config.in                  |    4 -
 package/libressl/Config.in                    |    4 -
 package/luajit/Config.in                      |    4 +-
 package/mono/Config.in                        |    4 +-
 package/nodejs/Config.in.host                 |    8 +-
 package/openjdk/Config.in                     |    4 +-
 package/openssl/Config.in                     |   21 +-
 package/protobuf/Config.in                    |   22 +-
 package/qt5/qt5webengine/Config.in            |    2 +-
 package/rustc/Config.in.host                  |   16 +-
 package/sam-ba/Config.in.host                 |    2 +-
 package/supertuxkart/Config.in                |    4 +-
 package/ti-cgt-pru/Config.in.host             |    2 +-
 package/ti-gfx/Config.in                      |    2 +-
 package/wine/Config.in                        |    6 +-
 support/kconfig/Kbuild.include                |  273 ++
 support/kconfig/Makefile                      |  375 +-
 support/kconfig/Makefile.br                   |   10 +-
 support/kconfig/POTFILES.in                   |   12 -
 support/kconfig/README.buildroot              |   11 +-
 support/kconfig/array_size.h                  |   11 +
 support/kconfig/check.sh                      |   14 -
 support/kconfig/conf.c                        |  562 ++-
 support/kconfig/confdata.c                    | 1358 +++---
 support/kconfig/expr.c                        |   29 +-
 support/kconfig/expr.h                        |   49 +-
 support/kconfig/foo.h                         |   12 -
 support/kconfig/gconf-cfg.sh                  |   33 +
 support/kconfig/gconf.c                       |  100 +-
 support/kconfig/hashtable.h                   |   48 +
 support/kconfig/images.c                      |   34 +-
 support/kconfig/images.h                      |   33 +
 support/kconfig/internal.h                    |   21 +
 support/kconfig/kconf_id.c                    |   53 -
 support/kconfig/kxgettext.c                   |  235 -
 support/kconfig/lexer.l                       |  460 ++
 support/kconfig/lexer.lex.c_shipped           | 4103 +++++++++++++++++
 support/kconfig/list.h                        |  254 +-
 support/kconfig/list_types.h                  |   17 +
 support/kconfig/lkc.h                         |  117 +-
 support/kconfig/lkc_proto.h                   |   33 +-
 support/kconfig/lxdialog/.gitignore           |    4 -
 support/kconfig/lxdialog/BIG.FAT.WARNING      |    2 +-
 support/kconfig/lxdialog/check-lxdialog.sh    |   93 -
 support/kconfig/lxdialog/checklist.c          |   26 +-
 support/kconfig/lxdialog/dialog.h             |   76 +-
 support/kconfig/lxdialog/inputbox.c           |   21 +-
 support/kconfig/lxdialog/menubox.c            |   35 +-
 support/kconfig/lxdialog/textbox.c            |  330 +-
 support/kconfig/lxdialog/util.c               |   41 +-
 support/kconfig/lxdialog/yesno.c              |   21 +-
 support/kconfig/mconf-cfg.sh                  |   55 +
 support/kconfig/mconf.c                       |  529 +--
 support/kconfig/menu.c                        |  345 +-
 support/kconfig/merge_config.sh               |   91 +-
 support/kconfig/mnconf-common.c               |   53 +
 support/kconfig/mnconf-common.h               |   18 +
 support/kconfig/nconf-cfg.sh                  |   53 +
 support/kconfig/nconf.c                       |  295 +-
 support/kconfig/nconf.gui.c                   |  326 +-
 support/kconfig/nconf.h                       |   62 +-
 support/kconfig/parser.tab.c_shipped          | 2189 +++++++++
 support/kconfig/parser.tab.h_shipped          |  134 +
 support/kconfig/{zconf.y => parser.y}         |  467 +-
 .../01-kconfig-kernel-to-buildroot.patch      |  115 +-
 .../06-br-build-system-integration.patch      |  103 +-
 .../kconfig/patches/10-br-build-system.patch  |   66 +-
 .../patches/11-use-mktemp-for-lxdialog.patch  |   17 -
 .../patches/12-fix-glade-file-path.patch      |   14 +-
 .../14-support-out-of-tree-config.patch       |  202 +-
 .../16-fix-space-to-de-select-options.patch   |   19 +-
 .../kconfig/patches/17-backport-kecho.patch   |   26 -
 ...fig.sh-create-temporary-files-in-tmp.patch |   19 +-
 ...e_config.sh-add-br2-external-support.patch |   24 +-
 ...fig.sh-Allow-to-define-config-prefix.patch |   31 -
 ...-positive-matches-from-comment-lines.patch |   32 -
 ...config-lxdialog-fix-check-with-GCC14.patch |   43 -
 ...onfig-mn-conf-handle-backspace-H-key.patch |   24 +-
 ...llow-only-config-comment-and-if-insi.patch |  956 ++++
 support/kconfig/patches/series                |    3 +-
 support/kconfig/preprocess.c                  |  580 +++
 support/kconfig/preprocess.h                  |   19 +
 support/kconfig/qconf-cfg.sh                  |   40 +
 support/kconfig/qconf.cc                      | 1199 ++---
 support/kconfig/qconf.h                       |  163 +-
 support/kconfig/streamline_config.pl          |  104 +-
 support/kconfig/symbol.c                      |  374 +-
 support/kconfig/util.c                        |  122 +-
 support/kconfig/zconf.l                       |  372 --
 support/kconfig/zconf.lex.c_shipped           | 2500 ----------
 support/kconfig/zconf.tab.c_shipped           | 2488 ----------
 support/scripts/gen-bootlin-toolchains        |    2 +-
 system/Config.in                              |    4 +-
 toolchain/toolchain-external/Config.in        |    2 +-
 .../Config.in                                 |    2 +-
 .../toolchain-external-arm-aarch64/Config.in  |    2 +-
 .../toolchain-external-arm-arm/Config.in      |    2 +-
 .../toolchain-external-bootlin/Config.in      |    2 +-
 .../Config.in.options                         |    2 +-
 .../Config.in.options                         |    2 +-
 .../toolchain-external-synopsys-arc/Config.in |    2 +-
 115 files changed, 13005 insertions(+), 10428 deletions(-)
 create mode 100644 support/kconfig/Kbuild.include
 delete mode 100644 support/kconfig/POTFILES.in
 create mode 100644 support/kconfig/array_size.h
 delete mode 100755 support/kconfig/check.sh
 delete mode 100644 support/kconfig/foo.h
 create mode 100755 support/kconfig/gconf-cfg.sh
 create mode 100644 support/kconfig/hashtable.h
 create mode 100644 support/kconfig/images.h
 create mode 100644 support/kconfig/internal.h
 delete mode 100644 support/kconfig/kconf_id.c
 delete mode 100644 support/kconfig/kxgettext.c
 create mode 100644 support/kconfig/lexer.l
 create mode 100644 support/kconfig/lexer.lex.c_shipped
 create mode 100644 support/kconfig/list_types.h
 delete mode 100644 support/kconfig/lxdialog/.gitignore
 delete mode 100755 support/kconfig/lxdialog/check-lxdialog.sh
 create mode 100755 support/kconfig/mconf-cfg.sh
 create mode 100644 support/kconfig/mnconf-common.c
 create mode 100644 support/kconfig/mnconf-common.h
 create mode 100755 support/kconfig/nconf-cfg.sh
 create mode 100644 support/kconfig/parser.tab.c_shipped
 create mode 100644 support/kconfig/parser.tab.h_shipped
 rename support/kconfig/{zconf.y => parser.y} (56%)
 delete mode 100644 support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
 delete mode 100644 support/kconfig/patches/17-backport-kecho.patch
 delete mode 100644 support/kconfig/patches/20-merge_config.sh-Allow-to-define-config-prefix.patch
 delete mode 100644 support/kconfig/patches/21-Avoid-false-positive-matches-from-comment-lines.patch
 delete mode 100644 support/kconfig/patches/22-kconfig-lxdialog-fix-check-with-GCC14.patch
 create mode 100644 support/kconfig/patches/24-Revert-kconfig-allow-only-config-comment-and-if-insi.patch
 create mode 100644 support/kconfig/preprocess.c
 create mode 100644 support/kconfig/preprocess.h
 create mode 100755 support/kconfig/qconf-cfg.sh
 delete mode 100644 support/kconfig/zconf.l
 delete mode 100644 support/kconfig/zconf.lex.c_shipped
 delete mode 100644 support/kconfig/zconf.tab.c_shipped

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
