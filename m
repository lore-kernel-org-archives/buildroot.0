Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B99C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 11:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD41B8316A;
	Tue,  4 Oct 2022 11:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD41B8316A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YClIQPVg3qcO; Tue,  4 Oct 2022 11:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10AD7830C0;
	Tue,  4 Oct 2022 11:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10AD7830C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 788A01BF863
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6193260B43
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6193260B43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GRi3r1xvmHi9 for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 11:04:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0EFC60B2A
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0EFC60B2A
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 11:04:37 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id lt21so2777326ejb.0
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 04:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nL5Il5SYFr6EutzGZX5WkmSEHN9rORiMQQEIe49FfcM=;
 b=qypUHFYUTNN8WkI/zxwiKKMSxJmnV62PXNHQRDD6bDOIS88bhDYqDkFBEqDfBk5ha4
 a3n+qy41O2HeFovc5HxC+wzLPlo1/vc+ZYS6tjS09Z3Z2ZV7Ox3B76qx8YTxfHoMs0iA
 ze070AbFGxgeGUCrZ0Auz7mjRXA5HcZlqdrCRnR2YjNh3pUPZQDnhX2Kw5qvWa51cU7x
 mQI8H5DFqUJhFlgHulRgsI+dnEGLxDW3Zxvo8mccoNyjaoukUFQu0Io12++Wthwpd7WM
 os+fpTJ6/u2uDyk4p0NYZIKdu1PsmqODuXCuoicHuXoZgYl36lZn2sQqGUasffg2z1MB
 lYYQ==
X-Gm-Message-State: ACrzQf0Yog/qZLQW8gCW4Wjrnsq/O+osIhtcLYNhe5ZZVdDWMexdbM16
 2K2Lqmh7FDnMsE79EtEFx8hm+dDQLfufKA==
X-Google-Smtp-Source: AMsMyM6MzOZ6q0qzTWGaWGcdzEf7ryue5dJnpfTrfB4VWBxOsZHdGKChE2+2gSaEHpvS16QRLxDJow==
X-Received: by 2002:a17:907:a05c:b0:772:eb61:904b with SMTP id
 gz28-20020a170907a05c00b00772eb61904bmr18906012ejc.237.1664881475530; 
 Tue, 04 Oct 2022 04:04:35 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 p24-20020aa7cc98000000b00456d2721d93sm1427714edt.64.2022.10.04.04.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 04:04:34 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 13:04:20 +0200
Message-Id: <20221004110421.137795-5-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221004110421.137795-1-angelo@amarulasolutions.com>
References: <20221004110421.137795-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nL5Il5SYFr6EutzGZX5WkmSEHN9rORiMQQEIe49FfcM=;
 b=kLEiZzSaqLb8B6nPlnPBDYsIdQ5HlKozVcGrmDxKy5Tk9o98tu8EfTiPOdKU6FQqFn
 cY1hqZjNxYiQHIIuvvS5D65d10DvSGDpb9Dk+CLWZ3I8sSfC2ywZ24qMng0QrJtImW0K
 tqlVI4h9a14lxijhlebcb++Egkzc7EO/7GXio=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=kLEiZzSa
Subject: [Buildroot] [PATCH v4 4/5] package/ifupdown-scripts: add wifi
 configuration when enabled
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

Add a proper wpa-conf line to the interfaces files to let the system
bring up the wifi interface and the related wpa supplicant.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
Changes:
v3:
* add "|| true" lo let the command exit without error when
  BR2_SYSTEM_CONNECT_WIFI is empty (me)

 package/ifupdown-scripts/ifupdown-scripts.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
index 5ef032142c..ebaf234143 100644
--- a/package/ifupdown-scripts/ifupdown-scripts.mk
+++ b/package/ifupdown-scripts/ifupdown-scripts.mk
@@ -28,6 +28,8 @@ define IFUPDOWN_SCRIPTS_DHCP
 		echo "  pre-up /etc/network/nfs_check"; \
 		echo "  wait-delay 15"; \
 		echo "  hostname \$$(hostname)"; \
+		test -n "$(BR2_SYSTEM_CONNECT_WIFI)" && \
+			echo "  wpa-conf /etc/wpa_supplicant.conf" || true; \
 	) >> $(TARGET_DIR)/etc/network/interfaces
 endef
 define IFUPDOWN_SCRIPTS_DHCP_OPENRC
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
