Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB61CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EC306064F;
	Sat, 10 Oct 2026 15:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1QY23JpISBxJ; Sat, 10 Oct 2026 15:11:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 076F46065F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645116;
	b=Bn/hAnFYyJV3szaNSQJOoeBM6uoOm2JYzgB2+LEP/ei/gd48CW3fsXH89doxnu5JsG9J
	 yq2q6FXvwG5Zz4HOCnUbNefsBiiGW9T3bMw1P2sn8bkzJKvZAGlqpxfFQvRybQCSzOAFA
	 lOvfCeEneeW1ggeBpGPCNBgnUlue02nT1EQscbwpHKoIm89mys/CxFMKqfdW48yMoMO0E
	 desXveVbgHUNdqtr1OedHcT7cJbiVCNPrEy9OXUu93tBJZFs53fGxeRicbDTaC2FNe3l5
	 BMDVX6Kyh8HcK8x3EGQctwlyitHW7kPcI3IxvDMndVF0rr0v/sH5awLdcwG1WGfRF3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645116;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=x30SuiwfKobFxixS3EhokhMB7oo2kPuIYi14qzLYNuI=;
	b=baFU+TXfR/ft1C/BAo2hsdsbh2CrzLTHXo03Orw+KHsuW5gl5mZB+Qgp9o6nh7oB1U8O
	 o3IS2WktWJokTiPt3b/aemmkzXXdNdBYWFhhIkbiaBohxJYaqr9zUQMk/P/JKsKzC8mSi
	 uIvitn+0Q9x0VJJjg/cUH3FHFSZYTyMANCWwMNhs3tEutmHuGrJtqQWjXY0cJGvwzNsfo
	 xeRIeZ0Wk09nmXbXsuanqV26enAqeoBivAdWaDzpq+UbkjbbPeHr9kTG2Td/OtefNC824
	 gVAOqYqbM+RZUcR6cBf5XJWPkChb22arODP6a5MoN8dAVHU2lAge5ijUql7pYSHdh9A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645116;
	bh=x30SuiwfKobFxixS3EhokhMB7oo2kPuIYi14qzLYNuI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=NF4V3H34tQM8XVDMTuXEB2OsNcsLh7tKi9gk+6szc7tebbCFY+rsjQM4NYhqLLuj/
	 vvKLSNZeZQgSoAwLcSRvOKDcZ+UD+9B/SR7gIoR4PCvb3x0v9eZSCDWKHMOXvVka97
	 oPpGF93Dkp8yVeNE1n9UlIgt2rJmZomI3AgeKIAf2112pShZgBYKSeXAdD39A+2p6Z
	 iG6bGAmXfhqEQ22fHJ4xPIz3CAMVYaSa2uEId96DMv3Fd2Aub6zrxNKvZsuqwozvU2
	 twe+4tfqYPAvk7+TOoaGr0APwaLSC6QHnhwnXfypRgSHk/W9x7RWMt5AYQxugopJRS
	 YNxw0F16sa5gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 076F46065F;
	Sat, 10 Oct 2026 15:11:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3D2E105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95DC660662
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1jgUstgEx9S for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:11:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EB8836064F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645111;
 b=PCbwCJmq21Sua9YDqLd6SP34zWo5C1pHbeUx126Zlsw0mYjdnCXpImOb27BzTNBgCJdP
 3IwIRRC36u1Sf4H8hL4pHYMsOoRwBF5cycsp9GyXulyoBvQxytfXaZbB/C/S4YEatDGIq
 83TVsOIa9/TZ4+9ZvhdooGyqZMhFDajpenmioV+WFIz1n7x0RYHZR+2S6fuwGUxAYLqEn
 12iWWChd+g9Bxs0IhycYbHb5m05eiHwQVSXWsTKYcss7ADSrSKlEIsxQUAyGNm/2DTsal
 eW77qM818idl+W1Ta4wVt8wbF5iDAu/XS1EM9i8IM4qB4unYCnaT4g+M778uRavSWYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645111;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=3OsgArpfmcz9LhkJ+2TKmxA2BDuMBoVNYf2XzQrtvPM=;
 b=DPeAHUkTHjYZ4xbbBa+hftGUyKV3If4lt+rbycUnZ7n0AeRU9fHqu/8eWZkKv3PXrb9t
 1xuYgHOcCh8TRtWXStBJ60y8Um47zRMxhyESyZviijkgCCJoruZg6SvfvPDbE572jZRw7
 KPqoNvUC/2Ebl1C+9jDkK/Xq3D7TfFYlDlCy1k6RK//CLDlkpcxocYQKk3JzmPyYOMYJo
 CijlMj8PJSBd3JO8eVAn57wyI16RsNrwxKxWMjlreh9DTi3PNKz6/O9h0LKeIbJCxL13i
 qwT4MCnSN3ndmBU9sM0R4YozdOoxBGKJkxe989K7Qu7lQBo0MljUpRr+Q23r/2Wsfnw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=MXt+N19K; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB8836064F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:49 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a1682bff3cso3025585e9.1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791645107; x=1792249907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3OsgArpfmcz9LhkJ+2TKmxA2BDuMBoVNYf2XzQrtvPM=;
 b=pauO9bB6D333qyOl1LoPdUVZCFQnPcka4PBaTeyhndqrG1oEP7SAdOhDWTQQ4s+sW2
 YpXN2LOt4y3NmiGcZLus8V4m5iXaAV8hn7vucKz7mT4WqJVvSLD+9mtb4kR987HpxLuF
 fh//395tEioY9jzmyt9CXtY3CBpbv8aSVOxJ96hHBduC+Q4N8GD4pVbNi4rNprVkPGUp
 aTSsO3l5T6Fp7Sn4TnmLbdFR5EU3MxPvk0nRRc/LwQ+Oxh7zZX8NT3Z7MurSA07ul7p+
 vmPvchfVtnqSwuwyP18r4a0+raqJqIFQCJi66s624mPW/Z8nVbjA49dR6SzCAWpa396N
 JSQg==
