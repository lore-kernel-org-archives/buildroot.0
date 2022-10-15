Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4B0C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 23:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 151994150E;
	Sat, 15 Oct 2022 23:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 151994150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gVkG1_1kQ7x8; Sat, 15 Oct 2022 23:07:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D379A410A0;
	Sat, 15 Oct 2022 23:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D379A410A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07C981BF3FF
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B05D981911
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B05D981911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k9NFQy2Bbv2J for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 23:05:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC21F81959
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC21F81959
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 23:05:45 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id q11so4232230ilj.10
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 16:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PfgZF6P9RSNMDnO4CWRm8HAbTlH1brQ8i/1VhX9wM1A=;
 b=GCxh7dmR0A4tUiBcS7Cc0hL4+3PH02dhbc4BsAr8u/HtQg6CGdqHDxYxGQyRYWlqmO
 EE3Amj/HD4Jh+C8Le44Ukb8PCA1kstZybA04vZm0fssvCPgBfCRaNu3uU/LPiGcL6vf4
 H6XwrJ3a6ayEbP/lf+azRLHvr/7kVQk8362UIzwqctnAeHEq456bdnc/mEDm9dMjgwNZ
 5wVojqpBwY3PjXQXzC2BaKx60Tx5dzA7lyaE01wJ5THsvTc9CvQN8XoLX4AScywVd+ym
 cMk+BWWg5BgVG2YuWQsBw0OgHhMubIcWJGxY5ue6Djbbe3iGcSOO6KMb48zUo43Tpo7P
 jawQ==
X-Gm-Message-State: ACrzQf3+p3i1GQrUfZr2tW3xOPWhqoWSqLFC5cumbJXiPw+CTPSAA16E
 EuyuOJm7m4WFgWo0LALnIOuOISDHOL3/qg==
X-Google-Smtp-Source: AMsMyM66bRc8DqSHZqGfx5ewGXOPgfBPkaX4QHZBHAxollKLrICj/nrIf5FOasjbliyIk/Mqo8jzzw==
X-Received: by 2002:a05:6e02:180c:b0:2fc:405a:d04c with SMTP id
 a12-20020a056e02180c00b002fc405ad04cmr1769166ilv.212.1665875144614; 
 Sat, 15 Oct 2022 16:05:44 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 186-20020a021dc3000000b00363e61908bfsm2718163jaj.10.2022.10.15.16.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 16:05:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:05:30 -0600
Message-Id: <20221015230534.4016536-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015230534.4016536-1-james.hilliard1@gmail.com>
References: <20221015230534.4016536-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PfgZF6P9RSNMDnO4CWRm8HAbTlH1brQ8i/1VhX9wM1A=;
 b=Xl1+5mgCJ/ja3jb2zujEO7NHZdfeIbmirSd5PdjtsYYE9fT2fyOw71gtJZvUVxvIgj
 nzRcwDVcrobUWOtpB4NjN//tYatrI6jJ9vAm1gyg8LBNTUNQJPh2JLOcDdegI+wNW7rC
 ZjkOQn0Y8p0LIyok3/mEuQo87dMeKGVewd8C/1Dw5WlMNL97goADB0eUTl/Mh+Q7E37M
 ovSCuLGyPu8vHXgQ58rFrtMhGSFYTnfm6zMTTM9RFyd5ysqWWf4SPUjnSy6lpwBlXzEv
 5kQ7cKBaqiVvqhhN1ZcwFMkAF/ovAZODEa+mbAK3DOHHCEGqxXPioWpv4BauKrpYzo5S
 peJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Xl1+5mgC
Subject: [Buildroot] [PATCH 08/12] package/gst1-vaapi: bump version to 1.20.4
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
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index fce687774a..5baaa4dfb7 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.3.tar.xz.sha256sum
-sha256  6ee99eb316abdde9ad37002915bd8c3867918f6fdc74b7cf2ac4c1ae0d690b45  gstreamer-vaapi-1.20.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.4.tar.xz.sha256sum
+sha256  ab12596144c05506e9782374c5d2cdfb3069fca89908d6de360d947bb77fd06a  gstreamer-vaapi-1.20.4.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 8b137c37ec..bd6c16be3e 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.20.3
+GST1_VAAPI_VERSION = 1.20.4
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
