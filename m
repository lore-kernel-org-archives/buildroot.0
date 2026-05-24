Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F58ECD4F54
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 07:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F7D180BA9;
	Sun, 24 May 2026 07:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uEESRRcVNkg5; Sun, 24 May 2026 07:07:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0C8F81465
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779606430;
	bh=CY/nAnT58sEnufI85PQcVIHVtPQX3gqLDSGnVePyfGo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S21tY1Ah+cTHGEnS4aK/q0LbkDuLzQJUHYbXJik0gEofJyZcqAzj2l8e5sPEbRp2w
	 xrSAynHznhn7X/0eqWayrJgKL7T7Q1DiHyZnoiElMM6dlREiRlsqBleqCbBuuWS6oY
	 Mt17TmA6oHENicQZo/fVXynMd+sIsLB3tDQzttyi8TnLBfL/5SWW3daS5iZGmrZSXE
	 1JawTNv0O6446ivyyTTTCs7/xKHE3r+eX61OnnzgxdLNqNRYBwkD9pOZJc6fTpHrrg
	 zLjnoSQi4SxQ8Qpmxxsxx2cv5r4qSVEI6fDjBAyr20ZCHwx78Rq89jC8JOroy0EdIR
	 ebslnDCoi3cjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0C8F81465;
	Sun, 24 May 2026 07:07:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DC5D69
 for <buildroot@buildroot.org>; Sun, 24 May 2026 07:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C4F9410D1
 for <buildroot@buildroot.org>; Sun, 24 May 2026 07:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ju5cYLDQmk0I for <buildroot@buildroot.org>;
 Sun, 24 May 2026 07:07:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 84CA6410CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84CA6410CB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84CA6410CB
 for <buildroot@buildroot.org>; Sun, 24 May 2026 07:07:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1beef.dip0.t-ipconnect.de [84.161.190.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F1F6EA4C0172;
 Sun, 24 May 2026 09:07:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39676)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wR2vQ-0000000034M-0Uxb;
 Sun, 24 May 2026 07:07:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alexander Dahl <post@lespocky.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 24 May 2026 09:07:04 +0200
Message-ID: <20260524070704.2828646-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779606425;
 bh=END1JPtX4VdoZOxjb4JSnqmiyrCcv6LpYuRzf6bKuPY=;
 h=From:To:Cc:Subject:Date:From;
 b=INCLSNAiHhPpicOiydAnhs57NceRzF4Dhh8/2GDnxiMsV1zOXd9N0Rs1Sqe1nKM7v
 M4w0CSy0ZGkCsG81fWIYpfU+CRHklKBy8BefCmoL7CVwtf4NYzw+So4ewZwqFv/QqZ
 IrIfJbm0a/9jBRV+FBnoZhHCu668JD5w3Og1EWK9BGhZWlaEMV8Vx7MnxPuI4Q13p4
 YW5ukJGhWcrmxB991nTAO9nhPDJ6vONDwgZ2xFTV2r2MoMlXvDihsWGFp79oEOCwbd
 QoXnHr+ZkZRm5q4WYBrbdJaBO+8eBCo6nsNzd2OKQxWueE4+bh8GgOs0qx3JoK4jep
 DRbTIknpzIVBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=INCLSNAi
Subject: [Buildroot] [PATCH 1/1] package/putty: security bump version to 0.84
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

https://lists.tartarus.org/pipermail/putty-announce/2026/000042.html

Updated license hash due to copyright year bump in upstream commit
995b63a82bac4f6985958cb92943e807a9f35736. A link to this commit can not
be provided due to the shutdown of the upstream gitweb interface:
https://git.tartarus.org/?p=simon/putty.git

Switched URLs to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/putty/Config.in  |  2 +-
 package/putty/putty.hash | 10 +++++-----
 package/putty/putty.mk   |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/putty/Config.in b/package/putty/Config.in
index f89283b99a..f0484ec20f 100644
--- a/package/putty/Config.in
+++ b/package/putty/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_PUTTY
 	  and puttygen are built; enable GTK2 or GTK3 for the
 	  graphical client.
 
-	  http://www.chiark.greenend.org.uk/~sgtatham/putty/
+	  https://www.chiark.greenend.org.uk/~sgtatham/putty/
 
 comment "putty needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 33a9666bc2..362467e2d7 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://the.earth.li/~sgtatham/putty/0.83/{sha1,sha256,sha512}sums
-sha1  f9fd9ab5e3849bf8c22b218cdb7697dcdd1d8c9e  putty-0.83.tar.gz
-sha256  718777c13d63d0dff91fe03162bc2a05b4dfc8b0827634cd60b51cefdff631c6  putty-0.83.tar.gz
-sha512  4781616b7e9c5a779a54e6a8486513e0aa947d4a36e9dbfd4ffc0d32981a5ad4868cddbde0363467236ed67c43f990408a9326d10354954be716a270d587c0a6  putty-0.83.tar.gz
+# Hashes from: https://the.earth.li/~sgtatham/putty/0.84/{sha1,sha256,sha512}sums
+sha1  d3ed01106667b42de322b266266e0d21b70adf12  putty-0.84.tar.gz
+sha256  06057862ae198f1dbd219d0c7493080d59f606194bb5056c549e342aa01b69fe  putty-0.84.tar.gz
+sha512  647c84490c01f8c0f9cf02f565081d80ea2ea4fb90207cfb2fbe13ba5e8c3cea7c4807504363d3d3a851df5edb6087c3b39084820bf20e818dd551db54af0765  putty-0.84.tar.gz
 
 # Locally calculated
-sha256  c18aac5045fd30bff639b07884be44cb8c68eef16efe8c5e18deda1f58cacdfb  LICENCE
+sha256  3b02f87e0063430289d9681727a98818c844fc8a4d79b24b76047fa061e77f13  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 9071fea208..82b16b250c 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.83
-PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
+PUTTY_VERSION = 0.84
+PUTTY_SITE = https://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
 PUTTY_CPE_ID_VENDOR = putty
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