X-Gm-Message-State: AFq9FYJiJlIkGerCz7uZXlnYjozSXVgU4j0YB0CuItlPy6V08SFOu/Uz
 zG7GR/0lrmuUChoKRPx+lhWnMuNVrfxNSiDD5CwBp+BXYO1TDIq1EVhZ09sj3DwNTqnV64lE1VB
 uHS4Q9iI=
X-Gm-Gg: AYBFou2Gb/gFKNkxWhypyVUNgJGtCDkij3rJBEF5gAQpe8hJMhiaGkBsuGTkOPQOzKH
 x8Ot1BkCHyqsSwF9vd/jNMaQEfGEESrNjs2Zv2qoPRvSw8unDoRI0yn/KxUfgMvCH0svpZcUSC9
 T5Bxgxe0FSm2gvbLCbkufREAQegyyEPxGVl3dUe32kUkuaXR5AFtX97dTPb3uS3bi+JYcoMqFi3
 +ocNEsp077XmRMT0MrrRoWJLYVXgWvBc6qHvWe5iZMoVfKxeeN3p13QIOr2D1yeLJAp38tl5Z2G
 ognvwTT09wPf+2s4XlyvePEyo8HwCX4XXCoeQiYwRn+rigpYptkE/CZzPIhzzHlH+7bbVLBWA6L
 aLihydr7GI8YdjYDi9MmMu+dbCFGrfMjh7FdcYgRIx7eeflbOvTq85hCm8S/PI8Z5arJHNwqH/N
 LG09D7KMmJotHhde24K2sYpenkYLgWuQ+6/crwLRGMohca+FBKuNszzWMxP+ZeZJGTvKKLo0FHG
 Ubn71bIlqugQZEBNmYwEFWjf2vFz+o9PsNJqKRTi4OIcqns0c/g43S9pX5UvILMlPTJZVMlNQ==
X-Received: by 2002:a05:600c:609a:b0:4a1:717b:7976 with SMTP id
 5b1f17b1804b1-4a18e4b15e5mr95890355e9.35.1791645107054; 
 Sat, 10 Oct 2026 08:11:47 -0700 (PDT)
Received: from dragon.telekom.ip
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bb6b3cbsm115104125e9.0.2026.10.10.08.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 08:11:46 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:11:12 +0200
Message-ID: <20261010151121.876133-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/7] Update kconfig inrastructure to Linux 7.2.9
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
Cc: petr.vorel@gmail.com, ps.report@gmx.net, yann.morin@orange.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following commits update the kconfig infrastructure to a recent version,
and add support for Zephyr's kconfiglib, thanks to the update that make
our Config.in files syntactically compatible.

This is a major overhaul to the previous attempt at updating Buildroot's
kconfig infrastructure [1]. Compared to the previous iteration, this series
targets the latest kernel version to date (7.2.9), instead of 6.9 at the time.
Since more changes have happened upstream inbetween those versions, more
changes have had to be applied here.

Given all these changes, I re-started the series from scratch, while keeping
in mind the reviews that were made in the previous attempts. 
- Patch 0001 has been taken as-is from the former series
- Patch 0007 has been slightly updated from the former series
- All the other patches are new
Hence why it is posted a brand new series rather than a new version of it.

