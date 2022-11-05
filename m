Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC79FC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 16:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5940381E49;
	Sat,  5 Nov 2022 16:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5940381E49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mIdXAnR64xH4; Sat,  5 Nov 2022 16:55:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77A9D81DED;
	Sat,  5 Nov 2022 16:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77A9D81DED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F1CD81BF38C
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 16:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB7B260AE0
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 16:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB7B260AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8NhNv5wDYHeQ for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 16:55:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26E0E60A88
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26E0E60A88
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 16:55:28 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so4860571wmb.3
 for <buildroot@buildroot.org>; Sat, 05 Nov 2022 09:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q/feM+khua1OCkbFXm1kmvQ64um7YVWudIUlEpgE/xY=;
 b=YNVSLx4ZcIZfJxxt1C5NIz/yI/kGR35JoH9pupVf4OF4qZYSY1cQ2kKreOfRCvlcqL
 OgP5ItwkieLOvlkWuYp1YjFeYc+oEhbCi46QPlIbxXhpaNvYHiGs35+HJSQ0BcmGiTaB
 oeitOM4fpVhl0+V7yzUx7S4XIM1J+i2jz8thdFem45S4QBRJpsBEMqYtBre2hVnmYZjk
 pUJTjXMYbFNHuBIKIC5+onZO8+GacROXkPm62wN0eeluine+IajL39ImZpGfoUVXxndj
 SNBesmYZwKntDorr97MkGNaUXlILZLLP4sZ0uRyef4w149lt8AowFRTgsy75iyPg/4+R
 EqPA==
X-Gm-Message-State: ACrzQf1CjRXam14fH1Qp/OIvO3ImD0gK6ppYo33wIs8+GQr/HaWpBCN5
 1E5R6/JrpMJALeMwecGAQJ/ONswo04k=
X-Google-Smtp-Source: AMsMyM6DRALtsg2Ake9S5E+avdKo1aiobo7eu9g4H2xw5jrHCKYiaviKGAedHNrHxMxnpMWAtaznoA==
X-Received: by 2002:a05:600c:1f11:b0:3cf:73f0:b753 with SMTP id
 bd17-20020a05600c1f1100b003cf73f0b753mr20928505wmb.100.1667667326237; 
 Sat, 05 Nov 2022 09:55:26 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:b857:25fc:60e2:657f])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c1d1300b003c3a1d8c8e6sm3208226wms.19.2022.11.05.09.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 09:55:25 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  5 Nov 2022 17:55:24 +0100
Message-Id: <20221105165524.747494-2-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221105165524.747494-1-yann.morin.1998@free.fr>
References: <20221105165524.747494-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q/feM+khua1OCkbFXm1kmvQ64um7YVWudIUlEpgE/xY=;
 b=G1EwgIjw6MBV9wn8BpyicIALV42C9J5W0msOGmRJSNzIyE4WQsyrQmngH4uQXrwmCF
 FHuZbdBUX67vOn+dMQQsv6829DehomHx7tRbbqS/SvYjct5Rw0GvLKT4WghZmnwvKZN4
 IWTaolmXb5z9cPnCvGGpWj3I5UVGbaAJ3KnP0nuhp8B39z1tn7hlDYQ0Ep7T6aBJ06e8
 XqKh9/Eu4vEJneRuv230UpQ6/FpwiSr4qQD6QOgFtjBa+KAPeJYa9V9/Su/SAS3Uqxz6
 WEZnzLY+tortgYWUgFBx/Ri9iqBmYStRnTSoaYEc7P5+nnFPB9+qxNhXQwE2dJpe6cJq
 HQSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G1EwgIjw
Subject: [Buildroot] [PATCH 2/2] package.libopenssl: fix enabling/disabling
 mdc2
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
Cc: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, "Weber,
 Matthew L Collins" <Matthew.Weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 3dbc86f09897 (openssl: bump version, enable mdc2+camellia+tlsext)
form 2010-06-03, forced the build of mdc2. Commit a83d41867c8d
(package/libopenssl: add option to enable some features) added an option
eto explicitly disabled mdc2, but forgot to ammend the existing enabling
option.

It appears that, like most (all?) openssl config options, mdc2 ends up
enabled unless explicitly disabled.

Additionally, mdc2 depends on DES, so without DES, mdc2 gets disabled.

So, drop the explicit enabling option, and make mdc2 select DES.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>
Cc: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
---
 package/libopenssl/Config.in     | 1 +
 package/libopenssl/libopenssl.mk | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 00339238fb..7a3f56a512 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -63,6 +63,7 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
 config BR2_PACKAGE_LIBOPENSSL_ENABLE_MDC2
 	bool "enable MDC2"
 	default y
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES
 
 config BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2
 	bool "enable BLAKE2"
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 3542b89727..fc22c20467 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -79,7 +79,6 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(if $(BR2_PACKAGE_HAS_CRYPTODEV),enable-devcryptoeng) \
 			no-rc5 \
 			enable-camellia \
-			enable-mdc2 \
 			no-tests \
 			no-fuzz-libfuzzer \
 			no-fuzz-afl \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
