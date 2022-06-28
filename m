Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60548C43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 10:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C9F082F2D;
	Tue, 28 Jun 2022 10:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C9F082F2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F4y7VnTsriu1; Tue, 28 Jun 2022 10:15:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E4C782CF1;
	Tue, 28 Jun 2022 10:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E4C782CF1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B82D1BF9C6
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 10:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9B6060E82
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 10:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9B6060E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id is0Zfs7kL8Qq for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 10:14:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79BF460E7E
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79BF460E7E
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 10:14:14 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id cw10so24754528ejb.3
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 03:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lUWeFJ2fz8gjJsQbSJ0KVCvaTjQlMtc94Jse7UtcNOY=;
 b=Uz+qPixYonRVjxTrcOst92ARJg/3/3Vj4RK3N3Igdrpa1kod2QKcAI1oMMQJO7sJJz
 bRr0kHOe2TLgEkw7nTfNHDYo4qQgh11IZ7XzkVIEGxt3WzzQvY5Cu7CiP3PuagpsGQZz
 3YRU1/FX+0uNiwbMKiYrQdkIXeFmNAxSKshP6Es/TtyX6mylUSfCOuR3IUkMMV2gYYdP
 17EWXrQX56xIr4krzypwtNBIjQpJyEaFaCqc6+YkWaexKpPHKjs666fyV8h7iV4U7iW/
 CzWMSUT6POBsGDTQYhGfT2WvJIEo+DsomZPho9kNpuHLFBz6xUEPzXZAwy3DcOfL14kG
 1SHw==
X-Gm-Message-State: AJIora9aYMwvkZwYQb8zODTcmIrnzubRBEp/QTknKs0+dmZzpCbyD7/7
 Ou7rK8mOc6/90PeylyufpPscCXhfGnOMug==
X-Google-Smtp-Source: AGRyM1vx2FfKcH6YYbs2eue1j87ps70M65vGZ2aomGHjgtlpMnUuXTP63ZEIhqReggz8nKHak4nalw==
X-Received: by 2002:a17:906:794a:b0:722:efd0:862f with SMTP id
 l10-20020a170906794a00b00722efd0862fmr16891024ejo.650.1656411252650; 
 Tue, 28 Jun 2022 03:14:12 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 x2-20020a05640225c200b00435651c4a01sm9308401edb.56.2022.06.28.03.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:14:12 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 12:13:51 +0200
Message-Id: <20220628101352.1786434-5-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220628101352.1786434-1-angelo@amarulasolutions.com>
References: <20220628101352.1786434-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lUWeFJ2fz8gjJsQbSJ0KVCvaTjQlMtc94Jse7UtcNOY=;
 b=WXVqG2s+6K3WUVD7YQiW2rHPxsRlG6Cu/GGil5iRRGGX+0LcUtEm+ZFFg0gry7kps4
 MUSXu9HZFAA2OdxV1y7kIOT9mf0ujGrXJ/+sNqKgB5ud4+5+iVgy4WhbVnp7qJtiRSb1
 LDEtNsMV3bAm6N1UyNvR8wMWUsAVy6jku6etA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=WXVqG2s+
Subject: [Buildroot] [PATCH v2 4/5] package/ifupdown-scripts: add wifi
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
bringup the wifi interface and the related wpa supplicant.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/ifupdown-scripts/ifupdown-scripts.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
index 5ef032142c..e3830aa1ad 100644
--- a/package/ifupdown-scripts/ifupdown-scripts.mk
+++ b/package/ifupdown-scripts/ifupdown-scripts.mk
@@ -28,6 +28,8 @@ define IFUPDOWN_SCRIPTS_DHCP
 		echo "  pre-up /etc/network/nfs_check"; \
 		echo "  wait-delay 15"; \
 		echo "  hostname \$$(hostname)"; \
+		test -n "$(BR2_SYSTEM_CONNECT_WIFI)" && \
+			echo "  wpa-conf /etc/wpa_supplicant.conf"; \
 	) >> $(TARGET_DIR)/etc/network/interfaces
 endef
 define IFUPDOWN_SCRIPTS_DHCP_OPENRC
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
