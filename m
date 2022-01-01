Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C9CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 21:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 556EA60B95;
	Sat,  1 Jan 2022 21:40:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RiY3Y--o-NfI; Sat,  1 Jan 2022 21:40:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEE7960595;
	Sat,  1 Jan 2022 21:40:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E45A1BF376
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C65960595
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:40:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jafGH2sOWuXs for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 21:40:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1519A60594
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 21:40:44 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.198.196])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DD234B0056A;
 Sat,  1 Jan 2022 22:40:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641073242;
 bh=Ifolw+Z72pVSnN+bTjKFeoXGV2xw+ZAstnP2tUKICyA=;
 h=From:To:Cc:Subject:Date:From;
 b=GUK/Rg3sAT5ijW1rcadcfmljgJz87K9Tu8LcCdVacNPiijIH6LddnCtWo3Nly7juH
 M0kw2kDXnX9/tzulGURfxS3EDu04rrvcz/rmiPuTSOMl5h7SzIvt0DrFgR4oWbN14P
 gve4veloIFKig8oLFhsZ+1qHghDD4jW8CEq9FwXp/P2x2o85fhqgBq7gsJiQyopsk/
 89DAJMYsFnqFQee/Zb9bgMmrxne0VsozjEDSL85POSM2FYwNA2YfN4vWh/8EkXeZBC
 wDbdD/jsz70kXf4ggBlr05eTQi6NQg96b05iGuPfewK2JfFMB7ldKfMNGsqI/dCRup
 Db0OSFXzhqIvQ==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 22:39:48 +0100
Message-Id: <20220101213948.265173-1-ju.o@free.fr>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/config-fragments/autobuild: fix
 riscv64 toolchain configs
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit b3c66481e1f1503fcbf193d0c780271e880ad500 replaced RISC-V LP64
toolchains by RISC-V LP64D. The config symbols
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE and
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_STABLE were marked as legacy.
Those changes were not reflected in the autobuild toolchain configs in
support/config-fragments/autobuild/bootlin-riscv64-{glibc,musl}.config

When testing a package with the command:

    ./utils/test-pkg --all --package somepackage

bootlin-riscv64-{glibc,musl} toolchain are always skipped. The build
logfile contains:

    [...]
    Value requested for BR2_TOOLCHAIN_EXTERNAL_BOOTLIN not in final .config
    Requested value:  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    Actual value:

    Value requested for BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE not in final .config
    Requested value:  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE=y
    Actual value:     # BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE is not set

This commit update the autobuild config fragments for RISC-V 64bit
toolchains so they can be used by test-pkg.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../config-fragments/autobuild/bootlin-riscv64-glibc.config   | 4 ++--
 .../config-fragments/autobuild/bootlin-riscv64-musl.config    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-riscv64-glibc.config b/support/config-fragments/autobuild/bootlin-riscv64-glibc.config
index f6c6fcaa36..433a6e89f7 100644
--- a/support/config-fragments/autobuild/bootlin-riscv64-glibc.config
+++ b/support/config-fragments/autobuild/bootlin-riscv64-glibc.config
@@ -1,5 +1,5 @@
 BR2_riscv=y
-BR2_RISCV_ABI_LP64=y
+BR2_RISCV_ABI_LP64D=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE=y
diff --git a/support/config-fragments/autobuild/bootlin-riscv64-musl.config b/support/config-fragments/autobuild/bootlin-riscv64-musl.config
index 2b6a6e56da..fee1f29f4a 100644
--- a/support/config-fragments/autobuild/bootlin-riscv64-musl.config
+++ b/support/config-fragments/autobuild/bootlin-riscv64-musl.config
@@ -1,4 +1,4 @@
 BR2_riscv=y
-BR2_RISCV_ABI_LP64=y
+BR2_RISCV_ABI_LP64D=y
 BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_MUSL_BLEEDING_EDGE=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE=y
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
