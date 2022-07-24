Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B287BC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DB574248D;
	Sun, 24 Jul 2022 09:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DB574248D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cm5Ku8eHxdhi; Sun, 24 Jul 2022 09:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FC8D4248B;
	Sun, 24 Jul 2022 09:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FC8D4248B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F1A651BF2B9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7B6B60B56
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7B6B60B56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1IXucu0wkzKi for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:29:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB26961004
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB26961004
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:29:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id v5so5122231wmj.0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=acvrmT+K0PutSZr5WYVfeeIPcOT3punz6MeCuRDaFok=;
 b=Noq7t+ouEw/KNcY6v7pahYYdHSz/64zKRN0q2AOXegEMcLKwLnXTMwY2GlExKgzDkl
 DFYkEZupr+cuS3IJ9BCdkzlsJm53OdhbUmqYgWlPWNT3mNFQ7+sd3Au+fnJ0z+Lhn727
 65i1O9bdsV+VABq3NMXrf6aNm52bCJ7ufmfYtqon/FUeu1IFQE6VuhwVpLR4fSQYmKne
 kL/XB5Lbcls0gO5HRbggZcM5hlaVbDGK6D/yGDPcyW59UGGYb4mfn95sjx0NHM3Mn9MV
 S5UDxxcJd6lILwJ2JmNMZ0a8GwOZ3euPmCMZYAgbo/EtCr99lo8WXxRcAGurD626m6OW
 xZ8g==
X-Gm-Message-State: AJIora97gXASMwKUA31qX5Y85kESYDpiWVDGn6rk9J8dK+nArOMbjBVg
 v2YWME6K4yTLB7ojC7WiMOHdCGnTpq4=
X-Google-Smtp-Source: AGRyM1t+qVdsuUxvQStahlwiH01Lpyt6geQjLBe0BkO3jt3FSCyFVqN53WWRxKMXVFovWXeEMzrg0Q==
X-Received: by 2002:a05:600c:2209:b0:3a3:1643:e29a with SMTP id
 z9-20020a05600c220900b003a31643e29amr18039018wml.48.1658654978755; 
 Sun, 24 Jul 2022 02:29:38 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a05600c420300b003a3200bc788sm13746417wmh.33.2022.07.24.02.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 02:29:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 11:29:34 +0200
Message-Id: <20220724092934.6041-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=acvrmT+K0PutSZr5WYVfeeIPcOT3punz6MeCuRDaFok=;
 b=fqrf9n6YXygwKhH3EQQ4NCO/g0lR5hzYSwcmuN4CupC0hR+QSs41qbpQTeO/ymspOG
 rQZwFp1Aeo6s2B1KsHuVDMBiFdOnrh6u0b0U3sDtrDY+/GXAbclu59DJmlofyd1nowyp
 e12Y1pqcBtkM7IxemiRkAiN8ga8V+/2Moh8a4TtQEyeZFKsCXANSQT3fxzJAnxDDXlDT
 iz6PPUJ4OR8eNFnAsw2S/Pi8K9aN9+9pm4wZUSXOQHdOUVs4SP8uMqNTC7fbm3xMio/c
 eysRKaGunG0U9sNbLq6W0RzHJtLI16UDW5aJwhv6C8LAvoE6jkuPbnS4XcfxkdzQu6KT
 ptaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fqrf9n6Y
Subject: [Buildroot] [PATCH 1/1] package/libiio: drop 'from' in comment
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop 'from' in comment of Config.in which was added by commit
00deb6a7c11440766767cc07800661e8067df474

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libiio/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 98d663e203..21c3a3b439 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -32,7 +32,7 @@ config BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
 config BR2_PACKAGE_LIBIIO_USB_BACKEND
 	bool "USB backend"
 	default y
-	depends on BR2_TOOLCHAIN_HAS_THREADS # from libusb
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBIIO_XML_BACKEND
 	select BR2_PACKAGE_LIBUSB
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
