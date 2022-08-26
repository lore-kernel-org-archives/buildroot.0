Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BACBECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1407610AE;
	Fri, 26 Aug 2022 06:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1407610AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrnqkX0RHpam; Fri, 26 Aug 2022 06:49:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D693160B63;
	Fri, 26 Aug 2022 06:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D693160B63
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 00F301BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE740400F1
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE740400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pyfFFMH-mM7M for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F52440012
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F52440012
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:10 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id w19so1377542ejc.7
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gxwSdFe9Yx+9asCHWNtS0nUQi78LOdrDNQx25tBMcp8=;
 b=PSkguiiPFTFjZ4+lpq+VoOjkUmVI3dM0B2mKKvEAAhbUuVnx4zYkveAKkZWuMj+21E
 6tFjIwYys9tDK3vSa/f4K3Yslwqa1+99Wg5F0p3xeMnpGHO13OVQnvBPoY1v/bP2tLnp
 7sK55E+7930vfOTGZRhJRurvSaUXu9s03tHGgWHwesVu81B8xabcXbAAHumKzqv/avT6
 O1aopErE+Cg/VApzJlRyCMw0PsGFEytMCNp3+7jD7BSUSCrjJ/KOLk2LZvP5HUuu4IQO
 Y78+r3T5niw+iHTdgkPcwGt/rr/5NOfN/EB1roTOLBHnuiewkoU098B7OIRLBfRHKL9Y
 q1xw==
X-Gm-Message-State: ACgBeo1fO7mFA3EnkOhmn6sFZcbNbeJ1O7g22AxJ0DVmVVKiBBgMhtnc
 d/8Pyql6ugAheAeqEzPeKKQ6enB5mVpWxQWQ
X-Google-Smtp-Source: AA6agR60Voxmip+fnI5uyl6GEpBRVaOgV9r2obYmdWgZHZU1S6qeh5lcAE2tAhO7hCvdzG/isJ4/Sg==
X-Received: by 2002:a17:907:a062:b0:73d:dec1:6692 with SMTP id
 ia2-20020a170907a06200b0073ddec16692mr2075377ejc.685.1661496487955; 
 Thu, 25 Aug 2022 23:48:07 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:07 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:35 +0200
Message-Id: <20220826064758.3968647-7-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=gxwSdFe9Yx+9asCHWNtS0nUQi78LOdrDNQx25tBMcp8=;
 b=OPwOmp7PP/977yA1bnTT+OEr9towXtaAr/fcE599arziPwK4U9grszaGrdJnEw/MNd
 fkK7DKHMU3c14bx/TywGdH5QHDzkWk3DWdYypeOjQXob7AzNeDU4nzEgUesLV7LwesXj
 tJVLU+jigrxx/gp/gOp8YeetzYfvIVIBxPzYb+6eHLoyor56BkcMPa4IZfELtyZIgH2A
 VwxFwFIC5AsorcH+T0RJetW+7IZDJlWe86Q+e5NdrFJXGcNkCczvn08b+GIbgXjogN8u
 ofxDxxe5sbNLn4/TE7CASw6+HaugBnpRpeh/ce5St/jLUxIG9jbRysaV/2aFgN6gIQZ2
 trsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OPwOmp7P
Subject: [Buildroot] [PATCH v2 06/29] package/qt6/qt6base: add support for
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
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/qt6/qt6base/Config.in  | 5 +++++
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 4203ca7588..2ed780e913 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -27,6 +27,11 @@ config BR2_PACKAGE_QT6BASE_CONCURRENT
 	help
 	  This options enables the Qt6Concurrent library.
 
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
