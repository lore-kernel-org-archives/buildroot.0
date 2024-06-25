Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDB9C2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 14:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90723419A8;
	Tue, 25 Jun 2024 14:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2zBhjY4MuMCV; Tue, 25 Jun 2024 14:52:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4699E41863
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4699E41863;
	Tue, 25 Jun 2024 14:52:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C18221BF420
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 14:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF470605EC
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 14:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJdT4Lc6CpNl for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 14:52:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27199600C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27199600C4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27199600C4
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 14:52:10 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9D865B00535;
 Tue, 25 Jun 2024 16:52:06 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jun 2024 16:52:02 +0200
Message-ID: <20240625145202.789086-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719327127;
 bh=usnGG5U8GvFVNeve2NmgrOKbW+Vsqo7NqsAN3qDmaFk=;
 h=From:To:Cc:Subject:Date:From;
 b=QAPgKBMvc9bK97QRlY7ZJcSZ/yJroH/Qpt0ntPt9sM/qPm0rJYx8E9jgBdvbwH/0Z
 cO+/NUuFHpsWNpPH5u1gPXibfI6+sZTo0FBkVV7lERXD8RGe+9wnvOtQhphonwvsB4
 gmqgGJAO0AlQI1u98T4+k/SQZMJbtsSeBXqDE4gNVRCtokdLTZ6VwqEF5uS33T0eX4
 tJEt9bM+wLvv1MA8hUQn+RIdi+E7Y7CObq/gHZr4IXHPtmnX7W0pjEg3Vow3tX4NZw
 1dN6JQTxVx6bXk8Wj70gn83TQdsVodio5I2xJmvIUE9bshz+XkFASFcTh8poxI1bB7
 /eUk8iq6TBbMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QAPgKBMv
Subject: [Buildroot] [PATCH 1/1] package/riscv-isa-sim: update the patch to
 be applied with fuzz 0
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

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, host-riscv-isa-sim fail to build with output:

    Applying 0001-riscv-disable-precompiled-headers.patch using patch:
    patching file riscv/riscv.mk.in
    Hunk #1 FAILED at 35.
    1 out of 1 hunk FAILED -- saving rejects to file riscv/riscv.mk.in.rej

This commit rebased the package patch on the package version, bumped in
commit 853b7661bf "package/riscv-isa-sim: bump to git version
00dfa28cd7".

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-riscv-disable-precompiled-headers.patch     | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch b/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch
index 461f34e3a10..9ce32e3b768 100644
--- a/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch
+++ b/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch
@@ -1,4 +1,4 @@
-From 980d5143089bf32ef8a6dfdf1bb9e9fe92fa7bf5 Mon Sep 17 00:00:00 2001
+From 12e0257495de41202827fabd5935f2e5a92ae8a6 Mon Sep 17 00:00:00 2001
 From: Julien Olivain <ju.o@free.fr>
 Date: Sun, 9 Jan 2022 13:38:48 +0100
 Subject: [PATCH] riscv: disable precompiled headers
@@ -16,12 +16,12 @@ Signed-off-by: Julien Olivain <ju.o@free.fr>
  1 file changed, 3 deletions(-)
 
 diff --git a/riscv/riscv.mk.in b/riscv/riscv.mk.in
-index 2347ce6..4f56eaf 100644
+index 469c48dc..c61cadaf 100644
 --- a/riscv/riscv.mk.in
 +++ b/riscv/riscv.mk.in
-@@ -35,9 +35,6 @@ riscv_hdrs = \
- 
- riscv_install_hdrs = mmio_plugin.h
+@@ -45,9 +45,6 @@ riscv_install_hdrs = \
+ 	triggers.h \
+ 	vector_unit.h \
  
 -riscv_precompiled_hdrs = \
 -	insn_template.h \
@@ -30,5 +30,5 @@ index 2347ce6..4f56eaf 100644
  	processor.cc \
  	execute.cc \
 -- 
-2.34.1
+2.45.2
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
