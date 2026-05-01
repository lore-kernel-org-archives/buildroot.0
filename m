Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46636FF885A
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 06:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3CE3854A0;
	Fri,  1 May 2026 06:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TT6Imhymu5jr; Fri,  1 May 2026 06:23:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB817854A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777616601;
	bh=7FBD6NKDti9ZtiUgwh9FpPm62Ij67/4VD9TdtjLD5OY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ZMKsPk/85uB9trjQzuIcpbCCKHtky4JYT5Hawi/G35USWOGtppRwcLxBw9bIESjYh
	 XiaFkPMRnZGAkSymjzQptnEwZ5NNWizVKKF8Qqd0msX3z15PPF8vhd9GflRYSbLqsC
	 oCHJrs1uoXMNq8Lxcf1zdOgf6VEeQgn8l66NHtab5/uGV0aM2GNq8RrZYjoPNbOrBz
	 N7MtEWrkZulxaNmJSHtT/6TUItrMN7v4W1ujMZdm90sVkfv+BRdqonZroIEGnD8eTS
	 7WgNa9nR4ZaXTEJRJAmHzwfI2XhBwv+JuOEb7KpR8F3Fv53/6bYiEmZncmyHTsJWYQ
	 FeuP84YWm+iog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB817854A5;
	Fri,  1 May 2026 06:23:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D19B293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AC5B854A5
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NTQlXEkf-Qa for <buildroot@buildroot.org>;
 Fri,  1 May 2026 06:23:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D53DF854A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D53DF854A0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D53DF854A0
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:23:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8CEA1A4C00A3;
 Fri,  1 May 2026 08:23:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38120)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIhHQ-000000007tD-297Y;
 Fri, 01 May 2026 06:23:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 08:22:53 +0200
Message-ID: <20260501062316.1942112-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777616596;
 bh=xn/w2mZl43xdRIHsBan5ck9W4dOOQ4bBrR9hyRpuUBM=;
 h=From:To:Cc:Subject:Date:From;
 b=FqZEXYm3KM8QHS8H9ufI4S7UWvBrTp8QHETZSMrSYGyD0MuaH48tZjZW1mTyiRUz2
 TelHcOm+xplKV9Uz0UapFqckF+HTR8wOg24FyxSiVXwymsFIC733NDTA2nB/faIe4H
 U7sg5dyyFmtHrTjGF7nk5c/2NG/XM6IbJnZdg2AnBMEq2fEA+oo3epJxC+x6V64eEU
 DHDlSQltS5Qy7RrOroIwELnGDIiHYF3uMKs40v9opAsfXeHR8WHrY6eN0SWz0MojOc
 NWAjii3DsSBw+qaFWOUz8XvzOto0MXoi2+o2WZFSNmnXNh5Zg2vIsJZ9BdrT0GOlha
 nCDavBJCcHe6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=FqZEXYm3
Subject: [Buildroot] [PATCH v3 00/21] package/gcc: add version 16.1.0
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series adds gcc 16.1.0

Patches 0001 - 0014 add build fixes for gcc 16.

Regards, Bernd


v3:
- added updated cups-filters series to gcc series
- added openjdk and rocksdb bumps to series
v2: fixed typos


Angelo Compagnucci (1):
  package/qpdf: bump to version 12.3.2

Bernd Kuhls (19):
  package/autoconf: bump version to 2.73
  package/autoconf-archive: bump version to 2024.10.16
  package/redis-plus-plus: disable -Werror
  package/dump1090: disable -Werror
  package/qt5/qt5webkit: Fix build with gcc 16.x
  package/grantlee: Fix build with gcc 16.x
  package/cups-filters: add upstream patch to fix CVE-2025-64524
  package/cups-filters: fix build against qpdf 12
  package/cups-filters: Fix build with gcc 16.x
  package/openjdk{-bin}: bump versions to latest 17.x and 21.x series
  package/snappy: enable rtti
  package/rocksdb: bump version to 11.0.4
  toolchain/Config.in: add BR2_TOOLCHAIN_GCC_AT_LEAST_16 blind option
  arch/Config.in: introduce BR2_ARCH_NEEDS_GCC_AT_LEAST_17
  toolchain/toolchain-external/toolchain-external-custom: add gcc 16
    version selection
  package/gcc: add version 16.1.0
  package/gcc: switch to GCC 15.x as the default
  support/config-fragments/autobuild/br-arm-internal-glibc: update to
    bleeding edge components
  package/gcc: drop support for GCC 13.x

