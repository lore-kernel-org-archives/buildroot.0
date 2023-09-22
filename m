Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7A5CD4852
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 19:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2E6F616B5;
	Fri, 22 Sep 2023 19:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2E6F616B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4weTyMNg7sjt; Fri, 22 Sep 2023 19:17:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB4BC61690;
	Fri, 22 Sep 2023 19:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB4BC61690
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C369E1BF21A
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D2CC40535
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D2CC40535
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lr5lUI4P15ai for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 19:17:48 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5A724048D
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 19:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5A724048D
Received: from fli4l.lan.fli4l (p5b3a0af9.dip0.t-ipconnect.de [91.58.10.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9FF94A4C111A
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 21:16:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49004)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qjle3-00013Y-0N
 for buildroot@buildroot.org; Fri, 22 Sep 2023 21:16:55 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 22 Sep 2023 21:16:53 +0200
Message-Id: <20230922191654.2155418-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922191654.2155418-1-bernd@kuhls.net>
References: <20230922191654.2155418-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695410215;
 bh=aHU1Do9JEpsG6t6CFuTs5zUOr3k/CvtvEvfKMm7ZedY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qThl52oB+oTCBJmfhc4hKcSXrFu12amI5b0bVvc3cvDezdVkf1KV+zUQ/8+iT/CoH
 +v4QzQRzrWFR6HkYcyn8Wl0L8hzbRtDWHkQWiAjTK413TvZNz+5muGDcG4JbKNWQWM
 4H3v+Tod3wa4F/3SuscnGWObONamrrRkyLnfk+j0Y9MIJeGcypzR1ojEtiiov6DsAk
 Q+kEvt3SWu4XFEJLvTvJXG2dgAM6kn4T94zz79wNGNEAHmI9uVLBxz1Mz4hhSrGuL0
 rRQ+gEGbrK1Tpa4GdxWmQ3WlhryxUBh/CHng4YVi1eAi2KKSKqNE2z/OfP0BxBVGpS
 +AdRCJ5jw2IoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=qThl52oB
Subject: [Buildroot] [PATCH 4/5] package/kodi-pvr-plutotv: bump version to
 20.3.1a-Nexus
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
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
index 36a9dd4187..0c56c8b6b4 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d38a6bf4debc442849d01faedadcccb1b07debe850cd3c9a5789508233d22256  kodi-pvr-plutotv-20.3.0-Nexus.tar.gz
+sha256  11505556200029a48a293e97f94e0469a5f78580d0e56d5d0a1da05d61f0f5b5  kodi-pvr-plutotv-20.3.1a-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
index b05c452854..fadb47efaf 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PLUTOTV_VERSION = 20.3.0-Nexus
+KODI_PVR_PLUTOTV_VERSION = 20.3.1a-Nexus
 KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
 KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
 KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
