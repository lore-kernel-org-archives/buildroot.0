Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BFDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 09:54:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E092461056
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 09:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E092461056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0C3560653;
	Sun, 19 Sep 2021 09:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TbAoaIKkGpxp; Sun, 19 Sep 2021 09:54:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAEA7605A4;
	Sun, 19 Sep 2021 09:54:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A9BE1BF5E6
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 09:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 664CB605A4
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 09:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id munoJ0ae9Lu5 for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 09:54:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4812260599
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 09:54:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id w29so23140487wra.8
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 02:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7thYiX1SMgzAXPDcdV1plOYW6uojEaJad82Mbxpf9OI=;
 b=nBB1hhEmMCf0mqkLUC/PoPvXkLc3NLU2tzpryqUXNWLaFZz5bAyyeqjCdWz7KStf+y
 YJjsCZk2YrbRain7qMRTAJuiWsdIVWSWxKR/X3Ih2JzBvkDQaX5P1qn2frspcctqIDvW
 VPWi2Dznlemy+VjgRysDfvwFmGBKwMSV3DOwDOCt5TqwjfImVMkyIHhNl5llytSxKDhr
 6AvGy9qVs3Gj54kS1gxdvUFlmSbHabay6bTl1GS/gTRyiTp6me/B3PIlbhTSuEOt/diw
 yCz4a3p+xRRLhNm6e9p2O2zdi5c73pc5t4r72K6NhQP6nNM572JnFFr9faeXKbcKWolB
 SqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7thYiX1SMgzAXPDcdV1plOYW6uojEaJad82Mbxpf9OI=;
 b=hklqayBlQ6UOSNVODlUboPXFHncc/7sEIpdFTnLpAegQhMv4v2Z396H4mxeFOMdhgX
 DWAicYdK4ad9WyyBS+UZV/jGvQ0+20MjKE5PWtIVAalN9vAq68N4Gb8pKy+WmrbPQrbQ
 R2ybve1kv0V3QYxSoaBbNg1pAG5eUASnSaxlGWjgEBIwG37kk+/GsPkTtmv3KSLPYFL1
 zB+Xo+TCSU5qaQ/VPCSZRhZmYhAIe9pTMi7cnbtEAj3ZeIKVdaVSjeOBapeI+SRNP72x
 lgvVBQ/yNEQ+R01zROW9/kdmlQPNcMjcC7A65+yoznM5j26L0HBRdhzEpf+qrKcTjRhU
 VmTw==
X-Gm-Message-State: AOAM5317xI+aBOW9qHz8MVY6qa+Geg8NrNPeSALVJUJ9AzDbvTRCOmV+
 cTmdN/tWvHMy3t0VkeOS2ecDUoFTEXA=
X-Google-Smtp-Source: ABdhPJxwlcWIVIYsp537FLyTF1j/qQTBFmPl2TeUUXHyKbGVRNW/TUuIm8aORk8OfB0UlsMbzee1lg==
X-Received: by 2002:a5d:4f88:: with SMTP id d8mr22409528wru.358.1632045266130; 
 Sun, 19 Sep 2021 02:54:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id n17sm12311910wrp.17.2021.09.19.02.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 02:54:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 11:53:43 +0200
Message-Id: <20210919095343.2057376-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cppzmq: bump to version 4.8.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

https://github.com/zeromq/cppzmq/releases/tag/v4.8.1
https://github.com/zeromq/cppzmq/releases/tag/v4.8.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cppzmq/cppzmq.hash | 2 +-
 package/cppzmq/cppzmq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cppzmq/cppzmq.hash b/package/cppzmq/cppzmq.hash
index 4fd07b4052..31b93275df 100644
--- a/package/cppzmq/cppzmq.hash
+++ b/package/cppzmq/cppzmq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9853e0437d834cbed5d3c223bf1d755cadee70e7c964c6e42c4c6783dee5d02c  cppzmq-4.7.1.tar.gz
+sha256  7a23639a45f3a0049e11a188e29aaedd10b2f4845f0000cf3e22d6774ebde0af  cppzmq-4.8.1.tar.gz
 sha256  7e6db90e2e805c72b3daa77849d1cb5f1f92da0e69750c8a4aa1d86d70704748  LICENSE
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index ccab92e2ef..570ad4e3a3 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPZMQ_VERSION = 4.7.1
+CPPZMQ_VERSION = 4.8.1
 CPPZMQ_SITE = $(call github,zeromq,cppzmq,v$(CPPZMQ_VERSION))
 CPPZMQ_INSTALL_STAGING = YES
 CPPZMQ_DEPENDENCIES = host-pkgconf zeromq
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
