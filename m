Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0D4ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31E20610F7;
	Fri, 26 Aug 2022 12:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31E20610F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KsxmGI0qsAQs; Fri, 26 Aug 2022 12:58:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57AB160B9E;
	Fri, 26 Aug 2022 12:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57AB160B9E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C8791BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7814D40192
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7814D40192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0nI1lgaGc3Tj for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4F64404BB
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4F64404BB
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:22 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id s11so1953350edd.13
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=5djllh+1eXgutqcrX10yM0hwfkR3vLbf5yhuZgiuM78=;
 b=eBssMU+njCK26WK9NiiePqYihl5AYkeWL+9Dv3rfu5K2wRwDj9vsb04khCtC9Hg1VC
 hbJnwnbF9Bo/Ce5z4Zqsyd5y9qNuLX/o8faW9VMBNOYfh1Vwn7Zzx4AvgUY+3kGvKPS6
 EjaX2Xph+PBxfqHhogch9h0NeB3zzvG80uc4BMBNzM+e9GH3MIsEOJYNb9/P0D2k1ubz
 /lgworMqRecYjvuLD+jz9zv89UNnJs9j4DW5Y77982uEyKlqDw3YXKDW/0wCQy1NuuYn
 1MsKeR+5do3zUGkIZHDkuHwJYiifYUa+chLlv0eN6toq/uxHkMPtgrmEPDHFlfqOmTco
 cSng==
X-Gm-Message-State: ACgBeo39Z1iMEDhYxFcjEbJvBcB4w7oFeChfpbZqpd5AUV+a+iwpfwi8
 hXc4dWj0pps3lybTIWw94GmY2a6sYnNRHIto
X-Google-Smtp-Source: AA6agR6dA2zVWJ5JPnuNR6DMwYjw468K6OJmf0Tx6W14W/xbgb5u9fr+kdJQaiCDVgcsePRsplVRDw==
X-Received: by 2002:a05:6402:1943:b0:443:5ffb:b04e with SMTP id
 f3-20020a056402194300b004435ffbb04emr6633496edz.230.1661518401839; 
 Fri, 26 Aug 2022 05:53:21 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:21 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:48 +0200
Message-Id: <20220826125252.16782-26-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=5djllh+1eXgutqcrX10yM0hwfkR3vLbf5yhuZgiuM78=;
 b=CB3r7Iv4xV5yJNY9h3jcdx5dvXH+V2ZkBC8ElskFrEvur9hmj0OsVaHelzxEXNdcf2
 XQS3anYZRIsNeYgjsk4kxRlOzmbapY57hhr5CELx7wdVzGRazxXe6V47NPa1ufCfGRAW
 EzSVKuP2lArufrgOyijjWjsN41B7NTeT8ymoHj8Xn0dG7EWAjq6WnNP5AQaMDqeOLmC/
 e1/H/JOG7RDVOlwrK/JUsYvDTJlx6fs499USjbRLIqgkVoQ1KhYqBwvKYl1tegkqb2gt
 fwqPKF4oq9n76M8n8PLSrqt/4y7j6FEOr8uUdUanG/fJ/SSYu4vw07Vw8e7iXRqdDgWA
 LePQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CB3r7Iv4
Subject: [Buildroot] [PATCH v3 25/29] package/qt6/qt6base: add support for
 gui module tslib
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
 package/qt6/qt6base/Config.in  | 6 ++++++
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 52c1ba1421..648afa78a4 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -271,6 +271,12 @@ config BR2_PACKAGE_QT6BASE_TEST
 	help
 	  This options enables the Qt6Test library.
 
+config BR2_PACKAGE_QT6BASE_TSLIB
+	bool "Enable Tslib support"
+	select BR2_PACKAGE_TSLIB
+	help
+	  This options enables the Tslib plugin
+
 config BR2_PACKAGE_QT6BASE_XML
 	bool "XML module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index c4b4876d53..b5b67ec100 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -206,6 +206,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_eglfs=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_TSLIB),y)
+QT6BASE_CONF_OPTS += -DFEATURE_tslib=ON
+QT6BASE_DEPENDENCIES += tslib
+else
+QT6BASE_CONF_OPTS += -DFEATURE_tslib=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP),y)
 QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengl_desktop=ON
 QT6BASE_DEPENDENCIES += libgl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
