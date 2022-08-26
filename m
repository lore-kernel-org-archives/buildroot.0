Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85308ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D76340FDA;
	Fri, 26 Aug 2022 12:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D76340FDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mKxGMUDRz2xh; Fri, 26 Aug 2022 12:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B454D40FBD;
	Fri, 26 Aug 2022 12:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B454D40FBD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 330D41BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E43383EE9
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E43383EE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sW8uV--oPTl3 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C56483EEC
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C56483EEC
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:01 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id lx1so2949094ejb.12
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qnno27R6JkSQiFr3ayg+EneJr6Kh6G2JB7xMr9N5D9k=;
 b=bfBM3K0AVdZRUa3p4aPBZOn4+LISbt3IS9cFyNs47MFC9l6UJymMKB41m5K4MG+74e
 A3g56VgC9kZV+Zl2QCqs2VJTyGNEL8QfJ05ej+98PnOJnWGKzx4DEjFCGD1Ivb0qcUC/
 HfW0Jwpp00Ys72H3NT5AEl0bC9gHuuy9e3AWx7d017sGx0SYzjPQIC07CmrzCRnM4tlf
 b+bwQUApu+vSmH5yjDql6PE+Y7TP9ibLQnJtsbAioseuiubOpofal8VFQWFCg9tXdSxn
 LSaPkhu7ynCpu5XwTm9FUywtVcK+5Y72Xq1hLQv3ArqozBpvb9+jC+hX31yizad3Y0iH
 Pfgw==
X-Gm-Message-State: ACgBeo04G8R2VTjuICt//ypQjsE5bkuLvjka9MLfaiDVAilMKCcSWNp0
 eeufsOGE6S+xrSwD90t4vduAQixvxBP239lY
X-Google-Smtp-Source: AA6agR4wv5f1W1JiOV3ZMJA8miJSCbQ98VM6edZcTj0ik+MZKf8/zeUMQnqLR4EfZeXhByGdNawxRQ==
X-Received: by 2002:a17:906:974b:b0:733:10e:b940 with SMTP id
 o11-20020a170906974b00b00733010eb940mr5520889ejy.326.1661518379250; 
 Fri, 26 Aug 2022 05:52:59 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:52:58 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:26 +0200
Message-Id: <20220826125252.16782-4-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=qnno27R6JkSQiFr3ayg+EneJr6Kh6G2JB7xMr9N5D9k=;
 b=R+xEBGNjVRTs05emqqosHK+vpG5LvCWA6X2mxu61sECbdiqfGoS0fNOT7co01waXx1
 ro4DBc+FpFFazEr3cl9igGfiTIqIAZSHxAXvkqDDAoFW0D5dNcbCRNKCwfWrw6wqcoNj
 rjyTKWWSTI2Cd2XSbkjL4aciN6tvaznCluF8dloNf/U0QybyB9K1BtWAW5m6mcn+YTyh
 5OLoli2w50yK7G4LmhpG7Cyu4K8PAZTFnVAT/LcHVhChCef33boX+d7h2BW2oiHox2CY
 yUzPP/85acj7/Qh2wrk5zk2i4x/P/4Vh6JiEJi9RcDUTaqohYh7bug1MWwaN9CvuesUt
 MZyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=R+xEBGNj
Subject: [Buildroot] [PATCH v3 03/29] package/qt6/qt6base: add support for
 network module
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
 package/qt6/qt6base/Config.in  | 9 +++++++++
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index a489ce39fc..68bca728e2 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -14,3 +14,12 @@ config BR2_PACKAGE_QT6BASE
 	  QtWidgets, etc.
 
 	  http://qt.io
+
+if BR2_PACKAGE_QT6BASE
+
+config BR2_PACKAGE_QT6BASE_NETWORK
+	bool "network module"
+	help
+	  This options enables the Qt6Network library.
+
+endif
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 7a0838b2bc..b4b6450bf1 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -77,5 +77,11 @@ define HOST_QT6BASE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
 endef
 
+ifeq ($(BR2_PACKAGE_QT6BASE_NETWORK),y)
+QT6BASE_CONF_OPTS += -DFEATURE_network=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
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
