Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5228C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 13:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D2C981F60;
	Sun,  3 Mar 2024 13:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g788JeB7L-pH; Sun,  3 Mar 2024 13:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A06281F65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A06281F65;
	Sun,  3 Mar 2024 13:22:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9405F1BF863
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 13:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81D914081D
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 13:22:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_uUJm5pWsZP for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 13:22:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A3814081B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A3814081B
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A3814081B
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 13:22:28 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-412de8613b5so2319685e9.1
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 05:22:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709472145; x=1710076945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=twk0LGUzfQkb92jYqow6DjvM5XaI+PIJupwrwjw3xGM=;
 b=UWtN3KxsuE6+bCY6RmSpRI2x6zC+m+aDC/UuTRMlYZPpxFcWQDq4CQryS6877nUaGm
 ENIckx50dFhkBqHP0ym+Jkx6vQtfa2lvcluLk1sfcsrqB4wGPfT6rQ26YSLLqIL/fQPc
 LNE/Ygotq5/UFR1LOhDXJszkUC9IAF9lil9dgwwGMnbIgPpq1gMuh9Px1CK00TUA47tT
 +Xb6MaPbGycFQlviugts1S134cGaUtY5f7Bwo+aPq7BIMKboRU3LTJ7H5zQeyD9O0eaZ
 JjYLUnqnD9l9bUNhDvQGF2Zs5WjQxqXeE85/ePN3yJNy4Iwi/RMvp3DbVL2ehUcrXLeP
 3bYA==
X-Gm-Message-State: AOJu0YyCWnY/4wcliuT3Kk2vSSiZeaKi/RXQhgFUEnUE6WhclQyX0Cmh
 ae68kdxZLOX4l8pbh68aq1hjC4CctEy3naSlxVsdE0h8WTt6VlWQ0Tnvp97e
X-Google-Smtp-Source: AGHT+IGFXahLy+J0nB5bAuXd+h58RsWRC8CNkEXSR30le1bKfxVqAjmWbrvmfUl7+nc7k4Z/AJzBvw==
X-Received: by 2002:a05:600c:3596:b0:411:a94a:1ee with SMTP id
 p22-20020a05600c359600b00411a94a01eemr6319449wmq.21.1709472145191; 
 Sun, 03 Mar 2024 05:22:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 iv11-20020a05600c548b00b00412db89efe2sm3330619wmb.25.2024.03.03.05.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Mar 2024 05:22:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 14:22:22 +0100
Message-ID: <20240303132222.151704-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709472145; x=1710076945; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=twk0LGUzfQkb92jYqow6DjvM5XaI+PIJupwrwjw3xGM=;
 b=CRgxSbFP0Xa+jVSbRT6DjwioXF8inysyU1h1QLYgVTRXdtH7WqYEZfz6MGjyLM04u9
 kzM8pBYNFaE1lpnQ2Fk5fc3ZalhcMyDOShGDRE+9YHfi6TFyvbou6j+J/zmSILqhwK08
 nKcB3zbrbiMOr5GEY0HWPY3u6ycfOX8PHUyFXxLt9hGj3XabqsKiDtgiWSLVUsWVCvPf
 M7DG10FYlZx7gXrzI04HMf0YJC4vD/ptSpulEmbUdtOrmvnHg2m1D3cUKzZOuwmLhpUQ
 Jzcl1oKOjJ54IGRZVYwj2HpPgVLJwqTVarijCqAn3Jov9vror6Zn2z+MgS7Rb85+As3u
 11VQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CRgxSbFP
Subject: [Buildroot] [PATCH 1/1] package/google-breakpad: needs C++17
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Pascal Huerst <pascal.huerst@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
32c1fbad554d4c2bfbe56a652333195c8ae67904:

configure: error: *** A compiler with support for C++17 language features is required.

Fixes: 32c1fbad554d4c2bfbe56a652333195c8ae67904
 - http://autobuild.buildroot.org/results/451bae7151a74cbcb5d199b8516e9c255a0953fe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/google-breakpad/Config.in | 6 +++---
 package/sentry-native/Config.in   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index 5c7f4bb7ba..4e2d98eb04 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 config BR2_PACKAGE_GOOGLE_BREAKPAD
 	bool "google-breakpad"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
@@ -45,10 +45,10 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD_TOOLS
 
 endif
 
-comment "google-breakpad requires a glibc toolchain w/ wchar, thread, C++, gcc >= 4.8"
+comment "google-breakpad requires a glibc toolchain w/ wchar, threads, C++, gcc >= 7"
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/sentry-native/Config.in b/package/sentry-native/Config.in
index 7a3cbd36ad..88db2779f1 100644
--- a/package/sentry-native/Config.in
+++ b/package/sentry-native/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SENTRY_NATIVE
 	bool "sentry-native"
 	depends on BR2_INSTALL_LIBSTDCPP # google-breakpad
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # google-breakpad
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # google-breakpad
 	depends on BR2_USE_WCHAR # google-breakpad
 	depends on BR2_TOOLCHAIN_HAS_THREADS # google-breakpad
 	# google-breakpad is restricted to glibc or uClibc, but
@@ -19,10 +19,10 @@ config BR2_PACKAGE_SENTRY_NATIVE
 
 	  https://github.com/getsentry/sentry-native
 
-comment "sentry-native needs a glibc toolchain with w/ wchar, thread, C++, gcc >= 4.8"
+comment "sentry-native needs a glibc toolchain with w/ wchar, threads, C++, gcc >= 7"
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
