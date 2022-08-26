Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA3AECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B5994014C;
	Fri, 26 Aug 2022 06:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B5994014C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0UHeZ_IGCgNs; Fri, 26 Aug 2022 06:48:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17CDE40C39;
	Fri, 26 Aug 2022 06:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17CDE40C39
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E25F1BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16906610AD
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16906610AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uHRF2_PCnIfd for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56C2160B1A
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56C2160B1A
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:08 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id d21so1407028eje.3
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=I2i7PF7Aj/GWIQZ3YoJveO4vShAeopLolA5luP/vFKw=;
 b=2wEnYvdYAVOdEWnAWNoHgMhsb8ha4kmjFZVlGKE57WxTD9douxq9zDS8bUP0HcQDby
 S6CzSGMzzbojxrNxHVc5EnGWYXZBFaf4SooX4qLQ/5XRVXlSp/vV5nRasYXSJw8y5ehP
 O3ivaOHNriujAo3v9W7XvjbT+329UiXkSkbPKrIjmdtsteiLKCoNepp9x3La+3J/zGbc
 qhgp6jZegaLvUshdND4fa/hIFQGwmwCeDlLomanHvfBM91aJ4AJLHcGEUcwa2ex7w9J8
 ndh9yj1c3mqziZAPuBp1/gn5dDH4QdB730KRz3Ne1v9lpt/fcKVK/soucTd/rN5juUCw
 /K5A==
X-Gm-Message-State: ACgBeo1eT9axvXVL/nKZvRcYgFZoWqX9HOHRyfzOL3/2pSnuMqJgIL3B
 HmI1uCcuP2E4bBsI3LijPX73sC3+FK5Xgakf
X-Google-Smtp-Source: AA6agR7VLgTESxT8FPJEriR9jZxMINM6QA8iGdB9PFMM3wSs11aBSbmgmah68YwUTMzrSCSCsvGKyQ==
X-Received: by 2002:a17:907:6890:b0:73d:a58c:4f0b with SMTP id
 qy16-20020a170907689000b0073da58c4f0bmr4521911ejc.247.1661496485957; 
 Thu, 25 Aug 2022 23:48:05 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:05 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:33 +0200
Message-Id: <20220826064758.3968647-5-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=I2i7PF7Aj/GWIQZ3YoJveO4vShAeopLolA5luP/vFKw=;
 b=ZgRhlVfV3Hkfm/ae8VgFihkohDTlje+P7/hTjPbXV+j8ou7WU3kGMLNfUDKPZD3142
 Q+6aavODtear6+sD7W6kdtyRXEijDupBLtwtKliIMZXXpuNA28wFBSNRIZu/UGNPdLUr
 ISOrf8u7yHmSMgMDTBwgpT7lcxCt8GIIlyAWKYZI/hy2LCFB/aUWr5slv4uJDfWcJ6vZ
 oJcktb11JwCkB6Fln1uE/EdOavtebtf6OvvHFE9K//CnCL8EKFpPknbnkCWag4LA2ZGm
 4UF2oHuiTf9UP9WnovmLcPRGT8B/s3ThVb9kdYisLK1WWqhEBntRFpmxdqs4W+X/6py3
 xgzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZgRhlVfV
Subject: [Buildroot] [PATCH v2 04/29] package/qt6/qt6base: add support for
 concurrent module
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
index 68bca728e2..50cdb52761 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -22,4 +22,9 @@ config BR2_PACKAGE_QT6BASE_NETWORK
 	help
 	  This options enables the Qt6Network library.
 
+config BR2_PACKAGE_QT6BASE_CONCURRENT
+	bool "concurrent module"
+	help
+	  This options enables the Qt6Concurrent library.
+
 endif
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index b4b6450bf1..302aecab31 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -83,5 +83,11 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_CONCURRENT),y)
+QT6BASE_CONF_OPTS += -DFEATURE_concurrent=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