As a disclaimer, I made heavy use of AI for this new iteration.

[1] https://patchwork.buildroot.org/project/buildroot/list/?series=13&state=*

Titouan Christophe (7):
  Makefile: always use a base config file for defconfig
  */Config.in: use the new $(VAR) syntax
  */Config.in: replace bool entries with prompt within all choices
  support/kconfig: update to kconfig from Linux 7.2.9
  package/openssl: move libopenssl/libressl options out of the choice
  docs/manual: add migration notes for changes in the kconfig syntax
  Makefile: add new target "yellowconfig" based on kconfiglib

 Config.in                                     |   71 +-
 Config.in.legacy                              |    6 +-
 Makefile                                      |    8 +-
 boot/xilinx-prebuilt/Config.in                |    2 +-
 docs/manual/customize-outside-br.adoc         |   12 +-
 docs/manual/migrating.adoc                    |   13 +
 docs/manual/quickstart.adoc                   |    7 +
 fs/ext2/Config.in                             |    2 +-
 linux/Config.ext.in                           |    2 +-
 package/amlogic-boot-fip/Config.in.host       |    2 +-
 package/arm-gnu-toolchain/Config.in.host      |    4 +-
 package/docker-engine/Config.in               |    2 +-
 package/efl/Config.in                         |    2 +-
 package/erlang/Config.in                      |    6 +-
 package/flutter-sdk-bin/Config.in.host        |    2 +-
 package/freescale-imx/firmware-imx/Config.in  |    2 +-
 package/go/Config.in.host                     |    4 +-
 package/go/go-bin/Config.in.host              |   12 +-
 package/go/go-bootstrap-stage1/Config.in.host |    6 +-
 package/google-breakpad/Config.in.host        |   12 +-
 package/jpeg/Config.in                        |    2 +-
 package/kvm-unit-tests/Config.in              |    2 +-
 package/libopenssl/Config.in                  |    4 -
 package/libressl/Config.in                    |    4 -
 package/linux-headers/Config.in.host          |    2 +-
 package/luajit/Config.in                      |    4 +-
 package/mono/Config.in                        |    4 +-
 package/nodejs/Config.in.host                 |    8 +-
 package/openjdk/Config.in                     |    4 +-
 package/openssl/Config.in                     |   14 +-
 package/podman/Config.in                      |    4 +-
 package/protobuf/Config.in                    |   22 +-
 package/qt5/qt5webengine/Config.in            |    2 +-
 package/rustc/Config.in.host                  |   16 +-
 package/sam-ba/Config.in.host                 |    2 +-
 package/supertuxkart/Config.in                |    4 +-
 package/ti-cgt-pru/Config.in.host             |    2 +-
 package/ti-gfx/Config.in                      |    2 +-
 package/wine/Config.in                        |    6 +-
 package/xenomai/Config.in                     |    2 +-
 support/kconfig/Makefile                      |  382 +-
 support/kconfig/Makefile.br                   |   80 +-
 support/kconfig/POTFILES.in                   |   12 -
 support/kconfig/README.buildroot              |   14 +-
 support/kconfig/check.sh                      |   14 -
 support/kconfig/conf.c                        |  587 ++-
 support/kconfig/confdata.c                    | 1621 ++++---
 support/kconfig/expr.c                        |  641 +--
 support/kconfig/expr.h                        |  119 +-
 support/kconfig/foo.h                         |   12 -
 support/kconfig/gconf-cfg.sh                  |   28 +
 support/kconfig/gconf.c                       | 1837 ++++----
 support/kconfig/{gconf.glade => gconf.ui}     |  361 +-
 support/kconfig/icons/back.xpm                |   29 +
 support/kconfig/icons/choice_no.xpm           |   18 +
 support/kconfig/icons/choice_yes.xpm          |   18 +
 support/kconfig/icons/load.xpm                |   31 +
 support/kconfig/icons/menu.xpm                |   18 +
 support/kconfig/icons/menuback.xpm            |   18 +
 support/kconfig/icons/save.xpm                |   31 +
 support/kconfig/icons/single_view.xpm         |   28 +
 support/kconfig/icons/split_view.xpm          |   28 +
 support/kconfig/icons/symbol_mod.xpm          |   18 +
 support/kconfig/icons/symbol_no.xpm           |   18 +
 support/kconfig/icons/symbol_yes.xpm          |   18 +
 support/kconfig/icons/tree_view.xpm           |   28 +
 support/kconfig/images.c                      |  326 --
 support/kconfig/include/array_size.h          |   11 +
 support/kconfig/include/hash.h                |   28 +
 support/kconfig/include/hashtable.h           |   98 +
 support/kconfig/include/list.h                |  428 ++
 support/kconfig/include/list_types.h          |   17 +
 support/kconfig/include/xalloc.h              |   53 +
 support/kconfig/internal.h                    |   27 +
 support/kconfig/kconf_id.c                    |   53 -
 support/kconfig/kconfig-sym-check.pl          |  132 +
 support/kconfig/kxgettext.c                   |  235 -
 support/kconfig/lexer.l                       |  461 ++
 support/kconfig/lexer.lex.c_shipped           | 4130 +++++++++++++++++
 support/kconfig/list.h                        |  132 -
 support/kconfig/lkc.h                         |  159 +-
 support/kconfig/lkc_proto.h                   |   47 +-
 support/kconfig/lxdialog/.gitignore           |    4 -
 support/kconfig/lxdialog/BIG.FAT.WARNING      |    2 +-
 support/kconfig/lxdialog/check-lxdialog.sh    |   93 -
 support/kconfig/lxdialog/checklist.c          |   26 +-
 support/kconfig/lxdialog/dialog.h             |   76 +-
 support/kconfig/lxdialog/inputbox.c           |   27 +-
 support/kconfig/lxdialog/menubox.c            |   35 +-
 support/kconfig/lxdialog/textbox.c            |  330 +-
 support/kconfig/lxdialog/util.c               |   53 +-
 support/kconfig/lxdialog/yesno.c              |   21 +-
 support/kconfig/mconf-cfg.sh                  |   57 +
 support/kconfig/mconf.c                       |  641 ++-
 support/kconfig/menu.c                        |  573 +--
 support/kconfig/merge_config.sh               |  311 +-
 support/kconfig/mnconf-common.c               |   53 +
 support/kconfig/mnconf-common.h               |   20 +
 support/kconfig/nconf-cfg.sh                  |   56 +
 support/kconfig/nconf.c                       |  417 +-
 support/kconfig/nconf.gui.c                   |  345 +-
 support/kconfig/nconf.h                       |   62 +-
 support/kconfig/parser.tab.c_shipped          | 2248 +++++++++
 support/kconfig/parser.tab.h_shipped          |  134 +
 support/kconfig/parser.y                      |  798 ++++
 .../01-kconfig-kernel-to-buildroot.patch      |  101 +-
 .../06-br-build-system-integration.patch      |   74 -
 .../kconfig/patches/10-br-build-system.patch  |  108 +-
 .../patches/11-use-mktemp-for-lxdialog.patch  |   17 -
 .../patches/12-fix-glade-file-path.patch      |   46 +-
 .../14-support-out-of-tree-config.patch       |  207 -
 .../16-fix-space-to-de-select-options.patch   |   41 -
 .../kconfig/patches/17-backport-kecho.patch   |   26 -
 ...fig.sh-create-temporary-files-in-tmp.patch |    6 +-
 ...e_config.sh-add-br2-external-support.patch |   20 +-
 ...fig.sh-Allow-to-define-config-prefix.patch |   31 -
 ...-positive-matches-from-comment-lines.patch |   32 -
 ...config-lxdialog-fix-check-with-GCC14.patch |   43 -
 ...onfig-mn-conf-handle-backspace-H-key.patch |   62 -
 ...4-kconfig-allow-source-inside-choice.patch |   28 +
 support/kconfig/patches/series                |   10 +-
 support/kconfig/preprocess.c                  |  581 +++
 support/kconfig/preprocess.h                  |   19 +
 support/kconfig/qconf-cfg.sh                  |   42 +
 support/kconfig/qconf.cc                      | 1305 +++---
 support/kconfig/qconf.h                       |  183 +-
 support/kconfig/streamline_config.pl          |  124 +-
 support/kconfig/symbol.c                      |  790 ++--
 support/kconfig/util.c                        |  162 +-
 support/kconfig/zconf.l                       |  372 --
 support/kconfig/zconf.lex.c_shipped           | 2500 ----------
 support/kconfig/zconf.tab.c_shipped           | 2488 ----------
 support/kconfig/zconf.y                       |  782 ----
 support/scripts/gen-bootlin-toolchains        |    2 +-
 .../br2-external/detect-bad-arch/Config.in    |    2 +-
 .../br2-external/flat-stacksize/Config.in     |    2 +-
 .../core/test_selinux/br2_external/Config.in  |    2 +-
 .../br2-external/clang-compiler-rt/Config.in  |    2 +-
 .../br2-external/gumbo-parser/Config.in       |    2 +-
 .../package/br2-external/openjdk/Config.in    |    4 +-
 .../package/br2-external/polkit/Config.in     |    2 +-
 .../br2-external/python-pybind/Config.in      |    2 +-
 system/Config.in                              |   10 +-
 toolchain/toolchain-external/Config.in        |    2 +-
 .../Config.in                                 |    2 +-
 .../toolchain-external-arm-aarch64/Config.in  |    2 +-
 .../toolchain-external-arm-arm/Config.in      |    2 +-
 .../toolchain-external-bootlin/Config.in      |    2 +-
 .../Config.in.options                         |    2 +-
 .../Config.in.options                         |    6 +-
 150 files changed, 15366 insertions(+), 13897 deletions(-)
 delete mode 100644 support/kconfig/POTFILES.in
 delete mode 100755 support/kconfig/check.sh
 delete mode 100644 support/kconfig/foo.h
 create mode 100755 support/kconfig/gconf-cfg.sh
 rename support/kconfig/{gconf.glade => gconf.ui} (57%)
 create mode 100644 support/kconfig/icons/back.xpm
 create mode 100644 support/kconfig/icons/choice_no.xpm
 create mode 100644 support/kconfig/icons/choice_yes.xpm
 create mode 100644 support/kconfig/icons/load.xpm
 create mode 100644 support/kconfig/icons/menu.xpm
 create mode 100644 support/kconfig/icons/menuback.xpm
 create mode 100644 support/kconfig/icons/save.xpm
 create mode 100644 support/kconfig/icons/single_view.xpm
 create mode 100644 support/kconfig/icons/split_view.xpm
 create mode 100644 support/kconfig/icons/symbol_mod.xpm
 create mode 100644 support/kconfig/icons/symbol_no.xpm
 create mode 100644 support/kconfig/icons/symbol_yes.xpm
 create mode 100644 support/kconfig/icons/tree_view.xpm
 delete mode 100644 support/kconfig/images.c
 create mode 100644 support/kconfig/include/array_size.h
 create mode 100644 support/kconfig/include/hash.h
 create mode 100644 support/kconfig/include/hashtable.h
 create mode 100644 support/kconfig/include/list.h
 create mode 100644 support/kconfig/include/list_types.h
 create mode 100644 support/kconfig/include/xalloc.h
 create mode 100644 support/kconfig/internal.h
 delete mode 100644 support/kconfig/kconf_id.c
 create mode 100755 support/kconfig/kconfig-sym-check.pl
 delete mode 100644 support/kconfig/kxgettext.c
 create mode 100644 support/kconfig/lexer.l
 create mode 100644 support/kconfig/lexer.lex.c_shipped
 delete mode 100644 support/kconfig/list.h
 delete mode 100644 support/kconfig/lxdialog/.gitignore
 delete mode 100755 support/kconfig/lxdialog/check-lxdialog.sh
 create mode 100755 support/kconfig/mconf-cfg.sh
 create mode 100644 support/kconfig/mnconf-common.c
 create mode 100644 support/kconfig/mnconf-common.h
 create mode 100755 support/kconfig/nconf-cfg.sh
 create mode 100644 support/kconfig/parser.tab.c_shipped
 create mode 100644 support/kconfig/parser.tab.h_shipped
 create mode 100644 support/kconfig/parser.y
 delete mode 100644 support/kconfig/patches/06-br-build-system-integration.patch
 delete mode 100644 support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
 delete mode 100644 support/kconfig/patches/14-support-out-of-tree-config.patch
 delete mode 100644 support/kconfig/patches/16-fix-space-to-de-select-options.patch
 delete mode 100644 support/kconfig/patches/17-backport-kecho.patch
 delete mode 100644 support/kconfig/patches/20-merge_config.sh-Allow-to-define-config-prefix.patch
 delete mode 100644 support/kconfig/patches/21-Avoid-false-positive-matches-from-comment-lines.patch
 delete mode 100644 support/kconfig/patches/22-kconfig-lxdialog-fix-check-with-GCC14.patch
 delete mode 100644 support/kconfig/patches/23-kconfig-mn-conf-handle-backspace-H-key.patch
 create mode 100644 support/kconfig/patches/24-kconfig-allow-source-inside-choice.patch
 create mode 100644 support/kconfig/preprocess.c
 create mode 100644 support/kconfig/preprocess.h
 create mode 100755 support/kconfig/qconf-cfg.sh
 delete mode 100644 support/kconfig/zconf.l
 delete mode 100644 support/kconfig/zconf.lex.c_shipped
 delete mode 100644 support/kconfig/zconf.tab.c_shipped
 delete mode 100644 support/kconfig/zconf.y

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
