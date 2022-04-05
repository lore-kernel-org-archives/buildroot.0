Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F28C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 02:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AE0560F1C;
	Tue,  5 Apr 2022 02:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aRfnIlRZ8K7W; Tue,  5 Apr 2022 02:51:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56E2460BE4;
	Tue,  5 Apr 2022 02:51:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50E971BF2C6
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 02:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3698F402F4
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 02:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cl_Mvn-6tnuX for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 02:51:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CF6D4013D
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 02:51:00 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id e22so13620154ioe.11
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 19:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CZ6yUk9EMly+LliDvIYwI4JpFL14bNKQByFkyXWlsWs=;
 b=crGF2tu47ZG/h5Uw4zpjQn1Ed+JWh3/Hd8qJd2vzg5Vs/r7MV9FaymUKICHNv9PBKd
 r/nNeV2Jjuo8qU4k6LyYAwbO5wePEskvtuPGgCSZL4g3jyfcikJkyy9c2s3sMSLgO10u
 HJXai1C22Rz2zDK8vN+5IH3wtOvLK0a9CK3jLrBTx0NHIyAanHfiV3rntzydcAdpqWq2
 EMNNx83y3JvxNzrgOYcGD1ZHAQzya1/01b9hvMPkMAobVUm/ofr/U3u+CzIi64sNA2PG
 U3bYpsJxBsR24xBqKpfpaEDl1+Y+9K7cSEXhKF76YbHqNt41O7t7kOaz5hIFVZk8ovK3
 LEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CZ6yUk9EMly+LliDvIYwI4JpFL14bNKQByFkyXWlsWs=;
 b=kiApPE1ZgtFFcU2MajyN2HoYGyi4+jHFkVfvTv9Z3eF7zaTYXvBLdUPWiRxXakIUez
 coR0Xkuy2obP+7cy4SE5emzgfa0kuHaUUaFkb1ks26lydL9FwsPTc95QvQy9Y8po2qLs
 PffLee2CB92MO1eLM3hHnB0atZJGxt83Z3BuX8zJuLFJkxLteu5CNWGWKFt50pheD0/J
 8LZV3madYJzfthn/Fy0zLH9pOZRj7p4KGUmu2yN5JVMd933n+Y+/IJJkrH9eVwiK+4lY
 uhcLME7vyuunFfaICcPicA3QGQD0nsrZ1xETDAonEVmGg/rAfQNgL7awVxC9zyQT8TkG
 Nqug==
X-Gm-Message-State: AOAM530t71f5o4qAQS3p5urtfZJaH2ggPyIwqWKJyTYbAReA1MBDDe1k
 5qBbd7gir/M8U/JPkE1VDb+49W7QNpCIjA==
X-Google-Smtp-Source: ABdhPJxn/YYUd0Y6i5K4aICqr5RMY2QNguSYQiUmdiE0GM07wjuqOvy4I/fbydQ/0ejFrUXgL2PpXA==
X-Received: by 2002:a05:6638:2610:b0:323:bbe3:550b with SMTP id
 m16-20020a056638261000b00323bbe3550bmr873184jat.6.1649127059294; 
 Mon, 04 Apr 2022 19:50:59 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 h24-20020a6bfb18000000b006497692016bsm7496139iog.15.2022.04.04.19.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 19:50:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Apr 2022 20:50:54 -0600
Message-Id: <20220405025054.966064-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/aufs: don't set invalid AUFS_SITE
 if version is unset
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
package/aufs/aufs.mk:24: *** AUFS_SITE (https://github.com/sfjro/aufs4-standalone/archive/) cannot have a trailing slash.  Stop.
make: *** [Makefile:84: _all] Error 2

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/aufs/aufs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
index 4e95a350a0..b2dda771d9 100644
--- a/package/aufs/aufs.mk
+++ b/package/aufs/aufs.mk
@@ -8,6 +8,7 @@ AUFS_VERSION = $(call qstrip,$(BR2_PACKAGE_AUFS_VERSION))
 AUFS_LICENSE = GPL-2.0
 AUFS_LICENSE_FILES = COPYING
 
+ifneq ($(AUFS_VERSION),)
 ifeq ($(BR2_PACKAGE_AUFS_SERIES),3)
 AUFS_SITE = http://git.code.sf.net/p/aufs/aufs3-standalone
 AUFS_SITE_METHOD = git
@@ -16,6 +17,7 @@ AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
 else ifeq ($(BR2_PACKAGE_AUFS_SERIES),5)
 AUFS_SITE = $(call github,sfjro,aufs5-standalone,$(AUFS_VERSION))
 endif
+endif
 
 ifeq ($(BR_BUILDING):$(BR2_PACKAGE_AUFS):$(AUFS_VERSION),y:y:)
 $(error No aufs version specified)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
