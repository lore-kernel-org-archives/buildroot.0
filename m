Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED34C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 05:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D646A82F2D;
	Mon, 27 Jun 2022 05:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D646A82F2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0J-UjGsR-xox; Mon, 27 Jun 2022 05:36:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E84AA82F06;
	Mon, 27 Jun 2022 05:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E84AA82F06
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF5C41BF9B2
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9CBE41767
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9CBE41767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eiSWEo-Eoxzr for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 05:34:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1FDD41839
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1FDD41839
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 05:34:31 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id r133so8490377iod.3
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 22:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vhnH39oUNGsaOYnqF2gCYz2i4SYSuFH6tyObr5EUGak=;
 b=DVM1tPUAlJVxBBdM2JGA6MgRtP3NcYRe00wsmoEiNl5it20GV0zs26dYpKzHIxoVjU
 cwAYUbbfz+YBt3hyacbSMb5kRv70l4H//O3pHn3moHCe3XM26Qd0etJtxpS/cwFrXtkn
 4L94SyxfZplvAsvsJdCn0aRsvVjQ4wAa5vKv3aTR4X5hNuZ21WPDbYGZSvi1u3S6TBuC
 d7Hdrlcf2J0a7e2YjUJ2Ra40J2s6/bvulgQawrRW5RXDZVcSI0modyopfwkgIVh32pXA
 6sB0jdenVhQixCrqzb/7vurSXXYfooS/cX3qPYPPK4eQktrp6tcW1dAU+w3/J0rKlyff
 FbpQ==
X-Gm-Message-State: AJIora+4mYKtDt6rQ+wO+3xTORGDax1IQnYuB7+Hxkt39uzXIEr/WGtd
 c0Us7V1ycq5bonE2yjib79Z7vgs+i9Q=
X-Google-Smtp-Source: AGRyM1uN0uJaJKe15CJ1iBUV1bTBu02lBsBQUwgr3gHsQleIEYJcg8n75tSM21/ff0xvoytu+unLiA==
X-Received: by 2002:a05:6638:1a8b:b0:33c:9a15:1ad2 with SMTP id
 ce11-20020a0566381a8b00b0033c9a151ad2mr2327533jab.38.1656308071208; 
 Sun, 26 Jun 2022 22:34:31 -0700 (PDT)
Received: from james-x399.localdomain (97-118-147-20.hlrn.qwest.net.
 [97.118.147.20]) by smtp.gmail.com with ESMTPSA id
 n9-20020a056e021ba900b002d95fd5ad64sm4082623ili.59.2022.06.26.22.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 22:34:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 23:34:16 -0600
Message-Id: <20220627053422.618280-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220627053422.618280-1-james.hilliard1@gmail.com>
References: <20220627053422.618280-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vhnH39oUNGsaOYnqF2gCYz2i4SYSuFH6tyObr5EUGak=;
 b=NnN6uQARrpq2Yu89FGqi4g6CeQn9ba6d86vgKwP09/1GeSXRSUcUOStft1Xy6KOnjJ
 /l6WqECsCVhbzyZ+F+WrSeliKTW7M9j6mW0a9nvvQ2H0UWEFIJYoJpZX6LJaFpK0LAeH
 OcbaLWSnA4M1chGQ3DTOAWga/hrudZo6hdZ32DKUa/hnSy1CP+bPdKSGqglgmYrkWvvO
 +fCwrnlhyBoioE6ofkRQ47VfZMqr7WQOIqYkNHm6IdHSMlX30LGjD3A9cVvPwWWl5Bsf
 f1GxzHJtUvTXll87LMMJZ24LnG8+2aY023x4FDLYFa1b6zS7He4ah1NGghcDq+SaYYgG
 6b/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NnN6uQAR
Subject: [Buildroot] [PATCH 06/12] package/gst1-devtools: bump version to
 1.20.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-devtools/gst1-devtools.hash | 4 ++--
 package/gstreamer1/gst1-devtools/gst1-devtools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.hash b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
index 7173dbe266..bed13db295 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.20.1.tar.xz.sha256sum
-sha256  81f1c7ef105b8bdb63412638952f6320723b3161c96a80f113b020e2de554b2b  gst-devtools-1.20.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.20.3.tar.xz.sha256sum
+sha256  bbbd45ead703367ea8f4be9b3c082d7b62bef47b240a39083f27844e28758c47  gst-devtools-1.20.3.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index 8c430800d2..14f665a408 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_DEVTOOLS_VERSION = 1.20.1
+GST1_DEVTOOLS_VERSION = 1.20.3
 GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
