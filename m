Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE88FEA3C4E
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 11:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9C2B60FCE;
	Thu,  9 Apr 2026 11:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_wGSy3Ob6vA; Thu,  9 Apr 2026 11:07:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0DE960D92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775732865;
	bh=ePkdKX7pHEJmJbB8pRMVG/Lu/EY7Z5qub7qrptIHu/g=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VO9HPclYFnPtW6nRz22C4EcjE/21MStLX+ku3QmsPZm35rROQz1i8DTk6igtCxjWH
	 SjkH5pZ+lu42iMYnLB9TDkRCvwtpXN0IpSUjOwjCRi63EtfTOWLaD99na2QQSCW7RY
	 B1gphoghcz57CvnlH0hAyU7C7iVXG5sR8zOyMk+qvd9zfQjA52nhZV15TY4szzGwti
	 Vk9HzUKsJOqr91YUM9WhheAy643xFNWCKEMezb8E94iZqE4jsBr/s4emozI8diRy0x
	 8pkwfFctuWWM7XPRBqg6AYZagC6phl7u/VK3zObo9HV7RlOsaaC+MliUjo9aOpiOy9
	 68CE8UbHdNaGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0DE960D92;
	Thu,  9 Apr 2026 11:07:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9582237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 11:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F68841082
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 11:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFbVIsFXxn6Y for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 11:07:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9A8CE41081
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A8CE41081
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A8CE41081
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 11:07:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BDDE3A4C08E6;
 Thu,  9 Apr 2026 13:07:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53242)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAnEa-000000004gk-2vem;
 Thu, 09 Apr 2026 11:07:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Thu,  9 Apr 2026 13:07:40 +0200
Message-ID: <20260409110740.3651654-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775732860;
 bh=VbYWP+/chT2mG/G3fQ63Ajblmn73sGEFQBxWI8O4IpM=;
 h=From:To:Cc:Subject:Date:From;
 b=dWAjHMsvJpm7spbx2zRQG+zlx4DsXyf0nRlLturGCbS99w1Pxo83e+Ch4Iskrwees
 6Tn5bQD4w4lGdScsxLeBVUIH1qdUc0YRQfOcwW3u2S3lFiOLMDTD6uz8x9XSe+5hBs
 0Jxrl1zZDAyghfHBPQ75hd0D0Ch11BL9caxnJ0Ybf+80blJMn0pW7wFtECSXxgGbuh
 MR59r/0Neg0d1YPzyNEBtcaoDEh4ovmoWTtChojRi/1oT8g/E+1KqySj8m74UR0fSA
 KLnxqO8jfUDI5kih8TVEa/OzJ+OCXBj5SlAonfSou9/KnqY4hrPylB4Zv5E7wsi9Hs
 OD675l+9SKvPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dWAjHMsv
Subject: [Buildroot] [PATCH 1/1] package/drbd-utils: bump version to 9.34.0
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

https://github.com/LINBIT/drbd-utils/blob/v9.34.0/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/drbd-utils/drbd-utils.hash | 2 +-
 package/drbd-utils/drbd-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/drbd-utils/drbd-utils.hash b/package/drbd-utils/drbd-utils.hash
index c9db5b6587..46c605417d 100644
--- a/package/drbd-utils/drbd-utils.hash
+++ b/package/drbd-utils/drbd-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  223fe07d0b646e991b33ba9ea41468f9a66f903562e7da766dd0fc6b4ea33db9  drbd-utils-9.33.0.tar.gz
+sha256  7063e6451056b6c51b1ab29e1a33321131286d11aeea3cb9f491458b3ca63dab  drbd-utils-9.34.0.tar.gz
 sha256  1ca3e8f71b7de618968e7ea9fe47822d9e704dc476aef8544033abedec355225  COPYING
diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index 82baba975d..9786275ccc 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DRBD_UTILS_VERSION = 9.33.0
+DRBD_UTILS_VERSION = 9.34.0
 DRBD_UTILS_SITE = http://pkg.linbit.com/downloads/drbd/utils
 DRBD_UTILS_LICENSE = GPL-2.0+
 DRBD_UTILS_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
