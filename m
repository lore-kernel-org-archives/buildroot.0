Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC8AC54E49
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 17:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 611B940121;
	Thu,  7 Mar 2024 17:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mBp9AEX6o5dr; Thu,  7 Mar 2024 17:42:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 334B341B70
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 334B341B70;
	Thu,  7 Mar 2024 17:42:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40D7F1BF396
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DD4C60A8F
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WrF4b_F7XEXM for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 17:42:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 34326608A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34326608A5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34326608A5
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 17:42:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd61.dip0.t-ipconnect.de [84.161.189.97])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D43A7A4C25AF
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 18:41:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34548)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1riHkf-000000004Ag-2Dnb
 for buildroot@buildroot.org; Thu, 07 Mar 2024 18:41:53 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 18:41:53 +0100
Message-Id: <20240307174153.36557-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240307174153.36557-1-bernd@kuhls.net>
References: <20240307174153.36557-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1709833313;
 bh=wLFuD5trLpHXmaDrNpRtiMbxq5uABHvAzqm9SFHAOos=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TdPyvHcGpJxymRklcYvsIbQ3Qh0FsTnrBmMy0EKJ9wN5bU3I8/1vFxKMVAKjz2hDw
 UjTcRXUeAIua/CgQyRxdf5hlUMkPT0sO0O4LjQ97yUhi3XnOhnoOz+t8LUbpzXCSRi
 EFqdfym/reLw4cXEp0ZKLVunM7m5ZTCLLlm3k+Ajf6ih/trG8EFzTcCK/EcvgrVrNm
 b7xHbum/GVPp4etcv8P3mpIZtw5kbc4NXs9OoPRaZhpN6DCBn3HwXG27k8XAlSYemI
 Jrex20xblH5c4o8/51mJN7LnCUTxUTZXd/sD2yarJkXLMt7Fxt6YmKGJByhZlxvcRJ
 VivbajjE/MTFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=TdPyvHcG
Subject: [Buildroot] [PATCH 2/2] package/kodi-pvr-mythtv: bump version to
 20.6.9-Nexus
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index c61c391825..ff3d0f05b7 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eb21e185d1333a8696565138bc58df3d37970c9a3615193396e9f296a56a24c4  kodi-pvr-mythtv-20.5.10-Nexus.tar.gz
+sha256  32196265ee5b78bb97e0bd8e633778f4566e95d54df96e4577764e5d3681fcf1  kodi-pvr-mythtv-20.6.9-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 66f1948741..a3a5678651 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 20.5.10-Nexus
+KODI_PVR_MYTHTV_VERSION = 20.6.9-Nexus
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
