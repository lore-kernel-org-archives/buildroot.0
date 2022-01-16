Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60337C433F5
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 21:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1543A81442;
	Sun, 16 Jan 2022 21:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2FczwTrsdXIy; Sun, 16 Jan 2022 21:52:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CF008141F;
	Sun, 16 Jan 2022 21:52:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D0161BF476
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 21:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49BCF60ADC
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 21:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wp9GqpRf8oSh for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 21:51:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2DFC60A74
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 21:51:37 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id k5so7470575wmj.3
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 13:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aUy49V5JmJ0uJM9l+jOcSphe4ksY4Q4YdtAkinzKVUw=;
 b=TYMz5NdmLSr3SPZP+Ccr0YM9TVAFLx5NhUD/1caHvCuhhJzdcMdZiiEsufcQGyeIou
 nGebKCpnx4dv1KbNOuX2kLL3T/YuU/0bS76FeIPnB2pvCOKxOh1nUXP4ugx2+tpDt7Ox
 nuvLXmtJyBQEfmKpWNTPcAJd9gj80vqfkP2NyyxCTPBQsMwLMTc/WBG4M/2hhD6+yzhL
 FLX6htsf03W31B3ID7TwZ3+/2H34gqYZVKqKMw4sGDKeTmXxquyUMcT0d534i++vAHiM
 naiK4oRLvaRCH3gIN1XcATCPtzw+mCBuob2rG5KM27MOKYa2EV/Pxc3M8MeoOAniLBNt
 TdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aUy49V5JmJ0uJM9l+jOcSphe4ksY4Q4YdtAkinzKVUw=;
 b=UE65OS5l5n2eH3zbYt/6rERAPByKyQhq5OuDRMI1yE8PKQQAZVPvK85PGJ7BuulCIa
 f6vS6qMo890vfCLws4RtRmx8N/0vFv0Nyup13a4H7ic++OCYV6MDORjoGOFI5P1AdUF2
 mkNzrr47vQ2+90epUgWTfj9Um+tPyJOZJYhhCCXPAPeFNm/2T8hMiiIVTioxIwpRjP9x
 +XwS/7NmXPgPdx9L+OAXxOZMi0hZw5v6TZmclry53LichTtIXmvY9WNdYOELZkJuA92D
 FTOz9mvQSZEDrd1fLhSaQM5Fl8wXeSEhMYrp1FGBKQ2ENsysPQ1Vk0zARJ15zk9iSQk3
 HG6Q==
X-Gm-Message-State: AOAM533Os3k+G4nmthBcQduhQZH/VPGVoRK/MtaNHq5TxQBD+XQjP+79
 yLOuyPLt72dCqBMAMRKnPX8zj7GqkvI=
X-Google-Smtp-Source: ABdhPJzqCP9BUY0NgQrnTr+5OUVr8FOU6XPwsYL6XP71z+8zchhiKDhv8QYvInF4v01P3/lPH/u6PA==
X-Received: by 2002:adf:ba8b:: with SMTP id p11mr16909673wrg.390.1642369895831; 
 Sun, 16 Jan 2022 13:51:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id g15sm12062164wrm.2.2022.01.16.13.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 13:51:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jan 2022 22:49:55 +0100
Message-Id: <20220116214955.3231899-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220116214955.3231899-1-fontaine.fabrice@gmail.com>
References: <20220116214955.3231899-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/qt5/qt5webkit: build shared core
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build JavaScriptCore and WebCore as shared libraries to avoid a build
failure

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5webkit/qt5webkit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index de3c428fbe..565c57e813 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -42,6 +42,7 @@ QT5WEBKIT_CONF_OPTS += \
 	-DENABLE_TOOLS=OFF \
 	-DPORT=Qt \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
+	-DSHARED_CORE=ON \
 	-DUSE_LIBHYPHEN=OFF
 
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
