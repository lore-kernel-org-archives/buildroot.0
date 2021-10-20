Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4887CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 19:05:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9694611B0
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 19:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9694611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ECC860B18;
	Wed, 20 Oct 2021 19:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UoknmXrb8vmX; Wed, 20 Oct 2021 19:05:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0DD86084F;
	Wed, 20 Oct 2021 19:05:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA9321BF3F3
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 19:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA1048354B
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 19:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hfmL2bN_rxXG for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 19:05:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE280834FE
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 19:05:53 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id m22so420694wrb.0
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 12:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LwGkh4/lGpf926p1E2oKGh9Dt5N8sUN1e+DDDyibyG0=;
 b=Tw44uy5IqHCoIRiXOcLp397xQNNq8U/yE7Mb4BDDYs1+NFmhxn/CUi9B+yzqb/i+1M
 P2sZ5VZBeWcv7T9tdQUTa+8BKfUo9bKJDUfGJoDIbNOUQd+bDs0z/ts4Ydxki1VavQjw
 tGkBcvkddV7ymTUUI2wUiBY7McqGC1+cGLfdYZzpqu8PS49wo80OzvcXSn/LyKoVXipW
 RRPkfVaC1vUGAyKEMAdgaD/QF1kiAdBdBiiWfI4GGCQ+QDhjYaQNygAEl0IGDwjKDVoo
 PzWrs2mR602rBEx4AUxOeRO4XIaHl0wc3PG72mCUKSXqXzJGqlYZtZP2i+rn4Svp03j2
 UxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LwGkh4/lGpf926p1E2oKGh9Dt5N8sUN1e+DDDyibyG0=;
 b=SnMvLyTbqznpTE7ToRHHO4xkTmfAnDc4jsipeVLty79qyvZuwARr3Duwd8NxlmvTfw
 VWg7BXk4d9uOHQSoQTirCGgWDUWHbPpMWwu1PlgjYHpwnlIYHjgTF6+GE7Yhkrn39xdU
 S2VZQPyYcDJ3hCWTr2MP9m7II8M1oviOvcAbNt3dsHqWo2ogTojHKnk8UGn63ftRsr+S
 Ew9t6WOKsqMME20MjX+04fDrVxbtGXPPHihO/t/pMvhPSZ1XkWjxwzyRQnorXERQiga0
 UvYjjF6WdRoUyPvKGuhkKt0crTyoQrRObfrcyeCl8FIpEGQjeusfz5GHF/+wvfwJSX9Z
 I/Cw==
X-Gm-Message-State: AOAM531k0KbxHmNF+i4Ks/1cE+QToS3ryLisSxbXqyseT1SxocRzMQ7X
 i+lpmJ7rcZ3u8gtc0xo4kkaoZeH98fc=
X-Google-Smtp-Source: ABdhPJx2Vwu7pbgAqeZZgpL/F/UrgWvpLkDdAZcAFwfMBA0ZYnafMBHU2nIK6EQ88hgx5lnh4iDSWg==
X-Received: by 2002:adf:bb08:: with SMTP id r8mr1275810wrg.247.1634756751564; 
 Wed, 20 Oct 2021 12:05:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id l2sm6441705wmi.1.2021.10.20.12.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 12:05:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 21:04:23 +0200
Message-Id: <20211020190423.3547893-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcamera: disable compliance tool
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable compliance tool to fix the following build failure
raised since commit e1d37ab0a7b2b8735e69c070519978d2898d2e79 and
https://git.linuxtv.org/libcamera.git/commit/?id=02bc1108578e8b8eb68fa7d9ae3eeea558723931:

/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lgtest

Fixes:
 - http://autobuild.buildroot.org/results/e1bb8aa1de310f3d27b74ec7d8748d170ad444e2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcamera/libcamera.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 8ab95fb42a..638c9ac553 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -17,6 +17,7 @@ LIBCAMERA_DEPENDENCIES = \
 LIBCAMERA_CONF_OPTS = \
 	-Dandroid=disabled \
 	-Ddocumentation=disabled \
+	-Dlc-compliance=disabled \
 	-Dtest=false \
 	-Dwerror=false
 LIBCAMERA_INSTALL_STAGING = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
