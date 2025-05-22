Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9072C54E90
	for <buildroot@archiver.kernel.org>; Thu, 22 May 2025 13:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8845E60A9B;
	Thu, 22 May 2025 13:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o96lJqgxz-io; Thu, 22 May 2025 13:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C47CC6062D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C47CC6062D;
	Thu, 22 May 2025 13:48:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B3C9B69
 for <buildroot@buildroot.org>; Thu, 22 May 2025 13:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0E41419CA
 for <buildroot@buildroot.org>; Thu, 22 May 2025 13:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OznzBAaq66EH for <buildroot@buildroot.org>;
 Thu, 22 May 2025 13:48:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A21A419CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A21A419CB
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A21A419CB
 for <buildroot@buildroot.org>; Thu, 22 May 2025 13:48:24 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a363ccac20so5407299f8f.2
 for <buildroot@buildroot.org>; Thu, 22 May 2025 06:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747921702; x=1748526502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zZnwbbW1Y860YHTZGruAR8EyL063u9tkdESpF2VhJng=;
 b=f8t093wk3Kd6UWEM7IIQBGZS02/intT0vDTf6zPOeku4XfaSIzd8+A95KfDNQenguE
 lG34/W163pdlS+Uzc9Np+yMEiSp3HtOiBICKm7Fxs1AzNeM6FYWz4Kq41kcDbjCWk34b
 PvRYNhVuckJGw+GIu/w2ocAWGYuiY0c0XbCvAtsNofRFZbLF1iPfNmCqMjYw1FkD4AX3
 uDL2JQVIO4DjIuZhHRT3RyogRltm5rubWASist2BY+gMcjmqPkCzaI0knoVo+6GZfvCI
 OeNm7SeB7MvLDjlxGRA1llU2qkaJIU4KacGVKcetcAP8lx5fGHsO3XC02nhTiO30Eazv
 rd3Q==
X-Gm-Message-State: AOJu0Yz6tij3o1110H7df28R1ZiEjdvjgoHIo+nujrPqeuHOTLhNTm5O
 xxFziriJxpujkAMkLl96jEq6KkRwy5KwRg2bY2e0wDIs2Z+tXXJvI3kcI1u2Wg==
X-Gm-Gg: ASbGncsSseOoresXeBNZmbS1XTg3I4f+nU60BAZ4Apk97wQj/WmssM8bVvUsQps18Pi
 VncMteaffN09mK8nrFcTvW5ziDkANhtCfMVuuuDs9ljkziz0h/K+oOBscbjvYccxzl/4WTIJUOq
 cO4k67FMRftEUt4lHtISmcyAHWzDh1YSSD6iJbDtIwM0Va1hIC/+PC3p9ZXps82FqSRy+uwGxe8
 tZa16ovd90gzUwP3U3Rb7kHVMqnudOrXFPnhrgfTOK+nxgHoz98vTjI0x0q0BIuVBce+zYuFQxh
 5z1VxAskw/ccFFBZN49OCkta5GbuZT/vkEEOH07+0rblu9UsBD3tCoMI0LKYPz4xLRcZ
X-Google-Smtp-Source: AGHT+IGFyNihZhPcv7WdwMqB+ctZNkfetSpJcC7sYRUGCZNomLuhzaYvyeN3Kfu37bWdWc2mBm1I+A==
X-Received: by 2002:a05:6000:18ac:b0:3a3:67c4:580b with SMTP id
 ffacd0b85a97d-3a367c45acemr16969299f8f.46.1747921702463; 
 Thu, 22 May 2025 06:48:22 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca62204sm22750735f8f.42.2025.05.22.06.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 06:48:21 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 22 May 2025 15:48:10 +0200
Message-Id: <20250522134809.169692-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747921702; x=1748526502; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zZnwbbW1Y860YHTZGruAR8EyL063u9tkdESpF2VhJng=;
 b=a5obmdJpXxwJnC6getdXFfhyLzIQFlhbrraHsKsdxieYOIyMR/95mOgknIUCmd5FyQ
 b0wElBrset7UIwvoEUbHeWckgGQSYKQMvBj5Hbp0eDs8k/cwhuzcoYAH/Qz+n/ruRqLl
 W5SbhZT9K5UCLg+zq/jUqH98VSQHn54RfGxT/+GHzghf0X+LM/AJmUYzuiEV8yjd3Zyg
 H3tWvPqeFGaQRqio5L7eX/Kh7ddNk7rk8DwSGQkIHlk6omAyUk9XuIKMEVebtvUHXxQO
 IqrZD8QGgXR/BQs/LpA73qdkH86v+LAE2QaRI4hD5nDUTw5OeqaJFPz5L3dVNPPlerVe
 nkLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=a5obmdJp
Subject: [Buildroot] [PATCH] package/kmsxx: fix meson build directory for
 extra tools
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 4e95062f8 ("package/pkg-meson: use buildroot-build for build directory")
changed the build directory for meson packages to 'buildroot-build'.
Thus accessing the build directory for installing the extra utils needs
to be adopted to this directory. Otherwise the install will fail when
BR2_PACKAGE_KMSXX_INSTALL_TESTS is enabled.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/kmsxx/kmsxx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index 8ebdffaad1..f65cc668d4 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -30,7 +30,7 @@ KMSXX_EXTRA_UTILS += kmstouch
 endif
 define KMSXX_INSTALL_EXTRA_UTILS
 	$(foreach t,$(KMSXX_EXTRA_UTILS),\
-		$(INSTALL) -D -m 0755 $(@D)/build/utils/$(t) \
+		$(INSTALL) -D -m 0755 $(@D)/buildroot-build/utils/$(t) \
 			$(TARGET_DIR)/usr/bin/$(t)
 	)
 endef
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
