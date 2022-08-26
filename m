Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5321ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 623A441833;
	Fri, 26 Aug 2022 12:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 623A441833
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdVA8Y3K-0Mv; Fri, 26 Aug 2022 12:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C51EF4182C;
	Fri, 26 Aug 2022 12:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C51EF4182C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D1381BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58A97610F7
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58A97610F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X3hL-wcYMVNZ for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C92960761
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C92960761
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:06 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id u6so1960489eda.12
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=CPYhSsnDqlqUdVMxWqQJVVNhfS2SVgnAfLf9Ju4gW9o=;
 b=rq4aDRHbqIvUMh1eoTVRbEIg4S4GC+FxN+GyZl2pUWTZFaByKyFK4ZBUHLlYPawFmw
 0PNCZgyT4ahxaXOpTljwKSwndRNoh4X1kg++3IiJTpbO0fiR5Tf2N/ffNljM5S5vsc5I
 UW/Xfef8uGngM1/H4UdIXRWev66/NzIY07cDpwsuRU2BftoXPFs+op9V1GJHPJ8z4Zt0
 RYnFH5iGBnagKz49LDmNmGqG9dbiaAC8hprhmYIWz623/z5Gzv/4MW/UIxx6lo/sJLLy
 HXrksWwNLjski27hOkL+mByHRxC+FM8lLx3HJenarMUyZitxF1/ujyjsUmROSg2fte9U
 BCxg==
X-Gm-Message-State: ACgBeo1TJ/QFXfQdUtmjbjv066lueCvJIQ/Z+VNUpNdCuFGwdRNCwRJX
 ikIaubSaoRaWfOrLFj+Jmo7sTbj0H/osG1Tk
X-Google-Smtp-Source: AA6agR4xdPU1rubftbAxeoyz+Pe3Zk2TwS8gSQMx6vrecmeQo4J62gykMpE884KFs1t/U63mrSUQ0Q==
X-Received: by 2002:a05:6402:e86:b0:440:d1be:20c7 with SMTP id
 h6-20020a0564020e8600b00440d1be20c7mr6683047eda.349.1661518384389; 
 Fri, 26 Aug 2022 05:53:04 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:03 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:31 +0200
Message-Id: <20220826125252.16782-9-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=CPYhSsnDqlqUdVMxWqQJVVNhfS2SVgnAfLf9Ju4gW9o=;
 b=dqz13Troe7sV5ZLjTKgcg10ZPcLmW3vfo7VSIF3S6twgwScIIbf+Y2/x+reNnVAl2A
 xn0wdzJnDCr6Pwia5qKMmdoFEye02Ifgramm2FeVdaToZRJdS8Y5fxBZ0zA/M4dRlx1V
 iKGmuPZqjMDr+OjpaExP26NpvM/UGbDFl52etVx8vQ1jPob9YrDHS36iPn+/fX4Qxz96
 SBVqFwCWbCf100pCxbdV3H00GJtMDWNC7W1WYSg+WPOR/zZlSvkQ3hSLHQsazeLp6ZHn
 ZRVRYUp07FIBh/wmvsRsUcfo8+qi+Oki/+pu4ypJytePneIbaXDBqd7GjCvHLQKCqUTP
 jc/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dqz13Tro
Subject: [Buildroot] [PATCH v3 08/29] package/qt6/qt6base: add support for
 syslog backend
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
 package/qt6/qt6base/Config.in  | 5 +++++
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 2d4a4df223..f3e56aefa4 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -35,6 +35,11 @@ config BR2_PACKAGE_QT6BASE_NETWORK
 	help
 	  This options enables the Qt6Network library.
 
+config BR2_PACKAGE_QT6BASE_SYSLOG
+	bool "syslog support"
+	help
+	  Logs to the standard UNIX logging mechanism.
+
 config BR2_PACKAGE_QT6BASE_TEST
 	bool "test module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index fdb3377eb4..a399f53e6c 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -112,5 +112,11 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_xml=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_SYSLOG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_syslog=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_syslog=OFF
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
