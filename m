Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D1DC2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 21:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F215040592;
	Tue, 25 Jun 2024 21:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 20wbrTnPsqSb; Tue, 25 Jun 2024 21:21:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9AE340A84
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9AE340A84;
	Tue, 25 Jun 2024 21:21:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA78C1BF417
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 21:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D42A5607CA
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 21:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STY6fKlzztzB for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 21:19:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB5E4606F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB5E4606F7
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB5E4606F7
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 21:19:08 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ec002caf3eso90429061fa.1
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 14:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719350347; x=1719955147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IFknuf6txIWrvv3BiGpCnuovvD0K5IoEVeWoxGrMwAc=;
 b=UceZQZvEKQDz0OyypkNLfcq1N8nuWe0EPlCQQWVzU5fvlhW2atb36La8XT7hLzwCUe
 GZVeG+nEcLhQ2LMJFx9rfuePWgq2P72+gFMQUvSQRf8l2nCStVtfL+zqevopRW3Apbqk
 Ym2X/YbxaqI83LPhaimOzOJw/VDs5CUPegmPto5hhU6C7yED6l9+JY5exOrZ3YK4jEXZ
 SIpvzAOXhJybV0vAR69efMLDdVPTnVqZI6QCXAYLj2oLkWDU69bXvcSCPJBooWqbpiZj
 7Se6sI/Pb9qf11vP2Oe4fPP+mVr9ZGAdpDhWx1EkN48aoNVQt6E0nmOF5UEufQ/LjhBR
 QBNA==
X-Gm-Message-State: AOJu0Yw/X3oUmZUmdu7M+Zpi8VqGTtu5cEJe9HtNe4mfmOpeSVH2wM2E
 5bbXjD8UCuL3fg26PK1+PkNnrsvixuclMMhADiwtaVZ7qwvTsGtz3L/Vew==
X-Google-Smtp-Source: AGHT+IF87pAwieEM9jpuXS0aZgcntwrbfyvEm2HVME8QvwvF5xzfVxhyVat0ENiH8kzeEMlotj0zfg==
X-Received: by 2002:a2e:885a:0:b0:2eb:fca8:7f37 with SMTP id
 38308e7fff4ca-2ec5b2e628fmr67293891fa.28.1719350346641; 
 Tue, 25 Jun 2024 14:19:06 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec592b6158sm8908971fa.3.2024.06.25.14.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 14:19:06 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jun 2024 23:18:28 +0200
Message-ID: <20240625211847.1419944-4-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240625211847.1419944-1-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719350347; x=1719955147; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IFknuf6txIWrvv3BiGpCnuovvD0K5IoEVeWoxGrMwAc=;
 b=OWLxvcCbl7hm4h/pQ6ROQS5rdA/9wAYK+ylEesK2HRD7XuSVClzxPTfkr43wqBFBMl
 oL04bLAuYaSMtTqayXmrk6VeqX1viPyBoGTgckK5ICUqMUK8WKaMQKDSuThTW9CxLnvE
 g6pRV7evSv28bW+JyxscUx3FwJs9ipgF4Fk3uSmH8hhzr4LwsA73fGdLmEpcM2uDa77B
 dIBLaEViRAtKlQTZlvGYubqwJhJqaeZR2KCQNia8oDUSUifXvGEd0TYE4bcRLfjrzxR5
 y0nlVG3C+PKV2+gqy1l6W2EghHp2EZ6Ksqw2CRvGO2J1mxUr8sGypG8NwekBz/3pDid8
 amnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OWLxvcCb
Subject: [Buildroot] [PATCH v9 04/14] package/qt6/qt6base: add blind option
 to enable Test support on host
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

We need host-qt6base with Testlib support when building host-qt6declarative
with QuickTest support. QuickTest support is further required for building the
qmltestrunner host tool. qt6declarative will fail to build if qmltestrunner is
not available.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6base/Config.in.host |  5 +++++
 package/qt6/qt6base/qt6base.mk     | 11 ++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 286da0ff03..80bc13c7dc 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -7,3 +7,8 @@ config BR2_PACKAGE_HOST_QT6BASE_GUI
 # (e.g. Qt Tools).
 config BR2_PACKAGE_HOST_QT6BASE_NETWORK
 	bool
+
+# Select this if you need host qt6 tools that require the Qt::Test module
+# (e.g. qmltestrunner).
+config BR2_PACKAGE_HOST_QT6BASE_TEST
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 509c6b0066..6b9f425255 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -86,7 +86,6 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
-	-DFEATURE_testlib=OFF \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
 	-DFEATURE_glib=OFF \
@@ -111,6 +110,16 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
+# We need host-qt6base with Testlib support when building host-qt6declarative
+# with QuickTest support. QuickTest support is further required for building the
+# qmltestrunner host tool. qt6declarative will fail to build if qmltestrunner is
+# not available.
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_TEST),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_testlib=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_testlib=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
