Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036EEC4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78EB640579;
	Thu, 29 Dec 2022 09:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78EB640579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lBkub-0cOiRn; Thu, 29 Dec 2022 09:25:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFD4B40584;
	Thu, 29 Dec 2022 09:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFD4B40584
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55D3C1BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 313BF81846
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 313BF81846
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dnKcFmnp9B6J for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:25:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E5C6817C0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E5C6817C0
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:25:47 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso12835331wmb.0
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 01:25:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MH+a7sXW6dATioz2uiz5oFzQWoAfA11XSZu1iwf+whc=;
 b=Mf9LZHwKa0buQoGx6siNGj3ZVXR0e3fBraHw1CECPRfqSEXueC4Jb+Fu6sf7r52C+S
 7jzlcbj2hks+f+YRZ8yQ1WHsTX2nEZIQJ3Ky+Y9gH+i2XuboOwNooM6TMN4j9g70dB0t
 BVi8i0pQ0VnzcL5OSW1TLf9Immy4K52OEKHJ2G2qhCz0L54x/pIDv59I8574E11hmhA4
 4g5OBHi2fOAs9/zwwCq1Ok72zV353xpLbCtCAAJTVEi948XTM0gufb/o/Pu6Yxor6YFa
 WxMcM3GvBmRrqta/slUaT9kYRMUousRSrFXm8FbKBqRM+DlBXGGSNaV7XEj4XA2xCLIS
 r0+Q==
X-Gm-Message-State: AFqh2krg1mVXRD4TGm5UrGlQLHeMpzePF8RpAefPl8R5Nh32ek7k7hnA
 5irfX16ZhezhLoRQaKJNI2rsgduuw5I=
X-Google-Smtp-Source: AMrXdXtTpYQZpFCoMfmHO5RgCQHxwXu3lKnZ5JahVSfG+hVG3+Uzu+hfT02P4DnC4gqbj0L2pbc7Fw==
X-Received: by 2002:a05:600c:1d03:b0:3d3:4aa6:4fe6 with SMTP id
 l3-20020a05600c1d0300b003d34aa64fe6mr19290709wms.3.1672305946057; 
 Thu, 29 Dec 2022 01:25:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c080500b003d208eb17ecsm22479148wmp.26.2022.12.29.01.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 01:25:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:25:39 +0100
Message-Id: <20221229092541.236778-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MH+a7sXW6dATioz2uiz5oFzQWoAfA11XSZu1iwf+whc=;
 b=LkmF2O4h+n+owQBpNMBHgw1WcLUujd+OPMAK3kbFMsv+L+m39O+aSXrjoWY96xWK6d
 FJW9XZdzlWk7p4/+ZLhdLncnWckNBlicX05ern8XWSlEEKRyS8gW/GxdJs/6Ub0s4zpx
 oqIDgMCXawkFCoSYpyXX95LX+PzD5Qb9a0AcVgdmqHZcQhx80jDvrLNZcnY2QDbdjdHw
 T/MYr04MY3jymURFJ/fzzpfIUdNdHzAOwG/PYq8C3+Fw9lVsCLK2XRhGkHgb/X2K4AM/
 vtfiQGEGP3+Dq6ZJatqXkIBvKBECvf4nwvwm42SLBN+aUDXlREQY3sa8teAxZlUEpSrs
 olyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LkmF2O4h
Subject: [Buildroot] [PATCH 1/3] package/rsync: add zstd support
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsync/rsync.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 3cdd820fc0..7a32c4f8b1 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -19,7 +19,6 @@ RSYNC_CONF_OPTS = \
 	--with-included-popt=no \
 	--disable-roll-simd \
 	--disable-openssl \
-	--disable-zstd \
 	--disable-lz4 \
 	--disable-md5-asm
 
@@ -36,4 +35,11 @@ else
 RSYNC_CONF_OPTS += --disable-xxhash
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+RSYNC_DEPENDENCIES += zstd
+RSYNC_CONF_OPTS += --enable-zstd
+else
+RSYNC_CONF_OPTS += --disable-zstd
+endif
+
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
