Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D32C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 16:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A450A418EC;
	Wed,  6 Apr 2022 16:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDoi9a9FHd3u; Wed,  6 Apr 2022 16:30:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CBF7408A6;
	Wed,  6 Apr 2022 16:30:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FEA31BF593
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 16:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F0E540AE2
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 16:30:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OMTEkJH6LlD9 for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 16:30:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64B4B40141
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 16:30:14 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 m67-20020a1ca346000000b0038e6a1b218aso2004012wme.2
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 09:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6grsxZUao6rATsQRFpaQGkwG7EZXt4B2Jl0rKEmX4cY=;
 b=n7UWfDQItuq0Ib/cmWR9QbAn67nyRmaUIAbEfqQ6XON47Esa6igrO4KPVVG1/fFRcT
 KK7MCBuZKliCSGMMbvo8IyYFCiJmt/6AmuIZ699iDQwNZ5nboXfkvXhYIzIyoN+hwrEe
 hKr/Up5vfnct/tu/RqmCaHTZ1dRb138bX9wOR8bTyLChhItEM+qEcuhwn5bF47KZ7LOi
 0bzYnx09CoDv2C8L5+JDlsY1eTItozXR9oA1eqI5bPMV07HDCkw2EJnUQVKi7iwnpoC8
 kB3CxjWKHqR67Wt+cUxhz2CZh6NxR2uVSeBUAzzhAvmQyuBVYSwvravAO759ghKSErLw
 rqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6grsxZUao6rATsQRFpaQGkwG7EZXt4B2Jl0rKEmX4cY=;
 b=gwS0VwijBs+ykzzC4EoJJlVrygTQHPMyzdok6hJR3+++N4+igz6SafuR8Zk+YhtvbB
 zOlshImqaBzAFg5fAnjtGazkJGEfVs9GPO/c1BAJtnAPCD2CWE+nty8feLE2cDuFBLcf
 oykKfNyWUhMU2hNqay4rZh2SdPrifOAt7WTumx4e2xGBqt72uCNHHEfO8FTrygWTvv3O
 MNpOrzvCoibmRT27OrC5eLe5YE+CNtRYx1QsPIic1nle/V+8E9jJv9mGLFOra6MvVuG8
 Spi1K1XOV/wR2dd5sZLcEKSYUpRfuS0/qVml4FDCz09CCVtrXwdDR2qQO/wUPBnX7ONI
 HoVQ==
X-Gm-Message-State: AOAM533Nh/iiXE/9oRA+sUdT66aQeOCgf0uB1/QiS2I/gB+OqI1GiBIc
 E7O2wZKgx/V+XGUIVRdt29W/uPHVqDM=
X-Google-Smtp-Source: ABdhPJwTgOYIt8Ww9BJDz57HP6JyIbTw6Vq5tEN8Ti9qfYMb3EU3CVutczL0QyDR6L7cdTX5SUl2PQ==
X-Received: by 2002:a7b:cc0d:0:b0:381:220e:a3a0 with SMTP id
 f13-20020a7bcc0d000000b00381220ea3a0mr8188328wmh.59.1649262612429; 
 Wed, 06 Apr 2022 09:30:12 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c186-20020a1c35c3000000b0038e6c6fc860sm5296572wma.37.2022.04.06.09.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 09:30:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Apr 2022 18:28:28 +0200
Message-Id: <20220406162828.4005662-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dhcp: fix build with zlib
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

internal bind is in version 9.11 and so doesn't support pkg-config
like bind 9.16 resulting in the following build failure since commit
0c8dd6ebd656e06cf99a63eb93343715f4853503:

configure: error: include/zlib.h not found.

Fixes:
 - http://autobuild.buildroot.org/results/7a5cdf30881d208807976cf98960c5fe2abfed50

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dhcp/dhcp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index f1e3c22f1c..460e62a81c 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -42,7 +42,7 @@ DHCP_CONF_OPTS = \
 	--with-relay6-pid-file=/var/run/dhcrelay6.pid
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-DHCP_BIND_EXTRA_CONFIG += --with-zlib
+DHCP_BIND_EXTRA_CONFIG += --with-zlib=$(STAGING_DIR)/usr
 DHCP_DEPENDENCIES += zlib
 else
 DHCP_BIND_EXTRA_CONFIG += --without-zlib
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
