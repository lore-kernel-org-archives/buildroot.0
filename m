Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3B1C2FC0E
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 00:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3FD260ECA;
	Fri, 18 Aug 2023 00:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3FD260ECA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t-8xA8ab891F; Fri, 18 Aug 2023 00:32:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0692160E85;
	Fri, 18 Aug 2023 00:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0692160E85
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AC181BF98E
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 00:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 088EB83D12
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 00:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 088EB83D12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2prq83Az9F1 for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 00:31:52 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF63683D11
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 00:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF63683D11
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6889c748c44so57624b3a.0
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 17:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692318711; x=1692923511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EPmrCREQq/fD5/TI7NGEji7f5TL3iLNGW+kA+ZRlN+M=;
 b=IuDarbEpEBj3dceCniz/BkXUD2o18GpzWlS3A4v5fgnEdNg4ZKaPTHtZjS8z7I3sUn
 FL5gJ6dS6bPnyi+lBvfuxBOWu5pkx/MElGH7qRHFritEo0IL0zsgR7t3JVIskC1aXJC1
 AVlO78TZ9Hsa7/nfMjvFoOYC0PG5VR68p7RzWIVmXMB6+ebAHvFzfqiWmKEpknKfPamJ
 PXEke6nIKHKdrSh7a/HqDrfWj7x6rgjMPvgMgtYTdDrnjVdX2SKCt2/BJKruf6dhdIG2
 TP6yPH2d5F8re4itsOoKiWMOUyYolO/1IHyPMW9QuFXD5nqZRsUgRbZNAVVl8HApTeC3
 GMng==
X-Gm-Message-State: AOJu0YyyNAw3e5ChmQuTvX3RUG3MejNLMWxsu//ckGgbQVFee4V03Kss
 HdwUezfkRgvr43aAB9W9oR5fzQ==
X-Google-Smtp-Source: AGHT+IHbOMVsPJN+mNMAu0ckU71dBnuonGVkS2Vbab8+KqjNWtFLOYALpBG0O+iwV+SPo3f+iUG7ZA==
X-Received: by 2002:a05:6a00:1d85:b0:681:9fe0:b543 with SMTP id
 z5-20020a056a001d8500b006819fe0b543mr1145768pfw.2.1692318711233; 
 Thu, 17 Aug 2023 17:31:51 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
 by smtp.gmail.com with ESMTPSA id
 b1-20020aa78701000000b0068895d26b79sm354260pfo.10.2023.08.17.17.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 17:31:50 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id D0FC06DC; Thu, 17 Aug 2023 17:31:49 -0700 (PDT)
To: Buildroot mailing list <buildroot@buildroot.org>
Date: Thu, 17 Aug 2023 17:31:24 -0700
Message-Id: <20230818003124.3770152-3-mmayer@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230818003124.3770152-1-mmayer@broadcom.com>
References: <20230818003124.3770152-1-mmayer@broadcom.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1692318711; x=1692923511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EPmrCREQq/fD5/TI7NGEji7f5TL3iLNGW+kA+ZRlN+M=;
 b=bqVBWIbNbddMXClK9OUHBsU9pTe4Bqg9/OfF+V9+zE30FgOH56hiOrzZ/W/GEzlBRH
 h2gRFHKjrMMZJdCxVVeLCIwuESSMyxRbFoZQeviFamtLhUAMIYr58fDSXQ5GkimlQ/uB
 VRjuWAwG+8SNJUNuP6GBhRWFnC3nL8n8EG8ng=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=bqVBWIbN
Subject: [Buildroot] [PATCH 2/2] Revert "package/util-linux: add missing
 autoreconf"
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: "Yann E . Morin" <yann.morin.1998@free.fr>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit f3fab0defe8fa9e1d99e4a89ddb29776e3bdd7fd.

With 0001-libmount-ifdef-statx-call.patch no longer required (due to the
release of util-linux 2.39.2), we no longer need to run autoreconf.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/util-linux/util-linux.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 73eda5c17134..4a40d5afec85 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -30,10 +30,6 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.LGPL-2.1-or-later
 
 UTIL_LINUX_CPE_ID_VENDOR = kernel
-
-# 0001-libmount-ifdef-statx-call.patch
-UTIL_LINUX_AUTORECONF = YES
-
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
