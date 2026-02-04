Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D3DE9D404
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26D1560DD6;
	Wed,  4 Feb 2026 15:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78-7qNrloEXG; Wed,  4 Feb 2026 15:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC7D8607B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770219852;
	bh=RtLpje4Hn3gEH+XqttWom/hQBmHWvNGDTGTQcba5kjQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=ba2Gae/q0aziDQUvBi4jA8+f7NwTRy3JUDwtv7qan9gqUzXnULuNvq8zZeuRbaLT0
	 KiOpMe/fzVbUdmiAZuoJeetUHqyVAYLzdIUdxFGcoJ87f0fNUa0S3UN3rHYNWSomKx
	 YWEZsL4IB1HEq2AbfgHsVpqZn23/vzr4BEeeIkQbmol5dAvB4XsXtRPTfSW3elLXjp
	 q2BoXqUSuXsYtHS+FbIVMvbX7lEHjOZ0s61OTnCfskWlkQeCgcB9zqFAzCK5enY60R
	 rus5KhpCY/eYT1npM7o1szpmWIV/0RTo3X3cLc+Mhjx/m3DSbQ3JQS7YOSLZmMbyxQ
	 14e5nQDxQwLMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC7D8607B3;
	Wed,  4 Feb 2026 15:44:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 987AAF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A62C607DF
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LyiEhGIRkbaf for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:44:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 343E9607B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 343E9607B3
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 343E9607B3
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:02 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4806b43beb6so50722655e9.3
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 07:44:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770219841; x=1770824641;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPWnMF9rpmZedgEaonjFV76aANLVVBdp5dlANkQ0Udc=;
 b=mQTp3jzRXElw3hFTMPh2zYdNEDCPx2wWIWyiMO9z6yuzTV6sUja/YgRem3jmT6Xu/M
 1frmHZOaR8RS0us6XutppKd0SJjRUCqrwnNRdaaUxke+2ft7OGohAUxkO0K/0gkRJhLj
 aSEjbjXZh3X13ZcOr4f/Dgp4hP8NKEyroFjLr5/QGVd7UKmVe/C42RadFS/X1Io7Qpso
 8IUPUhyki523y6HRkqLaUNUBTOQqPzZteKbYANaEHiipYNXIwfKua2kD5IEqfIgz7rxf
 ii6eSZl/3pnV2Wo9eolVEhkvL6Ks6tur0J4p5pComF+iEZHkBYUvBTTsFTGAMAQn5RQX
 bJ4Q==
X-Gm-Message-State: AOJu0YyqOS4hSOZ0i+xnwqsP2COCUURLyNvri109LVLDbpDT0T6ze9SD
 Ul5Q4Mo4qgSEvLslU2C9Z8dTcsZi8TlyxxR/KA3qnOwoQqFMNWDIkFcNPjA12L1o5ZrfXOICllT
 8Cl8J3Jw=
X-Gm-Gg: AZuq6aJHcI55Jo+AgRlEme/nkovc5B0/4mpYIEQEv4DL0qBPP5Ms6wyquZWXfoaxYv4
 wZD59qkpcoYEqqgawMIAhb5S+1UxXa49Kr+Vxx7Kv2ewyeHRp+cojJMu7Mj+rzXuxU8R5p2xbgR
 ybJOx4ahLphYLuDxtysAW2aidWz4dQXNPhDNyCa84j4aWSfYcoi0w15jHlWs/W3D3loe0FHztnQ
 rUuxLJFG/2vrDuvaDtbuM2jXCKwSOIOWw4JRo4rA8Fzi28NZrviX0m7hOfhpVDcew54O0FYqxnd
 tnAgC8U4eaaxr6TvdGRVUu5lWt2RTfeBvcgU39ljVo84ioKQll3DrrxquLJuo3FC+Uj41L/tYPb
 ZLaHrikn/vb7sqbl3yZSSHPGuru4Vml2KBkHP6ue3cF82cxsYnXE9lMQDY9LLghMOyj1jyIeYOW
 b9DSorKHD6kQAuV3NzmW1/Uu4BdG0IOHPAJkvTmZG17yTsqRBe7qB8oliZPUg=
X-Received: by 2002:a05:600c:1c02:b0:475:dd89:acb with SMTP id
 5b1f17b1804b1-4830e96fb19mr50681075e9.22.1770219840769; 
 Wed, 04 Feb 2026 07:44:00 -0800 (PST)
Received: from dragon (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483108d79d5sm55222545e9.3.2026.02.04.07.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 07:44:00 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 16:43:27 +0100
Message-ID: <20260204154340.766528-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770219841; x=1770824641; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QPWnMF9rpmZedgEaonjFV76aANLVVBdp5dlANkQ0Udc=;
 b=IZV43kuQE7qofBh/3oqaFS7XKcX4P12LadgU1DBcN3XH0pagy0HzjeqS5UtmhnPbyh
 spua6NJttAlD04huNgqFhBBPpMIMu/2g3zGyGUty+05Q+X1umLfPQH5/b8/9eSodA2kP
 iWtsnfHUQzTG5Nu8C9/pSf7omBd02BG5Py0G7WAhzvb9QHNbLPBFyTJge4Swv5Wk66LG
 Wx+Lw1YtB8adyJ6PflYaEbz8R3XQzELqXWk0o0wkYUQbsAsETiPJrJ3pwEM7mukyY0K3
 sx6tN3rb1HBT0j/BlzE3E/MjteIjNpUYXtH4KyCjMJyE+NNveDuiZZY35h/0ENFGOKU1
 AYVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IZV43kuQ
Subject: [Buildroot] [PATCH v3 0/7] Update kconfig infrastructure
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
Cc: Petr Vorel <petr.vorel@gmail.com>, Peter Seiderer <ps.report@gmx.net>
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

Peter Seiderer (4):
  Config.in: do not expand TOPDIR, BASE_DIR and CONFIG_DIR
  support/kconfig: bump to linux-v6.9-rc5 version
  support/kconfig: reference environment variables directly (remove
    'option env=')
  package/openssl: move libopenssl/libressl/.br2-external.in.openssl
    source statements outside of the choice

Titouan Christophe (3):
  support/kconfig: fix invalid filenames in patch 23
  docs: update the Buildroot manual for kconfig variables expansion
  Makefile: add new target "yellowconfig" based on kconfiglib

 Config.in                                     |   53 +-
 Config.in.legacy                              |    6 +-
 Makefile                                      |    3 +
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
 system/Config.in                              |    4 +-
 toolchain/toolchain-external/Config.in        |    2 +-
 .../Config.in                                 |    2 +-
 .../toolchain-external-arm-aarch64/Config.in  |    2 +-
 .../toolchain-external-arm-arm/Config.in      |    2 +-
 .../toolchain-external-bootlin/Config.in      |    2 +-
 .../toolchain-external-synopsys-arc/Config.in |    2 +-
 112 files changed, 13001 insertions(+), 10420 deletions(-)
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
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
