Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98E1C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 13:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71D2C60EC8;
	Tue, 18 Jun 2024 13:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4U_qlPkTogr; Tue, 18 Jun 2024 13:20:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAFD560F04
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAFD560F04;
	Tue, 18 Jun 2024 13:20:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 385741BF3BB
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3182681770
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZJtig6X-eOM for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 13:19:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 379708175E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 379708175E
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 379708175E
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 13:19:56 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ec17eb4493so64066481fa.2
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 06:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718716794; x=1719321594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IFknuf6txIWrvv3BiGpCnuovvD0K5IoEVeWoxGrMwAc=;
 b=W9zd6ZOiNkIiULt03Hu8M2xXuasX4GW3/bZNM3ALqY0o0bBPCm/Chi4JD7bdE9iF95
 Orv9AbZALSHRdDQ+Tx4WVju4UDhavLkClbF9jxippxB4J0sm57GtfZfDfDvChPkR3Fii
 YByAlGTpnJxmv85oomBb8SWGvO8/eYOfk19PkliPcxnFMt0ITZ3XyANuLLGaV9NM6nZF
 tJRDvjzCboVqXl2c3N5xpbxbomaCNJbfFp8zswWPBWUBA0O6jkHc6G6qheqQueKei/b7
 H8w1QVcOT3poMoNYHxpyCAvh+R8COEkuvKsnSho9LBbVhfEwKgcJqiJDqqswQtbMx0DN
 R1Lw==
X-Gm-Message-State: AOJu0Ywml2HZf4T+vi/vsKKM8IcLbDbQbf26zBOUeWMIT9QhCM9KzUJc
 qAifcNoZQiM6Sd/6epLUvBCZL11j9KK8Edu5fd/JJW/q2h0WLjva9b/JMw==
X-Google-Smtp-Source: AGHT+IGaLtk9hsIapdhaN0Jri8I5ooAQlg/4APJJXMxr2yXhSOdx+sWvl1G3hRY1U4FJ0V/8vSOcmA==
X-Received: by 2002:a05:6512:473:b0:52c:9f9d:d55a with SMTP id
 2adb3069b0e04-52ca6e92849mr9270213e87.51.1718716792785; 
 Tue, 18 Jun 2024 06:19:52 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287228bsm1497540e87.163.2024.06.18.06.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 06:19:52 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 15:18:25 +0200
Message-ID: <20240618131902.2912459-4-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618131902.2912459-1-roykollensvendsen@gmail.com>
References: <20240603115206.3583474-9-roy.kollen.svendsen@akersolutions.com>
 <20240618131902.2912459-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718716794; x=1719321594; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IFknuf6txIWrvv3BiGpCnuovvD0K5IoEVeWoxGrMwAc=;
 b=Pgx2WFVLZyc9berPtmO/CPCoyA2ujDEKNCfls4eWIg8+7y4rqxZGC+wduFyZwIkmSc
 B+mHQyTc8cWQ6wFGe8wK1NRVIjCUrMAMikjlOGkrdEbOMElmHRh2MznrBLVCnsOokzjX
 2n3WpzRrbDkzrugdELSvQWd+e8eNRYv7C+EChBG5Y/KL3uoFfzvb6fWJjPUe3it0rUMw
 ZfEXdjiFCBq2hSb9KkY8IBf3CWNmECdjRkacifRxn+sJLbKcR9xM/HAM4C/GqXgK/27H
 aKj1bQyn1eAzt+bh5imdyBirhyMpGttewXPjeZU6IsKs/orH2UDvEQIfyVpuhBJK2IRx
 pYwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Pgx2WFVL
Subject: [Buildroot] [PATCH v7 04/14] package/qt6/qt6base: add blind option
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
