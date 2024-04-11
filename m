Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C6EC4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 17:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53B18605C8;
	Thu, 11 Apr 2024 17:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-AqLCYpq0nb; Thu, 11 Apr 2024 17:39:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57425605FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57425605FB;
	Thu, 11 Apr 2024 17:39:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2C8C1BF3FC
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 17:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE14080C66
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 17:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ug3V_jkXwKed for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 17:39:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 968C680C46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 968C680C46
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 968C680C46
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 17:39:03 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-417d14c3426so706795e9.3
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 10:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712857141; x=1713461941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pLFuAb8WRGS73cc+zzSzQRzTK5ZCI+/3seAIQjYzn1A=;
 b=chfkHifMHJGV+oC0Wd6XPfZAbOzsCSB1wYOy/HHaHbrch0kSCb0vKcH4wvAJW25GyK
 ygv/dVoCsnkEddAiIoImjM/uD3jlZ/ULOT0qHW8eN0j4bgeSQ5Xo+WdVUxn8JVwYXtEs
 GSxC4EE/CR4VBWscj1bXPWwtuMAtdyg/eGHcZYDjRGcZ6JPQtbfK/oiyJokivgUkzmSo
 l3eeqpTUdL2NooAuuIUTsotakoop9gzJP3XvpBlJ8A0aQPdA/0DPUKPalD/xgTcKwdew
 ntFLGbOy3/F1TpwnxXvkKPx3xHwQEzXRtCzZVawTDY+wJYl20W49nTS/LZ0P9DyIuTHm
 NYdg==
X-Gm-Message-State: AOJu0YyREBpiMNT/sExyn74nzGXgPgbmZNnj8mDji18cqOwnCrdEp4Wb
 +p8Pth+FNJnZPzxJFxOoHHuAwxYcF/Efrn+CMipgJZAd4LzBMPbWus1WxobC
X-Google-Smtp-Source: AGHT+IGHsyJe3kjKXcLHc6e485ROH1I99MstLMU+NhuZgw/r65QvPR79szoh91mwacBdv69baPimng==
X-Received: by 2002:a05:600c:3482:b0:417:bbb3:ce4a with SMTP id
 a2-20020a05600c348200b00417bbb3ce4amr321435wmq.37.1712857141012; 
 Thu, 11 Apr 2024 10:39:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k23-20020a05600c1c9700b0041469869d11sm6129384wms.47.2024.04.11.10.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 10:39:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 19:38:55 +0200
Message-ID: <20240411173855.583816-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712857141; x=1713461941; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pLFuAb8WRGS73cc+zzSzQRzTK5ZCI+/3seAIQjYzn1A=;
 b=drwCaFL0dgT+WjyiC2izQTjXjBMiAMYJ2GxEjbkwm2b8iu6y/THLCA4WaXW0aL5BwH
 bFPD4B00xCqvjZYqTw4EfUpqNDgWPCTD6wOvMmk/XeRiuu6GUcNjy6KmXmUV4JCd8uex
 MyJcCrCjT/dJXom/COPnZMDTm1Lzbz/f8kcbqmA8aXCoYR5XBysG9ObaUJD1lNWrgZ1k
 wxqwe4rGUwR7aK1JakXH8exKAIYtq3rjixCxnWqIjk9qjMWQwctia4rhV6uqWpohaqGI
 ehHoReinXxYlmWA+xqj8N9Tp06u66zC25UGcPlJoNRWi1umsFnCvR51SrgK9tJxePRh+
 6qAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=drwCaFL0
Subject: [Buildroot] [PATCH 1/1] package/glog: needs gcc >= 6
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

C++14 is mandatory since bump to version 0.7.0 in commit
2e9f161d4a7a68a041860e5855e98bee9d3a1498 and
https://github.com/google/glog/commit/674283420118bb919f83ceb3d9dee31ef43ff3aa
and
https://github.com/google/glog/commit/42a185cd888439d500a35191cd31a605b7c5bd20
resulting in the following build failure with gcc 5:

In file included from /home/buildroot/autobuild/run/instance-2/output-1/build/glog-0.7.0/src/demangle.cc:43:0:
/home/buildroot/autobuild/run/instance-2/output-1/build/glog-0.7.0/src/utilities.h:210:22: error: enclosing class of constexpr non-static member function 'google::glog_internal_namespace_::FileDescriptor::operator bool() const' is not a literal type
   constexpr explicit operator bool() const noexcept {
                      ^

Fixes: 2e9f161d4a7a68a041860e5855e98bee9d3a1498
 - http://autobuild.buildroot.org/results/8d5e105283ead1057545b46726385f4ba4dff29e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glog/Config.in            | 6 ++++--
 package/opencv4-contrib/Config.in | 4 ++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/glog/Config.in b/package/glog/Config.in
index bbdd1e2151..85873f02f0 100644
--- a/package/glog/Config.in
+++ b/package/glog/Config.in
@@ -2,11 +2,13 @@ config BR2_PACKAGE_GLOG
 	bool "glog"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
 	help
 	  C++ implementation of the Google logging module
 
 	  https://github.com/google/glog
 
-comment "glog needs a toolchain w/ C++, threads"
+comment "glog needs a toolchain w/ C++, threads, gcc >= 6"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_6
diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/Config.in
index 261d414869..d992c6d1ac 100644
--- a/package/opencv4-contrib/Config.in
+++ b/package/opencv4-contrib/Config.in
@@ -251,6 +251,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SALIENCY
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SFM
 	bool "sfm"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # glog
 	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV4_LIB_IMGCODECS
 	select BR2_PACKAGE_EIGEN
@@ -261,6 +262,9 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SFM
 	  to perform 3d reconstruction from 2d images. The core of
 	  the module is a light version of Libmv.
 
+comment "sfm needs a toolchain w/ gcc >= 6"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_6
+
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SHAPE
 	bool "shape"
 	help
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
