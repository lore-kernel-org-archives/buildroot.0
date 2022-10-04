Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05792C4321E
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 11:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A583C82FD5;
	Tue,  4 Oct 2022 11:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A583C82FD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nFiFNgNhIQpP; Tue,  4 Oct 2022 11:04:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D010F82F76;
	Tue,  4 Oct 2022 11:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D010F82F76
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAD471BF863
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 966CA82F84
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 966CA82F84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YMqQSh62Flgy for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 11:04:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A04182F77
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A04182F77
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 11:04:33 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id m3so18305344eda.12
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 04:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FSGmpFymiY6zwSpyok4ysixOiJ9DPk5IrMaKY/ZivEU=;
 b=EL+a8AzAzumnNYE/QYzY5t0PViBIUh4J8ziDDrgq1Bk3zu+3mQampSOqv5ViDD+GL+
 hqrBKfvJSWZSAqMy7eoLIVXsNmHFuWlIEAt6lhB2fguJmvbQS7hGfoK87c3bHsiartw6
 FxgmgAJw3TDIUVSEsm2/KGFGqTHBzXEwLRmpXWcinhSKDQtM7QfnWrDCa1PRyWoWDtTN
 su6MWo1Eqodq/MPmMUpvg5ZdSazOqyaueoMnWYhM8U4lo5tDQPETiabsbW9DpLEmudjJ
 kiELF0EJ0DxuSLiRwaiYoAyxyh6G4BhxosPKJbL5fo29zvmI53KMwH3aRtGQs4JXI4ZG
 m8+A==
X-Gm-Message-State: ACrzQf3GaV2vEBkfHpFminTZz+MaBvHnxqJ9rn6DRDtws7p/JRFmjRRc
 q+iYrITZmlux2J03De7TkOl3suIRPDFPEw==
X-Google-Smtp-Source: AMsMyM5pSEgfbgeanKasu3pPfKgDHZkFjM8M81s5X6HBcfEHGiio4HSVb21rO6ztG+B7LIxAohQlnw==
X-Received: by 2002:aa7:d614:0:b0:458:f796:f86a with SMTP id
 c20-20020aa7d614000000b00458f796f86amr9127138edr.294.1664881471138; 
 Tue, 04 Oct 2022 04:04:31 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 p24-20020aa7cc98000000b00456d2721d93sm1427714edt.64.2022.10.04.04.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 04:04:30 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 13:04:17 +0200
Message-Id: <20221004110421.137795-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221004110421.137795-1-angelo@amarulasolutions.com>
References: <20221004110421.137795-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FSGmpFymiY6zwSpyok4ysixOiJ9DPk5IrMaKY/ZivEU=;
 b=Q/XBakoYmLbmq9EeEHf0ChEPg7HjhlwKBjsRL5spBkV16eCez3pFwdItV+P3OS9GUh
 RBZf5Zlr90msYBI6D63v2gyNFRJUmnqSJcLyR863giJMkeWmh4cBwJsjMT8Mjo0RKxE/
 Z9qpcjWmKS4XAuBCaxQ2a4MRKYj0Fw6i/Jyyc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Q/XBakoY
Subject: [Buildroot] [PATCH v4 1/5] system: adding options for configuring
 wifi
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These options can be used by packages to configure a wifi card
to connect at boot.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v4:
* Adding depends on BR2_SYSTEM_DHCP != "" (Andreas Ziegler)

 system/Config.in | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 888c24ce81..647072b965 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -418,6 +418,20 @@ comment "automatic network configuration via DHCP needs ifupdown or busybox or n
 	depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || \
 		BR2_PACKAGE_SYSTEMD_NETWORKD || BR2_PACKAGE_NETIFRC)
 
+config BR2_SYSTEM_CONNECT_WIFI
+	bool "Connect to a default wifi access point"
+	depends on BR2_SYSTEM_DHCP != "" && BR2_PACKAGE_WPA_SUPPLICANT
+
+config BR2_SYSTEM_CONNECT_WIFI_SSID
+	string "Access point SSID"
+	default ""
+	depends on BR2_SYSTEM_CONNECT_WIFI
+
+config BR2_SYSTEM_CONNECT_WIFI_PASSWORD
+	string "Access point password"
+	default ""
+	depends on BR2_SYSTEM_CONNECT_WIFI
+
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_SYSTEM_DEFAULT_PATH
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
