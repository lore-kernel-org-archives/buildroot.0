Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DE6C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 31 Dec 2023 17:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B21D404D5;
	Sun, 31 Dec 2023 17:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B21D404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6kUPPVIe0LOG; Sun, 31 Dec 2023 17:36:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6743440578;
	Sun, 31 Dec 2023 17:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6743440578
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96A171BF3EB
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 17:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2FFD404A0
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 17:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2FFD404A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8LQYRBDJe0-D for <buildroot@lists.busybox.net>;
 Sun, 31 Dec 2023 17:35:21 +0000 (UTC)
X-Greylist: delayed 540 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 31 Dec 2023 17:35:20 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B30EB404A8
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B30EB404A8
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 17:35:20 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0B7F135206CF; Sun, 31 Dec 2023 18:26:13 +0100 (CET)
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Date: Sun, 31 Dec 2023 18:25:32 +0100
Message-Id: <20231231172538.1279608-1-wbx@openadk.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1704043574; bh=MPJYx8rTKJth3LMnwaDzW/0T2nyB+P0OiPs3XIDZfoY=;
 h=From:To:Cc:Subject:Date:From;
 b=FJGEq5FuWdjFSffJjmsoFrkCzou6zkcH5gvGn/GXIPfleCnWiu0j4jTHHIqKKbbvX
 /UJSz5+t6QCLqoF7Qvqz7IUssSLe9WaoGvGfxKel4vuoFnG8Bp37XtZaiCV2MVGkcT
 KTTe/UtRFMx1WGU6eMceBBXe92sE940VEYmc0vym2BfkWNetXrwodAbGDTPXtK5AD5
 FEims60tyvqCU8By2oPGV4cYEBbp+QLbk/CUKtJzNJwK5R1q8rYRVmDRtdOq4aj/Rx
 sPvKZgOXzMMsK4C/VP5zo7Z1/BnjptoIwRbJG0mLT6umZ90slfXjgLXJsbz+mD1+1d
 4bTe8nlxG/w9w==
Subject: [Buildroot] [PATCH 0/6] rework arc architecture support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove special versions of binutils, gcc and gdb as the upstream
versions of these main toolchain components working fine for ARCv1 and
ARCv2. Add new config for Qemu ARC. Update snps_arc700_nsim and
snps_archs38_hsdk defconfigs to use latest stable Linux Kernel.
snps_arc700_nsim is ARCv1 and only works with uClibc-ng, glibc is not
supported without patching.

I can not runtime test the other ARC defconfigs myself so I left them
untouched for now.

Waldemar Brodkorb (6):
  package/gcc: remove special arc version
  package/binutils: remove special arc version
  package/gdb: remove special arc version
  configs/qemu: add qemu_arc_defconfig
  configs/snps_arc700_nsim_defconfig: update kernel
  configs/snps_archs38_hsdk_defconfig: update kernel

 board/qemu/arc/linux.config                   |  32 ++
 board/qemu/arc/readme.txt                     |   8 +
 board/synopsys/nsim/readme.txt                |   2 +-
 configs/qemu_arc_defconfig                    |  30 ++
 configs/snps_arc700_nsim_defconfig            |   9 +-
 configs/snps_archs38_hsdk_defconfig           |   4 +-
 package/binutils/Config.in.host               |   9 +-
 .../0001-poison-system-directories.patch      | 310 ------------------
 package/binutils/binutils.hash                |   3 -
 package/binutils/binutils.mk                  |  10 -
 package/gcc/Config.in.host                    |   9 -
 .../0001-arc-Refurbish-adc-sbc-patterns.patch | 243 --------------
 ...er-Remove-cyclades-from-libsanitizer.patch | 121 -------
 ...-machine-names-in-__has_include-.-PR.patch | 124 -------
 .../0100-uclibc-conf.patch                    |  29 --
 package/gcc/gcc.hash                          |   2 -
 package/gcc/gcc.mk                            |   5 -
 package/gdb/Config.in.host                    |   3 -
 ...t-define-basic_string_view-to_string.patch | 114 -------
 package/gdb/gdb.hash                          |   3 -
 package/gdb/gdb.mk                            |  23 +-
 21 files changed, 82 insertions(+), 1011 deletions(-)
 create mode 100644 board/qemu/arc/linux.config
 create mode 100644 board/qemu/arc/readme.txt
 create mode 100644 configs/qemu_arc_defconfig
 delete mode 100644 package/binutils/arc-2020.09-release/0001-poison-system-directories.patch
 delete mode 100644 package/gcc/arc-2020.09-release/0001-arc-Refurbish-adc-sbc-patterns.patch
 delete mode 100644 package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch
 delete mode 100644 package/gcc/arc-2020.09-release/0003-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
 delete mode 100644 package/gcc/arc-2020.09-release/0100-uclibc-conf.patch
 delete mode 100644 package/gdb/arc-2020.09-release-gdb/0001-Do-not-define-basic_string_view-to_string.patch

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
