Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CFEC0502E
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 21:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A11982A2E;
	Fri, 26 Aug 2022 21:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A11982A2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qq3F4PmLdUJ4; Fri, 26 Aug 2022 21:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A09E826DF;
	Fri, 26 Aug 2022 21:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A09E826DF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5B21BF860
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 21:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 771E3826D5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 21:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 771E3826D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zq7a6-a6Fwn8 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 21:34:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFA508266D
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFA508266D
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 21:34:56 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id k17so1465630wmr.2
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 14:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xh2d31hNpXfcMfTgrERYOsT4isLPhxZ170zPgXYOTEE=;
 b=0dt64Izo1k/0R8/YW4ISLoUQMwp9Ee7UUO+L38q9pOmqyGYMUJHB6/dNjxFXZo613m
 EXWH6id5lcqbB4BQhNVe3kqmsbAy7ORnq7If6vH900jx0BV82hU1v3UBopv2+FDEtzkS
 hlJjS0n/eGLB3IdWBPVDourmJyxZPOz0F+cAmZ4f9agXbCYXVcpKCNsDxvOSQRPLj9wG
 siu07GeEVUHK81lQa6Y0qu/Ng4qs8NT9ENlTQI5Zt+anhdcXw8RInoru4rzGIDzkrDCo
 zop40JWgTHo6xHdUUGH9m2ipQSy68Z+Uis8g+/du2XOhj7XPVNgYFZ6MpCvqhMzkPgrf
 Dowg==
X-Gm-Message-State: ACgBeo2dWE0qWb929bDscj0i2SANuzdKSTFKMrynd1BJIGo9jkUdkF2+
 cee3W8QkVuiH7ssWo4Wa04oAo4Y04pE=
X-Google-Smtp-Source: AA6agR6sLWMxtUZ4//HFuQIeHaR5hZ69i6gS/EW8uHF9sWTIFR3QcsH4Q9Kllin/GuGBXYeJtLYAJw==
X-Received: by 2002:a05:600c:3846:b0:3a6:5294:d0a9 with SMTP id
 s6-20020a05600c384600b003a65294d0a9mr771284wmr.28.1661549694893; 
 Fri, 26 Aug 2022 14:34:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o26-20020a05600c511a00b003a5de95b105sm813986wms.41.2022.08.26.14.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 14:34:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 23:34:47 +0200
Message-Id: <20220826213447.47029-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826213447.47029-1-fontaine.fabrice@gmail.com>
References: <20220826213447.47029-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=xh2d31hNpXfcMfTgrERYOsT4isLPhxZ170zPgXYOTEE=;
 b=D5hwIOGAHexcMld598F97azSqWC88Gnqse7wLuHxznmfSljZA2JBICEP3jzsZzw+4k
 yCyC1rvdQK6LGUxv+puS7C15NNBGlB9YxMDSCOnB9dz8FAn7RM5XtX88RK+Tn/ktuX59
 J+F3PISDwHY0VZ0J7NSoaUqXY8eWAQsMfB3JTC8o/Fgr0dPxtYdglCwfA+g4zsvqfHAY
 D+I8yRq4frm9q6XGilAXP2rRSWti36ojyC2iigcUL76XuffpfQZjRhaZ7HQcdBAeLiWK
 cV/1SEQxb/0rY5TvZcYBlbelsagVgzSPinBmgW8J+Aviw1SFfN1yonvDrFOnNenHYYb5
 +c9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D5hwIOGA
Subject: [Buildroot] [PATCH 2/2] package/v4l2loopback: security bump to
 version 0.12.7
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
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-2652: Depending on the way the format strings in the card
label are crafted it's possible to leak kernel stack memory. There is
also the possibility for DoS due to the v4l2loopback kernel module
crashing when providing the card label on request (reproduce e.g. with
many %s modifiers in a row).

https://github.com/umlaeute/v4l2loopback/blob/v0.12.7/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/v4l2loopback/v4l2loopback.hash | 2 +-
 package/v4l2loopback/v4l2loopback.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/v4l2loopback/v4l2loopback.hash b/package/v4l2loopback/v4l2loopback.hash
index f4491e02d0..d897fd48ff 100644
--- a/package/v4l2loopback/v4l2loopback.hash
+++ b/package/v4l2loopback/v4l2loopback.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e152cd6df6a8add172fb74aca3a9188264823efa5a2317fe960d45880b9406ae  v4l2loopback-0.12.5.tar.gz
+sha256  e0782b8abe8f2235e2734f725dc1533a0729e674c4b7834921ade43b9f04939b  v4l2loopback-0.12.7.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index 6ee4b69ef9..84e1927ce3 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-V4L2LOOPBACK_VERSION = 0.12.5
+V4L2LOOPBACK_VERSION = 0.12.7
 V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,v$(V4L2LOOPBACK_VERSION))
 V4L2LOOPBACK_LICENSE = GPL-2.0+
 V4L2LOOPBACK_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
