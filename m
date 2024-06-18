Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8909C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 21:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7299E413DF;
	Tue, 18 Jun 2024 21:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ezLX-2hvwgc; Tue, 18 Jun 2024 21:28:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71A4742AF0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71A4742AF0;
	Tue, 18 Jun 2024 21:28:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CCC41BF2EA
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B6586081E
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IaCJ7kCy8I7j for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 21:27:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A8E5605EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A8E5605EF
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A8E5605EF
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 21:27:15 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ec17eb4493so71696961fa.2
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 14:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718746033; x=1719350833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dHP2ySsKeNM3ESiKUCHE7DISVeuo3mfuK9VTk/LtBvI=;
 b=G9UZGlLeGKamhmmZvXcUdeO0g83+C5cXNcHRwnb/LyYgMACU7Q5mqTZSOkKuaL52tz
 Bl3DPdVeUam3fM85qLUaT+UDpTtATMCPQHyF+3ICnoHh/ot2jn6HZOMNN0n01quHxsbv
 Ub5pswLz4rSXpMJj01FrP77KaDwWclT+1L9MBKvWjgV+Jifve0QTVs1qscjT75TN2VNJ
 8MPAIMTc0uoc1BsiCpAp6WN8s9HftDJUMOPDG+i1uQIPVUKphrF7yXuiltYQQOx/oxfY
 Ph/h2M8qUt5fzhHef5BF5HyOyA1gWyVaZ3h8CYkfDgOuiq5ZZUfLciuruJz0sDMfZjm1
 EBQQ==
X-Gm-Message-State: AOJu0YzVXBT9k3gO/KGeURf3zPbq2lEiZtBHmsc+5xCbovEiuuBPv3Rc
 kV1J9rgrCzylmEcgLiYQMCQWnEjC4cm48uErLFwo9v93aEfJTYY5uqZBzw==
X-Google-Smtp-Source: AGHT+IFD7vbfbI5t8/EGIHsegVGhqhCU1GtHyGDQ/FQSTO3mUpc6HhvjpRnOvA5kScu475GzmXsMqg==
X-Received: by 2002:a2e:95cf:0:b0:2ec:5cf:565e with SMTP id
 38308e7fff4ca-2ec3cec04c8mr6874661fa.12.1718746033197; 
 Tue, 18 Jun 2024 14:27:13 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c7838fsm17240521fa.100.2024.06.18.14.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 14:27:12 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 23:26:28 +0200
Message-ID: <20240618212646.4154474-5-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
References: <20240618131902.2912459-9-roykollensvendsen@gmail.com>
 <20240618212646.4154474-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718746033; x=1719350833; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dHP2ySsKeNM3ESiKUCHE7DISVeuo3mfuK9VTk/LtBvI=;
 b=LwlPEbX6VyRKhSuzSkBGYtOg02SicOKgR95FzvAjPD2khsxM5s9O/89nELJzVhcsk3
 CP/9oIpWT+mgLeR7QvAgivxCwweyYibdl5W9QSFQnCsuv8TbcNsvcxlcFXamWp+naOwW
 xNxJoAmfpZEffXRMi7x5uakHYMNHhiv2h01ldceX/uq+gE+Q2r/ijtlpVa6mD9eO0PVN
 CYKtKAP7/b1lHKfDdV4hA0nco566zsdXECDVRPItR6Hse5moIGernDI8qgz93ql0a+lt
 5+GwNmWCaDSdRTT5pWFiSXD9jRzEkfAsGDJq1P1hJDtMCVEqY63zwcNj0o6cbA4oyGew
 tFng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LwlPEbX6
Subject: [Buildroot] [PATCH v8 05/14] package/qt6/qt6base: add blind option
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
