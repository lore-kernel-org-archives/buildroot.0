Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCD0C433FE
	for <buildroot@archiver.kernel.org>; Sat, 12 Nov 2022 12:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51F0A4067F;
	Sat, 12 Nov 2022 12:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51F0A4067F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rEmsV30N8_T3; Sat, 12 Nov 2022 12:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1BD04035D;
	Sat, 12 Nov 2022 12:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1BD04035D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F19BA1BF82C
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 12:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCFF640232
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 12:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCFF640232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z_D1-d7KqH6R for <buildroot@lists.busybox.net>;
 Sat, 12 Nov 2022 12:34:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81AF7400CB
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81AF7400CB
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 12:34:35 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a14so9681680wru.5
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 04:34:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nAodoGc9YtaY+J9te7t6mG5xrWYC5t8302CxwE9xgsc=;
 b=fKklPMGV58BhYFabXEIPb/dfdGnQ/EGMvFa33+spKwiA3xOp/HNkvMLFjveWfFussK
 qUxocfNlXeUlIUc0MFYwl5AxWg6meVtG/rVDMcXUse+CfgWUrNEktmIWJrrHQ7LR//WU
 S3wHI3Cog5fZG8Mxd7H1bVEIbOae/9Uju/zcVj7JLlCqSEf2c3+sDpLbi9nMp3aekluC
 /bXR7V6tKY1ct+53ZR+UgYmZ3MJcKsodqYpN/xV6bemE2DGW2yVXnTk1oypRl78uiueH
 jJO9iiaZQVUhmlVHjnqJxleZi/hcDh723t9xGjG5pBDEMVbJRcYXsgSe6VZKJc/gLBaR
 fyAQ==
X-Gm-Message-State: ANoB5pkM0qk4mL61i75w5qHvxcRLvvr6Z3NNk5zN43h08xBWjzDYc50B
 /8x/UQEG0UuR19+iXy7Yo2ih9WyEABE=
X-Google-Smtp-Source: AA0mqf7Omu+gFLGMEalW+PqJx200QkLBb5ymyT98GjywiY5bBRxPMNiqJ2/hcrNpsuovEjIyGRsT4A==
X-Received: by 2002:a05:6000:71e:b0:238:c1d5:332f with SMTP id
 bs30-20020a056000071e00b00238c1d5332fmr3526226wrb.37.1668256473599; 
 Sat, 12 Nov 2022 04:34:33 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:12bc:32e:ad2a:4f42])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c358a00b003c6b70a4d69sm6714810wmq.42.2022.11.12.04.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Nov 2022 04:34:33 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Nov 2022 13:34:32 +0100
Message-Id: <20221112123432.1075333-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=nAodoGc9YtaY+J9te7t6mG5xrWYC5t8302CxwE9xgsc=;
 b=eE1s7bhB+TxG0MydNSIAE4Cvt/VvWz49+IaBa7xVt72Rup/+vvW2EYCxeRTTxGkUm3
 0XiW99ozAIZ69yXiD/Uk3cZDZKH2J9J5pVnixEXubjk9Sga+YedlX7YidGAv3TmCGCW+
 Sc8KSi6fv2msj7tFCCKTi7yxahfkIlj4tfS6tCRDHCMU7cg2darLzbtkZ6Y/FcUsbuS5
 ALA2+oEn7Ixy2LQw79nMvMNW4N818nxJzvPWmhA+WXLvquMMMG5gjrbv65Xyz7HYFCBI
 hinRNxazg/FeNwryFpGnTF9M+2WTNw4/PWMoedZY0DoMpFlheHPRzjpuPoEER3WZYD/A
 mAZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eE1s7bhB
Subject: [Buildroot] [PATCH] package/dbus-broker: audit support needs
 libcap-ng
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since v14 in 2018, audit support has needed libcap-ng.

Fixes:
    http://autobuild.buildroot.org/results/43abdb85cc2f386d427cec1cfa876e20e3509cb8/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
---
 package/dbus-broker/Config.in      | 1 +
 package/dbus-broker/dbus-broker.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/dbus-broker/Config.in b/package/dbus-broker/Config.in
index c7206232da..aa6584c392 100644
--- a/package/dbus-broker/Config.in
+++ b/package/dbus-broker/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_DBUS_BROKER
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
 	depends on BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBCAP_NG if BR2_PACKAGE_AUDIT
 	help
 	  Linux D-Bus Message Broker.
 
diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index c0a58de9ad..e82b79220d 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -28,7 +28,8 @@ DBUS_BROKER_DEPENDENCIES = expat systemd
 DBUS_BROKER_CONF_OPTS = -Dlauncher=true
 
 ifeq ($(BR2_PACKAGE_AUDIT),y)
-DBUS_BROKER_DEPENDENCIES += audit
+# libcap-ng selected from Config.in
+DBUS_BROKER_DEPENDENCIES += audit libcap-ng
 DBUS_BROKER_CONF_OPTS += -Daudit=true
 else
 DBUS_BROKER_CONF_OPTS += -Daudit=false
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
