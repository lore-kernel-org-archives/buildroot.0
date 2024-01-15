Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7740C4707C
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 21:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6132D843B1;
	Mon, 15 Jan 2024 21:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6132D843B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23Usp77QLbOh; Mon, 15 Jan 2024 21:42:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A212284399;
	Mon, 15 Jan 2024 21:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A212284399
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61B6F1BF383
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 397CF44302
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 397CF44302
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bk153gijKQaL for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 21:41:47 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D70AD42FDA
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 21:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D70AD42FDA
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5592d72edecso1859476a12.0
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 13:41:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705354905; x=1705959705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KZlDWbmPnt4MwNji06t4qK3mcja6l+Eib12Gm2zc2rg=;
 b=JhhxmzNBeNi5bo6BJWf9lD6V8xsVFsTOl+rlrHoF7C1sdHSzvqbLIHgCf0FHqZF6bR
 D86vtPnHlLsrzXXI456ZbUiFC3ZIRvN/mtPuAvK8oPyR4ypYW06UxyYZ6ObSMr8AKiGi
 7Kx3tLt1FjOfZOtNWrXm3EYH7vcwS28WVx8pZWn7ABYbMSe9KvK4ITHx/kpDatPn9fXT
 +e7n+T4UM5PZWqB/oIvECvsb9yr7U5KPz22drV0BYWYk4fKFnhdu3ooO3v8BIysj7mpb
 srZ3e786wm0DOKu+/GFnevk+YICIg26Ite22PSlk1u3RPPGlBkmyLeJuxE/s1OqTEFsi
 7toA==
X-Gm-Message-State: AOJu0YxDxFcFizL7fZnFkZl8zo08hilkYifOsE4iOjggO2VBv/kj3P9d
 EDg4rr6OiPubOBugzZSM3EfzuYub0rU=
X-Google-Smtp-Source: AGHT+IEURR6ocOABu7JUnAb/dNcxPY1PPCToBg7SuXJk3KZVDLoWZcEF8JC0Jo+9T6SCNP19NvW6BA==
X-Received: by 2002:aa7:df8c:0:b0:559:39a0:38af with SMTP id
 b12-20020aa7df8c000000b0055939a038afmr1392687edy.30.1705354904958; 
 Mon, 15 Jan 2024 13:41:44 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 dj15-20020a05640231af00b0055845b1b318sm5927402edb.65.2024.01.15.13.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 13:41:44 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 22:41:36 +0100
Message-ID: <20240115214137.2350453-3-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115214137.2350453-1-petr.vorel@gmail.com>
References: <20240115214137.2350453-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705354905; x=1705959705; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZlDWbmPnt4MwNji06t4qK3mcja6l+Eib12Gm2zc2rg=;
 b=DQunEspwaA/rKseUmrZJeLkRjC02QhTCzSx+qKeqA/8iTv5pHDrM+a0PRhXR0ZImYw
 H/sohHj2Oc/8feSF7KnBdDI2IxPCfo3us6yy25r63E9GNq6a/LixQjB2ITSfVC4hP+yf
 ewpVYw7CypqzMlUmqmvYeAn1lEEXd1x5AHejlFDo5CEWObva8r+deeSmT0+trHH/Is6z
 H3+asKZDolyXIGkkw+UEcES3eWrIIywfTfvK8Z0tWHeYZfW5KTg9QY75zi3/BzxmP/BW
 T69Pl0rf95yn+6yFyxmQgV8vnNkAGiYiE/dlfyvfwfBOPXJ6ZYoglXTVAJVMhKRbPlN9
 YD+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DQunEspw
Subject: [Buildroot] [PATCH 2/3] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6}.x series
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Bernd Kuhls <bernd@kuhls.net>, Petr Vorel <petr.vorel@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index aa6f846338..4528d8eacc 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.12" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 27a9d5cd0d..efd0dac4cf 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  afe2e5a661bb886d762684ebea71607d1ee8cb9dd100279d2810ba20d9671e52  linux-6.6.11.tar.xz
-sha256  98dce69077c35cffca799dcdbbd32a02242aad6b0950eb931936bb2ef69f0926  linux-6.1.72.tar.xz
+sha256  1fd7ec8c3d9c4e4b3a41d11e2c6d151e5fbf875dd08b3577f73afd6ee6674605  linux-6.6.12.tar.xz
+sha256  6cad48706bf1cde342613dca2a2cd6dd4f79f88f9e4d356263564e4b2a5d7e87  linux-6.1.73.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  5a807a5fa2a80ada957d8079681dfb5cc196ec26f43244d1c8a4fd7af592d192  linux-5.15.146.tar.xz
-sha256  86ace9892296bf1534d574894edd27614b68de4085c03fd3f60121751a334f1b  linux-5.10.207.tar.xz
-sha256  da072f7e6fe719c01e517cac1fa9988b2f5fa87d62a8501b7dc16d3b62b2acb6  linux-5.4.266.tar.xz
+sha256  56c1e65625d201db431efda7a3816e7b424071e7cb0245b2ba594d15b1fdfcd4  linux-5.15.147.tar.xz
+sha256  9025147a09547f28ec8f496c12efc30bd2fc03b2824a668e8636b2ca0ef1fb6e  linux-5.10.208.tar.xz
+sha256  42d28def2cc1502251edbfeaca3b25ee764ad1e471b6c703ccb2267f38471c43  linux-5.4.267.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  cdc6a5d51aaff7c50bfe4ac4adf5cc3727043a24641145dc268e858db2a4b598  linux-4.19.304.tar.xz
+sha256  da82425c7410623dfb2405915347ee9617fc0e33a63ca821c33aeed160cddae8  linux-4.19.305.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b6ff605469..f8b9a4a857 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -403,12 +403,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.304"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.266"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.207"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.146"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.72"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.11"	if BR2_KERNEL_HEADERS_6_6
+	default "4.19.305"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.267"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.208"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.147"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.73"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.12"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
