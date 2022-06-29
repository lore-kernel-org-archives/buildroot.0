Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D60AC43334
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 20:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1F068403A;
	Wed, 29 Jun 2022 20:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1F068403A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L57iot6_OwSr; Wed, 29 Jun 2022 20:39:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 804AF818C2;
	Wed, 29 Jun 2022 20:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 804AF818C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1F1F1BF2A6
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 20:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C971660C23
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 20:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C971660C23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oNWckNd5Rroo for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 20:39:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7E7560BF9
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7E7560BF9
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 20:39:53 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 t17-20020a1c7711000000b003a0434b0af7so375360wmi.0
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 13:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bjb3Nz5tp8hyq2j22xQzjsUbVEnIvWKBlSMeHwaccSQ=;
 b=EzfCt0zPEwWfmRWIT3h/AixrLx62FO2PWXBLLAIIuoP0vlqYzw4kNgBL4IWyjSv8BD
 21/cDFqfWerXcZeuvsutRE2yOm78N+DC2GDmdrHWBQJ76Vd+1dJ/nCN79yH30ArdQ+zP
 5uC1/lIjbrOl9o9d+lyjlZgBA74JIqSMOORmshdPuJw2ng62YgKuXWUY5cUAfCrp7Vun
 asgQIkGFB6qlE88c91FDNvl35rjSad7YMpW/qGccLuLlINYkzK7T9njigVdOHBlqEcEW
 HFY0INWOAdY4P2jbXxpC1QviwqZyWfY7Doxh5ChJXdA9FrkLBOcKfARj6fZEk8Ouu3Rw
 dT0A==
X-Gm-Message-State: AJIora9Qfy6eaA/vncccdXvteE4lNqIjpkTmjaaUUbqDPzRI56/GX2+p
 sb2XgZWyMCeuzRT+w8y0HzGEMdZKSVQ=
X-Google-Smtp-Source: AGRyM1tJPwP9ZJe8hr21IuwcSLoUb/8bUjKNBFUvok3sj/9bTpI0radv1QYxummNLHwq27NNtuxjpg==
X-Received: by 2002:a05:600c:1d0e:b0:3a0:50bb:55e0 with SMTP id
 l14-20020a05600c1d0e00b003a050bb55e0mr6004157wms.89.1656535191972; 
 Wed, 29 Jun 2022 13:39:51 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a7bc5d7000000b003a04a9504b0sm189783wmk.40.2022.06.29.13.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 13:39:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 22:36:55 +0200
Message-Id: <20220629203655.577286-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bjb3Nz5tp8hyq2j22xQzjsUbVEnIvWKBlSMeHwaccSQ=;
 b=WducxEK6Nj9ImKFNu3AmE4AStt+uihhKRXiw5T/MWraCtKD/gUgZ9rqUs/z66IjKFT
 t3FED0yQE6IPxiQ1RXtHgLoeq9W+d8RyNFyOE6OYDKsevWT6LyixoeOe4qLxeQPjm91x
 xQ8/s27mevgGRGw2TGt9L38ug+jaFxZzOMPW5991x7LLjfjK+tuGOiLcZoYgd+oGVS8q
 ZH7Yz1TV4u96HOPbEwCnt3wdW/LbJocmjjNyo8hcL/8HFgqAEgnyGhZsF6P98xT9HM2d
 Rdb1cQC1GUYy9d/H7MCyc1OdjtUoEyNXlJ5wCVnSVIJv65TOWsJDDcvvuBr2cHRFW+NF
 vzsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WducxEK6
Subject: [Buildroot] [PATCH 1/1] package/watchdogd: install to staging
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14881

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/watchdogd/watchdogd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
index 1a9d04d938..ea033b4e71 100644
--- a/package/watchdogd/watchdogd.mk
+++ b/package/watchdogd/watchdogd.mk
@@ -9,6 +9,7 @@ WATCHDOGD_SITE = https://github.com/troglobit/watchdogd/releases/download/$(WATC
 WATCHDOGD_LICENSE = ISC
 WATCHDOGD_LICENSE_FILES = LICENSE
 WATCHDOGD_CPE_ID_VENDOR = troglobit
+WATCHDOGD_INSTALL_STAGING = YES
 WATCHDOGD_DEPENDENCIES = host-pkgconf libconfuse libite libuev
 WATCHDOGD_CONF_OPTS = --disable-compat --disable-examples --disable-test-mode
 WATCHDOGD_SELINUX_MODULES = watchdog
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
