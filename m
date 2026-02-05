Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C539EE91289
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 07:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FF7483D4A;
	Thu,  5 Feb 2026 07:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6IIun0hdvFA; Thu,  5 Feb 2026 07:28:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DECB83ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770276536;
	bh=uvcSRIIiQxVDvtMRpqCBpJfGRblQ0+VQjv+QIBV1LVQ=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=FHDp+bzB8RoCumvRsrQt4TOzB9cf9pB8DPj9F5YulCuhVASFVG3W0tmre14BncWuD
	 gI9dzqETNwSIYch2YKyU14OPn2jGS6w7/pRl0aQPKAXZgkI07VoD8hpS7woJ3mL/bP
	 sLep8fPKgkDEigJGutyfJbOPWrug33bjgrgNnCYyFymiM1FHo1Rl9rXo1wgohVntZF
	 XSgPk92aQR4nDnJS+KTDpEMNhMIY6mwC1O6bC8X46zJM45HG0DXfWRzNurEBtPhMu0
	 4piYgnoAJO0W9ON7e3GmMx+9GGdc1AuwJgWRsqgikR0rjQl12LoUq+X87z8AuwHN7I
	 9+EAmCUo8YT1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DECB83ED8;
	Thu,  5 Feb 2026 07:28:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1249B173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 07:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0971183ED8
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 07:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15tNxZXP9NIu for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 07:28:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C3D2383D4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3D2383D4A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3D2383D4A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 07:28:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1 ([82.135.81.2]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mnpns-1vUqRm04NO-00e4xm; Thu, 05
 Feb 2026 08:28:48 +0100
Date: Thu, 5 Feb 2026 08:28:47 +0100
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20260205082847.4b855528@pc-1>
In-Reply-To: <20260204154340.766528-1-titouan.christophe@mind.be>
References: <20260204154340.766528-1-titouan.christophe@mind.be>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:jWgljwN2skknSt2L4QJM+6hSMsmwMF0HuWXT+YYhc8fiyzGeprg
 B6MS1TOfd4QveyZ6FC/nNstEBF8PPErL10YxJOxTYU77McJExZu8V0r5bhFNO39BWZtn1oK
 y/0CKzU/N4NPFRGS9HOgLBLdBZ9sLERAShhrkHsaBBM0BzEHn1GnCe8M9s1/BzcmGdazG/L
 NYKlTs/QUs7O0F5S934QQ==
UI-OutboundReport: notjunk:1;M01:P0:BN9Sh9Nbx3A=;OdvUmUYDU3Cj5VGwFAd7t26qn73
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1770276528; x=1770881328; i=ps.report@gmx.net;
 bh=QYDKCLAFEYc0a+fvF24qfgNzYvkXt7yzK7i9S2lW8HE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=eBKWwmx39nRIFR3gEOqv7cppQ8tlqQsbwQ8Rvlo1FDa0OMV6PE6j7bQx4DvheftO
 Rig9nN4tWpZS4raOOGF53LP16WQOdQZS9TCgCINEmSMDjPGAgfqZSzOdwi8woOVcF
 f8/ra1s3yj2HIQ5MA0K20KAcOWkJTGNYK9GYLld/s8UT8rG4kLeVhYJVJy726v11M
 ozxz1AXMo1oL2Pm1MbZhv97dsejRyvxHTKeYHxlIVt8i4rgLIDy6ITKfR/J/CDsE/
 TvPbUMACqB38nePxDfwDNNaukSb7RPvmmlTdxERZfWep4bJ9dCzx1HMoQTkq8Kc7G
 zVNXFRJKp7N08+IU1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=eBKWwmx3
Subject: Re: [Buildroot] [PATCH v3 0/7] Update kconfig infrastructure
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Titouan,

thanks for taking care of the patchset...

On Wed,  4 Feb 2026 16:43:27 +0100, Titouan Christophe <titouan.christophe@mind.be> wrote:

> This is an update of Peter Seiderer's series [1], rebasing the v2 [2] on top
> of the latest Buildroot master.
> 
> The main changes introduced here are:
> - update support/kconfig to match what's in Linux 6.9-rc5
> - add support for Zephyr's kconfiglib as a new configuration interface
> - fix remaining issues or merge conflicts from the former series
> 
> [1] https://lore.kernel.org/buildroot/20240506144555.31709-1-ps.report@gmx.net/
> [2] https://lore.kernel.org/buildroot/20240513091950.30116-1-ps.report@gmx.net/

The patch 'Makefile: always use a base config file for defconfig' ([3]) suggested
by Yann E. MORIN should be added as preparing patch...

The patch 'toolchain-external: do not expand ARCH' ([4], [5]) should be added to
the patchset...

Regards,
Peter

[3] https://lore.kernel.org/buildroot/ZjyqwNLypWWS21v5@landeda/
[4] https://lore.kernel.org/buildroot/20240514001106.6e9d8206@gmx.net/
[5] https://lore.kernel.org/buildroot/20250521094004.4fb92fe1@gmx.net/


> 
> Peter Seiderer (4):
>   Config.in: do not expand TOPDIR, BASE_DIR and CONFIG_DIR
>   support/kconfig: bump to linux-v6.9-rc5 version
>   support/kconfig: reference environment variables directly (remove
>     'option env=')
>   package/openssl: move libopenssl/libressl/.br2-external.in.openssl
>     source statements outside of the choice
> 
> Titouan Christophe (3):
>   support/kconfig: fix invalid filenames in patch 23
>   docs: update the Buildroot manual for kconfig variables expansion
>   Makefile: add new target "yellowconfig" based on kconfiglib
> 
>  Config.in                                     |   53 +-
>  Config.in.legacy                              |    6 +-
>  Makefile                                      |    3 +
>  docs/manual/customize-outside-br.adoc         |   12 +-
>  docs/manual/migrating.adoc                    |    7 +
>  docs/manual/quickstart.adoc                   |    7 +
>  linux/Config.ext.in                           |    2 +-
>  package/amlogic-boot-fip/Config.in.host       |    2 +-
>  package/erlang/Config.in                      |    6 +-
>  package/flutter-sdk-bin/Config.in.host        |    2 +-
>  package/go/go-bootstrap-stage1/Config.in.host |    6 +-
>  package/google-breakpad/Config.in.host        |   12 +-
>  package/jpeg/Config.in                        |    2 +-
>  package/kvm-unit-tests/Config.in              |    2 +-
>  package/libopenssl/Config.in                  |    4 -
>  package/libressl/Config.in                    |    4 -
>  package/luajit/Config.in                      |    4 +-
>  package/mono/Config.in                        |    4 +-
>  package/nodejs/Config.in.host                 |    8 +-
>  package/openjdk/Config.in                     |    4 +-
>  package/openssl/Config.in                     |   21 +-
>  package/protobuf/Config.in                    |   22 +-
>  package/qt5/qt5webengine/Config.in            |    2 +-
>  package/rustc/Config.in.host                  |   16 +-
>  package/sam-ba/Config.in.host                 |    2 +-
>  package/supertuxkart/Config.in                |    4 +-
>  package/ti-cgt-pru/Config.in.host             |    2 +-
>  package/ti-gfx/Config.in                      |    2 +-
>  package/wine/Config.in                        |    6 +-
>  support/kconfig/Kbuild.include                |  273 ++
>  support/kconfig/Makefile                      |  375 +-
>  support/kconfig/Makefile.br                   |   10 +-
>  support/kconfig/POTFILES.in                   |   12 -
>  support/kconfig/README.buildroot              |   11 +-
>  support/kconfig/array_size.h                  |   11 +
>  support/kconfig/check.sh                      |   14 -
>  support/kconfig/conf.c                        |  562 ++-
>  support/kconfig/confdata.c                    | 1358 +++---
>  support/kconfig/expr.c                        |   29 +-
>  support/kconfig/expr.h                        |   49 +-
>  support/kconfig/foo.h                         |   12 -
>  support/kconfig/gconf-cfg.sh                  |   33 +
>  support/kconfig/gconf.c                       |  100 +-
>  support/kconfig/hashtable.h                   |   48 +
>  support/kconfig/images.c                      |   34 +-
>  support/kconfig/images.h                      |   33 +
>  support/kconfig/internal.h                    |   21 +
>  support/kconfig/kconf_id.c                    |   53 -
>  support/kconfig/kxgettext.c                   |  235 -
>  support/kconfig/lexer.l                       |  460 ++
>  support/kconfig/lexer.lex.c_shipped           | 4103 +++++++++++++++++
>  support/kconfig/list.h                        |  254 +-
>  support/kconfig/list_types.h                  |   17 +
>  support/kconfig/lkc.h                         |  117 +-
>  support/kconfig/lkc_proto.h                   |   33 +-
>  support/kconfig/lxdialog/.gitignore           |    4 -
>  support/kconfig/lxdialog/BIG.FAT.WARNING      |    2 +-
>  support/kconfig/lxdialog/check-lxdialog.sh    |   93 -
>  support/kconfig/lxdialog/checklist.c          |   26 +-
>  support/kconfig/lxdialog/dialog.h             |   76 +-
>  support/kconfig/lxdialog/inputbox.c           |   21 +-
>  support/kconfig/lxdialog/menubox.c            |   35 +-
>  support/kconfig/lxdialog/textbox.c            |  330 +-
>  support/kconfig/lxdialog/util.c               |   41 +-
>  support/kconfig/lxdialog/yesno.c              |   21 +-
>  support/kconfig/mconf-cfg.sh                  |   55 +
>  support/kconfig/mconf.c                       |  529 +--
>  support/kconfig/menu.c                        |  345 +-
>  support/kconfig/merge_config.sh               |   91 +-
>  support/kconfig/mnconf-common.c               |   53 +
>  support/kconfig/mnconf-common.h               |   18 +
>  support/kconfig/nconf-cfg.sh                  |   53 +
>  support/kconfig/nconf.c                       |  295 +-
>  support/kconfig/nconf.gui.c                   |  326 +-
>  support/kconfig/nconf.h                       |   62 +-
>  support/kconfig/parser.tab.c_shipped          | 2189 +++++++++
>  support/kconfig/parser.tab.h_shipped          |  134 +
>  support/kconfig/{zconf.y => parser.y}         |  467 +-
>  .../01-kconfig-kernel-to-buildroot.patch      |  115 +-
>  .../06-br-build-system-integration.patch      |  103 +-
>  .../kconfig/patches/10-br-build-system.patch  |   66 +-
>  .../patches/11-use-mktemp-for-lxdialog.patch  |   17 -
>  .../patches/12-fix-glade-file-path.patch      |   14 +-
>  .../14-support-out-of-tree-config.patch       |  202 +-
>  .../16-fix-space-to-de-select-options.patch   |   19 +-
>  .../kconfig/patches/17-backport-kecho.patch   |   26 -
>  ...fig.sh-create-temporary-files-in-tmp.patch |   19 +-
>  ...e_config.sh-add-br2-external-support.patch |   24 +-
>  ...fig.sh-Allow-to-define-config-prefix.patch |   31 -
>  ...-positive-matches-from-comment-lines.patch |   32 -
>  ...config-lxdialog-fix-check-with-GCC14.patch |   43 -
>  ...onfig-mn-conf-handle-backspace-H-key.patch |   24 +-
>  ...llow-only-config-comment-and-if-insi.patch |  956 ++++
>  support/kconfig/patches/series                |    3 +-
>  support/kconfig/preprocess.c                  |  580 +++
>  support/kconfig/preprocess.h                  |   19 +
>  support/kconfig/qconf-cfg.sh                  |   40 +
>  support/kconfig/qconf.cc                      | 1199 ++---
>  support/kconfig/qconf.h                       |  163 +-
>  support/kconfig/streamline_config.pl          |  104 +-
>  support/kconfig/symbol.c                      |  374 +-
>  support/kconfig/util.c                        |  122 +-
>  support/kconfig/zconf.l                       |  372 --
>  support/kconfig/zconf.lex.c_shipped           | 2500 ----------
>  support/kconfig/zconf.tab.c_shipped           | 2488 ----------
>  system/Config.in                              |    4 +-
>  toolchain/toolchain-external/Config.in        |    2 +-
>  .../Config.in                                 |    2 +-
>  .../toolchain-external-arm-aarch64/Config.in  |    2 +-
>  .../toolchain-external-arm-arm/Config.in      |    2 +-
>  .../toolchain-external-bootlin/Config.in      |    2 +-
>  .../toolchain-external-synopsys-arc/Config.in |    2 +-
>  112 files changed, 13001 insertions(+), 10420 deletions(-)
>  create mode 100644 support/kconfig/Kbuild.include
>  delete mode 100644 support/kconfig/POTFILES.in
>  create mode 100644 support/kconfig/array_size.h
>  delete mode 100755 support/kconfig/check.sh
>  delete mode 100644 support/kconfig/foo.h
>  create mode 100755 support/kconfig/gconf-cfg.sh
>  create mode 100644 support/kconfig/hashtable.h
>  create mode 100644 support/kconfig/images.h
>  create mode 100644 support/kconfig/internal.h
>  delete mode 100644 support/kconfig/kconf_id.c
>  delete mode 100644 support/kconfig/kxgettext.c
>  create mode 100644 support/kconfig/lexer.l
>  create mode 100644 support/kconfig/lexer.lex.c_shipped
>  create mode 100644 support/kconfig/list_types.h
>  delete mode 100644 support/kconfig/lxdialog/.gitignore
>  delete mode 100755 support/kconfig/lxdialog/check-lxdialog.sh
>  create mode 100755 support/kconfig/mconf-cfg.sh
>  create mode 100644 support/kconfig/mnconf-common.c
>  create mode 100644 support/kconfig/mnconf-common.h
>  create mode 100755 support/kconfig/nconf-cfg.sh
>  create mode 100644 support/kconfig/parser.tab.c_shipped
>  create mode 100644 support/kconfig/parser.tab.h_shipped
>  rename support/kconfig/{zconf.y => parser.y} (56%)
>  delete mode 100644 support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
>  delete mode 100644 support/kconfig/patches/17-backport-kecho.patch
>  delete mode 100644 support/kconfig/patches/20-merge_config.sh-Allow-to-define-config-prefix.patch
>  delete mode 100644 support/kconfig/patches/21-Avoid-false-positive-matches-from-comment-lines.patch
>  delete mode 100644 support/kconfig/patches/22-kconfig-lxdialog-fix-check-with-GCC14.patch
>  create mode 100644 support/kconfig/patches/24-Revert-kconfig-allow-only-config-comment-and-if-insi.patch
>  create mode 100644 support/kconfig/preprocess.c
>  create mode 100644 support/kconfig/preprocess.h
>  create mode 100755 support/kconfig/qconf-cfg.sh
>  delete mode 100644 support/kconfig/zconf.l
>  delete mode 100644 support/kconfig/zconf.lex.c_shipped
>  delete mode 100644 support/kconfig/zconf.tab.c_shipped
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
