Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C944C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 21:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5B50826C7;
	Thu, 29 Feb 2024 21:57:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LqwOKe1wAsWZ; Thu, 29 Feb 2024 21:57:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00A6A82A3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00A6A82A3B;
	Thu, 29 Feb 2024 21:57:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B02B1BF20F
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 21:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07355405CE
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 21:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rw41IF885cvn for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 21:56:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8663740591
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8663740591
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8663740591
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 21:56:47 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-412bfacd146so6336385e9.0
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 13:56:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709243804; x=1709848604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p/0sKMQ4jX/BLCU8akPLjNK5eO4S+ay3UYnwjdse8tI=;
 b=mWFZrG7PufHbWDIQ7/ba1VmCwDvnCdV0Z1rtD8THZgA5ubMzq4EsLqkrr+79G8XdhB
 zRhsrL2wkfJrlgWB4JkIPSeTzNiLym6y3U96Om0E72GyhQxsxkb3r80ibxf+wIzAbtLU
 xtdQ2rvetlTDu1tDHmZVSFLgNBvJeBPV1BoXo7wk+wu03pCh0SGabD9ng+qGHtgoZQQ6
 RbXXt0ISRG1je3j2MARRZYEFC9ZPm5jCIW+3iXq27z/tvhcQDrEJV9eR28YqFvnDRMed
 TNtq3RvLkEKaNWvcjjxf08Vfjp2M/Ukp2CrlP0H6PxXNxRyW+bzaqbdpk3FkGXcu7xu6
 Uwlw==
X-Gm-Message-State: AOJu0YwHzbI2BS1QvIBlgUr0iWc/oSGe4C0LSkh1e4ag+WeNRs/3t34v
 /tZaurF6zlm0s4pd3tNFZ9G9dWvh5wYUpsUhlCvCE1zcG9S8TKds6VN+AmcV
X-Google-Smtp-Source: AGHT+IF42HcOiMsPPZVdfGd7HbYsjXn5uUOgBUvTnqt6QaQBqrpKfNxWQz1Rm4meUVZipu9QyeJhpg==
X-Received: by 2002:a05:600c:35cb:b0:412:bcca:751d with SMTP id
 r11-20020a05600c35cb00b00412bcca751dmr159794wmq.11.1709243804336; 
 Thu, 29 Feb 2024 13:56:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c470a00b00412704a0e4asm6451754wmo.2.2024.02.29.13.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 13:56:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 22:56:41 +0100
Message-ID: <20240229215641.330203-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709243804; x=1709848604; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p/0sKMQ4jX/BLCU8akPLjNK5eO4S+ay3UYnwjdse8tI=;
 b=Q9/8Ih3gGiTdARmaWxMeTqOerpXP0G2QKTIg1XJML0tmKEQa2rmhxWk/OoJrZWSJfQ
 j9YrwJJtKkzatr2dgT1iL/MzgA2rIs7uZzl8gZiZQlDNjO1PqixwGuwsyyUQega/l14e
 Ox4chHypa34llpquYCwz74Xv4uoq1SitxWuQUTDiiM1C5XsutK044su3BKFN6t/pP4bI
 2hjSttW6fhoeuobrc+E/Z6vB4fr3LiyScNG7QmPIuUOLZ/kvpzLwUcHtwbYdm/VvVlEv
 hsr9hr6PONZUgJaPMMI1Jv9+WQYngZog1Ctc4CIuJtzN8fzHTTtgVl445E/8q2Tz4AcR
 EB+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Q9/8Ih3g
Subject: [Buildroot] [PATCH 1/1] boot/shim: force arm mode instead of Thumb
 mode
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

Use OPTIMIZATIONS parameter to pass -marm to fix the following build
failure in Thumb mode:

/tmp/ccEjPM4h.s:941: Error: selected processor does not support `mrc p15,0,r2,c9,c13,0' in Thumb mode

CFLAGS can't be overridden as it is defined as:
CFLAGS		= $(FEATUREFLAGS) \
		  $(OPTIMIZATIONS) \
		  $(WARNFLAGS) \
		  $(if $(findstring clang,$(CC)),$(CLANG_WARNINGS)) \
		  $(ARCH_CFLAGS) \
		  $(WERRFLAGS) \
		  $(INCLUDES) \
		  $(DEFINES)

Fixes:
 - http://autobuild.buildroot.org/results/580156f89cfd72122fef07aa2fe37b4fdd4c316b
 - http://autobuild.buildroot.org/results/8980c0f422516c7263d8d0c9cc6123f30c4b7ee4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 boot/shim/shim.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/boot/shim/shim.mk b/boot/shim/shim.mk
index 19b11f4086..ae57677320 100644
--- a/boot/shim/shim.mk
+++ b/boot/shim/shim.mk
@@ -13,10 +13,19 @@ SHIM_CPE_ID_VENDOR = redhat
 SHIM_INSTALL_TARGET = NO
 SHIM_INSTALL_IMAGES = YES
 
+SHIM_CFLAGS = $(TARGET_CFLAGS)
 SHIM_MAKE_OPTS = \
 	ARCH="$(GNU_EFI_PLATFORM)" \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	DASHJ="-j$(PARALLEL_JOBS)"
+	DASHJ="-j$(PARALLEL_JOBS)" \
+	OPTIMIZATIONS="$(SHIM_CFLAGS)"
+
+# shim has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `mrc p15,0,r2,c9,c13,0' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+SHIM_CFLAGS += -marm
+endif
 
 define SHIM_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(SHIM_MAKE_OPTS)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
