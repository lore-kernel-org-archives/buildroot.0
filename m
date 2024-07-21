Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B7AC3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 06:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33F3740042;
	Sun, 21 Jul 2024 06:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYTnlXb2JINr; Sun, 21 Jul 2024 06:53:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBE8440247
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBE8440247;
	Sun, 21 Jul 2024 06:53:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D58E1BF342
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 06:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A1874038E
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 06:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aa-XvAQHVLYs for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 06:53:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08E5740372
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08E5740372
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08E5740372
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 06:53:09 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-427d2c8c632so22079765e9.2
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 23:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721544787; x=1722149587;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wMJwm+TkcSFeN91pJ/AFtHvrgcd08xlSakXkdnn4Ozc=;
 b=pL1j9YlTqBTi4abb8oo5cTzpFXVAprMNBHWJYJpAG9vhTx23woVN6wdXYrULop7LLd
 8EcsQWSAJnjHP4h3j5pzh0mdWKEFZ+b/1jMgOmxzQ6tEIgMpxtLqIVQhH8QF4neb0Hao
 jLJN/N5aTGBQQ6IvtCbe2fa/W4Le6XPmv5YZsSuZKmwck8tW7YSO7AxhZs0kqu7sdpcS
 gmk9cQJZgXtHn+cLBtRe4Npw2J0q7h+TFi+23zzdyZVQkaJu+VVOgsKHnf29pe4bLHld
 j4kgfMZR6zy2esqIrJHZMmp7x83BUD39NLmSQWwgUFjS5lt+yZCOLfm8MYMjGH0mCGF9
 Ql+A==
X-Gm-Message-State: AOJu0Yylx1T4brqLf9wFkWfGhy1Po8DQHfJc50X+7BkdLWHx+xZCz10k
 DIjHXUWkaayA3iUXwhp84qNHZ3mNSjD1+Cz/PvUCfCHS8BKYFDHUDqJflQ==
X-Google-Smtp-Source: AGHT+IHGK8vTbCZNbMZqkT71fAdnLRR/56lKnQKhOKlYj/Y+38K0xiIvcHsPMypeNJ2GZ9eQJ3EbVw==
X-Received: by 2002:a05:600c:82c3:b0:426:5d37:67f0 with SMTP id
 5b1f17b1804b1-427dc548f5bmr20986505e9.13.1721544786685; 
 Sat, 20 Jul 2024 23:53:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6929827sm80307425e9.34.2024.07.20.23.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 23:53:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 08:53:02 +0200
Message-ID: <20240721065302.35452-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721544787; x=1722149587; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wMJwm+TkcSFeN91pJ/AFtHvrgcd08xlSakXkdnn4Ozc=;
 b=CKnvmRUNXoDC39QeiOSzkWSrOq0jv6PE0icK5eMJUeCTqwUNPmaiDYSz4OpZnVd8BF
 YY8/p33mKqbTjq5Dn15kOMqvV3TDLUsirDr6egcMBWE9djk/iLMwxSGJarynw3wjm5eM
 UIAVhOTyFFBIuXAeu3FL8HDkJgCr0qDiGn8NTIBvqIqTTkQz7eYI/Kl88RMWubu9llEi
 Nz/d1FeSrp+WMsUXlL7NCMpViz2t77KPSop9SuGsdLQMQ1LM0quRA6Q2GnCluJUV5JVO
 wDdWcQmtaMoQRTxxzibIJC4RTbGz+JZj8T8TQWmGI16LEP8mrSwlrQDH8JWoq4Fa0o2q
 /sTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CKnvmRUN
Subject: [Buildroot] [PATCH 1/1] package/sysprof: needs C++
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
Cc: Will Newton <will.newton@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

sysprof needs C++ since bump to version 46.0 in commit
0d57555407f2a0708515e7c377f57a6466c78b1b and
https://gitlab.gnome.org/GNOME/sysprof/-/commit/a4b5ea6160135ae4ee2916b6a93b281302d5ddc8

Fixes: 0d57555407f2a0708515e7c377f57a6466c78b1b
 - http://autobuild.buildroot.org/results/6ab455b9287220d4353154ba3b54df4ce57748df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sysprof/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index 1d1b2fa264..be4f7653b0 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_SYSPROF
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS # libunwind, polkit
 	depends on !BR2_OPTIMIZE_FAST # polkit
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_JSON_GLIB
 	select BR2_PACKAGE_LIBDEX
 	select BR2_PACKAGE_LIBGLIB2
@@ -18,12 +19,12 @@ config BR2_PACKAGE_SYSPROF
 
 	  http://sysprof.com
 
-comment "sysprof needs a toolchain w/ dynamic libraray, wchar, threads, gcc >= 7"
+comment "sysprof needs a toolchain w/ dynamic libraray, wchar, threads, C++, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
 
 comment "sysprof can't be built with Optimize for fast"
 	depends on BR2_OPTIMIZE_FAST
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
