Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5EAC4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B3C3410BE;
	Sun, 27 Nov 2022 13:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B3C3410BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8w6Q19IvGBim; Sun, 27 Nov 2022 13:12:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDFC2410C2;
	Sun, 27 Nov 2022 13:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDFC2410C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B98A1BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77DD6400D0
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77DD6400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g7qPccUVpe9P for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A795B400B8
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A795B400B8
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:59 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id n205so9047112oib.1
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4IOsoYGR3VQS/vE/lmnNnZ/IYsnduM0ChrApOk5J3qg=;
 b=TA0yDsuBtx80M6MCNfwbeQs7M6dOIHlgSrNVLG0+9kVLQ/yHg7y0aQkdRmBSlywobj
 Y+3VKVEA4tQjWn9YWQk6gXFBP6y0SMO2P7bR+D2I40RQiZ8Dw0gqN47vqksrzYN2RY74
 EKpKSmP2fBMvX8mHpWdO5ALOOO8GQ5AmO9G/OAG8IzfwRxwUGVeuHCq2lWv3Ed3rYe+E
 3S55zQTYJrPdTFeBx55rbFoduQuviqsH06cZ4bip3rq2c1+/JmoGrObs650Wq4KuJlkj
 XVRzeSpG08CfJM1vebRCC9S2iP3VTRifNlelY/78eNwQTpQF4dwsARHGGPaoLOtlTJU/
 Ae/A==
X-Gm-Message-State: ANoB5pn2AKw3+AmAYeyg0gC64KbkZ0u0z+sk7dWi3uLr8Thgfs2VlD7J
 lrJoeui7mYa7C1M/QSzIqn6sRcOgO74=
X-Google-Smtp-Source: AA0mqf5bwhzlem8DQacdsmtvObiKMwPrdJy0qXHXVSEoA2NcOvyf4+1nEdMt5dV6S5LXFqqnl0nbWA==
X-Received: by 2002:a05:6808:6d0:b0:35b:72eb:cad3 with SMTP id
 m16-20020a05680806d000b0035b72ebcad3mr10969693oih.83.1669554539368; 
 Sun, 27 Nov 2022 05:08:59 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:58 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:35 -0300
Message-Id: <20221127130739.1862398-22-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4IOsoYGR3VQS/vE/lmnNnZ/IYsnduM0ChrApOk5J3qg=;
 b=EerDmekyqkbIEq1/DEUbkSwPWaLCM85cva+Gs7G9SpAiuoqMm5PoZ/fHuyAY9RL94x
 4rQPTMGoPrOdK3cNaaymYN2blFd8AplyHnVZ1qp+uWDFIpiwRvnNcZdKbQihUMi12H+T
 zlvBwTy92WjKbcvtuLSDk3GpKXsxcMJF/DhOyLU7Cu1xC2TJsq0paDkBjXsAN5LZI55B
 Qm7smeduqBdKOdYO3Bkj/r8IrmehLXhatrjo7ccWnUpI7+jXnCL2KFisQBtV+UiOizzH
 IBdlE/xnCxWhEHMQk2hqCzyqKdupSbKrbJXg355cM/xhr6NiXMR9r05ehWCjZWKLZAdr
 yW+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EerDmeky
Subject: [Buildroot] [next 21/25] package/ti-sgx-km: properly handle legacy
 for removed options
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "c38b5566fe package/ti-sgx-{km, um, demos}: bump to latest TI
version", added in release 2020.02, removed some options that were
previously renamed in release 2018.05.

Update the legacy entry for 2018.05 and add the corresponding legacy
entries for 2020.02.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
test config 1:
BR2_PACKAGE_TI_SGX_KM=y
BR2_PACKAGE_TI_SGX_AM5430=y
BR2_LINUX_KERNEL=y
BR2_arm=y

test config 2:
BR2_PACKAGE_TI_SGX_KM=y
BR2_PACKAGE_TI_SGX_KM_AM5430=y
BR2_LINUX_KERNEL=y
BR2_arm=y

test config 3:
BR2_PACKAGE_TI_SGX_AM335X=y
BR2_LINUX_KERNEL=y
BR2_arm=y

test config 4:
BR2_PACKAGE_TI_SGX_KM_AM335X=y
BR2_LINUX_KERNEL=y
BR2_arm=y
---
 Config.in.legacy | 66 ++++++++++++++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3131c31e68..5dfbd8b831 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -1629,6 +1629,35 @@ config BR2_PACKAGE_RPI_USERLAND_START_VCFILED
 	help
 	  The vcfiled support was removed upstream.
 
