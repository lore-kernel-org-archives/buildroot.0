Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC8BC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 07:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E74583ED0;
	Sun, 17 Jul 2022 07:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E74583ED0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJmG4UsrRQaY; Sun, 17 Jul 2022 07:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 634F883E84;
	Sun, 17 Jul 2022 07:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 634F883E84
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACC441BF2CA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86871607F7
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86871607F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YX2kPbEsayNr for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 07:53:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C18E607E3
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C18E607E3
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 07:53:55 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 j29-20020a05600c1c1d00b003a2fdafdefbso5582342wms.2
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 00:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XMY8gaRqNJfA356m6sT9VeW+QLG+JbvRzSH9hZodc4U=;
 b=ARb1jNJU6V+iMO4nWN9DNynY4XlJPcvjDY/b2bDELWOG7FIPn0zIpf7MJQb/RAtpm/
 zcWwtHLPgtgzHWEQ27kLwmv3cMje+A3Xbq9y29pGnt7Yplf2qyGVcNEcAKTYdDB5GuBu
 VwxAehr+OzHEPOowVyqql7oiRSWDlxb5TWIUrN4vg21MmOfwn5jibApDu0zBvSJ0QWwY
 Poz68o/UyhZqugz5x+fpVuzEDvFrAYGDEMWLTqjPIlBL7Ayja7GfhXwGMXmoWkmy3Uoq
 CS0DxZ3jtm6+N+l7/o3clvwsubetTqmbc+iEHSvvtU8ACFOrgaqHIr/KBuWmaonD8lLD
 IpIg==
X-Gm-Message-State: AJIora/L4qNjJREZGSDBAfetX1FsCci8D7o9aI7hdWbmHFN4RfAQOqIT
 tVendgtebE486wwkq/h+FWrPeyn7aPM=
X-Google-Smtp-Source: AGRyM1vGPGJlO1xASifXK7EYSLzKxlLBkEaa5+v+/OhyInpKkgKqxp70BhyznrUwMiZHOWRHIeovdw==
X-Received: by 2002:a1c:2783:0:b0:3a2:fd82:bf46 with SMTP id
 n125-20020a1c2783000000b003a2fd82bf46mr20156752wmn.29.1658044433346; 
 Sun, 17 Jul 2022 00:53:53 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a6-20020adfdd06000000b0021b970a68f9sm7642292wrm.26.2022.07.17.00.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 00:53:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 09:50:34 +0200
Message-Id: <20220717075034.2246639-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220717075034.2246639-1-fontaine.fabrice@gmail.com>
References: <20220717075034.2246639-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XMY8gaRqNJfA356m6sT9VeW+QLG+JbvRzSH9hZodc4U=;
 b=fBEc7qMEvpyUxaEL7uN23Inq4kgGuS9lY7NYq+RnOEGFGTMr00ifFkIdIcqgTnQumh
 Lzbb0kcTmUFQLEl7/+gBuCV6OQBuQHyH9+D/wm0gePEuk9NoFZQd5Wm/mTQyHn6Mcfji
 +TJMMBF6jsoqU10tTwYboq9ICBHw6xvP8QQyQPJePRYXKMU3JqcYaq6LBl+seVFRidUG
 Ur/GE811jEv3f7hRNwUCWaES7O2ZE9hjpKnWS135Oj4A80yebMOMHVmIGe6cSBoS+2W+
 tkzppwxSDIP6OA+8BEMiu96pnRCfDI04Sx1+bwjtvQMP07SIoNo5a2CxLdHxf3g7UvDQ
 PuKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fBEc7qME
Subject: [Buildroot] [PATCH 2/2] package/libwebsockets: add wolfssl optional
 dependency
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

wolfssl is an optional dependency since version 1.5.1 and
https://github.com/warmcat/libwebsockets/commit/c3bcb89d01da0c3ce9915cd73451399ec005b535

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libwebsockets/libwebsockets.mk | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index f5cde37109..79624948a5 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -34,16 +34,25 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBWEBSOCKETS_DEPENDENCIES += openssl host-openssl
 LIBWEBSOCKETS_CONF_OPTS += \
 	-DLWS_WITH_SSL=ON \
-	-DLWS_WITH_MBEDTLS=OFF
+	-DLWS_WITH_MBEDTLS=OFF \
+	-DLWS_WITH_WOLFSSL=OFF
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 LIBWEBSOCKETS_DEPENDENCIES += mbedtls
 LIBWEBSOCKETS_CONF_OPTS += \
 	-DLWS_WITH_SSL=ON \
-	-DLWS_WITH_MBEDTLS=ON
+	-DLWS_WITH_MBEDTLS=ON \
+	-DLWS_WITH_WOLFSSL=OFF
+else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+LIBWEBSOCKETS_DEPENDENCIES += host-pkgconf wolfssl
+LIBWEBSOCKETS_CONF_OPTS += \
+	-DLWS_WITH_SSL=ON \
+	-DLWS_WITH_MBEDTLS=OFF \
+	-DLWS_WITH_WOLFSSL=ON
 else
 LIBWEBSOCKETS_CONF_OPTS += \
 	-DLWS_WITH_SSL=OFF \
-	-DLWS_WITH_MBEDTLS=OFF
+	-DLWS_WITH_MBEDTLS=OFF \
+	-DLWS_WITH_WOLFSSL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEV),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
