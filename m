Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300F0C6FD18
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 08:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7B3383FB2;
	Wed, 19 Apr 2023 08:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7B3383FB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uwqvhfLwkICg; Wed, 19 Apr 2023 08:32:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 051DB84001;
	Wed, 19 Apr 2023 08:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 051DB84001
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F4D31C431C
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37E7B41F0F
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37E7B41F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bGYcJUeNv17A for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 08:31:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23AC741F02
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23AC741F02
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 08:31:52 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-329627dabfbso43378425ab.0
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 01:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681893111; x=1684485111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=69csuwxz3LIkTeLMnja+zoS2rvyeETP6GAz+/+oS7ok=;
 b=ROwQGycAotmC0KG5OSpDr6CkmX+gnX9UBvxvp6GtTCx/UQXBbQcXltzKeLAz/nRuUe
 U8M3y8XGlG4ui50s+dBxwWGj5CsBsnospicEEAKI9rw8jRw+KIol6APqwNX4fOqb7Zu0
 K1d7CvNsdHFL6TVCjIMltwtEV8xhTAdWmA1u753XaS23AF5fxe+5X30wWyQDc+TiU5S2
 glqvhSb4HlrWNYXTv0jFBCOWiu8jHgNVDjmQorV/qA7+2EkyYfWJ6Nx6/a+9GfA1vwl7
 tmZ7Bm+onqPoIKOwoK4ePCSCCgWD+N4gb/eLByJqpz2hqF+TsJXfMWdPxbYQZx76q1o0
 iXSQ==
X-Gm-Message-State: AAQBX9e17Zw2K0o8h/48MsL/yviG6cWUT56Yj8/cos3Q8cgdoKjSqDk6
 iFX5g+d8ayL5ohYipbAyEXd0egHgomM=
X-Google-Smtp-Source: AKy350bhcJ1HCVb582xbiNuFEcEVC4p9Jvytcm7gCNaPNdnP7QxMyjqpmglcp99BlYv+AcvvsNWf0w==
X-Received: by 2002:a05:6602:1685:b0:760:a0be:e63c with SMTP id
 s5-20020a056602168500b00760a0bee63cmr1654463iow.4.1681893110965; 
 Wed, 19 Apr 2023 01:31:50 -0700 (PDT)
Received: from james-x399.localdomain (71-218-108-164.hlrn.qwest.net.
 [71.218.108.164]) by smtp.gmail.com with ESMTPSA id
 z20-20020a056638241400b0040f8a65164csm4026442jat.105.2023.04.19.01.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 01:31:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Apr 2023 02:31:36 -0600
Message-Id: <20230419083144.212921-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419083144.212921-1-james.hilliard1@gmail.com>
References: <20230419083144.212921-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681893111; x=1684485111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=69csuwxz3LIkTeLMnja+zoS2rvyeETP6GAz+/+oS7ok=;
 b=XBcn0hUFpDE7oUiuji7SWhphJkjULwvQazgZP3ZR8LhH3+GThhOGydtBnwVEpnd1UV
 xoBlHOK0XLhNvtVQEPk1TQzYMIM/vzWZMRbGUelM+XwEOoOpO8ekOiDb38IfFt0G1aw9
 E0938cuNl1GWONzk5ISLClCAxRTNEfIttYsh+jaIr7Fr0zYwq+CAq5Cbe94P0aacIlkP
 8Z2J8HMC6/UZ9Rs9TJe2GAR292JfDYCfAhp+KLq6pwG5mBmZWgyZIguetsLevVKDc1Wr
 uDd2DHEVdUC5lUpZ/D3TRQ4/Aek+XhkbeU1SwGeg63ZOkIzeF4jIarylnmwc4IS8XoaI
 D2dQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=XBcn0hUF
Subject: [Buildroot] [PATCH 04/12] package/gst1-plugins-bad: bump version to
 1.22.2
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
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 90b3a18982..2bbb8af904 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.22.0.tar.xz.sha256sum
-sha256  3c9d9300f5f4fb3e3d36009379d1fb6d9ecd79c1a135df742b8a68417dd663a1  gst-plugins-bad-1.22.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.22.2.tar.xz.sha256sum
+sha256  3d8faf1ce3402c8535ce3a8c4e1a6c960e4b5655dbda6b55943db9ac79022d0f  gst-plugins-bad-1.22.2.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index edac818985..1713f0b4b8 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.22.0
+GST1_PLUGINS_BAD_VERSION = 1.22.2
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
