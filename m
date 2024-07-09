Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF5AC3DA42
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 22:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D68641387;
	Tue,  9 Jul 2024 22:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCW2JkxhPOBI; Tue,  9 Jul 2024 22:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D96C041388
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D96C041388;
	Tue,  9 Jul 2024 22:03:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB7501BF41D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 22:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A47C181EFA
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 22:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZezaJ0qvnk7 for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 22:03:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D264481EF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D264481EF9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D264481EF9
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 22:03:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b57c.dip0.t-ipconnect.de [84.161.181.124])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2E3E1A4C0E66
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 00:03:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58780)
 by fli4l.lan.fli4l with esmtp (Exim 4.98-RC3)
 (envelope-from <bernd@kuhls.net>) id 1sRIvT-000000004j6-2VLo
 for buildroot@buildroot.org; Tue, 09 Jul 2024 22:03:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 00:03:06 +0200
Message-Id: <20240709220307.3598238-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240709220307.3598238-1-bernd@kuhls.net>
References: <20240709220307.3598238-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1720562588;
 bh=+AjCSnP5nCdUePDpARe6rrvTgQGrQv6USgYheDTV73I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=viHa4X3p4Zesr7ifJyTSb1LkWbr/Zjqj3QsEcLTdePv/zQ/xDwa8PEt8W1GGMtaSc
 a9fXQ8uiW5vdcGwM4iuydVvD2/uYmW6cH0uDdhk5Q/9Qxk0i0g+HwA1+6u6oBleAyB
 mX3HRl2Zp1xatc4ExmlgCHGI2AlWxMByVk2msiVpc6cIGmoOUSuDMKZ3IZ4f796IIf
 8+f5xuNmEF33wuWHhUYg1++gK3i/9Unl8i6pI+chcG/jKTU2cn12RPEAaTk87lews3
 vsdJJhWp1H3UFDKp4jiwhnSY9ILkArbtIoz1nEftY9iuO0LkMtqVFuLEXiKLXyMuh8
 FrnDHSHnXRCmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=viHa4X3p
Subject: [Buildroot] [PATCH 2/3] package/kodi-pvr-mediaportal-tvserver: bump
 version to 21.0.3-Omega
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
 .../kodi-pvr-mediaportal-tvserver.hash                          | 2 +-
 .../kodi-pvr-mediaportal-tvserver.mk                            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
index a02ddeb6a5..b6add33bb7 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9e8c92b49433f46ae681055762ca4c152481b258c9163a1119c1ca08d7e9fd7c  kodi-pvr-mediaportal-tvserver-21.0.2-Omega.tar.gz
+sha256  0aedb77bd9f3a36375feec7f3769d596dbc536b66d584eb933fb11ec7cff8514  kodi-pvr-mediaportal-tvserver-21.0.3-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index 62a30e8cfe..8ada1a1eb1 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 21.0.2-Omega
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 21.0.3-Omega
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPL-2.0+
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
