Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B710E6529E
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 18:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BACE60B00;
	Sun,  1 Feb 2026 18:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3Pg-RiUlpKs; Sun,  1 Feb 2026 18:41:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7103260B3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769971302;
	bh=+RTW78bG8853UCp4qqXHJ9D6Wm2MO5rSyOzZnnTWnsk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YdTFBQWUCmSX1EVVyo4nvI7BC9re4H9fG8q96h76GaKTKcj6NaiI3gtxCvNM/R9go
	 p6rurb4G5L8iMhavvietQUWXpgVdPl39uFe1vmvALxYi6g4Un36sErCIxbf5HOR8hQ
	 Szd7zEla88h/A7F9/KLJKxvrlok+cYuxaFAeR0olaqiajREO8X/Nof+pRMSpOaTqVk
	 1JaDIVGHDHt8yU6iViL/gNDzW3k73JpYVU1hMkHDLsfsKO2nhj+ifTA0aM4aicpMxz
	 ve79g4nNPOuxkKkJiziZF09SaKKj06iZje3eI0h6yJaI2FU/M75YAwgn6JjeqW+plg
	 996vSEioJYl4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7103260B3F;
	Sun,  1 Feb 2026 18:41:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DD8423E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E88B60B3F
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBrF-enw3te1 for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 18:41:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6871F60B00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6871F60B00
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6871F60B00
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:41:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 77DEEA4C547A;
 Sun,  1 Feb 2026 19:41:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49002)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vmcO9-000000007pI-1Qo8;
 Sun, 01 Feb 2026 18:41:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun,  1 Feb 2026 19:41:37 +0100
Message-ID: <20260201184137.3595514-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769971297;
 bh=sSlTdHMFHrClsMVWyb+eyDC9Kk0ODLF+2fjAU5+XL3E=;
 h=From:To:Cc:Subject:Date:From;
 b=hsIs8LhquTAGZcqTeQPgX84O5t4yi0BBb04bcEM+OjGqWQVO3ptYSpqpIVW22K1i5
 EKxb8HaE9s1Jtxp7WS7/lafXVM6PQuUbHcEJl4D8yBWPhFK7j6OO29UitBwFMXCsP3
 P4WgTwhw66DL0eEgtZ3myOnc8u/vQh8WKrOw0HV4Oun1z9tUvd3mf1FUp9mOHXsAxM
 WdKCdPNasBh4+6l19bQkgrVQrdjsLmfE2P+BTVkgwyL3jkbVN7hUO/bDK6R89w+ywT
 rmzMuXFoCnsy2KMeY3nIkq74mTOh2eGteoQ2D/HKFI1M3XHJ0SDTxVjPeHbnRLlHaZ
 8ngpG/HPsToHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hsIs8Lhq
Subject: [Buildroot] [PATCH 1/1] package/libvpx: bump version to 1.16.0
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

https://chromium.googlesource.com/webm/libvpx/+/refs/tags/v1.16.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libvpx/libvpx.hash | 2 +-
 package/libvpx/libvpx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
index 1082721f1a..33d15fe108 100644
--- a/package/libvpx/libvpx.hash
+++ b/package/libvpx/libvpx.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  26fcd3db88045dee380e581862a6ef106f49b74b6396ee95c2993a260b4636aa  libvpx-1.15.2.tar.gz
+sha256  7a479a3c66b9f5d5542a4c6a1b7d3768a983b1e5c14c60a9396edc9b649e015c  libvpx-1.16.0.tar.gz
 sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
 sha256  cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 4f4144f4ff..d6b84ffec3 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = 1.15.2
+LIBVPX_VERSION = 1.16.0
 LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
 LIBVPX_LICENSE = BSD-3-Clause
 LIBVPX_LICENSE_FILES = LICENSE PATENTS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