+config BR2_PACKAGE_TI_SGX_KM_AM335X
+	bool "ti-sgx-km AM335X option removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_TI_SGX_KM
+	help
+	  Starting from buildroot release 2020.02, the buildroot package
+	  only supports the target am335x.
+
+config BR2_PACKAGE_TI_SGX_KM_AM437X
+	bool "ti-sgx-km AM437X option removed"
+	select BR2_LEGACY
+	help
+	  Starting from buildroot release 2020.02, the buildroot package
+	  only supports the target am335x.
+
+config BR2_PACKAGE_TI_SGX_KM_AM4430
+	bool "ti-sgx-km AM4430 option removed"
+	select BR2_LEGACY
+	help
+	  Starting from buildroot release 2020.02, the buildroot package
+	  only supports the target am335x.
+
+config BR2_PACKAGE_TI_SGX_KM_AM5430
+	bool "ti-sgx-km AM5430 option removed"
+	select BR2_LEGACY
+	help
+	  Starting from buildroot release 2020.02, the buildroot package
+	  only supports the target am335x.
+
 comment "Legacy options removed in 2019.11"
 
 config BR2_PACKAGE_OPENVMTOOLS_PROCPS
@@ -2602,45 +2631,34 @@ config BR2_PACKAGE_MEDIAART_BACKEND_QT
 	  BR2_PACKAGE_MEDIAART_BACKEND_QT has been renamed to
 	  BR2_PACKAGE_LIBMEDIAART_BACKEND_QT
 
-# Note: BR2_PACKAGE_TI_SGX_AM335X is still referenced from
-# package/ti-sgx-km/Config.in
 config BR2_PACKAGE_TI_SGX_AM335X
-	bool "ti-sgx-km AM335X option renamed"
+	bool "ti-sgx-km AM335X option removed"
 	select BR2_LEGACY
+	select BR2_PACKAGE_TI_SGX_KM
 	help
-	  For consistency reasons, the option
-	  BR2_PACKAGE_TI_SGX_AM335X has been renamed to
-	  BR2_PACKAGE_TI_SGX_KM_AM335X.
+	  Starting from buildroot release 2020.02, the buildroot package
+	  only supports the target am335x.
 
-# Note: BR2_PACKAGE_TI_SGX_AM437X is still referenced from
-# package/ti-sgx-km/Config.in
 config BR2_PACKAGE_TI_SGX_AM437X
-	bool "ti-sgx-km AM437X option renamed"
+	bool "ti-sgx-km AM437X option removed"
 	select BR2_LEGACY
 	help
-	  For consistency reasons, the option
-	  BR2_PACKAGE_TI_SGX_AM437X has been renamed to
-	  BR2_PACKAGE_TI_SGX_KM_AM437X.
+	  Starting from buildroot release 2020.02, the buildroot package
+	  only supports the target am335x.
 
-# Note: BR2_PACKAGE_TI_SGX_AM4430 is still referenced from
-# package/ti-sgx-km/Config.in
 config BR2_PACKAGE_TI_SGX_AM4430
-	bool "ti-sgx-km AM4430 option renamed"
+	bool "ti-sgx-km AM4430 option removed"
 	select BR2_LEGACY
 	help
-	  For consistency reasons, the option
-	  BR2_PACKAGE_TI_SGX_AM4430 has been renamed to
-	  BR2_PACKAGE_TI_SGX_KM_AM4430.
+	  Starting from buildroot release 2020.02, the buildroot package
+	  only supports the target am335x.
 
-# Note: BR2_PACKAGE_TI_SGX_AM5430 is still referenced from
-# package/ti-sgx-km/Config.in
 config BR2_PACKAGE_TI_SGX_AM5430
-	bool "ti-sgx-km AM5430 option renamed"
+	bool "ti-sgx-km AM5430 option removed"
 	select BR2_LEGACY
 	help
-	  For consistency reasons, the option
-	  BR2_PACKAGE_TI_SGX_AM5430 has been renamed to
-	  BR2_PACKAGE_TI_SGX_KM_AM5430.
+	  Starting from buildroot release 2020.02, the buildroot package
+	  only supports the target am335x.
 
 config BR2_PACKAGE_JANUS_AUDIO_BRIDGE
 	bool "janus-gateway audio-bridge option renamed"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
