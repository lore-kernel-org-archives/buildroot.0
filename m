Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3D7ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1234740D01;
	Fri, 26 Aug 2022 06:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1234740D01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0C9lGLkC7nxp; Fri, 26 Aug 2022 06:49:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3049740CF2;
	Fri, 26 Aug 2022 06:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3049740CF2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17A3D1C11A9
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E40C783E86
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E40C783E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qy6FlQFRAoIx for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B39F83E85
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B39F83E85
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:11 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id c93so966317edf.5
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=jjbzjgYb2Y/6nej9+ih8tdgxk1VSrCukkOPcCQuntQ4=;
 b=zq/D9tsd1LH3oAbGPz2G2N8Mfmqc0mHERXSJU/iS4fpedF7x+MoUAH+mzHqqJuKgMM
 d0W0FL1pPbxG1/D2dOvJN0yvjRcz/vCAZVWeXdAYNdeQ51HbYf+hWXBTKTR+TAQ/uK3G
 5K38/up/MLabrNzWz/tw5H/zC68fYggBDdQoX5kOqMbV878kaNuzTzrmD549DL45ZQrs
 Hs61ELmCJoBQhzvJCeA0zrhsK1fs0KIpyXqPBK0Khji+q/MHAeRSqexDggtVfZeqpAcK
 7BvrrSxLNLsf3WDOexo2c0qCyzBHdY/NEKB0LCi2PFVqUTtauXafcDRtHRyH9gu5M24W
 R/Uw==
X-Gm-Message-State: ACgBeo3vOwio8s88Tj9g/vw8UnFQ42PrF9VvCpEuHzzW6qNoczKZ9Kxa
 JIROz19QbvMlJ2HZ4i2a8AlUaatOiMBr+PlN
X-Google-Smtp-Source: AA6agR5gdgyKSUG1G1il0mPGyro9H5THEReU7eWK/bASpvxKEQcgyKb7Jw0ob7BSLotW2DTz3dsKhg==
X-Received: by 2002:aa7:d78b:0:b0:447:d501:14c8 with SMTP id
 s11-20020aa7d78b000000b00447d50114c8mr2359929edq.82.1661496488942; 
 Thu, 25 Aug 2022 23:48:08 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:08 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:36 +0200
Message-Id: <20220826064758.3968647-8-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=jjbzjgYb2Y/6nej9+ih8tdgxk1VSrCukkOPcCQuntQ4=;
 b=A70EUpAUJxMpq4ASj9uTwSXybvvHNEbdjPWwUUpG3RsYnswpdpSuKnwBwqNODFNUYo
 loT3fY4lnKZ+3rLO8ywuIiztBg1gtBqux1akm9Fv+r9qg4OzR1WevlzP46ko7d9L+DUt
 wKVX2GFZ4LcOBuSOSOHRDu2nwxPSYLz1xb9TUYGXdKayCTDqb2zAOsaeOzYuHt+gy6Kz
 XxzFT07uQtnWwC0DVOyc/QjjJffbzInCB2OMsf8/IKQ/DV2X46unvVBLKTXjoDLfu6zc
 UPFOzLhI91E4/d1uq0LlJ6WCPkBvXVIX3NGbvMTC8U/VHLGuitenvG4VHxZfzVUj/JTY
 mNtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=A70EUpAU
Subject: [Buildroot] [PATCH v2 07/29] package/qt6/qt6base: add support for
 building examples
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
 package/qt6/qt6base/Config.in  | 7 +++++++
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 2ed780e913..061861880c 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -17,6 +17,13 @@ config BR2_PACKAGE_QT6BASE
 
 if BR2_PACKAGE_QT6BASE
 
+config BR2_PACKAGE_QT6BASE_EXAMPLES
+	bool "Compile and install examples (with code)"
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	select BR2_PACKAGE_QT6BASE_XML
+	help
+	  If unsure, say N.
+
 config BR2_PACKAGE_QT6BASE_NETWORK
 	bool "network module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index fd1e0a2847..f66610ea0c 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -77,6 +77,12 @@ define HOST_QT6BASE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
 endef
 
+ifeq ($(BR2_PACKAGE_QT6BASE_EXAMPLES),y)
+QT6BASE_CONF_OPTS += -DQT_BUILD_EXAMPLES=ON
+else
+QT6BASE_CONF_OPTS += -DQT_BUILD_EXAMPLES=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_NETWORK),y)
 QT6BASE_CONF_OPTS += -DFEATURE_network=ON
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
