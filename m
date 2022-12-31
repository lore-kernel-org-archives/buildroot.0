Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F3EC3DA7A
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 09:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D20E760A91;
	Sat, 31 Dec 2022 09:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D20E760A91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sLwUUHD-vBhA; Sat, 31 Dec 2022 09:49:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 193D560746;
	Sat, 31 Dec 2022 09:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 193D560746
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55A291BF83E
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 09:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D9DE40239
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 09:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D9DE40239
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3QkyDDAPCJLz for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 09:49:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB37D40117
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB37D40117
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 09:49:40 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso13405967wmb.1
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 01:49:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U5AyL0HOh9b0NMlC0wPlL3GumT1dcxa3NRAtMUWPn48=;
 b=TiSW4qg6abFioCcLtV8Kbud8LkIOCq0g1K2rgQG7rQ+Z/6tK3T+b8tT7kPmlGian+2
 J/104F8w+i8IaC/ap2dQAh1/s0oKnF3EjQGOEra2rEuzJqgdS6HMfQVpYh3XJP1xZYVq
 qcGBC+ugFYOw2Fx26IXOHsLFy2h5tpzzHnsrq9KLejTqpX1uybsYYmWzEfSt/CE/k1Cw
 2QlX2enK/xBBpTC0SpTdkYQ8IdkhHa4CJqyHBvdQbYyOVX4skvAhgUmTbSiLVlilO3W2
 NWolj0Qv/QoUs13h+MpELQDPsDolOaaxCFT6Rp+InNbcESxJNzsOD55dWbCN9Umu84ez
 1kOg==
X-Gm-Message-State: AFqh2krcSuiSlvWoJoA6bp7Z9jpcMR7JAQWcfYe6IMqIEvXsjjnxh+N/
 Ly1WuwMpo+M78WR7Oe8S2+kxm0QmGQg=
X-Google-Smtp-Source: AMrXdXt4O76/uFDLHRcy19vvmkQSmnUI0fBvM9UQ/mfv6AW8cHZtL0U0eAKU8YL4h2wFqRlYLpMBXg==
X-Received: by 2002:a05:600c:3b29:b0:3cf:d18e:528b with SMTP id
 m41-20020a05600c3b2900b003cfd18e528bmr24858289wms.39.1672480178725; 
 Sat, 31 Dec 2022 01:49:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c080500b003d208eb17ecsm29131979wmp.26.2022.12.31.01.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Dec 2022 01:49:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 10:49:35 +0100
Message-Id: <20221231094935.245194-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U5AyL0HOh9b0NMlC0wPlL3GumT1dcxa3NRAtMUWPn48=;
 b=MWqytHYFM5X2/SLkRSy52Q+zZfAKzzeyTLMP/z2Nc1eWK4tCBOI9ucB5v72mzE6/5+
 rcponjuku/mEdMdR6mtxKnBoT3Qz5dH2WF3QliiMFgm/nhn9MU5e0SQuNF57LBUljXsW
 CoNDQ3MSd8miy9HjtF3l0lgYEuOpP0Xc5EDN7TqtD8nSjLnTAl/8cyDW2RVD3mHMeEWg
 4gkKQ0OaOsymEVjvN/GYYLxqm2cF+OFEAlyD4ZoVJLkU9TCz0tzZAXdMJY5XZJV2ovbL
 bEZhDZjwnyeS+PKGgiZ4vKc+bHqAbcVBNtZaP6pwOGO64pzLZt2LbY9LnsvYNFLCUSQV
 csXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MWqytHYF
Subject: [Buildroot] [PATCH v2,1/1] package/modem-manager: qrtr needs qmi
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 1.20.2 in
commit b95334b71fbdde0f7621b58ed35fa98df9e0966d:

../output-1/build/modem-manager-1.20.2/meson.build:262:2: ERROR: Assert failed: QRTR support requires QMI enabled

Fixes:
 - http://autobuild.buildroot.org/results/04b9a41c5edbc492ef640b27d4d3d896d230cf34

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Select BR2_PACKAGE_MODEM_MANAGER_LIBQMI instead of BR2_PACKAGE_LIBQMI

 package/modem-manager/Config.in        | 12 ++++++++++++
 package/modem-manager/modem-manager.mk |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index d211d68ee1..8489e6fc86 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -25,6 +25,18 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
 	select BR2_PACKAGE_LIBQMI
 	help
 	  This option enables support for QMI protocol
+
+config BR2_PACKAGE_MODEM_MANAGER_LIBQRTR
+	bool "QRTR support"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 # libqrtr-glib
+	select BR2_PACKAGE_LIBQRTR_GLIB
+	select BR2_PACKAGE_MODEM_MANAGER_LIBQMI
+	help
+	  This option enables support for QRTR protocol
+
+comment "QRTR support needs a toolchain w/ headers >= 4.15"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
+
 endif
 
 comment "modemmanager needs a toolchain w/ wchar, threads"
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 8a0dbba3a4..8ef85b9b1d 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -37,7 +37,7 @@ else
 MODEM_MANAGER_CONF_OPTS += -Dmbim=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
+ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQRTR),y)
 MODEM_MANAGER_DEPENDENCIES += libqrtr-glib
 MODEM_MANAGER_CONF_OPTS += -Dqrtr=true
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
