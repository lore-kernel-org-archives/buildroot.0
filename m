Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5D1C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 19:17:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D31260F0F
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 19:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D31260F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11F3A60758;
	Sat,  9 Oct 2021 19:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id laXSfPkuVrNo; Sat,  9 Oct 2021 19:17:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B1036072A;
	Sat,  9 Oct 2021 19:17:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F3581BF95F
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 19:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 591454054E
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 19:16:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x2CLsHhW2C3l for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 19:16:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9354F4054B
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 19:16:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B0FE2240002;
 Sat,  9 Oct 2021 19:16:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Sat,  9 Oct 2021 21:16:40 +0200
Message-Id: <20211009191646.1076266-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/5] GDB updates
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
Cc: Michael Fischer <mf@go-sys.de>, Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

The starting point for this series was the patch from Michael Fischer
adding support for gdb 11.x. Michael's patch was not fully correct as
such, and required a few adaptations.

But while doing it, I discovered a bug in the current gdb package,
fixed by PATCH 1 in this series.

Then, after adding support for gdb 11.x in PATCH 2, we do the usual
dance of bumping the gdb version to 10.x in PATCH 3, and dropping
support for the oldest gdb version supported in PATCH 4.

We have a lot of different situations with gdb: building host-gdb
only, building target gdbserver only, building target full gdb only,
building both host-gdb and target gdb, the special ARC architecture
situation that requires additional dependencies (host-flex,
host-bison), the fact that GDB 11.x now needs gmp, etc. So I went
ahead and implement a series of test cases. They don't do much in
terms of runtime testing: they just run gdb --version (host or target)
or gdbserver --version, but at least they allow to make sure that the
different combinations continue to build.

And it does work, because it is by writing this series of tests that I
discovered the bug fixed in PATCH 1.

Best regards,

Thomas Petazzoni

Michael Fischer (1):
  package/gdb: add support for gdb 11.x

Thomas Petazzoni (4):
  package/gdb: append to dependencies in conditional
  package/gdb: switch to gdb 10.x as the default
  package/gdb: drop support for version 8.3.x
  support/testing: add suite of tests for gdb

 Config.in.legacy                              |   6 +
 ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  46 ++--
 ...-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |  16 +-
 .../0003-use-asm-sgidefs.h.patch              |   6 +-
 .../0004-gdbserver-fix-build-for-m68k.patch   |  19 +-
 ...fork-inferior-include-linux-ptrace.h.patch |  12 +-
 ...e-of-is-operator-for-comparison-in-p.patch |  42 ----
 ...x-Python3.9-related-runtime-problems.patch | 193 ----------------
 package/gdb/Config.in                         |   1 +
 package/gdb/Config.in.host                    |  19 +-
 package/gdb/gdb.hash                          |   2 +-
 package/gdb/gdb.mk                            |  16 +-
 support/testing/tests/package/test_gdb.py     | 215 ++++++++++++++++++
 13 files changed, 297 insertions(+), 296 deletions(-)
 rename package/gdb/{8.3.1 => 11.1}/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch (74%)
 rename package/gdb/{8.3.1 => 11.1}/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch (71%)
 rename package/gdb/{8.3.1 => 11.1}/0003-use-asm-sgidefs.h.patch (90%)
 rename package/gdb/{8.3.1 => 11.1}/0004-gdbserver-fix-build-for-m68k.patch (78%)
 rename package/gdb/{8.3.1 => 11.1}/0005-nat-fork-inferior-include-linux-ptrace.h.patch (87%)
 delete mode 100644 package/gdb/8.3.1/0006-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch
 delete mode 100644 package/gdb/8.3.1/0007-Fix-Python3.9-related-runtime-problems.patch
 create mode 100644 support/testing/tests/package/test_gdb.py

-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
