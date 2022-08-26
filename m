Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE118ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8164083E82;
	Fri, 26 Aug 2022 06:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8164083E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6SJtP2PAuX1F; Fri, 26 Aug 2022 06:49:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94C6C82560;
	Fri, 26 Aug 2022 06:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94C6C82560
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DCB41BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDC6A400F1
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDC6A400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n8T8X9fJxNI7 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A58A40012
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A58A40012
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:09 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id h22so1392156ejk.4
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=I3D21b6r9GaMG7PUgnulPvpViAsz5AD6a++VK/b1ZeQ=;
 b=GbBim920YwYI8ASkEqwzmHw7n/c/cipE4dXO9r1YcwvqxZcPl81FHRHi44sOlIkeBB
 y8Pf0pKJJX8f230MRcxwwi9Lo6/1k7GatIyLN8MPcj6M7o+RDIkekbTPuiGU14vrC6zg
 k0B0X+mYvpRQoCUcNs7I7gk3cp985QVOd1gK1MXqhyVh9w//zi9YZJCq7KbcXeXf+/Ov
 yXWw8x3QcEJ7bmKYzX5ICHjUW4MNc1kyeRnrhmzgp6Ov8srgnm/reCPVjt087KGxi6/q
 +DzqBVIwfxqko7rQVpx5CkVVthkvUPUmLXvG2F0qc0lzy+AmmYfb1KJOWje1p03z3AtD
 I41g==
X-Gm-Message-State: ACgBeo2J4fuJhonHmFVQLg9MkvFdpIla0o6afEJH+Am40BsOeGPeKEcW
 qVz1IcYcwNC9ShZe9T3kpH7TvSaXbC1WhQ/m
X-Google-Smtp-Source: AA6agR4/+Twl8yVf6rbwyLDO/YCUqsP/kKGwDFJJUuAL2DbKC2izcTiJ6Sa5flB/5gfsKMxAE60XBg==
X-Received: by 2002:a17:907:d1e:b0:73d:cf7e:8191 with SMTP id
 gn30-20020a1709070d1e00b0073dcf7e8191mr4268300ejc.46.1661496487014; 
 Thu, 25 Aug 2022 23:48:07 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:06 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:34 +0200
Message-Id: <20220826064758.3968647-6-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=I3D21b6r9GaMG7PUgnulPvpViAsz5AD6a++VK/b1ZeQ=;
 b=bQyCgR5UIDf58hcVoIqVvJrGbKtfE9gpdccS58XIcEJa4649A72NROKGDjtjvH4UL/
 TACjOaXG1QItA8oVdzYHVHCgL7eUoRJSW5A14xQ9qUvcBytETXBG/70VQR8HXb/DhXWs
 3K4fAidzibV7OCRyHDAPMXGRyEeH6iWVcxJw7OsgrqSFXENMEHhs22Rw9NxFRbTjckkO
 860t2cBMwDcJ2kIjl5xewmEtBoMY5UmvClZBE0DI7CQv/7eDdmA/ghL6/Qd8HbYpMxlY
 Nl5z+OZNF4h0K1XAks0BvuhG4sfMX15ttPeLr9MMtVgQCgTalCggxPcL9M+6tjoqTvkX
 GDkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bQyCgR5U
Subject: [Buildroot] [PATCH v2 05/29] package/qt6/qt6base: add support for
 xml module
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
index 50cdb52761..4203ca7588 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -27,4 +27,9 @@ config BR2_PACKAGE_QT6BASE_CONCURRENT
 	help
 	  This options enables the Qt6Concurrent library.
 
+config BR2_PACKAGE_QT6BASE_XML
+	bool "XML module"
+	help
+	  This options enables the Qt6Xml library.
+
 endif
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 302aecab31..1af24334a9 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -89,5 +89,11 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_XML),y)
+QT6BASE_CONF_OPTS += -DFEATURE_xml=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_xml=OFF
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
