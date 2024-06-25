Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4B8C2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 21:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04C0841707;
	Tue, 25 Jun 2024 21:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNbIFbFi_BB1; Tue, 25 Jun 2024 21:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BCA2416EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BCA2416EB;
	Tue, 25 Jun 2024 21:21:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A308B1BF417
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 21:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DF9860617
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 21:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khw0jTGv6c-F for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 21:19:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF05F607CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF05F607CA
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF05F607CA
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 21:19:10 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so69317571fa.3
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 14:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719350348; x=1719955148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dHP2ySsKeNM3ESiKUCHE7DISVeuo3mfuK9VTk/LtBvI=;
 b=BZvwnrCFqVBBFA5c4zXXyBVLpcruzGcvIANfHTkLK4i5yXlK7Ck86ML/syoT0IownE
 dMlqxsU4FCT07LDXReEkYqcGP2bDEPyNar38XU6w6X4dI6OjVX/mjiw4UmT8kFx9HFXW
 aU5+1qvlolVBYYO7K4b1ntY7nThtPaajPSl27VoT7dOiPlq3kuYr/dKJfFNed5loNP8g
 YQTgF4is6alhpf6xGAfeDsPN83gKnjfCrMrEBzEDMp2Er0+sDCyHXvkR0p0yTjKJ0eYa
 xIzNL3USD7Pu5OqGwcq5cfbx/ZpH5lDVE49tt/U2UM9SOHPSBzMLfe2HXQU8UARFIFrC
 Z2kg==
X-Gm-Message-State: AOJu0YzGfKe746hos0onTQcbNKqh+b8BQnGlR2jaVZCFWPfYAZzE1ISe
 rtj78f97VsjUamFjMAEjvoYBrvLI7H0G93ePqfgelJD8p2HJ/T7UQp/hOQ==
X-Google-Smtp-Source: AGHT+IEUchv+ltPffYBLgPAA66JN2G+P1/ZH/4wJu8Qntt3EJ/JkDIFVwThMbeVHXsbHN2udjvezcw==
X-Received: by 2002:a2e:998e:0:b0:2ec:4d5b:3d03 with SMTP id
 38308e7fff4ca-2ec579845dbmr58067551fa.31.1719350348470; 
 Tue, 25 Jun 2024 14:19:08 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec592b6158sm8908971fa.3.2024.06.25.14.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 14:19:07 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jun 2024 23:18:29 +0200
Message-ID: <20240625211847.1419944-5-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240625211847.1419944-1-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719350348; x=1719955148; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dHP2ySsKeNM3ESiKUCHE7DISVeuo3mfuK9VTk/LtBvI=;
 b=QMgzPHMAzWa2ENqLBT5WCAwIKsTUTA+4KMphWDhPvTOFAHCfHx/HxfJu2RDaj0dtyS
 SOw1wD7lYnGTIz1KdSqElcjm7NnozV46MuTfS76GBgXgeuqJzj40MVjhRajlq4KlRib7
 vLilM98MM+tCuPb+joubGoD9rQSNsExmzbSQ35YQgXW8hMlwMlRrttfWxRwdU18j/N8y
 20Q39l0ecLdD16A3fUPkB4ZK6RHVDYem+FAtFDmMXHpLB3pNWK3L6cUtEmQLK5d+Ic/e
 CoLwhsYXStXL6BT44Qc5hh3Mr8mghlByd+x7ib+Y0kU65ucqh2dAWsOllxo1N5YCLgU6
 /e3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QMgzPHMA
Subject: [Buildroot] [PATCH v9 05/14] package/qt6/qt6base: add blind option
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need host qt6base with Sql support for host-qt6tools to generate the
qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
available.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6base/Config.in.host |  5 +++++
 package/qt6/qt6base/qt6base.mk     | 10 +++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

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
index 6b9f425255..d8d68e5254 100644
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
@@ -110,6 +109,15 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
+# We need host qt6base with Sql support for host-qt6tools to generate the
+# qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
+# available.
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_SQL),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
+endif
+
 # We need host-qt6base with Testlib support when building host-qt6declarative
 # with QuickTest support. QuickTest support is further required for building the
 # qmltestrunner host tool. qt6declarative will fail to build if qmltestrunner is
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
