Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BA5C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 18:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B76860E27;
	Tue,  1 Nov 2022 18:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B76860E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ujtPMMcTL8C5; Tue,  1 Nov 2022 18:30:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 818CC60E09;
	Tue,  1 Nov 2022 18:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 818CC60E09
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52FCB1BF5F8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 18:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E16640123
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 18:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E16640123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oaq41Ejfynuk for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 18:30:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9885400D2
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9885400D2
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 18:30:35 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso13288275wma.1
 for <buildroot@buildroot.org>; Tue, 01 Nov 2022 11:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQ6eBGQLpwf56+VFxfxIA+yirCLfSbTJDnQf6lC1kgM=;
 b=UskBESQpMcITF9fwlC9lALG02ekpzbuoWyxtLdp10HfMThtE116eR4d+oiiwmQZ1TS
 WwKql8iiK9cnniy4gpOp5A+hJGBMTA0bCeMzUVn83XnQlxe9IXcQdwUxza6cUvlO76iH
 0rfzQFZiMLgGUUdjCzchiCJSodB4KYV9vK3v5f7WXusmI0B782uQ+So/vaEVN5z2KUh5
 KHZhWMhooFzKoE/8hhDjAlYGYz+pzfwMMZbYfNZfZ0HLbTs3ag5IkpN/ZHQsoF4zb4+e
 V5bPtQHs+x+Jx/vfKCWCrRfDh1sdfgdDld2OX94x3h+nKWyMT9UNEoCPURIUBQImB+sm
 qd9g==
X-Gm-Message-State: ACrzQf0HsXCKWgrXE8nPprrhDGkXzqDeeA8PGXdmjM+ofnCvLtStF8vx
 /oXsWBHAnHlfkSTtD4gukql58UaXPbw=
X-Google-Smtp-Source: AMsMyM7+FIbQzI79IrnpYmCEIIW61l4hT7Af0EXXgiRlrZmT1MFNIhQgyugBZxX8G1a5zA3731741A==
X-Received: by 2002:a05:600c:1553:b0:3c6:e12d:6f32 with SMTP id
 f19-20020a05600c155300b003c6e12d6f32mr22289481wmg.109.1667327434058; 
 Tue, 01 Nov 2022 11:30:34 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:50d3:260a:b461:e6c4])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b003a601a1c2f7sm10764026wmo.19.2022.11.01.11.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 11:30:33 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 19:30:32 +0100
Message-Id: <20221101183032.3631097-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=AQ6eBGQLpwf56+VFxfxIA+yirCLfSbTJDnQf6lC1kgM=;
 b=oJhQnMop6GUxffDK4ic46IlVm8H8pmphMzqejIxQoLVwWvuQdkSiBS1cwfJ/O3pgl4
 s0JUmFWjMqBw12tZhpU2NDiL+8xczITkVYrGIA0gzzCiIGCLwSBSUh85xRfoW4/NA7Ie
 tu/k/Z9kTJZcHZxe186t/VQYsSOaERAIH8tRdGgRyriWx86B3a+bNxmw0nY8yBLddeiN
 VquHvieBLTQWeeeXRtHvsImVkzAmiTZ9m1pt6xOhey1BksLQlDMc9Jo/6Ekpi0FClBMJ
 96FOuyG/EWePu3Q7TFlyKrDRMbANq6XRsahIzoYDcfFC4LKthMgOcVFtTqgO6JLTnrCK
 +P0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oJhQnMop
Subject: [Buildroot] [PATCH] fs/cpio: don't fail systems without /dev/null
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We pass all our dracut configuration files via a config dir, but dracut
insist with having one config file. Because we do not want to have to
chose which file we pass (which would then have to be excluded fro; the
config dir), we jsut used an arbitrary empty file, and /dev/null seemed
to be a good candidate.

However, some build environments do not have a complete /dev, and may be
missing entries otherwise taken for granted, like /dev/null. This is
especially the case in constrained environments like containers.

Switch away from using /dev/n ull, and do create an actual empty file
that we can use as the dracut config file.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/3249828364
Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/cpio/cpio.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index d671c337df..061f4a18f1 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -69,12 +69,13 @@ endif
 
 define ROOTFS_CPIO_CMD
 	mkdir -p $(ROOTFS_CPIO_DIR)/tmp $(ROOTFS_CPIO_DIR)/confdir
+	touch $(ROOTFS_CPIO_DIR)/empty-config
 	$(foreach cfg,$(ROOTFS_CPIO_DRACUT_CONF_FILES), \
 		cp $(cfg) $(ROOTFS_CPIO_DIR)/confdir/$(notdir $(cfg))
 	)
 	$(HOST_DIR)/bin/dracut \
 		$(ROOTFS_CPIO_OPTS) \
-		-c /dev/null \
+		-c $(ROOTFS_CPIO_DIR)/empty-config \
 		--confdir $(ROOTFS_CPIO_DIR)/confdir \
 		--sysroot $(TARGET_DIR) \
 		--tmpdir $(ROOTFS_CPIO_DIR)/tmp \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
