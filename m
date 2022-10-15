Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BAAC433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 23:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5C0F60DF6;
	Sat, 15 Oct 2022 23:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5C0F60DF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i9-cDYyZH507; Sat, 15 Oct 2022 23:06:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1273960DF0;
	Sat, 15 Oct 2022 23:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1273960DF0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 374351BF3FF
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12BEE81403
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12BEE81403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hw1u6yWRbsxJ for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 23:05:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2261581970
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2261581970
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 23:05:44 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id u2so4244599ilv.6
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 16:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JPsgvrzoOkiXYcrItvW4fM5cDbFw/p1ARExdDlO6oRw=;
 b=H9bze+y5HH7xpeyukiM0Zy3ID5ORejnIJpuu3b2BBnHNJwl4FgNolDSnAELMMZh4KN
 kl1er3iPUQ2ccOpkKr4myou0BRZh7Dgukdbcd2Y5JqeffEWSXtjxVdudsczcfpjKKTnA
 RLKneZf+nuBEynArg7+FdpRK7trxqfOjP58smfFUD7vxwIBf9rs/oGvPneqb6PnFangf
 DaoJ8CdQDT18ynxLJzTPkP4+AKJfU/V6FZ3iefHlyGwOQizlk5/FChYstCGSDHm4MLFc
 eE853UsbKWSdx2XnVSpfF64xNXHemFzRt8ZcZ9xWC9df1GxiIVoODdKfUfbrrBmRgX3w
 EzrQ==
X-Gm-Message-State: ACrzQf2EJHagYvmOUQICDbfZpcWS9iZnwIkknMLxrCxb6AbVaBwKSq+q
 wmQxXJBXBdZPhcNG/A2NxZ29+1b2G0XW5A==
X-Google-Smtp-Source: AMsMyM5d06J4IvhNyex48Ti3Ta/ev5CEcPkvNCQLLPVJg7vO1xF6AkCj7EAd/sWs7aJorxKKm2n5Dw==
X-Received: by 2002:a05:6e02:1caa:b0:2fd:54e2:ca0a with SMTP id
 x10-20020a056e021caa00b002fd54e2ca0amr1416599ill.54.1665875142905; 
 Sat, 15 Oct 2022 16:05:42 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 186-20020a021dc3000000b00363e61908bfsm2718163jaj.10.2022.10.15.16.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 16:05:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:05:28 -0600
Message-Id: <20221015230534.4016536-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015230534.4016536-1-james.hilliard1@gmail.com>
References: <20221015230534.4016536-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JPsgvrzoOkiXYcrItvW4fM5cDbFw/p1ARExdDlO6oRw=;
 b=KSM2v01Ziw3Tn5T186zFBkFveWnuEbLi1LMJFo/ume3XyIdpoa3mTd3c3S8FCqSVD4
 bpJd2h9N0KGfZXdFxU4CMCCg+uk8RyVQFJG0AiThYkErUBRNJ//EQISRGri6Nt/j4ECK
 m2/GTYXnCndoCJ+2pjjPYQpcD1jmUsxvVFLXV4BMuzsqSMNFPiAMsCu1FJGm5MAY3VC6
 KYVEqGHdG8VP3BH7bYzovqS6PBWhOqZ9nfvcIoLCTTbCrNtFTl3HA5IoCfsQ19tjtQam
 swTxxMF52uiX3aOLYiOSdDcWDBTPW9z5w4YyqjsR4mYnEGWoG/uokLYqQL0Bzl82Oe9I
 N5XQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KSM2v01Z
Subject: [Buildroot] [PATCH 06/12] package/gst1-devtools: bump version to
 1.20.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>
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
index bed13db295..fc504a2c12 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.20.3.tar.xz.sha256sum
-sha256  bbbd45ead703367ea8f4be9b3c082d7b62bef47b240a39083f27844e28758c47  gst-devtools-1.20.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.20.4.tar.xz.sha256sum
+sha256  82a293600273f4dd3eed567aae510ca0c7d629c3807788b00e6cdbd1d2459a84  gst-devtools-1.20.4.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index 14f665a408..fbb04c92ef 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_DEVTOOLS_VERSION = 1.20.3
+GST1_DEVTOOLS_VERSION = 1.20.4
 GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
