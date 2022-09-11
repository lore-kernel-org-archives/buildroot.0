Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2A7C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 10:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2698F41970;
	Sun, 11 Sep 2022 10:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2698F41970
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 46OUEWmB0szc; Sun, 11 Sep 2022 10:41:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AFD9419E6;
	Sun, 11 Sep 2022 10:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AFD9419E6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A7601BF5F5
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 10:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6E7C61053
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 10:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6E7C61053
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6lXDOxlHXvXk for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 10:41:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E473A6102C
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E473A6102C
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 10:41:10 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e16so10881528wrx.7
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 03:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=NDW286GvNzTafjDpNYVgBbGj4UFf/DcBsf/g83jgABU=;
 b=40Fkv6v0VioEtREf4TATpwevozc28E1win5sryjnBXo5LIsko7iKFRcxovMkO9vy4H
 LERkRAiHEfoEgNO7ywhwSx8I/qOVEgqiCLiQ8yPLkwEd25hb3UsyFegOR6JQqucZ9mpv
 FxfN/Mnr9KkPiQXx/AuZ8xcbT1+yIATTzMoIZieiOQLD+Zs7KqbyMUsm7MSxNBjeq3sO
 oH86LtFfwZMX3kgRl3fNAVuTVVHlb/unhZdvKvvajek0XY0HRNkD3hXgUtBGvUYvPgP6
 SKVOsrSFxxLZATkNkuWHoYnmGdW+VRxwc+n++NvypEtqvbHC7sS2zX5RhaotRaB4OnND
 G+Uw==
X-Gm-Message-State: ACgBeo2hpIROrY1VUIoHzkBBY/4PjaTblOO9svkr+z1Ke1Nw6a+Z8CUG
 OvYuLcquuVd+Kr3qtij/znR41NTL0Gc=
X-Google-Smtp-Source: AA6agR78tPluUPNzxW+vYzRS4iCmUPOmlSPN4BonKxtJk3OgAOG2aPuP3Jj8mO38bFG+Zw208LtCuQ==
X-Received: by 2002:adf:fac1:0:b0:226:d790:7644 with SMTP id
 a1-20020adffac1000000b00226d7907644mr12064826wrs.471.1662892868805; 
 Sun, 11 Sep 2022 03:41:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j13-20020adff54d000000b00229d55994e0sm4571292wrp.59.2022.09.11.03.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 03:41:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 12:40:58 +0200
Message-Id: <20220911104058.8928-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=NDW286GvNzTafjDpNYVgBbGj4UFf/DcBsf/g83jgABU=;
 b=CEzcnUXSHDEIKDPoaqqGgKMTmIrrJx6gPSE7giH3lxIBK5fKT9aZyi8+v96eNuO7pH
 JPsVu/Ypn0zNAM0c3I5AU2J5OCT5I7ntVSCIwSS1Oah2dKqLnmHbg3/gOXzoukm7kvQk
 KKxEcrHSWN4tzysYOtbuBrR93qHi1CjVYOFG38n3JuD+2X2EhMj/5tReaZ/pGchDO7Sc
 lo+4zcO790m0rz1EEtlAcKDByyrHwaw6KQr5/tLYpOk00k1yB07z/FBdxKlyqFvL7Wcp
 VxetPVPGpm4ORK+wD3tXYcx/6fE/cm4LcUllfx6SxWDttohC+TV9oGVMLkbsYCVfyUYJ
 a4fQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CEzcnUXS
Subject: [Buildroot] [PATCH 1/1] package/qlibc: bump to version 2.4.6
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

This is a maintenance release that includes improvements and bug fixes.

https://github.com/wolkykim/qlibc/releases/tag/v2.4.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qlibc/qlibc.hash | 2 +-
 package/qlibc/qlibc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qlibc/qlibc.hash b/package/qlibc/qlibc.hash
index 6abb16b274..5cd6e1860f 100644
--- a/package/qlibc/qlibc.hash
+++ b/package/qlibc/qlibc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e195c97453c260acea4421146ba992d9a4d89732eac345b3765c43cc3326d2ad  qlibc-2.4.5.tar.gz
+sha256  bd98c19f96c0d374adb69c99627c80cf967b5e860c8a4f28c13fa1b0d652a06e  qlibc-2.4.6.tar.gz
 sha256  7c9d03656af4c0acf0a35e29459086498dd64080eac6d2945bc1c064aaf18132  LICENSE
diff --git a/package/qlibc/qlibc.mk b/package/qlibc/qlibc.mk
index 6cce8201bd..3996bb3706 100644
--- a/package/qlibc/qlibc.mk
+++ b/package/qlibc/qlibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QLIBC_VERSION = 2.4.5
+QLIBC_VERSION = 2.4.6
 QLIBC_SITE = $(call github,wolkykim,qlibc,v$(QLIBC_VERSION))
 QLIBC_LICENSE = BSD-2-Clause
 QLIBC_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
