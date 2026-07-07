Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE3EC43458
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 16:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBA03607FC;
	Tue,  7 Jul 2026 16:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYgW-r0XKdvi; Tue,  7 Jul 2026 16:10:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F3EC606AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783440633;
	bh=5gJ6CNUKChw6/9lHioyNBE23Zv8S2rhkW1xhg+jMrEU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o8yQaZgj9joF425F+ur8Slh0yA6jufdNDC8dIm6IGjmIw2fimZb3z01nXjihEiL+5
	 RW3KYgwlPMQzJ8TB590BnfvLsVwBaogtrtw5E+sYkQ29qgtr5VcuEPJVRuLpOXU5BU
	 96Vrj2vxy190dp+zdJOPeKwghD24gaPZCIzjr5He2GMadG+FN0arPyR+xoIHcyJC2t
	 u1ij9chzCh1LtHuDoZhFSDt62ahwzNrB8jmV9TSjRQQSwEq2dfmpdaQSeFRx3EHcjU
	 ZzUjDlSL5P4anFAqYQox5d94C1QIW4qNhwb/bGsz6NN3HXRwnHxnGE6PG5k5+KRvG+
	 /Me+yQIIxSwlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F3EC606AA;
	Tue,  7 Jul 2026 16:10:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C9E12A8
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 16:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62AB380E55
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 16:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JiC1yGvbJEh2 for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 16:10:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=nunes.philippe@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0E6080E54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0E6080E54
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0E6080E54
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 16:10:29 +0000 (UTC)
Received: from pnunes-ThinkPad.proxad.net (unknown [213.228.1.188])
 (Authenticated sender: nunes.philippe@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 34A4A13F8A9;
 Tue,  7 Jul 2026 18:10:24 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Philippe Nunes <nunes.philippe@free.fr>
Date: Tue,  7 Jul 2026 18:09:57 +0200
Message-ID: <20260707161000.629475-1-nunes.philippe@free.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121937.346945-1-nunes.philippe@free.fr>
References: <20260701121937.346945-1-nunes.philippe@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783440625;
 bh=Uv3JfEEY1lUYA4dgFAmdTsHRoeHisZh1Pe6NdkAdv3o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BNMHKDBjEPIb9SzsI+LMH2qA6cKYNhF3NF2hmG3PNkhxoYlE1Te9csxpdx9BDnd3l
 pR/bKqloypXiLumhwq2VBT/lhlwQEZT1tPWUzfVw/hp1mjEfjAagANQziKdOElt3m6
 EXdfnCj4qh5BKcmRXZb1fwr9T/tnSjbqYXED7eRxa1unyx5AgxU5FVO+zwT8ELf04p
 o6sAxl0dzvADugenJ5ReTBbLD2uA3A2/+38sXUNIXRqaIavlZ42P7Yb4U55wbC91YD
 jRVSbPRS+YCfpeUsTuF08FtcO0cRAFRlFg9i+3nM/a267VPmmtXCBF3+7djA5F33G9
 NjyudIHtmDyrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BNMHKDBj
Subject: [Buildroot] [PATCH v2 0/3] Add qoriq-rcw C reimplementation +
 libmcpp dep
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

This series adds a C reimplementation of NXP's rcw.py for the
pbiformat=2 QorIQ family (LS1028, LS1088, LS2088, LX2160), packaged
as a reusable library (libqoriq-rcw) and a CLI built on top
(qoriq-rcw-c). Both host and target variants are built. The library
depends on mcpp (a portable C preprocessor with a reusable libmcpp)
for in-process preprocessing of .rcw sources.

Patch breakdown:

  1/3  package/mcpp: new package
       Matsui CPP + libmcpp. Autotools, host + target. Ships three
       Buildroot-side patches for GCC 14/15 compile compatibility
       (upstream is dead, last release 2008).

  2/3  package/libqoriq-rcw: new package
       Library form of the C reimplementation. host-meson + meson,
       depends on mcpp. -Dtests=false -Dman=disabled skip the
       cmocka and pandoc build-time dependencies.

  3/3  package/qoriq-rcw-c: new package
       CLI on top of libqoriq-rcw. host-meson + meson, depends on
       libqoriq-rcw. -Dman=disabled.

Naming note: upstream project is "qoriq-rcw"; the Buildroot package
name has a "-c" suffix to disambiguate from the existing
host-qoriq-rcw package (which wraps NXP's rcw.py reference). The
installed binary is qoriq-rcw.

Both libqoriq-rcw and qoriq-rcw-c gate on BR2_TOOLCHAIN_GCC_AT_LEAST_8
because upstream declares c_std=c17 in meson.build.

Tested:
  - check-package clean on all files (0 warnings).
  - Full nbxv3 (LX2160A, aarch64) image cross-build succeeds; the
    installed target binaries include qoriq-rcw under /usr/bin/.
  - Fork CI test-pkg matrix:
    https://gitlab.com/evAdopter/buildroot/-/pipelines/2659083836

Changes v1 -> v2 (addressing Vincent Jardin's on-list review):

  patch 1/3 (mcpp):
    * added target variant alongside host (Suggested-by: Vincent)
    * shortened the --enable-mcpplib inline comment
    * added three Buildroot-side patches to fix GCC 14/15 compile
      breakage in mcpp's 2008-era C code:
        0001 expand: split chained assignment between differently-
             typed pointers (-Wincompatible-pointer-types is a hard
             error in GCC 14+)
        0002 system: request POSIX.1-2008 so readlink() is declared
             (mcpp defaults to POSIX.1-1990 which pre-dates it)
        0003 system: rename true/false labels reserved in modern C

  patch 2/3 (libqoriq-rcw):
    * added target variant to satisfy patch 3's target build
    * dropped version-history sentence from commit body
    * removed consumer-oriented text from Config.in help
    * shortened the CONF_OPTS inline comment
    * gated on BR2_TOOLCHAIN_GCC_AT_LEAST_8 (c17)
    * bumped upstream to v1.0.2 (adds the 'man' meson option)

  patch 3/3 (qoriq-rcw-c):
    * added target variant per Vincent's request (Suggested-by:) --
      the --dump / --dump-flash recovery modes must run on the board
      itself
    * dropped the --dump / --dump-flash enumeration from Config.in
    * reworded the "faster than rcw.py" help text to name the
      concrete benefit (avoids pulling in host Python)
    * removed the duplicate "-c suffix" comment from .mk
    * shortened the pandoc-skip comment
    * gated on BR2_TOOLCHAIN_GCC_AT_LEAST_8 (transitive)
    * bumped upstream to v1.0.1 (adds the 'man' meson option)

Philippe Nunes (3):
  package/mcpp: new package
  package/libqoriq-rcw: new package
  package/qoriq-rcw-c: new package

 DEVELOPERS                                    |  5 ++
 package/Config.in                             |  3 +
 package/Config.in.host                        |  3 +
 package/libqoriq-rcw/Config.in                | 14 +++++
 package/libqoriq-rcw/Config.in.host           | 10 +++
 package/libqoriq-rcw/libqoriq-rcw.hash        |  4 ++
 package/libqoriq-rcw/libqoriq-rcw.mk          | 23 +++++++
 ...ined-assignment-between-differently-.patch | 36 +++++++++++
 ...POSIX.1-2008-so-readlink-is-declared.patch | 36 +++++++++++
 ...ue-false-labels-they-are-reserved-in.patch | 63 +++++++++++++++++++
 package/mcpp/Config.in                        |  7 +++
 package/mcpp/Config.in.host                   |  7 +++
 package/mcpp/mcpp.hash                        |  4 ++
 package/mcpp/mcpp.mk                          | 19 ++++++
 package/qoriq-rcw-c/Config.in                 | 13 ++++
 package/qoriq-rcw-c/Config.in.host            | 10 +++
 package/qoriq-rcw-c/qoriq-rcw-c.hash          |  4 ++
 package/qoriq-rcw-c/qoriq-rcw-c.mk            | 22 +++++++
 18 files changed, 283 insertions(+)
 create mode 100644 package/libqoriq-rcw/Config.in
 create mode 100644 package/libqoriq-rcw/Config.in.host
 create mode 100644 package/libqoriq-rcw/libqoriq-rcw.hash
 create mode 100644 package/libqoriq-rcw/libqoriq-rcw.mk
 create mode 100644 package/mcpp/0001-expand-split-chained-assignment-between-differently-.patch
 create mode 100644 package/mcpp/0002-system-request-POSIX.1-2008-so-readlink-is-declared.patch
 create mode 100644 package/mcpp/0003-system-rename-true-false-labels-they-are-reserved-in.patch
 create mode 100644 package/mcpp/Config.in
 create mode 100644 package/mcpp/Config.in.host
 create mode 100644 package/mcpp/mcpp.hash
 create mode 100644 package/mcpp/mcpp.mk
 create mode 100644 package/qoriq-rcw-c/Config.in
 create mode 100644 package/qoriq-rcw-c/Config.in.host
 create mode 100644 package/qoriq-rcw-c/qoriq-rcw-c.hash
 create mode 100644 package/qoriq-rcw-c/qoriq-rcw-c.mk

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