Thomas Devoogdt (1):
  package/openjdk{-bin}: add OpenJDK25 and configure it as latest

 .checkpackageignore                           |   3 +-
 Config.in.legacy                              |   7 +
 DEVELOPERS                                    |   1 +
 arch/Config.in                                |   4 +
 .../autoconf-archive/autoconf-archive.hash    |   5 +-
 package/autoconf-archive/autoconf-archive.mk  |   2 +-
 .../0001-dont-add-dirty-to-version.patch      |  12 +-
 package/autoconf/autoconf.hash                |   5 +-
 package/autoconf/autoconf.mk                  |   2 +-
 ...ix-infinite-loop-caused-by-crafted-f.patch |  83 +++++
 ...ilters-Fixed-building-with-QPDF-11.x.patch |  57 +++
 ...ated-code-to-be-built-with-QPDF-12.x.patch | 165 +++++++++
 package/cups-filters/Config.in                |   6 +-
 package/cups-filters/cups-filters.mk          |   8 +
 package/dump1090/dump1090.mk                  |   5 +
 ...ISC-V-fix-build-issue-with-gcc-4.9.x.patch |  48 ---
 ...emove-crypt-and-crypt_r-interceptors.patch | 146 --------
 ...bsanitizer-Fix-build-with-glibc-2.42.patch |  81 -----
 ...le-split-stack-for-non-thread-builds.patch |   4 +-
 ...-config-microblaze-fix-ira-for-GCC15.patch |  56 +++
 package/gcc/Config.in.host                    |  24 +-
 package/gcc/gcc-initial/gcc-initial.mk        |   2 +-
 package/gcc/gcc.hash                          |   4 +-
 ...-id-in-constructor-of-template-class.patch |  30 ++
 .../{17.0.12_7 => 17.0.18_8}/openjdk-bin.hash |   4 +-
 .../{21.0.4_7 => 21.0.10_7}/openjdk-bin.hash  |   4 +-
 .../openjdk-bin/25.0.2_10/openjdk-bin.hash    |   7 +
 package/openjdk-bin/openjdk-bin.mk            |  12 +-
 ...ARCv2-ISA-processors-support-to-Zero.patch |   0
 ...fix-HEADLESS-compilation-without-X11.patch |   0
 ...ARCv2-ISA-processors-support-to-Zero.patch |   0
 ...fix-HEADLESS-compilation-without-X11.patch |   0
 ...es-drop-the-need-for-X11-in-headless.patch |   0
 ...ARCv2-ISA-processors-support-to-Zero.patch | 109 ++++++
 ...OpenJDK-in-headless-mode-without-req.patch | 144 ++++++++
 ...spot-aarch64-macro-assembler-fix-cmp.patch |  43 +++
 ...ot-share-gc-shenandoah-fix-constexpr.patch |  42 +++
 package/openjdk/Config.in                     |   7 +-
 package/openjdk/openjdk.hash                  |   5 +-
 package/openjdk/openjdk.mk                    |  16 +-
 package/qpdf/Config.in                        |   6 +-
 package/qpdf/qpdf.hash                        |   4 +-
 package/qpdf/qpdf.mk                          |  27 +-
 package/qt5/qt5webkit/0014-gcc16.patch        |  42 +++
 package/redis-plus-plus/redis-plus-plus.mk    |   5 +
 ...ed-parameter-when-Snappy-is-disabled.patch |  24 ++
 ...ls-build_detect_platform-fix-C-tests.patch | 325 ------------------
 package/rocksdb/rocksdb.hash                  |   4 +-
 package/rocksdb/rocksdb.mk                    |  81 ++---
 .../0002-add-option-to-enable-rtti.patch      |  52 +++
 package/snappy/snappy.mk                      |   5 +-
 .../autobuild/br-arm-internal-glibc.config    |   4 +-
 .../package/openjdk-jni-test/JniTest.java     |   2 +-
 toolchain/Config.in                           |   5 +
 .../Config.in.options                         |   5 +
 55 files changed, 1002 insertions(+), 742 deletions(-)
 create mode 100644 package/cups-filters/0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch
 create mode 100644 package/cups-filters/0003-libcupsfilters-Fixed-building-with-QPDF-11.x.patch
 create mode 100644 package/cups-filters/0004-Updated-code-to-be-built-with-QPDF-12.x.patch
 delete mode 100644 package/gcc/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
 delete mode 100644 package/gcc/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
 delete mode 100644 package/gcc/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
 rename package/gcc/{13.4.0 => 16.1.0}/0001-disable-split-stack-for-non-thread-builds.patch (91%)
 create mode 100644 package/gcc/16.1.0/0002-gcc-config-microblaze-fix-ira-for-GCC15.patch
 create mode 100644 package/grantlee/0001-Remove-template-id-in-constructor-of-template-class.patch
 rename package/openjdk-bin/{17.0.12_7 => 17.0.18_8}/openjdk-bin.hash (53%)
 rename package/openjdk-bin/{21.0.4_7 => 21.0.10_7}/openjdk-bin.hash (53%)
 create mode 100644 package/openjdk-bin/25.0.2_10/openjdk-bin.hash
 rename package/openjdk/{17.0.12+7 => 17.0.18+8}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)
 rename package/openjdk/{17.0.12+7 => 17.0.18+8}/0002-awt-fix-HEADLESS-compilation-without-X11.patch (100%)
 rename package/openjdk/{21.0.4+7 => 21.0.10+7}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)
 rename package/openjdk/{21.0.4+7 => 21.0.10+7}/0002-awt-fix-HEADLESS-compilation-without-X11.patch (100%)
 rename package/openjdk/{21.0.4+7 => 21.0.10+7}/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch (100%)
 create mode 100644 package/openjdk/25.0.2+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
 create mode 100644 package/openjdk/25.0.2+10/0002-8376684-Compile-OpenJDK-in-headless-mode-without-req.patch
 create mode 100644 package/openjdk/25.0.2+10/0003-src-hotspot-aarch64-macro-assembler-fix-cmp.patch
 create mode 100644 package/openjdk/25.0.2+10/0004-src-hotspot-share-gc-shenandoah-fix-constexpr.patch
 create mode 100644 package/qt5/qt5webkit/0014-gcc16.patch
 create mode 100644 package/rocksdb/0001-Fix-unused-parameter-when-Snappy-is-disabled.patch
 delete mode 100644 package/rocksdb/0001-build_tools-build_detect_platform-fix-C-tests.patch
 create mode 100644 package/snappy/0002-add-option-to-enable-rtti.patch

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
