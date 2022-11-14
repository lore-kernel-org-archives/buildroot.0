Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0F0C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 23:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6513C813C2;
	Mon, 14 Nov 2022 23:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6513C813C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgBK0TmTCiwN; Mon, 14 Nov 2022 23:23:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9656B813BE;
	Mon, 14 Nov 2022 23:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9656B813BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B3801BF8A8
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 23:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62B5E405AA
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 23:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62B5E405AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q4IXWDSFw73h for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 23:23:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61DDF404EB
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61DDF404EB
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 23:23:01 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id i5so6548352ilc.12
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 15:23:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XVowZ+5W/JGEyYZLKnGNBjfwFJlKWkfMugAaOc4yKCA=;
 b=sUoLmaHrAAjJevfogpd4pzd9ZHC4Qs+xfpqT9acKPsjI1iXu3gp53smlzFM1lQnJLU
 T5ECTnTWoDtPQxSXrMgsacgTvlxbUHOr2PXCihWB0/kygQydsTq4/+8Mv4JGkpKhmC2v
 tWzYb6wSJanu1tnANcu7rLYgm2RcAikgT2lraoIxwJuCapuwXKV2iOnReqnnm0wVgURO
 4dJw9xb9FsybbWOHwmdZMQu8iBhjvwIPiNydPZBg37QBVHl8SGMUOtM/5byxFdcFccjm
 eHk/1iXQ0yNmOQv/ntxWh2DOqVxDqL6Pi0JHshbnii0WJHWyR2QCiZmJYrbeBbl0LBUW
 U5LQ==
X-Gm-Message-State: ANoB5pmTiE2rJWyjVUlpPZNvzAEf0A/69A2meBt2uPALVricSBSr185z
 uHT8spOYze13Cw1m8ijKmm6A72kJq17l4A==
X-Google-Smtp-Source: AA0mqf6kwLmOl3nbsjYvsSyrfTSBrF6bBhR2je5nQbJZhRd++e418zx+RSVIjULtf+mn4LtNjbaIJw==
X-Received: by 2002:a92:a007:0:b0:2f9:a2f3:9149 with SMTP id
 e7-20020a92a007000000b002f9a2f39149mr7428078ili.278.1668468180022; 
 Mon, 14 Nov 2022 15:23:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 w42-20020a05663837aa00b00375750e03fesm4051256jal.81.2022.11.14.15.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 15:22:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 16:22:54 -0700
Message-Id: <20221114232254.3970611-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114232254.3970611-1-james.hilliard1@gmail.com>
References: <20221114232254.3970611-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVowZ+5W/JGEyYZLKnGNBjfwFJlKWkfMugAaOc4yKCA=;
 b=XfTuj4hQaDqkph6eKSt5TaA8brWbW1gWu294RVfRPavopF/Sa03H1IwKNKxVC8o9fq
 UPkhrxfi4Ax5RscPpVHvnx6o8tpgVHmbHfzrV/4nlsmNfkMVPB5su9WEUxzL+HhTIae+
 HjTAgaPWpATepNHoYpz8h1eitMA/BuBEB2o8ILl1Zu9U5KXLDO9q7ww0kItfT+Hbl74j
 975QuIBinQ46aER6Oa3nwesTOejeFRZvj38dbV9nbyeZuRNBSuUxxjPjbO56ld6wNIVP
 EStelma0/BbJFVLA/6jDMPkIEE/2zYnplYi7L5R3Xo3MwmtyJZZZbAOzBA6tO29epqPT
 F7TA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XfTuj4hQ
Subject: [Buildroot] [PATCH v2 2/2] package/gstreamer1/gst1-plugins-bad: add
 zxing plugin support
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
 package/gstreamer1/gst1-plugins-bad/Config.in           | 9 +++++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 8 +++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index bcb4cb1545..83dcf37b76 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -727,6 +727,15 @@ comment "zbar plugin needs a toolchain w/ threads, C++ and headers >= 3.0"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_ZXING
+	bool "zxing"
+	depends on !BR2_STATIC_LIBS # zxing-cpp
+	depends on BR2_INSTALL_LIBSTDCPP # zxing-cpp
+	select BR2_PACKAGE_ZXING_CPP
+
+comment "zxing plugin needs a toolchain w/ C++, dynamic library"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
+
 endif
 
 comment "gst1-plugins-bad needs a toolchain w/ C++"
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 14710a2501..78b5096639 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -70,7 +70,6 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dsvthevcenc=disabled \
 	-Dtranscode=disabled \
 	-Dwasapi2=disabled \
-	-Dzxing=disabled \
 	-Dmagicleap=disabled \
 	-Disac=disabled \
 	-Diqa=disabled \
@@ -802,6 +801,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dzbar=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_ZXING),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dzxing=enabled
+GST1_PLUGINS_BAD_DEPENDENCIES += zxing-cpp
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dzxing=disabled
+endif
+
 # Add GPL license if GPL licensed plugins enabled.
 ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dgpl=enabled
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
