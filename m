Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1326D3E778
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 21:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93FC540677;
	Tue,  5 Nov 2024 21:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hVy4QME1nvL; Tue,  5 Nov 2024 21:58:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E3A1405F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E3A1405F7;
	Tue,  5 Nov 2024 21:58:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF6193B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 21:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D5CD60881
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 21:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPSYPM9w2blb for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 21:58:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D7C4A605AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7C4A605AF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7C4A605AF
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 21:58:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0255.dip0.t-ipconnect.de [91.58.2.85])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B32DCA4C2E70
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 22:57:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51816)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t8RYg-000000008M3-02QC
 for buildroot@buildroot.org; Tue, 05 Nov 2024 21:57:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 22:57:53 +0100
Message-Id: <20241105215753.3077420-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241105215753.3077420-1-bernd@kuhls.net>
References: <20241105215753.3077420-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730843874;
 bh=jWPx2cbs26NuvnTsOA+6vNDOZjJU1iNde0ZPH5Uwd+Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qGqAuorf5AIHUQELIZpOfofNgSok9sy5GPWAiXRpvStRMKkFxgw0zZ9POVDQzszA0
 7IlxTseGa++kLyclxWAzw+PC/Heu9eMVq1wRliagTcxZpXDlQSwDseCviMmqz+g6xF
 PV565hjtaxXyYJWVcr8CmzHXIhXNy1vM+LSpJIi9q4AygdLxCMS6uAUlT2oT/VZ3ch
 /5Iz2IvEvn7zU6Gci72erRNo5cR5YcjWc0aOvZ1EFeOWzG1oRPaHAD3WftAMBVoHf7
 YbZAC4zr35Y+GnLbuT2o34erZ0RQvsJtsL3T0KFHA46e9JMt8nfGGstSDJEudN5jpC
 RPTEkkv9zeU7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=qGqAuorf
Subject: [Buildroot] [PATCH 3/3] package/kodi-pvr-vuplus: bump version to
 21.3.0-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index 2b1139e054..f0bb4df7df 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e0fc9ef1db89e97c11dadccc06901ac0fbff03ff9f22ba7a8de665ce85c28aa8  kodi-pvr-vuplus-21.2.1-Omega.tar.gz
+sha256  b807baf970b034762d6bccb8be63c16a4a50508f3fc5b87d53d0804f4e94ac4d  kodi-pvr-vuplus-21.3.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index c289042a02..21ccec410d 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VUPLUS_VERSION = 21.2.1-Omega
+KODI_PVR_VUPLUS_VERSION = 21.3.0-Omega
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
