Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADF7C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F89981D47;
	Wed,  9 Apr 2025 20:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szbxxsWt2Onn; Wed,  9 Apr 2025 20:04:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E248B83F9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E248B83F9A;
	Wed,  9 Apr 2025 20:04:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FD21201
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C42261792
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTnrE_eC-Tpx for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9992460D65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9992460D65
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9992460D65
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so1068945e9.2
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229027; x=1744833827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Yu/Te+HUnibSLEBqE/pt3WA/01oORMaHGUNLNdg+Eww=;
 b=ehFUi5SDyWXMm1vTYpYkTAALD32YlI0YtijQMZTQK6CD4Ri94JjXLNKnr8TCLBqjEY
 GJqFWxJ+J685HPAFGbBv5aO1QCTzqmjA3orqEtSio3mznVtlMh/JeGUZijxAhFEjtezc
 D/sCI35x8u75K4dO+Ul0din20CZcIfdNoJK+n19EGUPbdouhgDC9Awf1W8bi1T0qwrAP
 oZDxF+51MGdEsoZHbCqA/hDew6JsYdu4Y4PsNPjnDmxyrd85zFDvFcq8j9e7qw76ccC9
 ZS7BRfHOoTjsLDBg5ozFWDoLyriCpjC97TeajB4WeUjhoAKXsZqjhUukKQZCXAZxOJuK
 gIPg==
X-Gm-Message-State: AOJu0YzB6YxdlTTGwfFoz01DtuTfNv4CFPZr/oIecWxiBXucFC4jJvME
 p+cREF8ZIduFP1X0b/agSuHFIeSUYZez7MWzc3nbtTDNriSdmyLKzBuy4A==
X-Gm-Gg: ASbGncsyf/LMaMzrLC0Qgjl69cYImPrQIdCx6FvwE0jgIPfnDxR7qXjHaBYaIHyKSA0
 bEq6jz8MuGFJkn7UJ4w7pbtqcODmOb+wiDICfc5BugYqeZ+B7iC4zgCwSwKBuLpuJokAfS13RBP
 WgpaLtOQXAmsL6VhkS1tyVVmWc6xG87anP9YvxMLha/fQYf/WieRpgKdmJq9xyxkAGlxTvueghf
 zGpNUuPkz55IyVIDuqizQ6NCkn0P6xCLyoHhHScgCRYfgbST6aEmoCm9M843Rwr29v7RYqLjEJj
 aY8wNH9fchbqywkrlnnLHJ42A6HEpNOW29Pmxo15g6rM+vqG0y4=
X-Google-Smtp-Source: AGHT+IFsfnN7QiwVeM5CYSnGQ8ByBBqHAWcttxPO9tnZw4zF0176uOXMiuBYoHvgVLjfIbqeS+/blQ==
X-Received: by 2002:a05:600c:c86:b0:43c:fe15:41c9 with SMTP id
 5b1f17b1804b1-43f2d7bbe32mr3675355e9.9.1744229027385; 
 Wed, 09 Apr 2025 13:03:47 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:47 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed,  9 Apr 2025 22:03:21 +0200
Message-ID: <e0712f9df2ed9473620cd421585d9b942b604b6e.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229027; x=1744833827; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yu/Te+HUnibSLEBqE/pt3WA/01oORMaHGUNLNdg+Eww=;
 b=AEzM1blSHDmgiJKh1X26jJSjbP+4pPWq71mBrr8bJn8eV0lDgUTKqbcf/+mCjKLqCh
 rIkM3V15CTh2EVxVaKi9qk1AlXeVr30EzEpCY0KjkChsPT9MYTDv3E5Ufn1+r3OMKmIo
 coz21wZ2dB8FlhWBTR98H/uSE3YrTKlNaoUURa7NZMVGMC8b91jZwJtOO6FB94Iu7O72
 WXzny0TCLTzTBhwLg2iCyU9LuqATB+7ta8wAal4GLhsIObK6nWfQqf4GUWyuGsGTYw9R
 71nu4BBDerwdOH9MC2aZqQ+5xqhhILbQGRuHZrwGDRywpSz38U60LHp1pYz81fAVFytz
 mH3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AEzM1blS
Subject: [Buildroot] [PATCH 06/29 v2] package/pulseview: fix, update,
 and reorganise dependencies
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

The dependencies for pulseview are not entirely clean:
  - arch deps are not first;
  - second-level inherited deps are listed;
  - deps are not alphabetically ordered (for deps on packages);
  - the comment is hidden even when the arch deps are met, because of an
    incorrect dependency on Qt5;
  - qt5 is a depends-on when it could be a select.

Update the dependencies to fix all the points above.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pulseview/Config.in | 42 ++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index f122551b9f..b1f9dc25d7 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -1,40 +1,40 @@
 config BR2_PACKAGE_PULSEVIEW
 	bool "pulseview"
-	depends on BR2_PACKAGE_QT5
-	# libsigrok->libglib2:
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
-	depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR  # libsigrok, qt5
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # qt5
 	depends on BR2_INSTALL_LIBSTDCPP
-	# libsigrok->libzip
-	depends on !BR2_STATIC_LIBS
-	# libsigrok
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	depends on BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_ENABLE_LOCALE
+	depends on !BR2_STATIC_LIBS # libsigrok, qt5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigrok
+	depends on BR2_HOST_GCC_AT_LEAST_5  # qt5
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_SERIALIZATION
+	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_LIBSIGROK
 	select BR2_PACKAGE_LIBSIGROKCXX
-	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_PNG
+	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5SVG
 	select BR2_PACKAGE_QT5TOOLS
 	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
-	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_BOOST_SERIALIZATION
 	help
 	  PulseView is a Qt based logic analyzer, oscilloscope
 	  and MSO GUI for sigrok.
 
 	  http://sigrok.org/wiki/PulseView
 
-comment "pulseview needs a toolchain w/ locale, wchar, threads, dynamic library, C++, gcc >= 7, host gcc >= 4.9"
+comment "pulseview needs a toolchain w/ locale, wchar, threads, dynamic library, C++, gcc >= 7, host gcc >= 5"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_QT5
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
-		|| BR2_STATIC_LIBS || !BR2_ENABLE_LOCALE || \
-		!BR2_HOST_GCC_AT_LEAST_4_9
+	depends on !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_ENABLE_LOCALE \
+		|| BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
+		|| !BR2_HOST_GCC_AT_LEAST_5
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
