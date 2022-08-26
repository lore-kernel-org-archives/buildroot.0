Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA56ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFB0882D96;
	Fri, 26 Aug 2022 12:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFB0882D96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TRd6sVym4gyq; Fri, 26 Aug 2022 12:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C75E83EC1;
	Fri, 26 Aug 2022 12:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C75E83EC1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 500DE1BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BAA5610F7
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BAA5610F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cy9wgJjwiO1p for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7368E60761
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7368E60761
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:04 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id r4so1978454edi.8
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=dfaKtT7wjvLCYkzgkaaA/BTPNP57uHLK9gUNAghQsUQ=;
 b=C3mtQpd7RGu1rErdCdXAZNk9Zfn1mEcnkap/AdcWsVwecJnaK6spR1rRQaennOGXyy
 hIxl/9IQkUGEmgP+cmnD7QmT2ogEm+Dlua8SMseSQzBydAkZdN9FWhYc0V6jUnU6Uz4b
 x9OIwlp02fG2Z/Hyrx2ZJAddVEjUJgU1hzAqLUyUjKCF5Q98Ymoy7YTqozpZC5jhcW8n
 gcWo0HRc94RDYklaDvkwRZ4DHbFeHWf2tkYycbDVA6r0CpxN5aiK8bSe/y1apush+fcI
 LHoOZRrSR87iN7Jq6qTslBnEoOiadWYEEHSffWnlEXNn3hly9cR1s97jXpLDb25XOny3
 WCrw==
X-Gm-Message-State: ACgBeo31ZSk1pmNLk11GFfAqodKvd1CNjemeZunypv3yAsgn4q+tWSzZ
 gF647LttZOCkyCzXJ4Fs2ZCsn4bvdFk8Ee2F
X-Google-Smtp-Source: AA6agR5Yk+QeqAVHo6ddTtKIHI2qBkuNhHCzFhxloTvBvAVzraRY6cs6G7vybRzwACC82weKW/z92g==
X-Received: by 2002:a05:6402:90d:b0:443:ef4c:480f with SMTP id
 g13-20020a056402090d00b00443ef4c480fmr6724701edz.128.1661518382298; 
 Fri, 26 Aug 2022 05:53:02 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:01 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:29 +0200
Message-Id: <20220826125252.16782-7-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=dfaKtT7wjvLCYkzgkaaA/BTPNP57uHLK9gUNAghQsUQ=;
 b=TF31F5Zrun4D0MaO3LdJUON8tPawMmKkNjp8xVpul3EX2lJLFTk5jFQCIRVDuZz0yq
 cahIq6aUb4slWG0RJmpYjYvDhq6lgXX6Bpqv332inPFmBaHFky/rlkkXj29DAR/g0uTp
 WWgSDvJa+XvTFIzFukRzb/2Yjf2YwlYUUEhcphuXGVNAvr7Z1/Un9sQu8/9hmMPsRF15
 av2+kHvRYaoDfke6hm2j1KJBeGJ3OQlCjM8JLCqkGq0NsBF0VMbUmTBvOmZ88A/MpZIH
 XvKbVRn7jOGyMr6WBB/QMrTqPQ/AgZLawQu8rh84XSiOSA711WTE8kNjeORdtk19I/Bv
 wdlA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TF31F5Zr
Subject: [Buildroot] [PATCH v3 06/29] package/qt6/qt6base: add support for
 test module
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
index 41c04fc5f6..354e02280a 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -27,6 +27,11 @@ config BR2_PACKAGE_QT6BASE_NETWORK
 	help
 	  This options enables the Qt6Network library.
 
+config BR2_PACKAGE_QT6BASE_TEST
+	bool "test module"
+	help
+	  This options enables the Qt6Test library.
+
 config BR2_PACKAGE_QT6BASE_XML
 	bool "XML module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 1af24334a9..fd1e0a2847 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -89,6 +89,12 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_TEST),y)
+QT6BASE_CONF_OPTS += -DFEATURE_testlib=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_testlib=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_XML),y)
 QT6BASE_CONF_OPTS += -DFEATURE_xml=ON
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
