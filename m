Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEE7EEB57F
	for <buildroot@archiver.kernel.org>; Sat,  9 Sep 2023 07:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5872A81185;
	Sat,  9 Sep 2023 07:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5872A81185
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qOSODaVqhYxm; Sat,  9 Sep 2023 07:58:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9731281AD7;
	Sat,  9 Sep 2023 07:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9731281AD7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A15191BF28C
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 07:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6821A82EB6
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 07:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6821A82EB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D4h0i9M1K56I for <buildroot@lists.busybox.net>;
 Sat,  9 Sep 2023 07:58:07 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5D4482300
 for <buildroot@buildroot.org>; Sat,  9 Sep 2023 07:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5D4482300
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-402c46c49f4so29367295e9.1
 for <buildroot@buildroot.org>; Sat, 09 Sep 2023 00:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694246284; x=1694851084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gDiOAgR5pd+YettpZtI+QZpkONV4HcQYoJayXWRNYes=;
 b=obk/fzbKi03SnA5V0WljQXzLTwpTXH6bBl6CZ4zwigAKqXf9fNoZipzKRgoltC4y1S
 VKT8d1G0vRdYtGFe7knkV5b97evttHpvdeK2H7UDyGGF8mO25iDptOW0GWsd1cr5YV2a
 hW1kCtPIWu2QpmbhyEwr9gNurk+02EiUmjSO1mgOwuzchhByhXN8B6DS3dhgwJ4BjhY0
 ax+LjWCEMfDNTGeMrYzIrhO/DJlw6RqVxnCLLTyqfyj5W3ZMSuDsewVhPqGWzRGeH0k4
 NSG2kiwObEVJ7I8abv9zX7FZh3N+EmyMF85g321KsU8FLt28UZKS6oSfxV52emtb/+Dw
 Mm1A==
X-Gm-Message-State: AOJu0Yxa60NBysbk5XTDH31Ndi1kYZ7v+qY5gps0PAxqXj8aNHSJJpWp
 YE7pyIJ+d7CzDtYFzMnk2LsIqRn9Ho7rww==
X-Google-Smtp-Source: AGHT+IGy+NMVx85QnASkHUaXhRnM4h+EEUyLBYtAEtKHkQvxqUzEVkso/HSqn3moQ1XAo2qhJS5lEg==
X-Received: by 2002:a1c:721a:0:b0:401:d947:c8a3 with SMTP id
 n26-20020a1c721a000000b00401d947c8a3mr3529326wmc.32.1694246284481; 
 Sat, 09 Sep 2023 00:58:04 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:f478:a81f:8ede:9814])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a1c4b0c000000b003fee9cdf55esm3833262wma.14.2023.09.09.00.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 00:58:04 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat,  9 Sep 2023 09:57:52 +0200
Message-Id: <20230909075753.7471-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230909075753.7471-1-thomas@devoogdt.com>
References: <20230909075753.7471-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/4] package/webkitgtk: make gbm support
 optional
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This was added upstream in commit:
https://github.com/WebKit/WebKit/commit/22e4c0386605d84f42f2d46fd20bdc46e3078498

Only enable it BR2_PACKAGE_HAS_LIBGBM.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v2: no change
---
 package/webkitgtk/webkitgtk.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index bb6df3d592..88bdfae27b 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -88,6 +88,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
+WEBKITGTK_CONF_OPTS += -DUSE_GBM=ON
+WEBKITGTK_DEPENDENCIES += libgbm
+else
+WEBKITGTK_CONF_OPTS += -DUSE_GBM=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
