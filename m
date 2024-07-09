Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BF1C3DA42
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 22:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE18040282;
	Tue,  9 Jul 2024 22:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVSSXTkqOrb1; Tue,  9 Jul 2024 22:03:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B901940299
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B901940299;
	Tue,  9 Jul 2024 22:03:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51F681BF41D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 22:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E9EA40282
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 22:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UlQWT_nwqhH1 for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 22:03:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1CE59401FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CE59401FC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CE59401FC
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 22:03:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b57c.dip0.t-ipconnect.de [84.161.181.124])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 525B4A4C10FB
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 00:03:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58780)
 by fli4l.lan.fli4l with esmtp (Exim 4.98-RC3)
 (envelope-from <bernd@kuhls.net>) id 1sRIvT-000000004j6-2ktT
 for buildroot@buildroot.org; Tue, 09 Jul 2024 22:03:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 00:03:07 +0200
Message-Id: <20240709220307.3598238-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240709220307.3598238-1-bernd@kuhls.net>
References: <20240709220307.3598238-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1720562588;
 bh=I3mebJteJQnPxkkHoqN82XIcJ5DcQcAYjxfNIrxdQUE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mhYL/SzsXeasCBv7gShalI6dFAx2bDZZhyHD+CgAW7/Y2UjPVUykUyclXQ1ZHwFWv
 E2ZvO8/FUrI4eqmUTfvkE2oFqmBhGqp28KmMbMOG6qqcSjdRPT2e06xJDDDOTQvEYW
 wkc2r7a0aeKStwKio8whKWEyd0AxoC40OKTsIuEvta50fMiyw9VF60eeEgN39m1WAM
 BQU2Y5VTLq8LuqVyFEJA2mqDO0TEJsd+csV5aJIKa0mUGHJhb6e1ydc6QBjTYWaMAs
 g0vlLimf8FN1gSLCGacmo+Q9RN4+13wChSUIaC4aL+2Z9fZen03+mvpYtxSjxe7dMp
 qUKwQNrxsToLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=mhYL/Szs
Subject: [Buildroot] [PATCH 3/3] package/kodi-pvr-mythtv: bump version to
 21.1.9-Omega
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
index 7095eaf81c..d445d9cb2c 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3f1d826e11da10a600dd4de0bfd279a0c583aeae387832c6f9f06bb8befbb811  kodi-pvr-mythtv-21.1.8-Omega.tar.gz
+sha256  d3a54798f38befeaeaf57dec7ea85e3c8846591298ced3f686ac03d62edeb0f9  kodi-pvr-mythtv-21.1.9-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 597e8018f6..0b54002aba 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 21.1.8-Omega
+KODI_PVR_MYTHTV_VERSION = 21.1.9-Omega
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
