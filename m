Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413FFCA1012
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 20:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB175846B2;
	Fri, 30 Aug 2024 20:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ckZY-ULO2Da; Fri, 30 Aug 2024 20:26:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C184846C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C184846C5;
	Fri, 30 Aug 2024 20:26:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 568881BF990
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 20:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1784D61483
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 20:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2DB3NCMUNDKb for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 20:26:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 188C061461
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 188C061461
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 188C061461
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 20:26:23 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42bb72a5e0bso18315515e9.1
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 13:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725049582; x=1725654382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9tdm6ZLu0w1acbQEiZJZXkLG4Tvmnvers2B+HQ2e3Ro=;
 b=HvF8421p8f4dzOKSlXbBPYohn8veg9vGXhpwKR/uWuHLOYdrXZRAkf+7h3ThIDmZKE
 vh7Eac0ScUyoA268CB5EMx2qPF70zToPcLJrPQ93Ry8OeklH1tkUH/yLnm/Ty8v4++qf
 olT03xq0YGjlAfO28EepmnHcqFEFEhA2AzhAqog//bsbRIqcH52Qumt3Ka7YjNhQF0jy
 cu8bWo6leURBJWISB9lOs93jUvyqr7rE8XLviJCmrmXRlS+HP0txf5xMQ69Xa1q3a5bO
 9qcpeluktuIOthTonHANgqUi0spdTijxjbZ1vh5HNnVIpBlx9Rt1sMWmsuYmTpYVfUuK
 PBhw==
X-Gm-Message-State: AOJu0Yz5JBBvvYWgVpXdZKVbuYloAJ6Pdx13HVh0pAQZxDFv6UkCMg2P
 FA0u9YAwboYwRxvNto03t7gtCBHJlrHWK1DV74KzG6aM7v6j4lUrxZC3HQ==
X-Google-Smtp-Source: AGHT+IEsMVCZ3ZuzfOhUN3inybtQh7n9oV7ZqZkVkdIG3G8rxTyPIOfd59QiPi47dUIuienek6cUtA==
X-Received: by 2002:a05:600c:310b:b0:426:627d:5542 with SMTP id
 5b1f17b1804b1-42bb01e6c05mr58481355e9.28.1725049581765; 
 Fri, 30 Aug 2024 13:26:21 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba6425a77sm91381615e9.45.2024.08.30.13.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 13:26:21 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 22:26:19 +0200
Message-ID: <ba4563207e767a0fc10b72831151e0155e7862fd.1725049576.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725049576.git.yann.morin.1998@free.fr>
References: <cover.1725049576.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725049582; x=1725654382; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9tdm6ZLu0w1acbQEiZJZXkLG4Tvmnvers2B+HQ2e3Ro=;
 b=nq2MCNY/+ltC/87pe+JZPe2YzbZPpk6piMRnNlG1xICRcZqTJyJoKiY5v5JWTGIhXK
 wkUOL0dt3TokwrrjE+sLmPlRZt0u9NrNnwxpRm3tTTaQAvFcpBcRd4+LtymjU9hG4dDb
 seqTxLUaEH3p2izh0mu2HMop081g5GlbrQbGp1M/BJh0tLEvg9UppqjUh5LaylUSNW5D
 6fhJCZlVaa5ws7peLQjw9eokm2p5XcXHFsw73+P68tIP+l/6TX0wpl0GiX0BqzNAjrJN
 R5cg4vKP+gwtOixYCLRUkCy5SBwTA6zDk90zgY6jq66kWS8e4SLrWbCrHbCBSiiM44S8
 Xr0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nq2MCNY/
Subject: [Buildroot] [PATCH 1/3] system: change label for BR2_INIT_NONE
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, the label reads "None", but it can be a bit misleading.
Indeed, since its inception in 0c00636e8bbc (system/init: add option for
no init system), what it really meant was "none of the above", as
briefly laid out in the commit log for 0c00636e8bbc (typo included):

    Can be usefull if a local package provides an init procedure.

This was later refined in 4d185e5ec51b (system: add help entry to "none"
init system), which explained:

    Add a comment that states the user has to provide his own init
    system, either via a package or a rootfs overlay.

So, change the label to better reflect that.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 318c538ef1..c710b38e74 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -146,7 +146,7 @@ comment "systemd highly recommends Linux >= 4.15"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 
 config BR2_INIT_NONE
-	bool "None"
+	bool "Custom (none)"
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
 	help
 	  Buildroot will not install any init system. You will
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
