Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83F4C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 15:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8198342404;
	Fri, 31 May 2024 15:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aq1pvUJLFl1e; Fri, 31 May 2024 15:14:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45BA64240C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45BA64240C;
	Fri, 31 May 2024 15:14:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 551F71D5416
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 15:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42BC761147
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 15:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yl8DTk0d7LrH for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 15:13:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A18E60605
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A18E60605
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A18E60605
 for <buildroot@buildroot.org>; Fri, 31 May 2024 15:13:42 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52b7e693b8aso1772721e87.1
 for <buildroot@buildroot.org>; Fri, 31 May 2024 08:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717168420; x=1717773220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NlKKY5N52wkxr/+mEHPuWQ1ymeg8l7e5olp+8hgFQHI=;
 b=KILY7khJ7DdFVriVS3zMBazv+m74RjUgHYX6rDcIIP6Dy4Ebf6CBkxE3k8cdYMyscw
 z1y6hxtqFLAziRviN447zJCKh5hs3VT2wt5Uc7Uni8tUNSiH86SVdzcgg56/31yOOa0+
 2bbAAC7PfIuzNJIlY8wGNS0H66OQPME524wylgFlpw2IOHHwZAbIIpgkhOp3mHOR/xXB
 gZOK1HFdibORoZe29bRTD9vH+jw6AdN+FpjDYvH8CKg3otiW111lmmaG/H0il3FllLiJ
 /rqCbV5OuKNdFjzTR1lpriybZtJKKmfYdCTci582ATstOWnSaF3RdqnM5ub3Qmi9wG/g
 9AhQ==
X-Gm-Message-State: AOJu0Yy3+9oR16dAcezDcjLtkSOp7GHM9ZY7IcGdfDrwMMgnK6SR5DqR
 nhydb40cH1SOA2JU4ergnLsWLn6LS487wSnFjyQGCbvNOMaUpKxlu97pBoIT
X-Google-Smtp-Source: AGHT+IH3F8tv4H9xTwOlxXX92WK/nNGn9rjNTr8zKLrlTKcjK9i2X0mF03uxXerDpHQL1kTuc1rkMQ==
X-Received: by 2002:ac2:464d:0:b0:52a:7742:4593 with SMTP id
 2adb3069b0e04-52b88783fbfmr816215e87.25.1717168420080; 
 Fri, 31 May 2024 08:13:40 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f510sm362599e87.90.2024.05.31.08.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 08:13:39 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 17:13:06 +0200
Message-ID: <20240531151325.2443323-5-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531151325.2443323-1-roy.kollen.svendsen@akersolutions.com>
References: <20240513220328.1085629-1-roykollensvendsen@gmail.com>
 <20240531151325.2443323-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717168420; x=1717773220; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NlKKY5N52wkxr/+mEHPuWQ1ymeg8l7e5olp+8hgFQHI=;
 b=KFA6yiKGPNVQcrF1E6ccMdNYKTixY7myEC6wEXa56r+QQ26HM55gXulwCJSNWBFC0n
 1gejfh+6hKJzvVA+r/OzQHZ4jTLLoLxFEYn1nxAJG9ZDIZ9D2/pTUamInjJZpfOJiDhX
 o4CJH5fHlLdCs/IiW3zLTPctroayoqfc/3M7sbNJEPfbQn4VHNzyP4DCgPz7pEBFCdHJ
 5FI7/5keDAzQG+cZ/QKQMd2ThObaZczdgKrJPco1w81h64ayRXFYHXSief3jHyxVmnZR
 SQrT1eSgq3JW7JHa43Bkxg6yxKue4baFTpymZgRRf6sQGTBLi2d2TbV0MwICQOYW9zSB
 FTPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KFA6yiKG
Subject: [Buildroot] [PATCH v5 05/14] package/qt6/qt6base: add blind option
 to enable Sql support on host
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
 package/qt6/qt6base/Config.in.host | 5 +++++
 package/qt6/qt6base/qt6base.mk     | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 80bc13c7dc..46fb668817 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -12,3 +12,8 @@ config BR2_PACKAGE_HOST_QT6BASE_NETWORK
 # (e.g. qmltestrunner).
 config BR2_PACKAGE_HOST_QT6BASE_TEST
 	bool
+
+# Select this if you need host qt6 tools that require the Qt::Sql module
+# (e.g. qhelpgenerator).
+config BR2_PACKAGE_HOST_QT6BASE_SQL
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 4bf715f5c6..1d4afaa801 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -85,7 +85,6 @@ HOST_QT6BASE_DEPENDENCIES = \
 HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=ON \
-	-DFEATURE_sql=OFF \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
 	-DFEATURE_glib=OFF \
@@ -106,6 +105,12 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_SQL),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_HOST_QT6BASE_TEST),y)
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_testlib=ON
 else
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
