Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995F4C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 23:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CCA9605E3;
	Mon,  3 Jan 2022 23:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H12E4flyHEtK; Mon,  3 Jan 2022 23:03:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B13E60B4C;
	Mon,  3 Jan 2022 23:03:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 538E71BF358
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 23:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C5C5813C0
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 23:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLgSZEdNo_DY for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 23:03:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A2BB813B7
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 23:03:02 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id v25so31148150pge.2
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 15:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IrHLEg1sjCyv6UIqhVu5GtjOW8Xn004x5uU2qBkplgU=;
 b=d9Y68GSHESoDQgFbQtUbtOj6mthJEeRFvZpsWs2hhISI5wkSsfmIqqvIi3KUvae+he
 0uMdJQ4Qxo5SFysmU23h6vF83B9qba7DdwPmx/TBCwtcrHotGz7wVlSx6QyT5F8VbCv6
 CUmDtJko4A2DUeMFpjQUY77VaWifP7Nod9obgT2s4C9P2oQrzvZk/JBr6NdWvQ5+7+Jc
 +2OXGvaaJki8DKY7gVNVTVXTaDoYPmpsSddOeVhG8Ztn7GWWrXk6XDtRdEz7dJbYlBCe
 uBD8Adkr/SISUtEyVdy5Ny3/SIg9qoGsh1klq6a4R9hMVFWbxujKXze92QiqPZmRVwg2
 pGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IrHLEg1sjCyv6UIqhVu5GtjOW8Xn004x5uU2qBkplgU=;
 b=AFA3kFd79VdZROTj7QDWfTdad4rNR3x1a4oRVuvJduREk7OlzN0jJspewSmqX0gb24
 CFO/9Ka+2xYOmHemUWohTJ84dvxdPSRHsHaP2uePLC/NTEbIj9+RKy3wuJgnGVbVCWW2
 jz64v7/d96YSQtlHsu7jo/dOkMUdNiqxbfoRiykMtoz58Kp6om5dwtCNtanBATMxgvPf
 Ef4mh6xTxsWPQjVsuuOf20M5nYq6zk3gEcmt4bxXQeOeq/uooNYxx43VJgLr7ndfo/Zc
 mYessp1PtsNGWsTx4RziIh8Gz5KYwLspKweyDNdew0Fwz5L78MI3MHdziOpKSNfFOdzl
 nZ+A==
X-Gm-Message-State: AOAM532Z1YF2MXvkBEU0r3crDYWOHoyz07WqAu5cDLwdNCp4D7eUtfKG
 CPM9AnwmG8rpuGJUPI6NJk2Z+XAhtZI=
X-Google-Smtp-Source: ABdhPJzDA5GMciy9BDgjbVgEtzFag8N87dy85c910j3Cu1hmg4F96kv5BCVQg/J3V7ysfcPze5ruHw==
X-Received: by 2002:a62:1642:0:b0:4bb:b3b6:c037 with SMTP id
 63-20020a621642000000b004bbb3b6c037mr42818074pfw.50.1641250981653; 
 Mon, 03 Jan 2022 15:03:01 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id o7sm38954864pfu.108.2022.01.03.15.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 15:03:01 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jan 2022 15:02:49 -0800
Message-Id: <20220103230249.310062-4-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103230249.310062-1-aduskett@gmail.com>
References: <20220103230249.310062-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/pkg-qmake.mk: fix absolute paths in
 .pri files for per-package builds
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
Cc: Adam Duskett <aduskett@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naumann Andreas <ANaumann@ultratronik.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Qmake generates .pri files with absolute paths. Unfortunately, doing so breaks
per-package builds because the paths in the .pri files point outside the
per-package sysroot.

Add the new pre-configure-hook "FIXUP_PRI_FILES_ABSOLUTE_PATHS" in
package/pkg-qmake.mk which searches for all .pri files in a per-package
staging directory and removes the $(STAGING_DIR)/ prefix in them. This simple
fix allows non-qt5base qt5 packages that use .pri files to build with
per-package enabled.

Based off of Louis-Paul's earlier work found here:
https://lore.kernel.org/buildroot/a339f273-33f3-f232-eac4-6e50427abf6d@cordier.org/

And Yann Morin's feedback found here:
https://patchwork.ozlabs.org/project/buildroot/patch/20200217212350.29750-21-anaumann@ultratronik.de/

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/pkg-qmake.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
index 4dcaf6dd62..b847ab0ef8 100644
--- a/package/pkg-qmake.mk
+++ b/package/pkg-qmake.mk
@@ -27,6 +27,17 @@ define QT_HEADERS_SYNC_HOOK
 	$(Q)cd $($(PKG)_BUILDDIR) && $(HOST_DIR)/bin/syncqt.pl -version $(QT5_VERSION)
 endef
 
+# When per-package is enabled, qmake packages may generate .pri files with
+# absolute paths Remove the absolute paths from the generated .pri files to
+# keep per-package isolation with the build sysroot.
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define FIXUP_PRI_FILES_ABSOLUTE_PATHS
+	$(Q)find $(HOST_DIR)/ -name "*.pri" | xargs --no-run-if-empty \
+		$(SED) "s:$(STAGING_DIR):\$$\$$\[QT_SYSROOT\]:g"
+endef
+$(2)_PRE_CONFIGURE_HOOKS += FIXUP_PC_ABSOLUTE_PATHS
+endif
+
 ################################################################################
 # inner-qmake-package -- defines how the configuration, compilation and
 # installation of a qmake package should be done, implements a few hooks
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
