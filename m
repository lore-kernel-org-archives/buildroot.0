Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B96C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A186400CF;
	Sun,  7 Jan 2024 16:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A186400CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SqCJh1pF30ex; Sun,  7 Jan 2024 16:13:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71D0D400D0;
	Sun,  7 Jan 2024 16:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71D0D400D0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D4AD1BF38B
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 066B481454
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 066B481454
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kNz7xv_Rrl_X for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:13:50 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86EB381450
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86EB381450
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d604b4b30so11131765e9.1
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 08:13:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704644028; x=1705248828;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SD9b0Zi9fb2G7oaNWaDtfZqEi3y0eq0+qF+B1bDy7jE=;
 b=ozHABGFYF9b9RTyLyjjuvUKxpSWhrfBbZqGq2riZDFHZvS36GxsRgjUfOn4CY4W6Fz
 /iDBC/OD76pU+bcdoG8icErRt0yS8GfksjifY7dp/IfQ6I5VucSvemixs/pjZjN+hxha
 AEdjcgiH7E0c/NgqrFLyV1YH1pDuBpu382zQ74czwMAuQkCDMrYiiO6bJoqZfeXc8BuR
 fKLBYG2iCWjMC9XuSCmL9sOzvM/7ykgKrZn3SlzhWTtiYtYzCojhw3IzyKle2pdfz2pR
 ebgTiZLb/JRObqg/xGQ1HIs9lqXsoUECMD7B/llNHQT6fbS9olMjYoUPSbXa84wthEUI
 qrtg==
X-Gm-Message-State: AOJu0Yzf0jYkqZGWPRdBuoPn4E1CraSoxCPLs1LlVp55DXn//XYbzYS+
 /PQZesMg/yPvcMh4pMh/Xl+0AsjRm5c=
X-Google-Smtp-Source: AGHT+IFpKOrK1Tt2Ot8H/sykRZrEzQfWfQYOWIY8gqhBkPscSkrE/975A4VGhg1Cb1KFT1vOJWC+ow==
X-Received: by 2002:a05:600c:4ec7:b0:40d:8893:cede with SMTP id
 g7-20020a05600c4ec700b0040d8893cedemr1072211wmq.88.1704644028046; 
 Sun, 07 Jan 2024 08:13:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fa13-20020a05600c518d00b0040e45518c1csm1827885wmb.18.2024.01.07.08.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 08:13:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 17:13:44 +0100
Message-ID: <20240107161345.23687-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704644028; x=1705248828; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SD9b0Zi9fb2G7oaNWaDtfZqEi3y0eq0+qF+B1bDy7jE=;
 b=lXyn7bMrb6OPUdzEOtNBVZJkprhEq6OHWrF0kETE1UOOHzUDiZ2pPvfM1lwnjYIBea
 xm0tap2nosOzzKN27+EnooU4jmhPT0hP10r3zwXkV2R4HnNN0uAvWEz+xtlwcSYhJ3HQ
 ckm51br32jsQJgv5fXRqIzoOv1gJgVGbQ2s3kuXqcgAXOQamNIfq2mtSwWQDcHH1CvDf
 oCN5HOMeNNFpSSPtj87x+oVqRQ5Wp9mB5q1elq7l49YSPTR/ldsf7XOjS0dptdnxD/Bx
 uPTiZdgodp7e73ROgUPtV2zamMDMqApvI4TO/u1gFqVFbosm//ZJ7KSJQxZEh0GGMahC
 iR4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lXyn7bMr
Subject: [Buildroot] [PATCH 1/1] package/lvm2: add blkid optional dependency
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

blkid is an optional dependency which is enabled by default since bump
to version 2.02.106 in commit f4106ef191cb699e9c4d244c68e462d860c4fa35 and
https://gitlab.com/lvmteam/lvm2/-/commit/9bfc0be493192958f5dbffea4eb7dda968062261

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lvm2/lvm2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 474ea30bdc..7a7dc2247a 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -48,6 +48,13 @@ else
 LVM2_CONF_OPTS += --disable-selinux
 endif
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
+LVM2_DEPENDENCIES += util-linux
+LVM2_CONF_OPTS += --enable-blkid_wiping
+else
+LVM2_CONF_OPTS += --disable-blkid_wiping
+endif
+
 ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),y)
 LVM2_DEPENDENCIES += libaio
 LVM2_INSTALL_STAGING_OPTS += install
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
