Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C442CFC526
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 11:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09E5040F69;
	Sat, 22 Nov 2025 11:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHGo9Inn9KIB; Sat, 22 Nov 2025 11:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 042FD40F5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 042FD40F5A;
	Sat, 22 Nov 2025 11:47:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC2AC122
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 11:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1E2A83ECF
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 11:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vw4ZlNwULQAj for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 11:47:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DE6A483EC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE6A483EC3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE6A483EC3
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 11:47:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b63c.dip0.t-ipconnect.de [84.161.182.60])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 37916A4C758E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:47:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMm5B-0000000057t-1Y9g
 for buildroot@buildroot.org; Sat, 22 Nov 2025 11:47:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 12:47:13 +0100
Message-ID: <20251122114713.3778269-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763812034;
 bh=CYZcfnv0krUkX7LVciyVIcvyMmIaCslmNy8JPrgX9fo=;
 h=From:To:Subject:Date:From;
 b=X//zh5yFm5b8FQvb2SdFMbB0UPTx6Rzu6sCG6WS+Fb66/eumBOxdOdJL6nfZkD37w
 leTfAExJrC7CKe5pkbiE/XSUTQS7M5DTHD8FyTK/fbLZdA4GRms6dNLKWj6IulmOfK
 tQuQyheg1++CxYNX4spOv5epJ1ergHGgT4dfviK18Bzphxpt3tfFg1IllGL9FfeZmq
 5KovY08tLvGG+PqMcgRfcaVPJRZ4fV8oL2R/MHBU4tx7++rGDE+l1k13v03dqgDU7H
 3kgU6htfEA68o8jL/MSs9jUUX8xICSQ1ocJs3TRvzpqExleKScKwc5rKaPMZd6oAVg
 tZzNDPDUxnctg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=X//zh5yF
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: mkeficapsule needs
 gnutls
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

While buildroot commit 14a0169714cd5c35be40faadc066412f144bc1a6 forgot
to add the reverse dependencies of gnutls the buildroot commit
f94ba69770e5c5dc1342bf52657b3565b1a56e6d to fix that forgot to select
gnutls.

Fixes:
https://autobuild.buildroot.org/results/595e9af38fef4729ff3d6f32ad320d46c8c88594/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/uboot-tools/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index 4ccef30973..da6cd65252 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -70,6 +70,7 @@ config BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE
 	bool "mkeficapsule"
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR # gnutls
+	select BR2_PACKAGE_GNUTLS
 	help
 	  Install the mkeficapsule tool on the target system
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
