Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CF2C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A700883ED7;
	Sun, 14 Aug 2022 23:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A700883ED7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6achGpSoo2P0; Sun, 14 Aug 2022 23:42:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC7D283ED0;
	Sun, 14 Aug 2022 23:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC7D283ED0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADAA41BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 890E360C1A
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 890E360C1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9YZD1p0nUuFX for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:39:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF1FF605AE
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF1FF605AE
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:39:51 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id j2so5870754vsp.1
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FjMXgBJ3+qHB3WUtBIH/vcUKxR+5jeqD8J8i9y6uGPY=;
 b=hZiwzVOF50ZWLtHerQLnAArsOWVyr4LzNwLhEkZyHg5zqBB+Rykahh2Lk3ltkIgtlc
 0kT26JBBqy3dObE8qhWVO2yirKh7OfURiUGBPa/hrOSDifTdceJPwJ0uT7voVlozezkb
 FCQUMnV4ATuYX0FBAOK6jToTT+/gPBHnjGcf6jOiUVjJceWEuzTv7xqxHi/Kzi9ng6d/
 uL1UuN3L79hrK70i0lBvyB4MHeOuNICkJCZT6q8kaRwJZoz/DPkm22UYf9o27RNY0mAR
 CMYEDsbUdvhimr1wZPLoLCkWAhcYOz3ozD9el71JxJ9xh3/dLrjf1rgMQU+36uLRcwLH
 JJQg==
X-Gm-Message-State: ACgBeo0HsbsffM7W0/GXcvy5RGCaPjYpOTYlp4Tg6q18Z9IHkx1bCziW
 4Nx0irq9exZMxBnyLN4DniANySFAJws=
X-Google-Smtp-Source: AA6agR7xo+gJkOMB6RvM/B1jSYZwr1yQyhUdErPK8N6j3GMbIIQapkp0oKLPus8dUXzT7JWdYne8hQ==
X-Received: by 2002:a67:a64a:0:b0:357:5efb:c1ff with SMTP id
 r10-20020a67a64a000000b003575efbc1ffmr5723723vsh.83.1660520390677; 
 Sun, 14 Aug 2022 16:39:50 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:49 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:25 -0300
Message-Id: <20220814233845.2247022-14-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=FjMXgBJ3+qHB3WUtBIH/vcUKxR+5jeqD8J8i9y6uGPY=;
 b=oK/JzIFq93ilDuj6rYgV1AHaKeU2purv0gKP3vXGJlC4iLxo58xTo8+sC8O2Qz6rZt
 2Dc/axO9J9cX4NJwiXuBDRLH4yfGJf3Tip1sq/7A8Ig38v/0OwcwICjN0oKX296tgZWE
 lhhw7+B35S6leAeh+HtVTLwyauUKTk2oTwmrQLgJhp6Z+HSXiXLHAbZ0Jv0sofKS5M53
 hHxQEHjT0+rPhYZbrDDkPfQYCImBcdjWxrIoOC9Q4EG7x84u/15fD27GuVMpkl+VS2rL
 3jBClqXoV+hjx2XGPd5eBZCj1wDytoDaRoUQT1uS0T3Uqb31fYJHdP1RJVNq+6/qqS+M
 xlCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oK/JzIFq
Subject: [Buildroot] [PATCH 13/33] package/qemu: fix typo on STAGING_DIR
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since this commit from 2010:
'87b81bb56f toolchain: move sysroot to host dir'
BR2_STAGING_DIR does not exist anymore.
So fix the typo added in 2014 with commit:
8956c336eb package/qemu: add SDL frontends

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/qemu/qemu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 9e1bec3836..f86c4c41ac 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -72,7 +72,7 @@ endif
 ifeq ($(BR2_PACKAGE_QEMU_SDL),y)
 QEMU_OPTS += --enable-sdl
 QEMU_DEPENDENCIES += sdl2
-QEMU_VARS += SDL2_CONFIG=$(BR2_STAGING_DIR)/usr/bin/sdl2-config
+QEMU_VARS += SDL2_CONFIG=$(STAGING_DIR)/usr/bin/sdl2-config
 else
 QEMU_OPTS += --disable-sdl
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
