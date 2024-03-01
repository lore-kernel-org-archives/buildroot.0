Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19B8C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 22:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70D8341FC6;
	Fri,  1 Mar 2024 22:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LCvR1E2onk3E; Fri,  1 Mar 2024 22:03:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8717141FC8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8717141FC8;
	Fri,  1 Mar 2024 22:03:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F8901BF32C
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 22:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 540FF83BB2
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 22:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IYFWG0EXXo0x for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 22:03:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5956083A67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5956083A67
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5956083A67
 for <buildroot@busybox.net>; Fri,  1 Mar 2024 22:03:36 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-412cbf58fdeso4531415e9.3
 for <buildroot@busybox.net>; Fri, 01 Mar 2024 14:03:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709330614; x=1709935414;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LqSqWv7jdO2mr59mTBXuDoYwSk+bZ7nuuHgvrFndMBA=;
 b=MbMw8pkDl18RBbjSAC+VAJGpcu4AzflqrRy96cCzkcnuS8KOwlkGhzhYu5Q/O0j2oc
 H/NKRmTvFa0uq6U2b0sLhjAk2QWM/tplg37cHVX5+NpLTgm1EoGGfq+2SUVtyfblpyfa
 9q2AQivIfjhOtf4N4ofeNCcrD6HBrJ0J2BNi9aMklhu/NdnMFzt98WFIQduYpFbs3xRz
 qlQq6xfh90og590OcuzZAoZXnyjg3RqiSb5BRq23zvKIoL6HkNC45yRQvAmDgE53Ysvl
 v/SYmQpfyaT+mwrxUAtQQzoDde5BXmiHoyoeQDUZeWU9zP5GkuG6+Pe51vnSn0+Iovbj
 EAEA==
X-Gm-Message-State: AOJu0YwxpCyxR7k8l5VQWwubJB7kA6AmEfjZ/1zyEzt8CURHW1WeAc+4
 D94ERss0ojl3V2VpclTDnH9EREZD8hZs668MNGDP1B0wnFF7EEKZ3F7QmDrF
X-Google-Smtp-Source: AGHT+IH0t3uxsidVMJTNTpJTlfRu7rWFNPY7uag2Yh2Iu2B0kIEdPOW0vSBD22z7vaf5Gbx7hgoa0g==
X-Received: by 2002:a05:6000:1cd2:b0:33d:ab46:22d1 with SMTP id
 bf18-20020a0560001cd200b0033dab4622d1mr1974414wrb.29.1709330614069; 
 Fri, 01 Mar 2024 14:03:34 -0800 (PST)
Received: from xubuntu-23.. ([37.66.33.127]) by smtp.gmail.com with ESMTPSA id
 g3-20020adfe403000000b0033af3a43e91sm5598642wrm.46.2024.03.01.14.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 14:03:33 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  1 Mar 2024 23:03:31 +0100
Message-Id: <20240301220331.315093-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709330614; x=1709935414; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LqSqWv7jdO2mr59mTBXuDoYwSk+bZ7nuuHgvrFndMBA=;
 b=jZuljiuZ8WczEsktt9KOyDnuHopEhWNoxhqPVL7G8gzj1UZf5PecBnEUtV3jXIbfF2
 QwpxBpCnARD1KvG6Kth8MXeOZyU6kxREHkySJp5iyoUkwTo9TyYG+THcydfbrbAB+dgj
 05Z88R1Scg0kcSPaAntfKXTpL7zBhdCv9K4zh4R3+IwS4wlB+mFEaaS6qaj4t+g6IaLW
 /yTQ1VfVX7eJa8jCrBT0nsRXCxyhgdOAgbYs4iL2PZ1990HwYewQGFKhnitzKI2xen77
 5P3kHu4yEqGTzM7XtHwY5fG2DwvPZ9qdpAOvKsWTOytT6vyhuUbtSzIHW387GHoXu91W
 CHjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jZuljiuZ
Subject: [Buildroot] [PATCH] package/mc: bump to version 4.8.31
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/mc/mc.hash | 4 ++--
 package/mc/mc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index 93462afa6..84ea4b2ac 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,4 +1,4 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.30.sha256
-sha256  5ebc3cb2144b970c5149fda556c4ad50b78780494696cdf2d14a53204c95c7df  mc-4.8.30.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.31.sha256
+sha256  24191cf8667675b8e31fc4a9d18a0a65bdc0598c2c5c4ea092494cd13ab4ab1a  mc-4.8.31.tar.xz
 # sha256 locally computed:
 sha256  5576bbec76296e1c8e081f7037ebd01bdada388635f58d844a2f20d37bbe4284  COPYING
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 2b4279c30..a6c3e0bc8 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.30
+MC_VERSION = 4.8.31
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
