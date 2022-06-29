Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9720C43334
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 19:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45B6660D4B;
	Wed, 29 Jun 2022 19:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45B6660D4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rIP9gYOb2yoj; Wed, 29 Jun 2022 19:58:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FB2460E42;
	Wed, 29 Jun 2022 19:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FB2460E42
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C5771BF4E5
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 19:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26A9E60B91
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 19:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26A9E60B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBcHVC9DuArl for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 19:58:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE7D460A78
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE7D460A78
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 19:58:35 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 o19-20020a05600c4fd300b003a0489f414cso288534wmq.4
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 12:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yJkqFZYHz7q6Q5B7bKgwoqqa6uAd7jEqy5eZtbTLEQI=;
 b=WO45gXnXuFfdNWkPezX/MX7WMIYhFH10OAbYTepb4JBF33Zj3lVsl36Us7RPA+HKvM
 36Q9L9naWRhztahTzvEyJL5z3Oks3v/9trZkpPI1clFM03wQ2mKy2fYlsZoiN2UO+E7k
 ETo6RR/f518ryevE2w04QTVYimE4NXfFXfCpGh54nzyJGSV9RRZu71ZfBRSOinsCCD2m
 YLRyeeNDasTn5yepxRuZmB1lM0xtvJflC7HZosFQmYryaDd61hsZUmYJ+HYykZXA2XRA
 HHo/1JYJLqMEZ5dxsfJ6uG0F3n0xhTI0Eu0q8K+gsN2CZUYO07par+UehqOHq31fvgkY
 uRSQ==
X-Gm-Message-State: AJIora/SJ/vn6SwGzjNeJZ8SVsoA0PtdNKUWNfakwcXMGFA4uROI0NnV
 znGN+6xQC5TvoqMkEgZ/O7CahBO67u8=
X-Google-Smtp-Source: AGRyM1vAwyGTT02uIHJo+pl0vy2lIEwiN5XAH0mpIOhOoBlM//I2lGe9/48CBIVg4pTKcY1rtDHJOQ==
X-Received: by 2002:a05:600c:a04:b0:39e:e392:ec22 with SMTP id
 z4-20020a05600c0a0400b0039ee392ec22mr7447399wmp.158.1656532713584; 
 Wed, 29 Jun 2022 12:58:33 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c1c1600b003a046549a85sm98108wms.37.2022.06.29.12.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 12:58:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 21:55:35 +0200
Message-Id: <20220629195535.340078-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yJkqFZYHz7q6Q5B7bKgwoqqa6uAd7jEqy5eZtbTLEQI=;
 b=BWHsWs5dchWE5aqkjtypWD/lRIaMP7dDPWcLxtOH1YkvCm1O/24SSnTyys7FaKtsxj
 Gm4KcS/ckCbzW6b5U1z56UhqrZxfHJuETOdBXsWPjXsBCzCIlrh185Sgq75K53TThrgt
 lnjpFTd/eO5A24WprDKjlaFlK1m4+jN9YkhhXCSx7HCLEyx2KdWHOvByiAAILRggjjAp
 m18wB+rEl4xT4IHwVhkyPiw4pkq8fLO5MS4gMuBr+2iOz0pFER9EK9Fx7YbF70ehlUyj
 L2IoS1WfwxO4xU6K6HdZvAAJXJ1K1lgs7g2ri+7mxBJlVsjrVq8OTb61jgd+FcEh1/ZI
 Zjjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BWHsWs5d
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 9.0.0008
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

- Fix CVE-2022-2124, CVE-2022-2125, CVE-2022-2126 and CVE-2022-2129
- Update hash of README.txt (version updated with
  https://github.com/vim/vim/commit/eb49041875118be5fe60f07750c7c86cb26dccef)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 4 ++--
 package/vim/vim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 55e5643b90..62b11fea7b 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  3052bc702cfb49571dbcf9824827ae6032c37c7bf1a2aa0d3f7cc18c8f085dfb  vim-8.2.5062.tar.gz
+sha256  86aa403632beea5827f305e471a245d14ee9c79072f67ce8e9536169a1deaad9  vim-9.0.0008.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
-sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
+sha256  4afae7c984ab1a4ccd0b474a695f316e7435ab6ed46537648af925c18835d853  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 6dbb32d27b..c3308b4542 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.5062
+VIM_VERSION = 9.0.0008
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
