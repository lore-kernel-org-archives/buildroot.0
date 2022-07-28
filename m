Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD0CC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 19:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A59C825E8;
	Thu, 28 Jul 2022 19:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A59C825E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1SnVd4l6dxCW; Thu, 28 Jul 2022 19:37:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B267C825B1;
	Thu, 28 Jul 2022 19:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B267C825B1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D74031BF21A
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF039402BC
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF039402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id egpK10esK2E9 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 19:37:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7FA340127
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7FA340127
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 19:37:33 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id w5so3384257edd.13
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 12:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=njJvgxPb0uYoCQSaQ949i4HT/teV5fyWK+C6lDNhYZ8=;
 b=eEHsIMDPnMArJa5JnpldN986h3UCMbF4qNWrv9DI+yEgoqu/kj7jVOA4X4a5aPl7eI
 QMxzBJmae1MsmEQjn2OoBhDNPbEUaDc09bNI65Yulnoe1boOIjKfbOGYSfiE5ast9zj3
 HVBV+ck75kms1p9GyhuT+vigECUv/lvEAgcMUBzHj5JGYXlI3HMTVf64ajl+Y4AZyjgi
 qo9td+A4Y5/kh+TGw2VMdRujno21hLvPt0QsBPXB+KPtXY27qI3SLJlma9OTBapEt1m+
 LXXhq66DC+XB5nAekBTfLqCKW9oKRCSGi9bTYdLaQcHwz7RX/wwiZ1o58kLZMDKp/Iak
 v6Jg==
X-Gm-Message-State: AJIora/i7UL12Ynfz0oXt4q587Nc1HCVkDzr8Nm1jpslGXu/b0wJEZ35
 ExILIgSJqoVu5VmyTThx1wDtSjIVJOWUNUAh
X-Google-Smtp-Source: AGRyM1sqx3sMCaxecFvmYBrTrQxbvfsH3n2a9TpvDe7A2GkJw8qRP6ETimVJqo4ncAeUpJIcHOyNeg==
X-Received: by 2002:a05:6402:50cf:b0:43c:7d1:df75 with SMTP id
 h15-20020a05640250cf00b0043c07d1df75mr498032edb.72.1659037051760; 
 Thu, 28 Jul 2022 12:37:31 -0700 (PDT)
Received: from arnoutx1.. (ip-185-104-137-32.ptr.icomera.net. [185.104.137.32])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a50d74c000000b0043ba1ecb0dfsm1218291edj.75.2022.07.28.12.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 12:37:31 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 21:37:26 +0200
Message-Id: <20220728193726.1465662-2-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220728193726.1465662-1-arnout@mind.be>
References: <20220728193726.1465662-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=njJvgxPb0uYoCQSaQ949i4HT/teV5fyWK+C6lDNhYZ8=;
 b=Rpl/oKSHdeDmUrj73gOkkNkvnrMSaEYOTTdEzqqQZBTpy1sEEQisbpeIAthobdijhd
 wp0ooQXHfgar5ZXmRsAP7fjGUkOUSgfchS/6sLT76VtMwZ1G5NF8XHgXeYdP/INl3dgL
 IcGMVJpBlNFChGy/bi671xUXEq12B3jA8PiF47DLhHMbkE930kJSUVVsXgn8Cs9cI2Bm
 osg98j5Hbrk+nOokpuyeEuccq8I7bZAy8UW787QNqJOhDKobjgU8ILAqSeKxNcjZXYrB
 0kapH1OQGOYgJPT2qpiP7xDzqkzPjwOD7ctaLYd+mzgyGcmECmdxw4SGRBO6Bqb+FMxB
 z1UA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Rpl/oKSH
Subject: [Buildroot] [PATCH 2/2] Makefile: always delete hwdb sources
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Sen Hastings <sen@phobosdpl.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In eudev and systemd, we have code that deletes the hwdb sources from
the target - they are not useful since a binary hwdb is created from
them. However, if eudev or systemd is not used, then those sources are
not useful either. It's possible that other packages than eudev or
systemd install hwdb files, which would be left on the system.

Always remove the hwdb files.

Note that we don't expect much space savings from this, but anything may
help. It's certainly more consistent to do it always than just in eudev
and systemd.

We do this both from /usr/lib/udev (usual installation path for systemd)
and in /etc/udev (usual installation path for eudev) because packages
may install in either location.

We keep the comment explaining why it's done in rootfs-pre-cmd instead
of target-finalize - this was only present in eudev.mk.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                   | 8 ++++++++
 package/eudev/eudev.mk     | 8 --------
 package/systemd/systemd.mk | 5 -----
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index f116ccb5bc..e30e778346 100644
--- a/Makefile
+++ b/Makefile
@@ -807,6 +807,14 @@ endif # merged /usr
 
 	touch $(TARGET_DIR)/usr
 
+# Note: this will run in the filesystem context, so will use a copy
+# of target/, not the real one, so the files are still available on
+# re-builds (foo-rebuild, etc...)
+define ROOTFS_RM_HWDB_DATA
+	rm -rf $(TARGET_DIR)/usr/lib/udev/hwdb.d/ $(TARGET_DIR)/etc/udev/hwdb.d/
+endef
+ROOTFS_PRE_CMD_HOOKS += ROOTFS_RM_HWDB_DATA
+
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
 	@rm -f $(ROOTFS_COMMON_TAR)
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index f050563feb..feb5505289 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -81,13 +81,5 @@ define HOST_EUDEV_BUILD_HWDB
 endef
 HOST_EUDEV_TARGET_FINALIZE_HOOKS += HOST_EUDEV_BUILD_HWDB
 
-# Note: this will run in the filesystem context, so will use a copy
-# of tharget/, not the real one, so the files are still available on
-# re-builds (foo-rebuild, etc...)
-define HOST_EUDEV_RM_HWDB_SRC
-	rm -rf $(TARGET_DIR)/etc/udev/hwdb.d/
-endef
-HOST_EUDEV_ROOTFS_PRE_CMD_HOOKS += HOST_EUDEV_RM_HWDB_SRC
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 19fd525534..1d7452de19 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -732,11 +732,6 @@ endef
 SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_UPDATE_CATALOGS
 endif
 
-define SYSTEMD_RM_HWDB_DATA
-	rm -rf $(TARGET_DIR)/usr/lib/udev/hwdb.d/ $(TARGET_DIR)/etc/udev/hwdb.d/
-endef
-SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_HWDB_DATA
-
 define SYSTEMD_RM_CATALOG_UPDATE_SERVICE
 	rm -rf $(TARGET_DIR)/usr/lib/systemd/catalog \
 		$(TARGET_DIR)/usr/lib/systemd/system/systemd-journal-catalog-update.service \
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
