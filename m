Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1445CECAAD5
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A806740FF2;
	Fri, 26 Aug 2022 13:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A806740FF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HkWOB3o_5Hcl; Fri, 26 Aug 2022 13:56:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D26D940FD5;
	Fri, 26 Aug 2022 13:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D26D940FD5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80D721BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 680A040FBD
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 680A040FBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1wA3yrpDOt82 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E59340192
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E59340192
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id cu2so3376590ejb.0
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=CPYhSsnDqlqUdVMxWqQJVVNhfS2SVgnAfLf9Ju4gW9o=;
 b=vmgDhNmLV44M1AbtVea9g8Bp/cksJZ0ajvNgtRUXGdBfN2ya5Y/0+kVmoaGjOTqIh6
 2I4Epw5mh5gAIZB3ni//3Yd8ZsxwyT9NIDKtIjiKPb5dltGW3XadNd6mjXpv8kLHY8rW
 fn1J6VZUZtuEBFfW/3ca6xok51Hvs+fqjS9eoK5J60qU/ZsiIcOLDcW2VyTgjlxgKjGh
 y8EK9XqYlkcCu54/65kEFD1A+zJJ4E5ECT/o/9L7tD3QsUPdLEK1mG3vigtS2FA29MGW
 s7trebv5AKY66alE6q/YUAuvTxQ4W2oCeQZJ5OUlOV8yCOfnaZskBl6J3H5z66gWMJKN
 fnxg==
X-Gm-Message-State: ACgBeo1kaXZf3PdPJEO1fo9mEBjfzbnX/77ukypjP0GNpg6znfsTSFRe
 TiABF2oM2oPrGUk2Yx8Tet1Ugc4aWPfidG8W
X-Google-Smtp-Source: AA6agR47e94/pwN9PuNVsuYsXveQzZzsRUFJR4XaLnsT40Bn0GxaQGiPMxw/uHySG/ykKer1vYpzMA==
X-Received: by 2002:a17:907:971d:b0:73d:78c8:77b5 with SMTP id
 jg29-20020a170907971d00b0073d78c877b5mr5572408ejc.631.1661522114467; 
 Fri, 26 Aug 2022 06:55:14 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:13 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:42 +0200
Message-Id: <20220826135503.20612-9-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=CPYhSsnDqlqUdVMxWqQJVVNhfS2SVgnAfLf9Ju4gW9o=;
 b=PFaMHf/zIFG/AEmywuCbChtycB5N6Znps4vyApek5fx6XIN361SDGkM04EV5sK7RkP
 5cabwKuodEItxHy46IrbVNXBEwaPKMR6kyvi/GakF9/hrPBIkE6SJn4XWsCuKUFlrG1+
 ux7dubg4Xh0lhXdxDarpgrfpw1jl2Pea1LFIwdLSUlKBxKMmQucLs48+5Wx0JddqUywk
 9hOqzt+9fCFWTsXzzk2glYWJ3XroQl+85ebkZQa7ROQ5r/g7pcKuttEL7oT1OAkzG6vW
 58TigNYKWcdAVT8nHD4iq3ooqbBS9wqXkhoX5dEL1vELfJ2WTLHfSVy/+KkNJ5q++u5/
 PHBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PFaMHf/z
Subject: [Buildroot] [PATCH v4 08/29] package/qt6/qt6base: add support for
 syslog backend
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/Config.in  | 5 +++++
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 2d4a4df223..f3e56aefa4 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -35,6 +35,11 @@ config BR2_PACKAGE_QT6BASE_NETWORK
 	help
 	  This options enables the Qt6Network library.
 
+config BR2_PACKAGE_QT6BASE_SYSLOG
+	bool "syslog support"
+	help
+	  Logs to the standard UNIX logging mechanism.
+
 config BR2_PACKAGE_QT6BASE_TEST
 	bool "test module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index fdb3377eb4..a399f53e6c 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -112,5 +112,11 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_xml=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_SYSLOG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_syslog=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_syslog=OFF
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
