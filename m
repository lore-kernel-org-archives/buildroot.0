Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED56AECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A5E860B9E;
	Fri, 26 Aug 2022 12:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A5E860B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 89CDTvC1brgU; Fri, 26 Aug 2022 12:57:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0CC8610F7;
	Fri, 26 Aug 2022 12:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0CC8610F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD891C2742
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BFDD404BB
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BFDD404BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkJSm30CTd3N for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EFD040192
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EFD040192
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:17 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id b44so1973463edf.9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=S59TJoR4UJd6eHAefEuRS00QXMlxI6BKdj9+4HzCJp4=;
 b=MFULkVUgorxqM/t0du7jOxaTJxFW/AMcqw4egKX3gKWwhEkWj+vcXfzOXixhI5Bd26
 Yj7CHz/hb5raTtHsgXINCbpLi05zsd4lpHtyuIDIrrBt1kxHw2fpJorG7G2kMlIYMk3t
 Z7sI3jFaH3MhRaC8SCdJHRGuHUx8xO6YZXqDAWi8Siguup+fEvRNtvKYL0IAGvHJf7rn
 EXd5qRn1GVXcNhkc++5cuhYU8krRPnimsjG36APOBsPpo3jXsyNsOeZcxR9d5do7EtsK
 gGtNNASJJeg7HBB5683WPWpGV2K3SD5VzEl108kOJ2aeSUjQAmIi10jZiweuq7yVGGNG
 4CkQ==
X-Gm-Message-State: ACgBeo3pC2Co/fjdyPYepTWppNNzlh5eaLGCs6ikO+UFkq4Ik/0+aseY
 tHG6vwnol3ac6MXG6QdvJ3ZR8bVFoC6c1Hau
X-Google-Smtp-Source: AA6agR7kn5DFCnOJCrSPf9hdiqq+WFBZPD5jA9ygT1bIZfQxVq97HlbTo1SbDGtoMEPEbSt6VwKfVA==
X-Received: by 2002:aa7:cd58:0:b0:446:d:905 with SMTP id
 v24-20020aa7cd58000000b00446000d0905mr6817218edw.191.1661518395411; 
 Fri, 26 Aug 2022 05:53:15 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:14 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:42 +0200
Message-Id: <20220826125252.16782-20-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=S59TJoR4UJd6eHAefEuRS00QXMlxI6BKdj9+4HzCJp4=;
 b=Ng7ltlGhPaiQ2YZkn6NJbvbTelvmIqeHKfNHa6FnfQTjVd+yq40l+0mvcCpNCeG4j7
 b+OoMH4HDFLwLxUpWCbipklk1LzkuI/bH3djMQI4scZDQh2LZW4B5Bm9d/nQ0CzixiKj
 gwIepVAWCGNxg4cykrLXOMNn21u65gjRc0jSgX0gkUMkrXQyM72QLU7Iy5U5NKU4qhAu
 1ixCfsSC3K/Y+FVIH8XPTkVbCQu8HqFq1siPXdy9uc74Ubfw6EX03hQBh1BJ6uL2ITUE
 AureklVqz4/SoR+RBpevlRYCCUY9fWoieUAkmPfAueE/wqjv98EagoRVCqJ9PAPk1UWu
 4+5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ng7ltlGh
Subject: [Buildroot] [PATCH v3 19/29] package/qt6/qt6base: add support for
 sql module w/ postgresql
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
 package/qt6/qt6base/Config.in  | 14 ++++++++++++++
 package/qt6/qt6base/qt6base.mk |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 9509fa5be9..79b6d675c5 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -76,6 +76,20 @@ config BR2_PACKAGE_QT6BASE_MYSQL
 	  Build MySQL plugin
 	  If unsure, say n.
 
+config BR2_PACKAGE_QT6BASE_PSQL
+	bool "PostgreSQL Plugin"
+	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR # postgresql
+	select BR2_PACKAGE_POSTGRESQL
+	help
+	  Build PostgreSQL plugin
+	  If unsure, say n.
+
+comment "PostgreSQL plugin needs a toolchain w/ wchar, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+
 endif
 
 config BR2_PACKAGE_QT6BASE_SYSLOG
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 0061a69c63..3925dee83b 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -115,6 +115,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_sql_mysql=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_PSQL),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql_psql=ON
+QT6BASE_DEPENDENCIES += postgresql
+else
+QT6BASE_CONF_OPTS += -DFEATURE_sql_psql=OFF
+endif
+
 else
 QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
