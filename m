Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06555C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 16:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F7FC41718;
	Mon,  6 Jun 2022 16:37:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IF8pid0jI9AZ; Mon,  6 Jun 2022 16:37:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 500AE416D8;
	Mon,  6 Jun 2022 16:37:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F2801BF303
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 16:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ED1483FC8
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 16:37:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wf4mYN2vuN69 for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 16:37:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90A5B83FA9
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 16:37:36 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h5so20649126wrb.0
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 09:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I9JiSKYp6KeTk6GCwO8Rgds7205mpwHBAPoysNhR+yQ=;
 b=OpjVbJMeHc+mYaayp1slduPlXtyFGcjoqniMCjbfoYFxC+/9SMBZoVgCkYukAsTzOl
 hhoAcPI2OQu9dGQXzwmrBhqNszyT/42Kx4lpdg25dOLOCQKye1SsJDntGEFPfDDVfQtC
 vnlyueoRIAwy3DVs2b5f0EbqoMoglkRD5IHo/pKq0WP9cFHyPpkaEQvuDdTw26Xbng8R
 0dRL9mfKMRALOWEz5BGUEvTFx/WsVktL3J/xhXX3IdzVzERJs6fB7TyMdK6emfmDJxLp
 XZvAck5RljvnCYhWy1f0QpDzSU6tTs/ntx6eGhq8cJq0nwG68lru6ErDbhrhZKwWqOK5
 EvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I9JiSKYp6KeTk6GCwO8Rgds7205mpwHBAPoysNhR+yQ=;
 b=C39dT5qlZApSx44Iz8fBw4Mpl49czHx0HPCNywHaYdCGY0tqGIEm7JlOVADzGUG4J3
 6/Zmdp8hBOXX1OVVesh2bjhHa9/JpJxDLYsW0W7d94dbFAkXtCCq7+d3kIDIg8Ax0UQU
 +ADPPVDPNDCVjjzf0xlfCOM91KbM8BLdA6SQT6M6yZPnnwYdzmY5gbSoBKDEP6XTrKN8
 +YQfmWEnzGknY1K9RJpE48h8eqvkJZpkRp/rhVNsb2b6i0Qth9QMcuSd6i7T/uJcR8rD
 v3sAGKRED1GmYd4SaVsq2C11v1CegLhmxcVa1aY8rpz2juPhwNtQh7DKrd8UAj2aMCDx
 ddQQ==
X-Gm-Message-State: AOAM533QvSN6nerJ3BfJFJ6iKzwNbsWJfz1wq/+cnAtRXsWUAOHAoiR0
 w0U8iRLJLxfzvTzgXv/ucgwwNCYdpDU=
X-Google-Smtp-Source: ABdhPJwdk5J9rr3C7dbOg82GMZokLD+qRPPbw4Yw76LU8vomtAb07FvPYmIGYk3XZ0h+FsZTPvbmqA==
X-Received: by 2002:adf:e347:0:b0:217:6f4b:f3d6 with SMTP id
 n7-20020adfe347000000b002176f4bf3d6mr9082381wrj.73.1654533454481; 
 Mon, 06 Jun 2022 09:37:34 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b18-20020adfde12000000b0020d0f111241sm15868621wrm.24.2022.06.06.09.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 09:37:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 18:34:51 +0200
Message-Id: <20220606163451.1510892-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] boot/at91dataflashboot: disable on armeb
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

at91dataflashboot fails to build on armeb:

/nvmedata/autobuild/instance-6/output-1/per-package/at91dataflashboot/host/bin/armeb-buildroot-linux-uclibcgnueabi-ld -T elf32-littlearm.lds -Ttext 0 -n -o DataflashBoot-1.05.out objs/cstartup_ram.o objs/at45.o objs/com.o objs/dataflash.o objs/div0.o objs/init.o objs/main.o objs/stdio.o objs/asm_isr.o objs/jump.o objs/_udivsi3.o objs/_umodsi3.o objs/led.o
/nvmedata/autobuild/instance-6/output-1/per-package/at91dataflashboot/host/bin/armeb-buildroot-linux-uclibcgnueabi-ld: objs/cstartup_ram.o: compiled for a big endian system and target is little endian

Fixes:
 - http://autobuild.buildroot.org/results/e44c042abc1dfb97b4f8a17389d27f842e9dd311

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 boot/at91dataflashboot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/at91dataflashboot/Config.in b/boot/at91dataflashboot/Config.in
index 4055f96410..8b37d84409 100644
--- a/boot/at91dataflashboot/Config.in
+++ b/boot/at91dataflashboot/Config.in
@@ -1,3 +1,3 @@
 config BR2_TARGET_AT91DATAFLASHBOOT
 	bool "AT91 DataFlashBoot"
-	depends on BR2_arm926t
+	depends on BR2_arm && BR2_arm926t
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
