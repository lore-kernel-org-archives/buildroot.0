Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C218CC44508
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 12:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49E3C614C9;
	Wed,  1 Jul 2026 12:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZsyzKtgE6v1w; Wed,  1 Jul 2026 12:19:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3C6260F0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782908391;
	bh=ux0XGREnilNGOkLW9Y6tLopM0r3Tb39GQlhysmp1n1o=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kBt9g1YrUAs8annz8+rA+BQ1A5c50QOxFaCEVUKvAv+fsQF4M7o22Kcp493V1/KeZ
	 nH9p55Y6WvG6RBHtJpgPAqzK3qm8ClT+5qbMGV3IhOjEAIlYDW/wemL1ffxQhLOIXx
	 rYCf8eS4qhtKzn4dzGAi8N6zkWXTSnzP5OtpKYP76Yn4dpt/sQZjBt3AhCJbEsiKBT
	 E1Fn6bqwu8yP0am2xtxOfOiyKc4xxqMaLj8c4ZMkjmFfe2JQYt81se7LV6QnUK77wj
	 mpxmK573HIWc9PxLvVlLF6oHdqsl4W8cpnILB2wPDWdiSw1EE1jCJCJ5bEzI8bmtNA
	 Q3nbXQvTWUOjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3C6260F0A;
	Wed,  1 Jul 2026 12:19:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42A592EB
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F86D83AB8
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ks00ooVUw4TA for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 12:19:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=nunes.philippe@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1934B83AAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1934B83AAC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1934B83AAC
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:19:48 +0000 (UTC)
Received: from pnunes-ThinkPad.proxad.net (unknown
 [IPv6:2a01:e0a:ad7:ca0:5e8f:f9af:2d01:45e3])
 (Authenticated sender: nunes.philippe@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 118672003D6;
 Wed,  1 Jul 2026 14:19:45 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Philippe Nunes <nunes.philippe@free.fr>
Date: Wed,  1 Jul 2026 14:19:34 +0200
Message-ID: <20260701121937.346945-1-nunes.philippe@free.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1782908386;
 bh=chHnpVsn53rvICGcgPvLv+jiUeev3b1YIFsYAjiflIQ=;
 h=From:To:Cc:Subject:Date:From;
 b=rQWY00tYiu4oSRZHksE45nZhL5Qgp90mQyO+vaofofLBQp7xb+NGac3RiBIkwYdk2
 nwVGXKWSYx5YHb+V3ItbT0s4Wnf0A809uMOHTm2gsJAnv1/RrYT96HBxHqjrn/mxO+
 v54O2nLPJVSnQ9hQ3yU+iUzmonQc6aDTfj3fVnD1ervaku9X20ySp9119vELnPJH4+
 6xnGzYx4Sy2BPinb9wF6KU3cyvoPgo9EscZKfMLc5KFs41aT+iD1NHm0UGEmu0LNar
 xeR9T9tV7c9LFLASlUxml16JpnQ7WIUHuPT5a5qD1c/QD+pGinGGJfIFiJThweVIMk
 Kt3DQNiPOMtxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rQWY00tY
Subject: [Buildroot] [PATCH 0/3] Add qoriq-rcw C reimplementation + libmcpp
 dep
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
From: Philippe Nunes via buildroot <buildroot@buildroot.org>
Reply-To: Philippe Nunes <nunes.philippe@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series adds a host-only C reimplementation of NXP's rcw.py for the
pbiformat=2 QorIQ family (LS1028, LS1088, LS2088, LX2160), packaged as
a reusable library (libqoriq-rcw) and a CLI built on top (qoriq-rcw-c).
The library depends on mcpp (a portable C preprocessor that ships as a
reusable libmcpp) for in-process preprocessing of .rcw sources.

Motivation:

  - The existing host-qoriq-rcw package wraps NXP's rcw.py reference,
    which (a) is slow due to Python startup overhead on every invocation,
    (b) requires host Python at build time, and (c) shells out to
    gcc -E for preprocessing. The C implementation here uses libmcpp
    in-process for hermetic preprocessing and runs ~10x faster on
    typical .rcw inputs.

  - Beyond the rcw.py reference, qoriq-rcw-c adds two recovery features:
      --dump        read live RCW from /dev/mem on a running board
      --dump-flash  recover PBL + PBI from the bootrom slot(s) in
                    NOR / SD / eMMC
    Useful when bringing up a new board or debugging a bad flash.

  - The existing host-qoriq-rcw package is untouched. Users who prefer
    the rcw.py reference can keep using it; the new package is fully
    independent.

Patch breakdown:

  1/3  package/mcpp: new package
       Matsui CPP, a portable C90/C99/C++98 preprocessor with a
       reusable libmcpp. Built host-only with --enable-mcpplib so the
       library + public header are available to other host packages.

  2/3  package/libqoriq-rcw: new package
       Library form of the C reimplementation. host-meson-package,
       depends on host-mcpp. Sets -Dtests=false and -Dman=disabled:
       the tests/ subdir links libcmocka (only validates library
       internals, never executed by Buildroot), and the man-page
       step requires pandoc. Both options were added upstream (v1.0.1
       for 'tests', v1.0.2 for 'man') specifically to support
       distro/Buildroot packaging.

  3/3  package/qoriq-rcw-c: new package
       CLI on top of libqoriq-rcw. host-meson-package, depends on
       host-libqoriq-rcw (transitively pulling in host-mcpp). Also
       sets -Dman=disabled; the option landed upstream in v1.0.1.

Naming note: the upstream project is just called "qoriq-rcw"; the "-c"
suffix on the Buildroot package name is purely a disambiguator from
the existing host-qoriq-rcw package (which is the rcw.py wrapper).
The installed binary itself is still named qoriq-rcw.

Tested:
  - check-package clean on all files (0 warnings).
  - End-to-end build of host-qoriq-rcw-c succeeds against the real
    upstream tarballs (mcpp 2.7.2 from SourceForge, libqoriq-rcw 1.0.2
    and qoriq-rcw 1.0.1 from GitHub).
  - 'qoriq-rcw --help' runs from host/bin/, .rcwi data files install
    cleanly under host/share/qoriq-rcw/.
  - Fork CI test-pkg matrix (32 toolchains), all green:
    https://gitlab.com/evAdopter/buildroot/-/pipelines/2641099395

Philippe Nunes (3):
  package/mcpp: new package
  package/libqoriq-rcw: new package
  package/qoriq-rcw-c: new package

 DEVELOPERS                             |  5 +++++
 package/Config.in.host                 |  3 +++
 package/libqoriq-rcw/Config.in.host    | 14 +++++++++++++
 package/libqoriq-rcw/libqoriq-rcw.hash |  5 +++++
 package/libqoriq-rcw/libqoriq-rcw.mk   | 27 ++++++++++++++++++++++++++
 package/mcpp/Config.in.host            |  9 +++++++++
 package/mcpp/mcpp.hash                 |  5 +++++
 package/mcpp/mcpp.mk                   | 18 +++++++++++++++++
 package/qoriq-rcw-c/Config.in.host     | 19 ++++++++++++++++++
 package/qoriq-rcw-c/qoriq-rcw-c.hash   |  5 +++++
 package/qoriq-rcw-c/qoriq-rcw-c.mk     | 25 ++++++++++++++++++++++++
 11 files changed, 135 insertions(+)
 create mode 100644 package/libqoriq-rcw/Config.in.host
 create mode 100644 package/libqoriq-rcw/libqoriq-rcw.hash
 create mode 100644 package/libqoriq-rcw/libqoriq-rcw.mk
 create mode 100644 package/mcpp/Config.in.host
 create mode 100644 package/mcpp/mcpp.hash
 create mode 100644 package/mcpp/mcpp.mk
 create mode 100644 package/qoriq-rcw-c/Config.in.host
 create mode 100644 package/qoriq-rcw-c/qoriq-rcw-c.hash
 create mode 100644 package/qoriq-rcw-c/qoriq-rcw-c.mk

-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
