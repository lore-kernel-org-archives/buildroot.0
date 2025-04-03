Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CE0C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 15:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62F79406B1;
	Thu,  3 Apr 2025 15:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mM-puD9hy-O; Thu,  3 Apr 2025 15:40:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1CA440787
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1CA440787;
	Thu,  3 Apr 2025 15:40:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 080A91F4
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE0CA60AEF
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5FokeFUQXRz for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 15:39:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F078860B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F078860B0E
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F078860B0E
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:39:58 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso6896625e9.3
 for <buildroot@buildroot.org>; Thu, 03 Apr 2025 08:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743694797; x=1744299597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q85KqY5yGmtzHP8SWoo0O+RxKN1qfcQCzVXv+UdXmgw=;
 b=MZDBL7ytK+YOSIzWPbkpgxTMleW9iyvpsylhWdfGYzZAyJe1Yz4T/bspI4Rh7uJFfd
 kPCSJgFRQ2mwPWWhH7iiwiFMQmAT4oUqbjH0y+gHCOBqvvEdFxJ4WBZc1pgESzXO3Vnx
 vaG3xgQUDYKwwgZrCWGguglOC/KYiOAX//9ORj5eZchqSjH1jOxq4PhBnFPULbBdDGVg
 My358sk4BMmucN7LlYJVhDCpZgQOyamhVINu/vXdudA0DuyGBT9VAApwM2RpVEY234gG
 XdjcFbrXwx2LK9vh/3+Em9exjHih6CpcT7CKT1O6PXU4k8Wjo7rQuBTn2a3o13RCBHDF
 LrlA==
X-Gm-Message-State: AOJu0YzVtKDyjuFQdxy7Po00RkIEQtbpmEi462N+VCwbvxmrIYDSXvS4
 fMY0Lqle54XRqf2YodcSE4PwNHB+G0AV8AsdvOy4Y0+Wori0PLZPIa2PmENVRr8=
X-Gm-Gg: ASbGncvcuMLrNJfOHO7RV5iEnkFAd6oek5gBFE9JvsGTidqB57QIsvyEa0ZQP/i8MyG
 sQdu0Eio3W9EHoeZg/lpdMW3DiQHirIYqj2obs4VWhvHFS73mSHGdJ0/oUk3oDHXtLxsurBOi15
 Y/od/qWxurNGfaoQtmqlfo058vgj/2B/oGbKteHx7b6XrzlwQbbgtpGkKhrbSWz74M5+aVLiauk
 cyd7MErZsK7aoNNOw2NZZAC/FJRL6JcfIJhk82W7nwPBt53J9+aVbL7v0jZqudx6klrZNu20TYA
 f7alzh+tTIj57pf0PUNGM0bfzaN24brfEc4UXvkrrjZQg00=
X-Google-Smtp-Source: AGHT+IG01LKaswX038jcUwsrCCKfvEm1ElJqhCNT6QFkq/rBaQaGVC+1RvgZUD1NlunhsJ1/PmitZQ==
X-Received: by 2002:a05:600c:1992:b0:43c:f85d:1245 with SMTP id
 5b1f17b1804b1-43ec13fe02fmr38343185e9.17.1743694796697; 
 Thu, 03 Apr 2025 08:39:56 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:32bf:237b:9ae:9868])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec34bbd9csm21702215e9.20.2025.04.03.08.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 08:39:56 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>, Robin Jarry <robin@jarry.cc>,
 Julien Olivain <ju.o@free.fr>, Maxime Leroy <maxime@leroys.fr>
Date: Thu,  3 Apr 2025 17:39:48 +0200
Message-ID: <20250403153950.6407-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403153950.6407-1-maxime@leroys.fr>
References: <20250328084743.8759-1-maxime@leroys.fr>
 <20250403153950.6407-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743694797; x=1744299597; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q85KqY5yGmtzHP8SWoo0O+RxKN1qfcQCzVXv+UdXmgw=;
 b=P/OYIDdngP/hkDPyREfJcvNFdwx2R9S9WIO63wQgXiiG3LDKU/RHOVyUzMinJBJYzR
 XKlm5RlXNq3jc0JU8lG2COJ56sOaC7b68EXPSqKQLcqvNV8kus8Vg32fGNuFHoq+vCIn
 +YzXCKSUF5JfXt/qTr5lH8NTzrGRzA0DVYk+CbuxnrIyNh0Tyv5b2J9k/o3CM/KB2yTn
 wDNWdkV3B/+RtddF4EFEU2kDWcKwvwUtfk6RDQD2PBBaosgtJvZNAGqfyEosOzD3/emN
 i4OiMRr2dVZaaVLP7MOlOUZqxkfQC1sOXJf4FQjWkooP35T9J5846RCUQ/Luzk934GEK
 JhLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=P/OYIDdn
Subject: [Buildroot] [PATCH v4 1/3] package/libecoli: bump version to 0.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This new version is required to compile grout v8.4.0.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
---
 package/libecoli/libecoli.hash | 2 +-
 package/libecoli/libecoli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libecoli/libecoli.hash b/package/libecoli/libecoli.hash
index 433550f91b..f973b6f254 100644
--- a/package/libecoli/libecoli.hash
+++ b/package/libecoli/libecoli.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e66a85a35bae644b0baf9a4e6d084ff926ebaa12023f9df9f34e8f7a46834da8  libecoli-0.3.0.tar.gz
+sha256  bc9ca742f32dc7787146de4cbc3997b28356adaf219049304bbc3368d25b7395  libecoli-0.5.0.tar.gz
 sha256  e58bf9ec962bee9b3e37abcaa0bc0ec940b05efdc1d1a5a4d9e2fdbcc08b7bdd  LICENSE
diff --git a/package/libecoli/libecoli.mk b/package/libecoli/libecoli.mk
index f260467d1f..f989e7b9cd 100644
--- a/package/libecoli/libecoli.mk
+++ b/package/libecoli/libecoli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBECOLI_VERSION = 0.3.0
+LIBECOLI_VERSION = 0.5.0
 LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
 LIBECOLI_INSTALL_STAGING = YES
 LIBECOLI_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
