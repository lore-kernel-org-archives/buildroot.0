Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C78C6379F
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 10:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75E7541880;
	Wed, 22 Feb 2023 10:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75E7541880
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SkfvOJRzL1qe; Wed, 22 Feb 2023 10:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C3C541884;
	Wed, 22 Feb 2023 10:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C3C541884
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EDF601BF392
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 10:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C747B40B64
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 10:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C747B40B64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z36O5y3wmffz for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 10:32:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8810040FDA
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8810040FDA
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 10:32:47 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id p16so3117196wmq.5
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 02:32:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xqw/IYg/rrMlrBm+tbZ7halg0xxzobHP8Y6mVP2RUNs=;
 b=z2+2Kw/72s7GxA4i9JQhwpF70N6OrSb1KFd5XXBMMV42U60Km8hefjRlV+ZzKmXmFh
 8aUuk2J9rZdGNfGOWWlQg37Ei/M24QEc/zr2Q0KLbkMbnW4fnT96L7v+f8Ni1PuhaOj+
 80PFyPCHOygN2JvjDM2qLTJ5AK9EBIKgAP04K0t64eEL2dLfex7Q2Sqo0WyYxCRbGg3z
 eHdo+OP2D+G/zdcaeSmg8oifo3HIfiHWy6LiwTCyFB92JHi91W+PhRMk2fdiQvai2SMu
 bZnQ/4ktGNne8weZ8/qCXB/bvWxFwEdrI80X/DMYOqsQO0oCvfmVRvZX3p3X+kDUNaFH
 2v7A==
X-Gm-Message-State: AO0yUKVRB8ly3XCPrjt3tFZxDITZVmsTlADp3IUdAHS1Mxzd583Qw8LK
 N4xpk9+fRYu+VMjB9vpHjlDIMn8pGy0=
X-Google-Smtp-Source: AK7set839VbbxfVri718OzksCUR+xIIwvgO5IM6iSpt9u504CWAphiC3K3vIfvEw6mJ31Eqcsip48g==
X-Received: by 2002:a05:600c:1693:b0:3da:50b0:e96a with SMTP id
 k19-20020a05600c169300b003da50b0e96amr10903699wmn.29.1677061965240; 
 Wed, 22 Feb 2023 02:32:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l38-20020a05600c1d2600b003db0ad636d1sm1487134wms.28.2023.02.22.02.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 02:32:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 11:32:42 +0100
Message-Id: <20230222103242.755918-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xqw/IYg/rrMlrBm+tbZ7halg0xxzobHP8Y6mVP2RUNs=;
 b=ZEj3+VkQRoX02ExhL23cdF7ZbSMIDp0874zIKIrw8AsJLShhLwvCuEPyzQbHNG4cN9
 kNXwCu4qpxAKg9L/FgcpsDLe8EXNoBsoRb2HL7bd63I+85M2dER455cZ0qunUxfCcSn9
 5wcKSdCwLABpZKruMLrHcgcKh0bg6E1Ts0XDJDyCvy59SyFq25L17OBTZ5uXS+lRPn8Y
 HUXVzT0z6fof6QfxP9f2ch5zRj5kKVWmT8am6Sc5GnBdbhhUge9O1E0ZGra90c9OMY32
 0udRNlrF+uv5tKUqSHN0+T5RPQzQDyfngQD6VcMaPB+WrSy3+oEG7fKTy1C2JC/i6Olq
 U6/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZEj3+VkQ
Subject: [Buildroot] [PATCH 1/1] boot/at91dataflashboot: disable
 stack-protector
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

Disable stack-protector to avoid the following build failure:

/home/buildroot/autobuild/instance-1/output-1/host/bin/arm-buildroot-linux-gnueabi-ld -T elf32-littlearm.lds -Ttext 0 -n -o DataflashBoot-1.05.out objs/cstartup_ram.o objs/at45.o objs/com.o objs/dataflash.o objs/div0.o objs/init.o objs/main.o objs/stdio.o objs/asm_isr.o objs/jump.o objs/_udivsi3.o objs/_umodsi3.o objs/led.o
/home/buildroot/autobuild/instance-1/output-1/host/bin/arm-buildroot-linux-gnueabi-ld: objs/main.o: in function `main':
main.c:(.text.startup+0x834): undefined reference to `__stack_chk_guard'

Fixes:
 - http://autobuild.buildroot.org/results/502c54be4978e628724d72ee2a75d4c5e0a6ace8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 boot/at91dataflashboot/at91dataflashboot.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index 0ad8b6fc44..c66f27e343 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -12,7 +12,8 @@ AT91DATAFLASHBOOT_INSTALL_TARGET = NO
 AT91DATAFLASHBOOT_INSTALL_IMAGES = YES
 
 define AT91DATAFLASHBOOT_BUILD_CMDS
-	make -C $(@D) CROSS_COMPILE=$(TARGET_CROSS)
+	make -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) \
+		CFLAGS="$(TARGET_CFLAGS) -fno-stack-protector"
 endef
 
 define AT91DATAFLASHBOOT_INSTALL_IMAGES_CMDS
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
