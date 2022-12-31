Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C77C3DA7D
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 09:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EB2C60A6A;
	Sat, 31 Dec 2022 09:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EB2C60A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id onwwHUuo7aEl; Sat, 31 Dec 2022 09:11:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 756AF607FE;
	Sat, 31 Dec 2022 09:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 756AF607FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B14D51BF83E
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 09:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9279F81CE1
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 09:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9279F81CE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2mlOaEbm7K-Y for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 09:11:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FEC581919
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FEC581919
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 09:11:19 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so13521739wml.0
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 01:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tU5qNUA4iqyD1NUhha+SoXII5Ngap1HV6R4dzQ+9Hwo=;
 b=QDFPldtc4EAGy6NHU9WHsbgfdR7ZXgymNtnEJPzMEh6xdwDD4Fm0THfJPve8qULqxP
 Sgnly8M+bg2ejv1Vgy1TAN3HRIG7h11JUSQ5rNYA4hiOuJ2iSL1sn0Q+VVuuTnk8hGUk
 TAFpCWiKy/4/xrZxCP+/zPIOFVhu9lf55WrCivKwC4vE3PYlzjVMPDny8NR+tfWaf+OS
 /PmwjknShV9BJr4qY0wuT1sxbFSyHkeF6E6c0gVhV9sdXELX/X6OKSdi/ChkBJYOxB+9
 gu9Nt3PqAUgO1xik6khyrj/o+6lCqrn++8nXTYuvSba5oh2Ql2HtwRL2I38nr78cx/2c
 SFFA==
X-Gm-Message-State: AFqh2krWWfFXbx5DpTv7H4cs+/u8AIyQDXMM/8P3rEAXe+dCkPwB/cCq
 MUpKTq/EfQhQH1u5qG23WDn4+PzsZD4=
X-Google-Smtp-Source: AMrXdXv8KlfABKdrkA/AgVv2FLVaY66+d3RjW3v5oO53QoWD3WV497DgbokFI71v3CydK5BpJDJMNQ==
X-Received: by 2002:a05:600c:348b:b0:3d1:f16b:30e6 with SMTP id
 a11-20020a05600c348b00b003d1f16b30e6mr24776968wmq.28.1672477877101; 
 Sat, 31 Dec 2022 01:11:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c355100b003d9980c5e7asm10928289wmq.21.2022.12.31.01.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Dec 2022 01:11:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 10:11:06 +0100
Message-Id: <20221231091106.8458-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tU5qNUA4iqyD1NUhha+SoXII5Ngap1HV6R4dzQ+9Hwo=;
 b=n2SsB4GkjXA4bVR1Chv5nXi3/7GUGnBsok7fY4ctAQMA9AmC/7pZHHG1EuSNCWdGM+
 NGSchE1aIUHyj6UewsnJ36T1WzxTlq4B54CaACyEEGShPP7dWDOu9ytpw1dEu59CReBC
 MCYBn07OMxBcxJUn/SYFZ4n8I7ei9nqLXx+o97dKWkcYpu9HNNNuaF+Rg4OWniS/B3Gf
 APVLF1/rPzRn92iKGeN1wXWG9lplrll/UJulnYdEvzM1ETCI2pLuduvpYF7qcIlLr0sC
 CWRNEtTesdah9nC07vfPeM5Gaf/EnoW6wcFyUt3rTVgUJehIjQPlkkFaQjUU/X6YfUKJ
 h9Pg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n2SsB4Gk
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: qrtr needs qmi
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
 package/modem-manager/Config.in        | 12 ++++++++++++
 package/modem-manager/modem-manager.mk |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index d211d68ee1..5b2e67fce1 100644
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
+	select BR2_PACKAGE_LIBQMI
+	select BR2_PACKAGE_LIBQRTR_GLIB
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
