Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28D8C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 22:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FE1F82159;
	Thu,  9 Mar 2023 22:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FE1F82159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id REHYmqkm3P6a; Thu,  9 Mar 2023 22:04:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E8A382063;
	Thu,  9 Mar 2023 22:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E8A382063
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C85E81BF2B9
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 22:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE3B260A7E
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 22:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE3B260A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DuU4TYOsz8bb for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 22:04:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EBDF60706
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EBDF60706
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 22:04:31 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id g17so4195481lfv.4
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 14:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678399469;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IogDHughft2GIT/afDmzz5+hi/maVk7gI3rWZWeN554=;
 b=igJkAcBV6JFcfnCCCtmNg8JjoDXCYT46mU3i68W0N57v66uq+z9GVxbUERjiiVtQb8
 aLoPnN9kKicCQ8ufsRpkMIOha+mEJ67hAYBO0l48JOj51HfViSpn0nRR8dYC2oobYNrg
 GmIms9MENhBE0T5hPRPc5kXW9vmbWCdaSB4LFd4jrUHi0lZPgMckEsMpHdTQvmUuVo+8
 wYm6JOUv8jq9CjLrq/lF83wh6TkF6o0M8dKRyMHsi0wxVUQlLt8nhMNZeqJrUpARneIf
 RFcamQQJIDlPvcVh4qCiRW/P0rh6ZeM9SprCBWzlrBKGdg/9aQgtylJsAUyDZ1rR9+Ed
 a0Hg==
X-Gm-Message-State: AO0yUKVl5l5vpCHPV2oY+at1sZoNJg1ZdGo8BEvK4wKX3Ttr5fIFVhdx
 RQ38OKhkXKSxgNyo5R0mJezDJ+r0yk0=
X-Google-Smtp-Source: AK7set/pKOrWcVZULV5hayhIKcbqrH5PX8qCxH9Km6TqtdtV0OHn6qNwvGC7GF3Q5tl9yLLegWkyyQ==
X-Received: by 2002:a05:6512:50e:b0:4d1:3d1d:4914 with SMTP id
 o14-20020a056512050e00b004d13d1d4914mr7592080lfb.33.1678399468582; 
 Thu, 09 Mar 2023 14:04:28 -0800 (PST)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 r6-20020a056512102600b004a2c447598fsm45158lfr.159.2023.03.09.14.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 14:04:26 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Mar 2023 23:04:14 +0100
Message-Id: <20230309220414.4174769-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678399469;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IogDHughft2GIT/afDmzz5+hi/maVk7gI3rWZWeN554=;
 b=KJIa6nd6KOmSJ8ZoK2of5lCGrKyWHXH/UXXTIsPFOYSJUKU3aNfBaAVpQ4mszx6kAA
 1/nkepSY7l8Dy8gtALR5cawSg/j4Buds1CowHvVoF5+FcYC+e7VU/9VGpVfF1v9pTHQY
 Jii1BzIqUr/svLsTzrI4+ouu48a/MBUb8m6mSFYyh/cOIvLPhslSs5LPgRAWbB+yMpfl
 KuJ+ljQTB63gXPtV91rvzflyfr/WRcPrHE9WwC5UTLExw74tlMJFkWOBJJ3CpULoGaZ7
 nMj+63v4UzKZxtjicDcM19sFHK74fZ+ZnAuA0FbKHhsi15YPvqqyXWpxJ/KoBr/NMoTC
 xnFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KJIa6nd6
Subject: [Buildroot] [PATCH] package/libcamera-apps: bump to version 1.1.2
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 ...ass-VIDIOC_QUERYCAP-as-unsigned-long.patch | 35 -------------------
 package/libcamera-apps/libcamera-apps.hash    |  2 +-
 package/libcamera-apps/libcamera-apps.mk      |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 package/libcamera-apps/0001-core-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch

diff --git a/package/libcamera-apps/0001-core-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch b/package/libcamera-apps/0001-core-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch
deleted file mode 100644
index fbd1d2d4ba..0000000000
--- a/package/libcamera-apps/0001-core-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a65682a97e19f96b86aeceb3ca3befb1687e3861 Mon Sep 17 00:00:00 2001
-From: Marcus Folkesson <marcus.folkesson@gmail.com>
-Date: Tue, 31 Jan 2023 09:14:15 +0100
-Subject: [PATCH] core: pass VIDIOC_QUERYCAP as unsigned long
-
-VIDIOC_QUARYCAP is an unsigned long and should be passed as one.
-
-Get rid of the following error:
-core/libcamera_app.cpp:33:22: error: overflow in conversion from 'long unsigned int' to 'int' changes value from '2154321408' to '-2140645888' [-Werror=overflow]
-   33 |  int ret = ioctl(fd, VIDIOC_QUERYCAP, &caps);
-
-Upstream: https://github.com/raspberrypi/libcamera-apps/commit/a65682a97e19f96b86aeceb3ca3befb1687e3861
-Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
----
- core/libcamera_app.cpp | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/core/libcamera_app.cpp b/core/libcamera_app.cpp
-index 04696fb..8cb6563 100644
---- a/core/libcamera_app.cpp
-+++ b/core/libcamera_app.cpp
-@@ -30,7 +30,9 @@ static void check_camera_stack()
- 		return;
- 
- 	v4l2_capability caps;
--	int ret = ioctl(fd, VIDIOC_QUERYCAP, &caps);
-+	unsigned long request = VIDIOC_QUERYCAP;
-+
-+	int ret = ioctl(fd, request, &caps);
- 	close(fd);
- 
- 	if (ret < 0 || strcmp((char *)caps.driver, "bm2835 mmal"))
--- 
-2.38.1
-
diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
index fbb3150cb5..20a06aa8fe 100644
--- a/package/libcamera-apps/libcamera-apps.hash
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c05e29e02da05fa92739941295d96dcb93324805f7b348ad182e7e29e7e0c520  libcamera-apps-1.1.1.tar.gz
+sha256  a19f3960b97ec1c0d42df8af972868ff0d4c48be6096e7ac02dbaaa4c7c75636  libcamera-apps-1.1.2.tar.gz
 sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index fe402ec3f4..592773eec8 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAMERA_APPS_VERSION = 1.1.1
+LIBCAMERA_APPS_VERSION = 1.1.2
 LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,v$(LIBCAMERA_APPS_VERSION))
 LIBCAMERA_APPS_LICENSE = BSD-2-Clause
 LIBCAMERA_APPS_LICENSE_FILES = license.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
