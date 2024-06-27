Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7C6C3064D
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 21:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38D506067D;
	Thu, 27 Jun 2024 21:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tnjW7_TJUSg; Thu, 27 Jun 2024 21:04:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45C5F60E85
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45C5F60E85;
	Thu, 27 Jun 2024 21:04:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 76B311BF3CA
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 21:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6321A41B2F
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 21:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zg9zpfXKyhtK for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 21:04:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 55FFA403B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55FFA403B3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55FFA403B3
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 21:04:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb6a.dip0.t-ipconnect.de [84.161.187.106])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 833C0A4C1FCE
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 23:03:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43114)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sMwHB-000000000PR-1bPV
 for buildroot@buildroot.org; Thu, 27 Jun 2024 21:03:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 23:03:25 +0200
Message-Id: <20240627210328.1560834-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240627210328.1560834-1-bernd@kuhls.net>
References: <20240627210328.1560834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719522209;
 bh=VRw7gexiMjnLQje4CLxLnQSaZSgh3x9D6EP5cGYZ7hc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ebc5UfUVPbZ3qbzHtbfvFB/RB+otePwWTlq1I9SeB6Jv9yo60oWFmAuLZ9BqAtmva
 VsMt8ekdM8EEdcwxDZ85KCAoxnTlqJK7tD4Kyo+klJ0oM2H+elSY23ki0j2PVYyr1S
 SMdrtfEWdyDKl4sM2EHuTJBtJzbRTvon31DW2htl7rhbVjOkDtKG67AF6253GroPrp
 ac0vOor1G9bX6I5ay3npphd99/hKOaGL058+Z9yZCAaB+6vskNnCh9HGMwVwSxoSMj
 Tj7RTk2CWR5vFJ9X5POVE1I/uljkqYB1fv3j4Jfe3KLuJ1FabzEJu2+FBSyH8DXL2T
 GeyaqfK1CgQKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=ebc5UfUV
Subject: [Buildroot] [PATCH 5/8] package/kodi-pvr-waipu: bump version to
 21.8.3-Omega
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
index 6377f36e80..1198d65768 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  96c558f02d820c43994da05a89693f3e787c2adb8faa2ff28127a6e97d33525c  kodi-pvr-waipu-21.6.1-Omega.tar.gz
+sha256  6d47012f43f9a24edb09bc249de9b14cd0adca58fe0633687cd2fc54fe1bf23e  kodi-pvr-waipu-21.8.3-Omega.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 222abcaa1b..2c2270f3e8 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.6.1-Omega
+KODI_PVR_WAIPU_VERSION = 21.8.3-Omega
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
