Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B092C61DA4
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 14:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD9E240B1D;
	Sun, 19 Feb 2023 14:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD9E240B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_N_Qfc8fdXO; Sun, 19 Feb 2023 14:01:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3DF640AD9;
	Sun, 19 Feb 2023 14:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3DF640AD9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20B741BF285
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 14:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF14C60C06
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 14:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF14C60C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJKONT6OQfKs for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 14:01:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E59A460BFC
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E59A460BFC
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 14:01:07 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id g7so339593wrd.3
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 06:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eNhzHZZzW4ZAer07H8jdPLlpPEGLK6eVP9/NbUUQ4i4=;
 b=8RMCPhVQqI7tpWrCbtyT/EBKLyYX/hcKw7u9fMuyQ1CyAdI/fU/xhaq5BkhcrEQ0cs
 dINLG47WFCvLY8XNILYPVChQBFjvX73qn4aj+pmO1zWnAsBXcTBPRv5gSeiuk8atPUnK
 jczKjMC5G/XErD6ZkuL8T1idmVX1iFpmdQv9X9EzlmyB0J2LA3j3SnxItrdgxyFpPkWH
 a/65Z0LCSaiQ+8JLCzlRMaQBWzIwo9utaScftp2HBb9u7zK+LMoaAthJ495Od75HUran
 N+5BMFa5JBixjrjlHJbSGhzJvNZ9fZ5q05ZUbjp2fEE6k4Gkf/T+XG02nx1xJovaQCUb
 bTtQ==
X-Gm-Message-State: AO0yUKWjYKaaNcPyrPVoJLG/mmQQ2Zd17ufLp04YBteLK2Nvu+On9OTi
 8l4p6cNTsSW0yAkF9PwnDJDgAerjZF4=
X-Google-Smtp-Source: AK7set8bdFI67VT3f/W0zxgBvS2J6xn9OMmBeF7Rulw/7akGuYCvFt/3JIqJncVGeZqhESqr1dGkOQ==
X-Received: by 2002:adf:ea46:0:b0:2c5:93fe:12b7 with SMTP id
 j6-20020adfea46000000b002c593fe12b7mr49099wrn.41.1676815266089; 
 Sun, 19 Feb 2023 06:01:06 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x13-20020a5d6b4d000000b002c6e8af1037sm1659333wrw.104.2023.02.19.06.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 06:01:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 15:00:51 +0100
Message-Id: <20230219140051.80647-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230219140051.80647-1-fontaine.fabrice@gmail.com>
References: <20230219140051.80647-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eNhzHZZzW4ZAer07H8jdPLlpPEGLK6eVP9/NbUUQ4i4=;
 b=MY7akKF69n7O7LNcrxbzThue9v/mm1xlnOuQLlr/I75PficeJ3DBjhgzRV2nmiGlc2
 4ICFv087BzxPFOlFvVvdk8dcOnS8xx1utMTxgmrqXsH1RYQeuKKHVqLG/5HzOLU7cLEL
 Skyh9YUrlI5kUhAJXcOo5hLASXNIQViQwK1/1rVOVMbTvU1QsZDkzaiInT639ZN/AOIs
 EguwVbXhRrrrdy3fWVnyhQI6CO0WJZkx8jfW6Xxho7/T2pneU4voc87qpDmFtw9kK/Nx
 JPfWnzTyy2bcUosV0IS+0lmbjljgMM447BCZP9J16Ams7m3cHq/U+i+dQtkqJpwCW+O8
 zjuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MY7akKF6
Subject: [Buildroot] [PATCH 3/3] package/libjxl: security bump to version
 0.8.1
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Security: Fix OOB read in exif.h

https://github.com/libjxl/libjxl/releases/tag/v0.8.1
https://github.com/libjxl/libjxl/releases/tag/v0.8.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libjxl/libjxl.hash |  2 +-
 package/libjxl/libjxl.mk   | 10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/libjxl/libjxl.hash b/package/libjxl/libjxl.hash
index e71d32e61d..6b4c9d8d0a 100644
--- a/package/libjxl/libjxl.hash
+++ b/package/libjxl/libjxl.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  3114bba1fabb36f6f4adc2632717209aa6f84077bc4e93b420e0d63fa0455c5e  libjxl-0.7.0.tar.gz
+sha256  60f43921ad3209c9e180563025eda0c0f9b1afac51a2927b9ff59fff3950dc56  libjxl-0.8.1.tar.gz
 sha256  8405932022a556380c2d8c272eff154a923feb197233f348ce5f7334fb0a5ede  LICENSE
 sha256  91915f8ae056a68a3c5bdf05d9f6f78bb6903e27a8ca3a8434c9e4ac87300575  PATENTS
diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index 77405e4f11..095dc06764 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJXL_VERSION = 0.7.0
+LIBJXL_VERSION = 0.8.1
 LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
 LIBJXL_LICENSE = BSD-3-Clause
 LIBJXL_LICENSE_FILES = LICENSE PATENTS
@@ -34,9 +34,13 @@ LIBJXL_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
 LIBJXL_DEPENDENCIES += jpeg-turbo
-LIBJXL_CONF_OPTS += -DJPEGXL_ENABLE_TOOLS=ON
+LIBJXL_CONF_OPTS += \
+	-DJPEGXL_ENABLE_JPEGLI=ON \
+	-DJPEGXL_ENABLE_TOOLS=ON
 else
-LIBJXL_CONF_OPTS += -DJPEGXL_ENABLE_TOOLS=OFF
+LIBJXL_CONF_OPTS += \
+	-DJPEGXL_ENABLE_JPEGLI=OFF \
+	-DJPEGXL_ENABLE_TOOLS=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
