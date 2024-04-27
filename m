Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DCEC4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 08:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB2B36076C;
	Sat, 27 Apr 2024 08:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggOx_KeTQSQd; Sat, 27 Apr 2024 08:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8DD160640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8DD160640;
	Sat, 27 Apr 2024 08:34:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C89F1BF29C
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 08:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70EE481758
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 08:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Hf-3l1WHpHH for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 08:34:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 404078144A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 404078144A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 404078144A
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 08:34:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0289.dip0.t-ipconnect.de [91.58.2.137])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E6B3EA4C256E
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 10:34:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51564)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s0dVS-000000006qG-3Ftt
 for buildroot@buildroot.org; Sat, 27 Apr 2024 08:34:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 10:34:02 +0200
Message-Id: <20240427083402.10703-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1714206842;
 bh=xqydEML5nJeCiSuCuCvskTXsGoOxtassmrV7f5+sW8g=;
 h=From:To:Subject:Date:From;
 b=hH7cFgmrKHRl1yuWCZqgONLzAUEoda/nyP18vWd5iHCcxHqiRm7dt96uC+EzgbyCF
 0kTBM9jMgx9oD5eUvIPmLmGCG8+drk/0ZsTPbPzwfZiD44DM32OiY44vSmDOs+30Ca
 IYPW2yQWie+fFgs0BpMq46Xf9IWzDIw01xVpDstkfzhXxO+eAIrZ+PU4M9RDt4A6JX
 RXxwZY2bFsCkoF1Kr9K/JLSrKI6Rc6mDpnsJm7O2BAkTSckqirNU7O8x7f1L3S8ilW
 oBVU2ghM7M86GtOhg6+GeZRL+l93iRbNaIGpoNYtnuTrWTKntGSb1YKFvH4RYKg1ih
 dfirvWtqhy2AQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=hH7cFgmr
Subject: [Buildroot] [PATCH 1/1] package/clamav: bump version to 1.0.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://blog.clamav.net/2024/04/clamav-131-123-106-patch-versions.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index cd03a11840..b2b7bfb987 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  aa67ee9679f747af3c492353d768464c27d614b3fed62eb7f988b6776d4aedbb  clamav-1.0.5.tar.gz
+sha256  12dcd842b6c46e5a9fdf2f5c16304efafe53310ac4605990465651b0c42227b2  clamav-1.0.6.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index c548897c37..eb3abaa21c 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.0.5
+CLAMAV_VERSION = 1.0.6
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
