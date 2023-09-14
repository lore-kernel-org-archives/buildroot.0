Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB5CEEAA72
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 20:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D672741FD3;
	Thu, 14 Sep 2023 20:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D672741FD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vuHtuEno4D9A; Thu, 14 Sep 2023 20:00:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4192F41FD0;
	Thu, 14 Sep 2023 20:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4192F41FD0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABB3B1BF3C3
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 142CF83ABF
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 142CF83ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7vHveSipF4ez for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 20:00:39 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3EAC81EFC
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 20:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3EAC81EFC
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-400a087b0bfso14576785e9.2
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 13:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694721636; x=1695326436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F9+w0jhwQ9t/VYMnXecuzCMqxm0UDOpYO9c1U+2zhQU=;
 b=JM/H/gxf1RT3q98qne98qMUa4PQfSsEt2aj/it2NWhyPeFTtox4OUoMLIVeEYHdiV6
 7haPBC+WBJZwDY0dBbG8Top3RBz75n6X8H3RJOlMsp0/9MBkPwRbhblGgQ7Mp5oMWqnk
 +eZ9bw7994yx2obvF2bcbskWz2dU/agmjVMWaaD9Lx8ME9GeJGivK1/lzEa60aFfo3R/
 T+4SEGATkN2egnqAOT5IPBwNn0GOe9AXv2j9WgJslp8J18aOUBJTpyA8vc5DAeh3gTIC
 Uf7NDS/YO+iBToTJWBuHNo4EXB8+bHh0gVjQa0Gufq7BlEBQcW0v4n+uAs6ZgI0H2Y+l
 7Vog==
X-Gm-Message-State: AOJu0Yz5lP7jZFJ6cCTrGhLB28KjCEDSj5ru7X4rqz6wvb7By4DLMS7V
 GFgdWMVRT3AXCtzVr+QKu807OVoC024=
X-Google-Smtp-Source: AGHT+IF4tOebuVwrOmgIAdSezllvyWbaVldsrJWof6RZk6oDveH/r0MCODkTvmVCjb5NU94oQjuNOA==
X-Received: by 2002:a5d:69cf:0:b0:317:7af4:5297 with SMTP id
 s15-20020a5d69cf000000b003177af45297mr5653786wrw.62.1694721636450; 
 Thu, 14 Sep 2023 13:00:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u8-20020a5d6ac8000000b003179b3fd837sm2563955wrw.33.2023.09.14.13.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 13:00:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 21:59:29 +0200
Message-Id: <20230914195929.356335-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694721636; x=1695326436; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F9+w0jhwQ9t/VYMnXecuzCMqxm0UDOpYO9c1U+2zhQU=;
 b=Xa5693G0IBJidG7lWZOUbnjGSwN4C/2f8WzzxAhpk08GK/c0ifNAbH4HAuBF/AW9K+
 EZruMmDrxAiQZU7Gj+z9B0PmduxBfqqY1+mgpWtHZ69TOyNAWz8tYLNGSw4UzQLypZQc
 amrTOE040OHk2OiBxsI252FlMeKjpXYTU/4P8nNWX8Pv6VtzhWaasbGlmcMCUMYi50fH
 XOjop/iQcd21OkWwg/phg4uL/aCsbq6ntS0o17xSOaEZgBrmD3IofYHFGiEX3/9u/qkD
 qA0cKClkZ2RR6q6s6QcohxZqNxn4KSaL6YeMnLMFGDSzMb4UEFbJl20wZ6Ydf3sVG4cB
 kwJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Xa5693G0
Subject: [Buildroot] [PATCH 1/1] package/libspdm: add LIBSPDM_CPE_ID_VENDOR
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:dmtf:libspdm is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Admtf%3Alibspdm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libspdm/libspdm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index 48c46e41f7..cbcbed29de 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -8,6 +8,7 @@ LIBSPDM_VERSION = 3.0.0
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md
+LIBSPDM_CPE_ID_VENDOR = dmtf
 
 LIBSPDM_INSTALL_STAGING = YES
 LIBSPDM_INSTALL_TARGET = NO
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
