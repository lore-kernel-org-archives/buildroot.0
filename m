Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9556CCCF9E0
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 03:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62EC4811FE;
	Mon, 27 Oct 2025 03:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGNs4EY6_sRR; Mon, 27 Oct 2025 03:54:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DD6E81148
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DD6E81148;
	Mon, 27 Oct 2025 03:54:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FA9325B
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 03:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25C1C412E2
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 03:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGsZPCOZV43K for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 03:54:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=ycliang@andestech.com;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD723412E1
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD723412E1
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 03:53:59 +0000 (UTC)
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
 by Atcsqr.andestech.com with ESMTP id 59R3XBaC065520
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 11:33:11 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 59R3Ws60065328
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 11:32:54 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Oct
 2025 11:32:54 +0800
To: <buildroot@buildroot.org>
CC: <tim609@andestech.com>, Leo Yu-Chi Liang <ycliang@andestech.com>
Date: Mon, 27 Oct 2025 11:32:39 +0800
Message-ID: <20251027033242.1797230-2-ycliang@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027033242.1797230-1-ycliang@andestech.com>
References: <20251027033242.1797230-1-ycliang@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 59R3XBaC065520
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org; dmarc=permerror
 header.from=andestech.com
Subject: [Buildroot] [PATCH 1/4] configs/andes_ae350_45_defconfig: Fix
 post-build.sh Shellcheck error
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
From: Leo Yu-Chi Liang via buildroot <buildroot@buildroot.org>
Reply-To: Leo Yu-Chi Liang <ycliang@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add quotation mark to fix Shellcheck error.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 board/andes/ae350/post-build.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/andes/ae350/post-build.sh b/board/andes/ae350/post-build.sh
index 84187a064b..e1669c2bcd 100755
--- a/board/andes/ae350/post-build.sh
+++ b/board/andes/ae350/post-build.sh
@@ -1,3 +1,3 @@
 #!/bin/sh
-cp $BINARIES_DIR/Image $TARGET_DIR/boot
-cp $BINARIES_DIR/ae350_ax45mp.dtb $TARGET_DIR/boot
+cp "$BINARIES_DIR"/Image "$TARGET_DIR"/boot
+cp "$BINARIES_DIR"/ae350_ax45mp.dtb "$TARGET_DIR"/boot
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
