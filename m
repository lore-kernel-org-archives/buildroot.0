Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83735C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 17:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EDDC4079C;
	Sun, 18 May 2025 17:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdjX1fy1hIdg; Sun, 18 May 2025 17:44:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB2884077C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB2884077C;
	Sun, 18 May 2025 17:44:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 77AA21BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D424405D3
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id byZPcETcGrRW for <buildroot@buildroot.org>;
 Sun, 18 May 2025 17:44:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B84440787
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B84440787
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B84440787
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:44:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1021EA4C2059
 for <buildroot@buildroot.org>; Sun, 18 May 2025 19:44:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44140)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGi3Z-000000003UR-196V
 for buildroot@buildroot.org; Sun, 18 May 2025 17:44:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 19:44:13 +0200
Message-Id: <20250518174413.2148870-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250518174413.2148870-1-bernd@kuhls.net>
References: <20250518174413.2148870-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747590254;
 bh=rShxVU2D0in+I07tmkPcy/jTKvta3kpnEsztHZLvMr8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Qp7oj9/Iefu9FcKRfsrjY0b+cFcnDF5/+Nn6XVNWKCBF2iKGPwEu9V5ytSabt9+25
 GHcw+P26hXzPT/gKXqZ3ALSd9lC0sUCAd6rqECBSWGjSPv5jcaYE9E7yEJpqWREFvc
 nyiG20kZwiAFjm4uvxtZYsFQwkshyM4qJd+wqzDb4HPUhmakY1x7hq9qtgm5iHR+oy
 TRpcS+yO91P1DHVpFnMRdij2ZIvgqQpxcnfnIpHBal8TfQhYZYfBVj8D6EglWYYCxD
 JAF19kijKTW+6joGUHwB3dXFqUQ+y21ykUl/Uw07O8IgtksKPcwGeJJvm1c76US3hk
 LV5zaFJDnXcVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=Qp7oj9/I
Subject: [Buildroot] [PATCH 2/2] package/alsa-utils: bump version to 1.2.14
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

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.13_v1.2.14#alsa-utils

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index c43ffd62cb..fd03588294 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1702a6b1cdf9ba3e996ecbc1ddcf9171e6808f5961d503d0f27e80ee162f1daa  alsa-utils-1.2.13.tar.bz2
+sha256  0794c74d33fed943e7c50609c13089e409312b6c403d6ae8984fc429c0960741  alsa-utils-1.2.14.tar.bz2
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index cb5129ece3..64da2201bf 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.2.13
+ALSA_UTILS_VERSION = 1.2.14
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
