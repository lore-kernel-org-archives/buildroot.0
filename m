Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77772C3064D
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 21:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 411436067D;
	Thu, 27 Jun 2024 21:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YK3vmwgwrhJ7; Thu, 27 Jun 2024 21:04:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56EC8606C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56EC8606C2;
	Thu, 27 Jun 2024 21:04:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4EC31BF3CA
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 21:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 615DF4076D
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 21:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7NFvOD2EiXFY for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 21:04:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6DF294076C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DF294076C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DF294076C
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 21:04:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb6a.dip0.t-ipconnect.de [84.161.187.106])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9C70DA4C2345
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 23:03:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43114)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sMwHB-000000000PR-21Ia
 for buildroot@buildroot.org; Thu, 27 Jun 2024 21:03:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 23:03:26 +0200
Message-Id: <20240627210328.1560834-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240627210328.1560834-1-bernd@kuhls.net>
References: <20240627210328.1560834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719522209;
 bh=45EbU9jCDmxFLwynGRe+Ym0CAMTf8HFidqUWdFZ6Meg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aJdu6zBKx5QAREC7Bb4jvVx6XfYqFm2ejwZ02wBDv309JwPMwroSmYPVbk4on6JJb
 0vJOT03gOD3yvnewRw50NXF5RwQ8Ee98ETZ0QTuZmFeyUw8vIW+AZ06MpHGu8KdZeZ
 vxjOSdNj49FB70sBzTYYAHierzq8c0TVtncK+CA/aPYuqQ8LjGjWyPhfxFPzxnNRK1
 Pwcjr/ydnEavnHmw0dFYEh9bm4ir36CAEd25erHEeoQgmPksHgWsIl9vvos5hUffsi
 RsQSkBEMlI/exsNQMANrm1gR0FaB330iJM/wZGuSZgf5Q6usA7UUf5+WMFXGL1EcF1
 kUxnrnT0G02jA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=aJdu6zBK
Subject: [Buildroot] [PATCH 6/8] package/kodi-pvr-zattoo: bump version to
 21.0.2-Omega
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
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index acffc6a7ee..d97bfce5b3 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5908de86c038b3565d8b3a8d4578d4cac0d37287fc039808542b874d9fb2bffa  kodi-pvr-zattoo-21.0.1-Omega.tar.gz
+sha256  859a64e152eca06a6210a80ad199e8b545c9fc9b85562eb12f980c1659ace72a  kodi-pvr-zattoo-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index d764524fbb..cba9d0b2ef 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 21.0.1-Omega
+KODI_PVR_ZATTOO_VERSION = 21.0.2-Omega
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
