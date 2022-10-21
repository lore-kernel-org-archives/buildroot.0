Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE352C433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 22:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A720418B0;
	Fri, 21 Oct 2022 22:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A720418B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7nswEfq7cWh1; Fri, 21 Oct 2022 22:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97EBA41859;
	Fri, 21 Oct 2022 22:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97EBA41859
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D23FB1BF94D
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD9AB60E7F
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD9AB60E7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YIB81yXfKgAp for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 22:36:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8968B60E79
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8968B60E79
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 22:36:35 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id iv17so3166364wmb.4
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 15:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ONKNyuPVR5BBup0RXv6gSj0lS3f3nB2zuZRupFa7DtM=;
 b=ymiwlno5+JDNnTKZln69kn+GnBGzeUCfINNb2MvfFBN5eIfQ3NFbMQ8YaZGFDT647T
 AjNupqM0AocffOczaTJCZHsBfWgOtOu2aXaXzTNROJObKSRA28D1+Aj15y2QWgRL7oGO
 35Vsnq9t4x4nMM8ClHbb7Wjpccr73Oj7lMy1MBZP1WucVGRN1A0/0cNWlTaUj2c4amDN
 hVcaXGFJ2sxqptiDS/QfwanPZPslS3rsMF5X6JvbGts0nVj4VyUqautFSgylXrLrBPG5
 /de2xcbVjpi4Q5LkMgMU7SGAF1Qhzflj5e5a3DK7moQMpk64P7vXT7JPFTZGzt4liIpU
 UEXg==
X-Gm-Message-State: ACrzQf23bufpr2BayeE4N50TBPUuSNa4N8XuMmqF9tXpnFP/vYtYP7z3
 flBaozbu58y4MpOpXpsGZazCS8LbTIA=
X-Google-Smtp-Source: AMsMyM4lPzz8boFo4q9e1GT0UcqFI24R0xCIiwG2ylpjPhOT5brF0BgwLCX3DuwcoGMCNTEqwVb0Sg==
X-Received: by 2002:a1c:7716:0:b0:3c5:6e61:bd1d with SMTP id
 t22-20020a1c7716000000b003c56e61bd1dmr35345145wmi.17.1666391793371; 
 Fri, 21 Oct 2022 15:36:33 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 x6-20020a5d54c6000000b0022e2c38f8basm19785209wrv.14.2022.10.21.15.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 15:36:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 00:36:30 +0200
Message-Id: <20221021223630.122214-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ONKNyuPVR5BBup0RXv6gSj0lS3f3nB2zuZRupFa7DtM=;
 b=gjhHvsVpAEGjRTXuoXMFQvdbQ/eS9uOEANXSFpGRBx2W3hkKGpzXI7N2IAP0pxSEda
 2qeOTG7qTw6ZrU+dVeH0M4BoXAYE+BVdp3HLXgER8TVIU7UKC+4Fbhdm3y/cpKDyFHnh
 3zUWQRkZFLkaYQ/YLUfTOjB8+ANgxud1680dXFVyyGtyXv3LfksbMRFT3WujTmRtDs9S
 WvW/472p/w4X5E8KQnyWbHw1MZmY04oUt/3S9jN0KDU28vHjww76MLZuCAcwVlycqjSb
 GGS+mKgeG1uABzF+z43+vHp8poaOipx9QToVrZMztRrPjBHPVXVloO39LNK1oKsXkrgS
 PlkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gjhHvsVp
Subject: [Buildroot] [PATCH 1/1] package/libdmtx: bump to version 0.7.7
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

https://github.com/dmtx/libdmtx/compare/v0.7.5...v0.7.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdmtx/libdmtx.hash | 2 +-
 package/libdmtx/libdmtx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libdmtx/libdmtx.hash b/package/libdmtx/libdmtx.hash
index 98eef9aeeb..8b176d737a 100644
--- a/package/libdmtx/libdmtx.hash
+++ b/package/libdmtx/libdmtx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  be0c5275695a732a5f434ded1fcc232aa63b1a6015c00044fe87f3a689b75f2e  libdmtx-0.7.5.tar.gz
+sha256  7aa62adcefdd6e24bdabeb82b3ce41a8d35f4a0c95ab0c4438206aecafd6e1a1  libdmtx-0.7.7.tar.gz
 sha256  fcc277b7302645322c63de22b9b0bdae2df3dfa7d6cbc0d5bed7a4d3f1a9af79  LICENSE
diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
index 04e089f1f7..00d37fb94e 100644
--- a/package/libdmtx/libdmtx.mk
+++ b/package/libdmtx/libdmtx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDMTX_VERSION = 0.7.5
+LIBDMTX_VERSION = 0.7.7
 LIBDMTX_SITE = $(call github,dmtx,libdmtx,v$(LIBDMTX_VERSION))
 LIBDMTX_LICENSE = BSD-2-Clause or Special Permission
 LIBDMTX_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
