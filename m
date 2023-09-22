Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9C7CD4855
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 19:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62DA461690;
	Fri, 22 Sep 2023 19:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62DA461690
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUOJbL36A8wg; Fri, 22 Sep 2023 19:17:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F4D560BC8;
	Fri, 22 Sep 2023 19:17:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F4D560BC8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8000C1BF21A
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C28F40291
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C28F40291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tS6UnkvTLbZH for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 19:16:59 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9347D40281
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 19:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9347D40281
Received: from fli4l.lan.fli4l (p5b3a0af9.dip0.t-ipconnect.de [91.58.10.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 80EC2A4C0B4C
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 21:16:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49004)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qjle3-00013Y-0C
 for buildroot@buildroot.org; Fri, 22 Sep 2023 21:16:55 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 22 Sep 2023 21:16:52 +0200
Message-Id: <20230922191654.2155418-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922191654.2155418-1-bernd@kuhls.net>
References: <20230922191654.2155418-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695410215;
 bh=Lz88hAK5wx/1bwOqmawZSeWrxsoCfloSEHabsvBM/5I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=z9+9oezpwUMPjsKXjBh6PW883pHSP4JPrbMNxc/vQEkMm2VWUz6LkqS9dn2qQ2jyQ
 ArHapaJG2Nik1aN3VeBaa2sKhT2+yrHX/66xA7bsZ1sTpD4sQzN2bzj9f9DiCK1GOw
 43dGj0FHaEVe3jrXbKTgB7hau8YMocmlDtsH7/v/em6mYAj/mGwwCZykyoMIdVFIBD
 +PNPdUUzw05W8fYrS5dOl8rP0fodYrpy1Tf6U8124UiWcRtOWX1Lc+5cQouxtAxBE3
 SPaI7XuKJX26Y6xIa3P1E/NN/wmpKR2aRPmIMjZCSwmglq5St9ILqc9MVjC9FnT3l2
 oda3wavbfc3FQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=z9+9oezp
Subject: [Buildroot] [PATCH 3/5] package/kodi-pvr-mythtv: bump version to
 20.5.5-Nexus
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
index ce8f68d3b5..49924265bf 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  344750ba617b261a4559ba8314107b7e90e9a37b6b1a6cccb9077e5b2f63694d  kodi-pvr-mythtv-20.4.0-Nexus.tar.gz
+sha256  2d3fc88dfdfd5e1084abab08424863dc40674472f0b48a1df7eef7c3692dd44a  kodi-pvr-mythtv-20.5.5-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 2038b9016e..6763d97947 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 20.4.0-Nexus
+KODI_PVR_MYTHTV_VERSION = 20.5.5-Nexus
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
