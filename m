Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284CAECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 06:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88FFD60B01;
	Sun, 28 Aug 2022 06:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88FFD60B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DiS1OHJrKCHv; Sun, 28 Aug 2022 06:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BA9760AEE;
	Sun, 28 Aug 2022 06:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BA9760AEE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 70C801BF2E4
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 06:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BDE6402E0
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 06:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BDE6402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QhebR30KPHSS for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 06:10:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CDA940137
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CDA940137
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 06:10:44 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 m3-20020a05600c3b0300b003a5e0557150so5040022wms.0
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 23:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=MqXlUXsvXN22BjweoJH5WTs+5+N7Cl6F6auu18hso8A=;
 b=RmGbEH6E59rrwiRXdF1JAPJ9W38xfKTamnWTSvTWQSWTbRttRgUGczrJ1RluPBvFnq
 yLNvtno2aYhPr7c/2JRtSh/EtN9sW4y35R9eRvXaWnlaN7tymnDIaVGRs3kh/22j+RCo
 Ka4MNYMGdB0f447Cq8dl9pmnCu4nGJ1ZnzYc9HseGRsEMNOUpsNhYwgQjq3PKUfuuYeO
 cpFJBxuuXs7J+d311+0ZtNAYCM4iQAVT/5+sp6+Gxs2ddg2Z9EUWNUbVcP/KZFI/r6Vx
 4s9GFSRtETTItHBf3SEt9XWKjamfZA6b4fHSGR+YfApgBTQITl0OvZboS+JrLErpH8BD
 a5xA==
X-Gm-Message-State: ACgBeo318Zot3I1s72HaMWH47u+Gh7Cdfo+lFvF7Q1AFR2DmQ68ZQV3w
 EqpyQnQW+6njEn17F9tw40XxW2vxjbI=
X-Google-Smtp-Source: AA6agR5SxQovroxH5NrvIUg+RTaBvzO9Re9sAaS6b+4shV/upjgG2nMojB96K//v/qoU5YoiSRteag==
X-Received: by 2002:a05:600c:1546:b0:3a6:a99:aa7 with SMTP id
 f6-20020a05600c154600b003a60a990aa7mr3522329wmg.109.1661667042197; 
 Sat, 27 Aug 2022 23:10:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j18-20020adfea52000000b002206203ed3dsm3718329wrn.29.2022.08.27.23.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 23:10:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 08:10:38 +0200
Message-Id: <20220828061038.36755-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=MqXlUXsvXN22BjweoJH5WTs+5+N7Cl6F6auu18hso8A=;
 b=kidBlxZVCc50BPuUdk6wFUVX780pKYySMM6GH7QNg/L3a3Q3Qev20SKZtn45viIuhC
 MfZjRafthymlCiue1sqra+2AQLwLAGSAy49TzarYq6YXPMtcjBPdIVIOkGpzWJRT8X4x
 N1mulroJYb+ji77VXjZoEbTz1sLviy47zShTrk74M2pDWjToMbdBkOr/VRORVs9JGqwQ
 6QQlrOihDO2ek8BQIevlshgHlGvoL0vxH7GeNyn70DsOlteCq6PBXpsnKpYEQXmbof1V
 eysbw5fBp2NHmySg7lZX8tcHmrK+kDRtAzr6UaMEdd85yZCLsILJZ/Dh2m/mXeb6jlzj
 uaWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kidBlxZV
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 9.0.0292
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-2257, CVE-2022-2264, CVE-2022-2284, CVE-2022-2285,
CVE-2022-2286, CVE-2022-2287, CVE-2022-2288, CVE-2022-2289,
CVE-2022-2304, CVE-2022-2343, CVE-2022-2344, CVE-2022-2345,
CVE-2022-2522, CVE-2022-2571, CVE-2022-2580, CVE-2022-2581,
CVE-2022-2598, CVE-2022-2816, CVE-2022-2817, CVE-2022-2819,
CVE-2022-2845, CVE-2022-2849, CVE-2022-2862, CVE-2022-2874,
CVE-2022-2889, CVE-2022-2923, CVE-2022-2946, CVE-2022-2980
CVE-2022-2982

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 62b11fea7b..f06d084cb3 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  86aa403632beea5827f305e471a245d14ee9c79072f67ce8e9536169a1deaad9  vim-9.0.0008.tar.gz
+sha256  7c97f8e8cc56157cad7d461633beb347472e134e96b5545d24d1fe451dfaecc2  vim-9.0.0292.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  4afae7c984ab1a4ccd0b474a695f316e7435ab6ed46537648af925c18835d853  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index c3308b4542..5e7c34abbb 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.0008
+VIM_VERSION = 9.0.0292
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
