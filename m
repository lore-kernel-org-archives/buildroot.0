Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360C4C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 14:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D241840A14;
	Tue,  7 Feb 2023 14:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D241840A14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ff5WLz3HCRe; Tue,  7 Feb 2023 14:32:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 123A440A12;
	Tue,  7 Feb 2023 14:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 123A440A12
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60C861BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AAA160F48
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AAA160F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y4RXvct7Rwg9 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 14:30:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70BBD60B9A
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70BBD60B9A
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 14:30:20 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so1145461wms.0
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 06:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HCeADxDVwWd1EMDZ9I/kxdtdSk4YpPoKUn/XQyYd0HQ=;
 b=eyX0tSueKgdEk/WJdQztauCeu03xqIjzPtqMYa3YJfGiHkzlkSlwd6s/Uc0B4PIH1t
 kwfcD0CGutt5GDrPgNPlFrcPkewJArRqiOlAEKCmLhYV8NpbTNUHUH8MSPfPyKo7XBYl
 Fu9b7KJyfWRzL0bm3yh0KK/stvMHUvZbD+He2LzQ9lGWHUhhhgakU9WKjng/z8E2sJgd
 n4gOSS3eZU9xzKlTJkyU6KY01fErqiQyLcqiebZXvmqJaEC8rlZezLQmIm7FvBnDbDZx
 Vh91Io9w2mDkZ+yUw0CgTAR5sJObSPvTQnR1WOULXxaqTSF+peqkRY485SwWrppKlgBB
 2SsQ==
X-Gm-Message-State: AO0yUKWQUgjHnBOlCnFFsgje4rxWzdQWQuE3iJedSGOvuSve5dVUBeCO
 mDv2jXU4UF80mfPAjyH7Db191kwuvw2co1273+tB+g==
X-Google-Smtp-Source: AK7set9WP9M5SSHBlD8tuvuZEyVoA9xOAmONFAat91V/MwTzI+eRZJTle4iIamJsKf9RoPMaq4z44Q==
X-Received: by 2002:a05:600c:490a:b0:3d3:4007:9c88 with SMTP id
 f10-20020a05600c490a00b003d340079c88mr4026387wmp.18.1675780218339; 
 Tue, 07 Feb 2023 06:30:18 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 l16-20020a1c7910000000b003dc1d668866sm18537074wme.10.2023.02.07.06.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:30:17 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 15:30:02 +0100
Message-Id: <20230207143006.2681335-9-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207143006.2681335-1-angelo@amarulasolutions.com>
References: <20230207143006.2681335-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HCeADxDVwWd1EMDZ9I/kxdtdSk4YpPoKUn/XQyYd0HQ=;
 b=dtPb0YxzWbkrLz0hnE9bJYaPudJQVA8dZHISY007VnX/hCJkru64KDI4ktfif2clNG
 V7UiogeQeEOYne+p0rjjjJExEl3rJaYyOY1SY55x8Urm/u8HBytWPM0c0i2Fs3sOXF7S
 RqEiva6o7H8iX9kz4XNLzPFM8Mk0bK+4W4+H0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=dtPb0Yxz
Subject: [Buildroot] [PATCH v5 08/12] package/qt6/qt6base: add support for
 tslib
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
Cc: jesseevg@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jesse Van Gavere <jesseevg@gmail.com>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/qt6/qt6base/Config.in  | 6 ++++++
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 0f1c9fccd2..dbf9c93123 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -224,6 +224,12 @@ config BR2_PACKAGE_QT6BASE_TEST
 	help
 	  This options enables the Qt6Test library.
 
+config BR2_PACKAGE_QT6BASE_TSLIB
+	bool "Enable Tslib support"
+	select BR2_PACKAGE_TSLIB
+	help
+	  This options enables the Tslib plugin
+
 config BR2_PACKAGE_QT6BASE_XML
 	bool "XML module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 41c7a8b350..c878a2e2b6 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -231,6 +231,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_TSLIB),y)
+QT6BASE_CONF_OPTS += -DFEATURE_tslib=ON
+QT6BASE_DEPENDENCIES += tslib
+else
+QT6BASE_CONF_OPTS += -DFEATURE_tslib=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_EGLFS),y)
 QT6BASE_CONF_OPTS += -DFEATURE_egl=ON -DFEATURE_eglfs=ON
 QT6BASE_DEPENDENCIES += libegl
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
