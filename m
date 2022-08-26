Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A15ECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 146C440FE4;
	Fri, 26 Aug 2022 12:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 146C440FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ktje8K8RGM68; Fri, 26 Aug 2022 12:58:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03CE240FDD;
	Fri, 26 Aug 2022 12:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03CE240FDD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA1A91C2742
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C329A40515
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C329A40515
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ifJDEsLQdmdI for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0533140192
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0533140192
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:21 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id s11so1953267edd.13
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=eyy7v/neTwXzju4ap5X2dJSpEEkyMX/0Ub+GbHaLwjM=;
 b=LBdC33VEcwRrlIXzk6z52/QdPStTZIFQUHSxUUhpAXU2bi7hYjTa5FhpvC0D3Gvt4n
 k7OWqOKJRk6GDj/PfX6ZNh/k71duQoh0e5nfERDmfQESZumqVCYuPBMCsvG4iGM+I5SC
 Dx2B237/TUR5cfyyFqQqVHflQKZbgvJ1WRUFMbXaLoja9G6/ska4sXdHFgA5JMn4/Cqh
 Ju1yLPb8SdUG5aDRNhBFYr+RQmSj3HMpUJLETl1Gfyex26hT8IYJseKjAAtXS65lz3JI
 //RkviPZNq/QLtleABzziUx1cKkX+K2nNCluk3Hm3m0fgtbi2KUzlYq/dBoDx8Xd3GSp
 NVYA==
X-Gm-Message-State: ACgBeo0dBBbyygTViiw3jy3uyjexuMLWWFUMvldSzLu9EgeMi/pWVIbH
 D6PppmWofg+BdxnQMQH0+v+shapPoQl+aRfs
X-Google-Smtp-Source: AA6agR5Rw8yFTier32cTd1NiDevk+awyv8kjXTSyfVloosPppLVzib4AMx+cA/CluKXAeLFD4o26RA==
X-Received: by 2002:a05:6402:50ca:b0:447:3355:76e3 with SMTP id
 h10-20020a05640250ca00b00447335576e3mr6664091edb.72.1661518399741; 
 Fri, 26 Aug 2022 05:53:19 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:19 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:46 +0200
Message-Id: <20220826125252.16782-24-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=eyy7v/neTwXzju4ap5X2dJSpEEkyMX/0Ub+GbHaLwjM=;
 b=YkjYIAL3OQP1LCtG0kDtXi61quAuemy4jJfKqhW0zJgpvrGhIsjyqYGkfXf5iao2Nc
 rkU2Tq4/nLEz/l1wPmI/znSgC5C+la32Bga5ND2/iawCk1DeVn+8nM393pACkUG8Ftr8
 1JM5B8W7xHA0hVSG0TLZ9CqzrbQncEZqkILS6ThmiJo4gEv7Hu1P3d8lRbhzwwTYz3fo
 bHIdXijTHyIVcaVj0RZmcHyn05KIviAn6wLShPYsSzwFN2zG5uelU54lxjnPJwI4gtQZ
 9zHay2Yu5BY2vHBdgfCzQUT/sfIgWunb1s4F04548rC+MDPuLn+b1tP7G4gJUnTmTQ6u
 S/wQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YkjYIAL3
Subject: [Buildroot] [PATCH v3 23/29] package/qt6/qt6base: Add support for
 gui module jpeg/png/gif image format
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
 package/qt6/qt6base/Config.in  | 19 +++++++++++++++++++
 package/qt6/qt6base/qt6base.mk | 20 ++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index db510989ca..9533076f54 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -65,6 +65,25 @@ config BR2_PACKAGE_QT6BASE_HARFBUZZ
 	  if the toolchain supports __sync for 4 bytes, or the qt
 	  provided one which avoids this dependency by using QAtomic).
 
+config BR2_PACKAGE_QT6BASE_GIF
+	bool "GIF support"
+	help
+	  This compiles and installs the plugin for GIF reading support.
+
+config BR2_PACKAGE_QT6BASE_JPEG
+	bool "JPEG support"
+	select BR2_PACKAGE_JPEG
+	help
+	  This option enables JPEG support using the system libjpeg
+	  library.
+
+config BR2_PACKAGE_QT6BASE_PNG
+	bool "PNG support"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  This option enables PNG support using the system libpng
+	  library.
+
 endif
 
 config BR2_PACKAGE_QT6BASE_ICU
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index ae6c482197..029afdd79b 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -155,6 +155,26 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_harfbuzz=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_PNG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_png=ON -DFEATURE_system_png=ON
+QT6BASE_DEPENDENCIES += libpng
+else
+QT6BASE_CONF_OPTS += -DFEATURE_png=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_GIF),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gif=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gif=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_JPEG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_jpeg=ON
+QT6BASE_DEPENDENCIES += jpeg
+else
+QT6BASE_CONF_OPTS += -DFEATURE_jpeg=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_FONTCONFIG),y)
 QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=ON
 QT6BASE_DEPENDENCIES += fontconfig
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
