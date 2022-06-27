Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C22AC43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 05:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DC8860EF9;
	Mon, 27 Jun 2022 05:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DC8860EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sk3oLZhjsNRJ; Mon, 27 Jun 2022 05:34:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC08B60E19;
	Mon, 27 Jun 2022 05:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC08B60E19
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD1181BF33E
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A432D4171B
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A432D4171B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LYGBJqxXKfgj for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 05:34:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CED24182E
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CED24182E
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 05:34:30 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id z191so8462934iof.6
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 22:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ewfSrf0dpihb0Ibu60MseUTRqIFU3D2ZvctqwpDGbh8=;
 b=dw914y/oD7IxnDrea16wI+xR28YmD7UGFZ4Yfl7rkm6rr/OMi1o4BGfQoC/S+Z+oBd
 YCCHsRJrrpkthlQb/+F3svlxKBIu2IeYnwaSfHzRM+uAqLmY1vn6RTYKPfQ9/T1GR0F5
 bFo+bpZgvIpV5nP5I5xspWNh6+AmrbT36m5RNzxhJou9HWJyOTEogmpx0Hq0nQyAUvVW
 /Xj2x2z/rUi6iPLkE0vCxeFVnPwXM0jeds4BolXajxMeSTZEU86dMYwtHW3or3cgUzXi
 K5O7ozRsWRjfMqHYkONmsjI616rLQZgVt9wz5uRkfF8+gkqruyzwYvA/OScBCdvt4KbP
 VtmQ==
X-Gm-Message-State: AJIora/RDhoTuhckdX6gt4bTlDGI0OKrHj+KI5fOuQ0k29/gkt4/M0Wz
 o0nsJKIDglovp8v5Ept2rTa2NtVsesE=
X-Google-Smtp-Source: AGRyM1vk5CZ6ZcBcuv5q6TV6YVeu/AaVSXwIpGyqBOg7+3L1nL+CRWkBaDnkhXweG2IMW3o6qiPAAQ==
X-Received: by 2002:a02:c007:0:b0:33c:ab03:5d7b with SMTP id
 y7-20020a02c007000000b0033cab035d7bmr61592jai.217.1656308069167; 
 Sun, 26 Jun 2022 22:34:29 -0700 (PDT)
Received: from james-x399.localdomain (97-118-147-20.hlrn.qwest.net.
 [97.118.147.20]) by smtp.gmail.com with ESMTPSA id
 n9-20020a056e021ba900b002d95fd5ad64sm4082623ili.59.2022.06.26.22.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 22:34:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 23:34:13 -0600
Message-Id: <20220627053422.618280-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220627053422.618280-1-james.hilliard1@gmail.com>
References: <20220627053422.618280-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ewfSrf0dpihb0Ibu60MseUTRqIFU3D2ZvctqwpDGbh8=;
 b=fcmSQ0oDp0XRENgLnqQDcTqt1ehT9aXtgEPLIJAQQErmzogJJ8TfuLxwC8PBsmgn9K
 jHCoXQ6nube+7wuEZ+w631bEn6T87o0zN5veemipMYnCY2w5mXLzB1imB8ox/RGH9A4z
 ++/QrmgsUE4RrUca6xvMzUlj0TJmtLQODkfb+SRSZb4CGK8EEgMbP5YMkcAVvm7zH/S9
 8k3XNSyQXXP7JXRSqzVdPbETfQXSkWjqr9XzsMcvLqLJcknJsFqh3GgV+DDhBen/srDF
 ZdPXO9yW/JUF3SoLIw/dgInb3hslwNXvHT1sTHSoDDlhoqsh2AeusIjHlzz0/N8XqLN3
 Pjlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fcmSQ0oD
Subject: [Buildroot] [PATCH 03/12] package/gst1-plugins-good: bump version
 to 1.20.3
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
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index cccd07dd2d..81da41388f 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.1.tar.xz.sha256sum
-sha256  3c66876f821d507bcdbebffb08b4f31a322727d6753f65a0f02c905ecb7084aa  gst-plugins-good-1.20.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.3.tar.xz.sha256sum
+sha256  f8f3c206bf5cdabc00953920b47b3575af0ef15e9f871c0b6966f6d0aa5868b7  gst-plugins-good-1.20.3.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 2b6cf769aa..61ffc7b989 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.20.1
+GST1_PLUGINS_GOOD_VERSION = 1.20.3
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
