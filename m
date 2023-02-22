Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C957C6379F
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 09:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34F9D40B83;
	Wed, 22 Feb 2023 09:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34F9D40B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NavC3YDQXw-U; Wed, 22 Feb 2023 09:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DBB640B7B;
	Wed, 22 Feb 2023 09:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DBB640B7B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D64111BF3F9
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 09:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD08860BB0
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 09:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD08860BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQ-ku5ZxH8Ew for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 09:54:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD4CF605BE
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD4CF605BE
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 09:54:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id c18so622243wmr.3
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 01:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JcuCSyjUaz+73WY/jeoN3JYkD3UdnXXQaVM0SfCQPaE=;
 b=tRIvJq5d7T7VNmlayOvgfwJvYfr9+JNDYW7uHvqqIjRUqVS4BlyUJXJeGuZAMj1cZ6
 KmAyCN0ONW+LZHZ0frWM4LKMdRTu2jbOjG72FUTUAYTO+rdbGoJl8HZYgQh2PLoO3wLC
 yoZaz4nx8rwwVvRTz3jLiRQN9iL8IA/oHqqW5nD3GfwPxUXF8EYbI/74BDyphs1Fqxsx
 Qlf7CbuvxaC9jo2ydfBc7xc1yZiWpKQa2r44QxGMwlxwkE64ooJXLbLLIlcSNYavnNJ1
 ydcG1xLSDQ/ECmZHmJZGH7L6a5BAwHwyOMN+mt+3L/9ObL9642+HUTEX2hfzFjDaOO3X
 +hUA==
X-Gm-Message-State: AO0yUKXTWNXUg88fbGCfzelhAqrp96iV9w8XSC+VrIyXWEnDgsppv4We
 5sHUPdEXszK7IIVscDjDqicHasf75ss=
X-Google-Smtp-Source: AK7set+x8zEBHPIIA/obz0nfiXDTcWSbsqurDi69nQUYfMijGnEcAhgUT4+Lme3uZPrSIrGT9GyKrA==
X-Received: by 2002:a05:600c:1c98:b0:3dc:59c3:9020 with SMTP id
 k24-20020a05600c1c9800b003dc59c39020mr5889246wms.8.1677059684711; 
 Wed, 22 Feb 2023 01:54:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h1-20020a05600c414100b003e200d3b2d1sm7872505wmm.38.2023.02.22.01.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 01:54:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 10:54:34 +0100
Message-Id: <20230222095434.444552-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JcuCSyjUaz+73WY/jeoN3JYkD3UdnXXQaVM0SfCQPaE=;
 b=V/LQkcj/8bA9So1FeavYqvtsj/fumKvkhbj9a91a3MN+CzJZtQDvWqNX2DJHqLz5me
 lCWRJXJtqjh+QLcHEiQQCwoLGL4my8oaoRujw8dpNcuoIdW0Oh8oYJ7mpluPY9HFtj32
 VHk6qea4U52aLYDPK+xotP0kM++GVx7JZjO4bBQBOXiBQOBgRI/9EWpG1+1v7tkJRpfU
 xFBzlcuE/0Vy/nr4JLK7XPHN1v5NpSNrraQj8ysp0HsgdAUbUa9ktYg0l0LiE9lCRh/Q
 4/OiLuH8+AQ3iGxAQE2+siPR4NT9YBvQCH3RKZoSNccbxjwl/97T8z/oXwfLHsFMzqxx
 yppg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=V/LQkcj/
Subject: [Buildroot] [PATCH 1/1] boot/opensbi: fix build with empty
 OPENSBI_PLAT
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure when OPENSBI_PLAT is empty raised since
commit 9b5b7165deb91bad3cdb1ea0dd8f940eff75f3a9:

/usr/bin/install -m 0644 -D /nvmedata/autobuild/instance-4/output-1/build/opensbi-0.9/build/platform//firmware/fw_jump.bin /nvmedata/autobuild/instance-4/output-1/images/fw_jump.bin
/usr/bin/install: cannot stat '/nvmedata/autobuild/instance-4/output-1/build/opensbi-0.9/build/platform//firmware/fw_jump.bin': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/8033327f090e4a3d84a7fce1f62b14fdf89dbd89

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 boot/opensbi/opensbi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index 06ec87b2c3..dd113a0bf8 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -71,6 +71,7 @@ OPENSBI_INSTALL_IMAGES = YES
 OPENSBI_FW_IMAGES += payload
 endif
 
+ifneq ($(OPENSBI_PLAT),)
 define OPENSBI_INSTALL_IMAGES_CMDS
 	$(foreach f,$(OPENSBI_FW_IMAGES),\
 		$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_$(f).bin \
@@ -79,6 +80,7 @@ define OPENSBI_INSTALL_IMAGES_CMDS
 			$(BINARIES_DIR)/fw_$(f).elf
 	)
 endef
+endif
 
 # libsbi.a is not a library meant to be linked in user-space code, but
 # with bare metal code, which is why we don't install it in
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
