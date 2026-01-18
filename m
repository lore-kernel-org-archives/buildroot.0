Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9774FD4A5F4
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 13:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5025961B74;
	Sun, 18 Jan 2026 13:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ep_VvQi92e8t; Sun, 18 Jan 2026 13:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28A4C61B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768742479;
	bh=pPtynk6HBAh1h5ZiTy+iY/lULBHx2PLCDWXwnnrp0fc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V8/fl+kTs6WlEwCyrSAWNsbiIwFCZFxO7aLU06RBbS1Ghp5JNwqEOsyhWPM4ZHfBU
	 E9UkOYxVj0fl7P+k+grE1DvLPZDCAbmIf6yj3P4CPV6aCdiyANiXUTcFhluLOz4OZo
	 0o4sk2CNdv9zkD1+LzbwjALL5BmQpa9ZuoVf/KQFELcQutEyLN3em9FdYoyRkW/V7P
	 7Wwxzcv1n0SLXmCxfU56urzMVCVcgcMRDyA2+LQdtHZ5kLYA8i9VSjFShdnI6EwbfJ
	 +VKhRuLLm0PjcmnJSE3ffXEmvEOVD713xgPiknxOvZyoaP6vVMlOTsjJPOFRYyGi+l
	 nIromVRFuzctw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28A4C61B76;
	Sun, 18 Jan 2026 13:21:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D01522CE
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 13:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3B1241E0C
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 13:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tkHlZnZow_jf for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 13:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3BA9C40258
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BA9C40258
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BA9C40258
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 13:21:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09ef.dip0.t-ipconnect.de [91.58.9.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E9F19A4C474D;
 Sun, 18 Jan 2026 14:21:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56522)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vhSiJ-0000000040v-0Xu1;
 Sun, 18 Jan 2026 13:21:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 18 Jan 2026 14:21:07 +0100
Message-ID: <20260118132107.1541912-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768742473;
 bh=ssi73gBrBz1xVQZid2c26enTE0XbyTmkQmO6R5uzWN0=;
 h=From:To:Cc:Subject:Date:From;
 b=pnnjkSWQzRgqRwqvNvImu+ZEZshEmNiALGaehLMMRTGw3niorvM9grB+0W+Lomi5X
 lu2brf3SrxiJOuKSmgptZwF6DILp3knDrOV4N36Nip+dcyZBBzaIQPjKDboNkd/1R7
 GI1QKhRGczZAOgzUk5iDqoyFhF02oj6NBKT0AledRAsgb/uN+OgNZzLKA1CRPxsfO6
 bWSMwjSmCeafGwi6zPU3p7hHOkeoA9Ftq1zvmrEKDz7ZjAi/Uz3KBLlCffyW+F42/K
 JchH89fuy1xqQaC7vPt0v94gcbq/sxZiPI7wQ2bcGRWpx1PzabmINsJLF9bJHLmaj+
 2gpIFyX36ePLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=pnnjkSWQ
Subject: [Buildroot] [PATCH 1/1] package/xinetd: fix build failure due to
 missing BR2_PACKAGE_LIBTIRPC_RPCDB
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package xinetd requires libtirpc rpcdb option enabled since the bump of
libtirpc to version 1.3.7 with buildroot commit
3f3d6e43de9b4aac7df8545fd811171256f878d3 which includes upstream commit:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

Fixes:
https://autobuild.buildroot.net/results/4db/4db625d395f38636b67adbbf6286c6c9da155f62/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xinetd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xinetd/Config.in b/package/xinetd/Config.in
index f509905f1c..9637016f7e 100644
--- a/package/xinetd/Config.in
+++ b/package/xinetd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XINETD
 	bool "xinetd"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no ecvt/fcvt
+	select BR2_PACKAGE_LIBTIRPC_RPCDB if BR2_PACKAGE_LIBTIRPC
 	help
 	  xinetd is a secure replacement for inetd. It was originally
 	  written by panos@cs.colorado.edu.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
