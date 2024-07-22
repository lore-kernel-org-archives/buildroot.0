Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F853C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 17:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30AD2401C7;
	Mon, 22 Jul 2024 17:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQb6jMijCEgp; Mon, 22 Jul 2024 17:48:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5C41401C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5C41401C8;
	Mon, 22 Jul 2024 17:48:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1C081BF2F7
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 17:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FA186060A
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 17:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKavMygTLaur for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 17:48:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 47A34605FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47A34605FA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47A34605FA
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 17:48:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b57c.dip0.t-ipconnect.de [84.161.181.124])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C9D9BA4C3147
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 19:48:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41534)
 by fli4l.lan.fli4l with esmtp (Exim 4.98-RC3)
 (envelope-from <bernd@kuhls.net>) id 1sVx9T-000000003oy-2zcY
 for buildroot@buildroot.org; Mon, 22 Jul 2024 17:48:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 19:48:47 +0200
Message-Id: <20240722174847.24596-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240722174847.24596-1-bernd@kuhls.net>
References: <20240722174847.24596-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1721670528;
 bh=gjbT6YEAmMYXsOhKn4VlN73XB6kasdi60Fv6egp0BOQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=wJTdvvMzdZcO+8Ii6FbBX8KVOfrGMYc6v3pO7ALD94guQs3SaFt5V2z4lirOhXcdw
 mvS9/76H9ZEm2GTuRf+YG/uwkboX+uoU1EHfvIbeYq/tWMbRmgLDuS9Wmh0l7njRTD
 3uwv4yyUKCkOjmIH605gCc1c13P8bCl6tea/T662Ndd+C4mXdbRJU2NWZu5wVbB/jz
 VavpU5RnuZWnx1bMHFVFEoPWyKPk8qxfL8lLdtA1oAEAi3jXkQS3UZ+jl6kIwLm91T
 e3VKlHlZ+HDpo0nYy0A/ktwGtIDz+xPr+czIxKAZwddXRMe/zSBsZfiwHIKgV507IY
 fDpnEDn/z8VuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=wJTdvvMz
Subject: [Buildroot] [PATCH 2/2] package/kodi-pvr-waipu: bump version to
 21.8.6-Omega
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
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index 0ceb344657..3a78f23b35 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cd394177247bb7ad24160246e0c368e946d0205ce3284a55f0dacd2d31d51bff  kodi-pvr-waipu-21.8.4-Omega.tar.gz
+sha256  11819542b32a8dc9a4b6f5cc2fb98153298be1156bbf36a1b2aaf569be9842ab  kodi-pvr-waipu-21.8.6-Omega.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 2a03bcb2c9..15a25a871a 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.8.4-Omega
+KODI_PVR_WAIPU_VERSION = 21.8.6-Omega
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
