Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F821C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 14:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3C68402C5;
	Tue, 16 Aug 2022 14:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3C68402C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HuexoMS7Grdp; Tue, 16 Aug 2022 14:40:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4B8D40296;
	Tue, 16 Aug 2022 14:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4B8D40296
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 830C31BF4D6
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 14:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DCCC82983
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 14:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DCCC82983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B1Rfq21zZLHs for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 14:40:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BA7F82A8F
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BA7F82A8F
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 14:40:34 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l4so12854806wrm.13
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 07:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mc8Zil+MRY89JdczzyB35AkEv7M4ciwYJfOYTBZNF2o=;
 b=2QNZYdziI6A7uRhcq+A7WPnieXwn0G4y0+KYEuePGIWYNAxrbm2HH8E4qSqdPu0ydV
 HstkaeKFqxgeOdDZ7OsVeurMAVW4ZDIrvrdt4nIAIq3zVWU2MBBQCGbvft1dxRjEpTLY
 6iOwDFy3Qf9d9/FTxfQSS/1ORDmJMNX+SfQBZVem3iVBg9K72mmMvd+DvRoRqAziVGSh
 QxIq6UyZQCeFgN2kKIqmx9Hw2pXm/Ly+xwxJuaV+fGp5v/D0ZYG2+df3y5QCEDj8XR38
 iG+RKmOZ3F0LwOiJKMggpMm825iBZqIRdigOKl3KGjl/7DIQ9jBJZJzYAdy7/TWoSzvE
 kbpA==
X-Gm-Message-State: ACgBeo1Yh+658ly0fLmZRYCL/d01TIfjDUL1tDvQZIg7ITqPcnZy70W/
 G3Ae2E7u+BG6n92QNhK+2yNfRGpZvO4=
X-Google-Smtp-Source: AA6agR6mVEctrJUqEsD+SXx7uH5l+i2t64cJ/x85bshMexlPX9g9eE5IpNtEWwpQQ3bTxtB5WABf/Q==
X-Received: by 2002:a05:6000:50a:b0:225:210c:a7e4 with SMTP id
 a10-20020a056000050a00b00225210ca7e4mr140419wrf.704.1660660832627; 
 Tue, 16 Aug 2022 07:40:32 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 j36-20020a05600c1c2400b003a4c6e67f01sm13844300wms.6.2022.08.16.07.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 07:40:32 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue, 16 Aug 2022 16:39:41 +0200
Message-Id: <20220816143943.16142-5-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220816143943.16142-1-guillaume.bressaix@gmail.com>
References: <20220816143943.16142-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=mc8Zil+MRY89JdczzyB35AkEv7M4ciwYJfOYTBZNF2o=;
 b=E9FAHbpRldr5k52KV7ebk7/dvd8SxGtSVc+t/8GghMW55ccYEnPrkj2Q3WtKCRMjVr
 2n5tZrCfM9NlFnVtP320nCdTg5rSNUiRMDUtB4vqOB/goEu44/DaigVBEjI7axLqlOMN
 WQ2LbnlpOlYB0FS5vxNgsIe6lH2m8GLqpZH9T/CqRP0u8TWOTVtnD3UxlUbBEVGLXpo2
 nMWJRz1VMy3Y/Th8UphNROoY+dKUIVWXJEJs7lXweSe8Hj32u738A9xpvevCK8Ti9RT+
 jti8AV95TPPlLdp/CTepRYJY3RpoEZEflvCLwAshZS67Lv/wPjRpkMqKqBJg97bGyl2h
 KDdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=E9FAHbpR
Subject: [Buildroot] [PATCH v1 5/7] package/python-scipy: add host-package
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-python-scipy is a build time dependency of python-scikitlearn

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-scipy/python-scipy.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index a8c23c6c88..d41cf2fd70 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -31,6 +31,12 @@ PYTHON_SCIPY_DEPENDENCIES += \
 	lapack \
 	python-numpy \
 	python-pybind
+HOST_PYTHON_SCIPY_DEPENDENCIES += \
+	host-python-numpy \
+	host-python-pybind \
+	host-python-pythran \
+	host-lapack \
+	zlib
 PYTHON_SCIPY_INSTALL_STAGING = YES
 
 PYTHON_SCIPY_SETUP_TYPE = setuptools
@@ -55,4 +61,12 @@ define PYTHON_SCIPY_CONFIGURE_CMDS
 	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
 endef
 
+define HOST_PYTHON_SCIPY_CONFIGURE_CMDS
+	-rm -f $(@D)/site.cfg
+	echo "[DEFAULT]" >> $(@D)/site.cfg
+	echo "library_dirs = $(HOST_DIR)/usr/lib" >> $(@D)/site.cfg
+	echo "include_dirs = $(HOST_DIR)/usr/include" >> $(@D)/site.cfg
+endef
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
