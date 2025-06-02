Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148ABC5B549
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 08:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0C1861131;
	Mon,  2 Jun 2025 08:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vKTu0zJHQtd4; Mon,  2 Jun 2025 08:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95C7C61045
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95C7C61045;
	Mon,  2 Jun 2025 08:01:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78DD11F7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 08:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B285405B5
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 08:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZFWi7KrEIS-y for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 08:01:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A57AD40597
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A57AD40597
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A57AD40597
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 08:01:06 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-54b09cb06b0so5456933e87.1
 for <buildroot@buildroot.org>; Mon, 02 Jun 2025 01:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748851264; x=1749456064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qUB9VwQNxaHQQEJGEnqJxzPX3xWcMUNzPcZXYkejAuU=;
 b=MX3ikvScSGn1ryK7UvTt2bMwSTmQdUOfmd+SVcUd8N0p2M2FFhkIPFDAg2/Lc+W01r
 3mTYNddK7HCCxR7GL6thHqz3DdAMeWDjcPJ10KAvSDYMmuIE/v7Ii0jpG21pWoOHQfi0
 FTQE3DSXq4VRPmBzVnYGmfZ1ehL5t75y2/5xoREmzVx/E/Z54o0vjtOTTiihJhyqlFYZ
 1FYQcVNWvewBCU1cd1GYJApzy20n3YqO61LXvirwk3YPH1MA0fv+ICQT5PoStomO1KuK
 epmibEKxIWgQRMx+p98k++DlRQanWIOKJfBMyU46Ium75J7sILtGONMxK0gLhTXV6bvD
 31wA==
X-Gm-Message-State: AOJu0Yy1b3JWVrxJJ9Ef3WrnRECFkq2Y9WAr2C57hRrzjmsj3RlJeoJ8
 OsDfT2scNZUg5fqZUYHx7BUS529W1pqiO3DVBXItnveHhv+1UrbqDdTyllfADg==
X-Gm-Gg: ASbGncv6Y7yyBdquy75BUvTJcq43hLuFd7YLjKlpCVkg8sYbnFSL4FgSfTXYhMzoOr3
 lg4ApRv7bQAMxlukp8LH7TQn4lLuhsfhq8wdBMfzkkP+wffH/NI53m6PvC9YhzaO/Q11KFyBnWj
 ndksGMQm/nMvD6kbZTZ5vKKe/BIvTWWZA3xazhG6zSqAQqTjYVjOvy6xq3zjBvMAhZbyy5yYHPC
 ilUdY4c6xnOKuvJXOm9FsAeSISK6UFrMIvDLHkHSwgCz7djheoG4IPDCrchsIrScSN6PhTUopmS
 QapU497Z8zqVfzrpTyqSDPHgUNxQ+QfNyj63mUCyh4DtQtC36NdS7zocU7wV8lLpfWjmbPMa5n0
 Dkw7DHsLzgD8vMNy5J14qFF2nk0mgq6g=
X-Google-Smtp-Source: AGHT+IHM7948N9+Ua8t2ruiQ1uEtWG3odRWDnP8fMwnj+5gj1mufouQyiYFB4sZ29+QOfCS/xPOl7A==
X-Received: by 2002:a05:6512:6417:b0:553:34b7:5731 with SMTP id
 2adb3069b0e04-55342f61150mr1896808e87.3.1748851264143; 
 Mon, 02 Jun 2025 01:01:04 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533793770bsm1495467e87.238.2025.06.02.01.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 01:01:03 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  2 Jun 2025 10:00:52 +0200
Message-ID: <20250602080056.2466471-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602080056.2466471-1-roykollensvendsen@gmail.com>
References: <20250602080056.2466471-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748851264; x=1749456064; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qUB9VwQNxaHQQEJGEnqJxzPX3xWcMUNzPcZXYkejAuU=;
 b=lk9xdVx4DkJmHNfVn8R9w+7/7uOcnX4QFVzkMKxzr5zWl54DtNt/SkceeCJEQqVh0q
 rABXID2OcPSq4ykHv7gqmqYkT9+8iz573MEvQX2WBL9aNtBh3R9LFSUnxWZVBjM+qHGn
 ilsdOlRv3sycOizjOyjXw7enCZHDnQiIrzh+c9Lw/LGvO2HWARtW1/8oNbF1zssm/CAq
 joyj5THY5hz/lcDT0c4MuqmhrL+r5ZJAoN6H1QdqPDlJM3a1NRTyVElp0mVXUQKyX7j0
 2cxB1r0vwO6VxL985egFPIl2PFlDf4wZXywyLmCQ+h00LqLfEMJRLn8HhadmTTeyzrrq
 D9eg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lk9xdVx4
Subject: [Buildroot] [PATCH v4 2/3] package/qt6/qt6base: remove unused
 hidden host option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6base/Config.in.host |  5 -----
 package/qt6/qt6base/qt6base.mk     | 10 +---------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index e38e99fbaf..bc605c6821 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -16,10 +16,5 @@ config BR2_PACKAGE_HOST_QT6BASE_NETWORK
 config BR2_PACKAGE_HOST_QT6BASE_TEST
 	bool
 
-# Select this if you need host qt6 tools that require the Qt::Sql module
-# (e.g. qhelpgenerator).
-config BR2_PACKAGE_HOST_QT6BASE_SQL
-	bool
-
 config BR2_PACKAGE_HOST_QT6BASE_WIDGETS
 	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 39fb440be7..51a4f1b5be 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -89,6 +89,7 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
 	-DFEATURE_glib=OFF \
+	-DFEATURE_sql=OFF \
 	-DFEATURE_system_doubleconversion=ON \
 	-DFEATURE_system_libb2=ON \
 	-DFEATURE_system_pcre2=ON \
@@ -139,15 +140,6 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
-# We need host qt6base with Sql support for host-qt6tools to generate the
-# qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
-# available.
-ifeq ($(BR2_PACKAGE_HOST_QT6BASE_SQL),y)
-HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=ON
-else
-HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
-endif
-
 # We need host-qt6base with Testlib support when building host-qt6declarative
 # with QuickTest support. QuickTest support is further required for building the
 # qmltestrunner host tool. qt6declarative will fail to build if qmltestrunner is
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
