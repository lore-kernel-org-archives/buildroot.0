Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBCEC48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 05:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 282CB41F24;
	Fri, 16 Feb 2024 05:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iRaQ7KpUp77q; Fri, 16 Feb 2024 05:43:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 310E841F53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 310E841F53;
	Fri, 16 Feb 2024 05:43:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7159D1BF3F6
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 05:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55CA2404AF
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 05:43:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2VcyvtCaWxKB for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 05:43:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B66214048E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B66214048E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B66214048E
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 05:43:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4CC91A4C0A29
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 06:43:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57420)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rar0j-000000004PS-09SZ
 for buildroot@buildroot.org; Fri, 16 Feb 2024 06:43:45 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 16 Feb 2024 06:43:45 +0100
Message-Id: <20240216054345.17403-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1708062225;
 bh=69ghIg3nGu4uaNAPrzqZq6kwEz1GBi/6vJcCeReAAPk=;
 h=From:To:Subject:Date:From;
 b=XBJSHBYM8/J7i+DxcCHSUJBH128WVd/RlTDDm8EUIlOb6TWYBGNPGLXETlQQ2bzhB
 RcZZlGzvZVWZSQEKQCWsjFd0R6mutYEkHTJjPP/WqEGG58qnXinCBj3tGcBkFez7ts
 VQd1/HxrzHnmh+yQXi56Vj0jdnHAbfb/LaqiPa9He46o97psWZe9QP+fzJWYblHrov
 h8WlHxsPeG49kN5WE8cr5/yRcyBIL4siGxbssbTNj5YoxwAtQXcwT/E0CZSfEfSyTb
 Ev4j/OHafVUqXZaOBWPoQCTDmTJYQjaJIPCTmR5HBzY7ne6qJxbYEsuItjnrYF5+zV
 dYIp7urGEP64g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=XBJSHBYM
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version to
 20.6.1-Nexus
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
index c61c391825..286cff5cc4 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eb21e185d1333a8696565138bc58df3d37970c9a3615193396e9f296a56a24c4  kodi-pvr-mythtv-20.5.10-Nexus.tar.gz
+sha256  4c742a31ec6f4d2a427d05f70950cfd4e347cf1c0acdb1747c39eb68124be30a  kodi-pvr-mythtv-20.6.1-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 66f1948741..312c8619be 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 20.5.10-Nexus
+KODI_PVR_MYTHTV_VERSION = 20.6.1-Nexus
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
