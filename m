Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562F3C54EE9
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 20:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D24DE403D0;
	Sun,  4 Sep 2022 20:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D24DE403D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CZzCHja00ZKA; Sun,  4 Sep 2022 20:04:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8899A400E4;
	Sun,  4 Sep 2022 20:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8899A400E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AA861BF303
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 20:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1310F8137A
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 20:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1310F8137A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nTFWeqW2uD_i for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 20:04:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 049558136F
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 049558136F
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 20:04:15 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e20so8821581wri.13
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 13:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=9gnaW64qIqh7NQrH1JLPJSirgh5cTW2g77dRO4QWwS0=;
 b=tpZp06Gm1t6nyyw+qEsjfdKPd2FMbWV3J9x2m3JVuisYpCQH7s/XePCDT6OExoUWmY
 cUtqqc8O2hgT5o1Cw2SikwrUS4cGZPvswyX8iC3p1G88FIH91sUbJtSzDucamDNmTrWs
 +c3Y9A31rIKwBQpP+1w/23OBFW5XL483hixah0/xNmJOXpsIM7YRDvE0pQOgetVPiVQ3
 1zwZdJy2C/9FTrdwHCBb3elak9RcB5oeb1cUJRdzMS3kx6yTJLeid8LU14vTlMAhRWCY
 IZn9iIlLowce6QmsecDaSepLez5m2oYIjQ2RTHi6TPjKO7PJ68cFR9Q4oZFw7M9zoUUV
 7MFg==
X-Gm-Message-State: ACgBeo2VdLeAX9JsGTOmRHvYDdVlhtREtEbOVwPV6DNRY5TSxhDVsIIj
 87h5TORakZ4KUMXzdCu5wbK+zU5w72Y=
X-Google-Smtp-Source: AA6agR7474j6+xc5k7T+XCW1VRNBwxiOFwCOl55rUrBz56xbOKLeAxDWz+89O3a/0k1ot3i8EyQt0A==
X-Received: by 2002:a5d:47ce:0:b0:228:5769:489e with SMTP id
 o14-20020a5d47ce000000b002285769489emr4128606wrc.188.1662321854074; 
 Sun, 04 Sep 2022 13:04:14 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 k27-20020a05600c1c9b00b003a845fa1edfsm25794026wms.3.2022.09.04.13.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 13:04:13 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 22:04:09 +0200
Message-Id: <20220904200409.3153993-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=9gnaW64qIqh7NQrH1JLPJSirgh5cTW2g77dRO4QWwS0=;
 b=Fqp2OnuzSr+fTJjxuH/Lq1SengfdJ8iit2xcFeUiAdy6zhmpxJk2uzvpGyeIlu9Hgl
 j1BabSFerFMyMhGcvXZ8LX9aMAFbY1+HYoOU+XR8YMDW/oJ23gf9sivR7p6MhXvYt2Rk
 nAN+zRJIEILMszHkZLsYascS1XAG8i/bX2aiVe3SRM+6gRFIvfvxEIMKyYVoTkKG7G0F
 1zfizPdI8q+PlXGwR7T+kjFgQrFYAt/yW7FXOt5R5I38ZJJ9UZ9eHfrLzdSUuENkVUUn
 1IUHVKEH//WAMBVxayCLUO/5bcMEYiRLa9oO4oUyZ0ZtIUmG7LqxkwcAS9HqjjCa8TLY
 iyBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Fqp2Onuz
Subject: [Buildroot] [PATCH] arch/xtensa: xtensa little endian target
 requires an overlay file
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Using a custom Xtensa processor configuration select little endian
by default. But xtensa for little endian requires an xtensa overlay
file containing a version of xtensa-config.h header for gcc setting
XCHAL_HAVE_BE to 0.

When BR2_XTENSA_LITTLE_ENDIAN is selected, we have to check if
an overlay file is provided. Error out if BR2_XTENSA_OVERLAY_FILE
is empty.

Fixes:
http://autobuild.buildroot.org/results/f0b/f0ba47d2534aeb3cc2921124aa639ae3aa072b9b

xtensa-buildroot-linux-uclibc/bin/ld: ldso/ldso/ld-uClibc_so.a(ldso.oS): compiled for a big endian system and target is little endian

[1] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=include/xtensa-config.h;hb=2ee5e4300186a92ad73f1a1a64cb918dc76c8d67#l28

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/arch.mk.xtensa | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index fd410f6bfa..516d77bf91 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -34,3 +34,11 @@ define arch-xtensa-overlay-extract
 		$(ARCH_XTENSA_OVERLAY_FILE) | \
 	$(TAR) --strip-components=1 -C $(1) $(TAR_OPTIONS) - $(2)
 endef
+
+# By default GCC build xtensa for Big Endian. To build for Little Endian a
+# Xtensa overlay file must be provided.
+ifeq ($(BR2_XTENSA_LITTLE_ENDIAN),y)
+ifeq ($(call qstrip,$(BR2_XTENSA_OVERLAY_FILE)),)
+$(error No xtensa overlay file provided. Check your BR2_XTENSA_OVERLAY_FILE setting)
+endif
+endif
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
