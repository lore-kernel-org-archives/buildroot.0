Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017BEE77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 13:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B58B480582;
	Mon,  6 Jan 2025 13:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKglcywFkObx; Mon,  6 Jan 2025 13:42:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B165080588
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B165080588;
	Mon,  6 Jan 2025 13:42:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 094666B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBCCC6072C
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gw040dwxvO3o for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 13:42:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CEF6960093
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEF6960093
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEF6960093
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:43 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d932eac638so3318517a12.1
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 05:42:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736170961; x=1736775761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gBiTzL9BrMpe1ZYIkJlAWprh8AbqcFpN1FAUIx7s8Hs=;
 b=BtOdxarVwKhlpCyTF9EzxfY0XFZa/7Nv0lR3AmzrPgmYpIPjc5BgSUO8SrGL+zqBQZ
 +TcBKyz7gv5qjjSHiGfqUeeoiZJqW0QZ/Dtzeti4HPNyvAFLq8CwG1orXQWQrXFo1Ch0
 EAl/NQjGZDGmVAMozv6SDcFa3umf+kytmRZ19e+QvLDOPUsMfPyUFw0n42rutDlAA+Ca
 ssIGNQVEDULHfD2DFuSYxeHK8GEaFakJj8qGiZryMTa6n2Cq1BmUr4HNyIetmS7yUrJU
 Vj6DyKwGLadlQN7MVqNCwjygfM4y2STJVR5SWQd5q3ZqJFv8O2Y4RF4iENjC319PdHYC
 HL+A==
X-Gm-Message-State: AOJu0YxmMXXnNO2e9LDx8abA+CZuOutW9l6jCpW/g0bvDGukaRFcXXZk
 TjcAtDRvag204xOL18R/pxn6vKWp6YyFAUMJzKpqq6Mn2ConLJe75q89iA==
X-Gm-Gg: ASbGncv+J9JWUNxJqfS5Fu6rUJ30wUNpjegvaGEUq41phjYYES/M24Xd2YSfYZiwDUG
 qyMeKJAW0eAoJnydpiCWY6SuxaAsNMPUxVa6jxPP9IlturWmpK+kjjH0bWNIpJKtH4WQgTo5Wvf
 PVzR66gsv2Ubrlu/e4QRl2OXk1bFBTz96IKtcvx/a39B4f2cZCn0jdYB1wwKCQBkbe+V5B3UAUU
 75K5Rw1IPheHD0ejfpfQhZJK03sDo0DKqi43Cyt3xPBbsalFh7uFQmEPoGRAr6zR8DSlXTjOQ==
X-Google-Smtp-Source: AGHT+IFza51kOGTIc0TLb8Oa2ONXBVmz4F8w34Up2RCXMoLV3oyfLa9vQ+UmMy5rJa4HuzIcZjN5VQ==
X-Received: by 2002:a17:907:97d2:b0:aa6:af4b:7c95 with SMTP id
 a640c23a62f3a-aac33690754mr5940260366b.56.1736170960897; 
 Mon, 06 Jan 2025 05:42:40 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae74e4sm2243847766b.91.2025.01.06.05.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 05:42:40 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  6 Jan 2025 14:42:13 +0100
Message-Id: <20250106134219.1914954-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250106134219.1914954-1-heiko.thiery@gmail.com>
References: <20250106134219.1914954-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736170961; x=1736775761; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gBiTzL9BrMpe1ZYIkJlAWprh8AbqcFpN1FAUIx7s8Hs=;
 b=DXz7Eb+8dVvBQz2KslPLGHnKtzz/WFJyvknGkKHHyH/ek3oKmysWVc15miGcujlyj2
 Kwz2PN0x/6meZqpfWjdP8Ij+c7ztBf6FVcBD3pxRbnLdv1PQ1M7E6tvJRYD5ce3/eKUK
 Lp26fA5eilXnXLtW63onvv6tIoSV10r3OZIl0sGmYafZw/YRzQp0q1E95aHyiHuujPNG
 9bnMxQEINK44l4JZWIPjdpxm3OiCqMJkjZmIoShxYUJcvvN5ol8DV2vWTq3AM4su4wWB
 D0wdTbPaBCe3WGNa1+YVZerOMCcAk35S/6zRwq7nBLjeHbtXLRr4jgRrINFlKCYHviIJ
 tV+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DXz7Eb+8
Subject: [Buildroot] [PATCH v4 1/9] package/libyang: add patch to solve
 issue with older cmake version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The cmake list operation behaves different on older cmake version (<=3.19)
and show the following error:

  CMake Error at CMakeModules/UseCompat.cmake:48 (list):
    list sub-command REMOVE_ITEM requires two or more arguments.

As workaround we can simply add an empty item to remove list macro. The
patch is provided to the upstream project [1].

[1] https://github.com/CESNET/libyang/pull/2332

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v4:
 - this commit is new in this series and fixes a build error occured
   during build via base buildroot docker container

 ...UseCompat.cmake-fix-list-REMOVE_ITEM.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/libyang/0001-CMCMakeModules-UseCompat.cmake-fix-list-REMOVE_ITEM.patch

diff --git a/package/libyang/0001-CMCMakeModules-UseCompat.cmake-fix-list-REMOVE_ITEM.patch b/package/libyang/0001-CMCMakeModules-UseCompat.cmake-fix-list-REMOVE_ITEM.patch
new file mode 100644
index 0000000000..b8c98cfd00
--- /dev/null
+++ b/package/libyang/0001-CMCMakeModules-UseCompat.cmake-fix-list-REMOVE_ITEM.patch
@@ -0,0 +1,34 @@
+From 01f8440a8e6e5fb8811f6ca311d980223cb7e29e Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Sun, 5 Jan 2025 11:35:46 +0100
+Subject: [PATCH] CMCMakeModules/UseCompat.cmake: fix list(REMOVE_ITEM ...)
+
+When using a cmake version <= 3.19 the compat check fails with:
+
+CMake Error at CMakeModules/UseCompat.cmake:48 (list):
+  list sub-command REMOVE_ITEM requires two or more arguments.
+
+To solve the issue we simply add an empty element "".
+
+Upstream: https://github.com/CESNET/libyang/commit/a1633fc0b72b403bb6925cdc432d6824a2dfe994
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ CMakeModules/UseCompat.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeModules/UseCompat.cmake b/CMakeModules/UseCompat.cmake
+index 8fe9f2c40..2c4348690 100644
+--- a/CMakeModules/UseCompat.cmake
++++ b/CMakeModules/UseCompat.cmake
+@@ -45,7 +45,7 @@ macro(USE_COMPAT)
+     find_package(Threads)
+     list(APPEND CMAKE_REQUIRED_LIBRARIES ${CMAKE_THREAD_LIBS_INIT})
+     check_function_exists(pthread_mutex_timedlock HAVE_PTHREAD_MUTEX_TIMEDLOCK)
+-    list(REMOVE_ITEM CMAKE_REQUIRED_LIBRARIES ${CMAKE_THREAD_LIBS_INIT})
++    list(REMOVE_ITEM CMAKE_REQUIRED_LIBRARIES ${CMAKE_THREAD_LIBS_INIT} "") # cmake <= 3.19 needs at least one item
+ 
+     test_big_endian(IS_BIG_ENDIAN)
+ 
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
