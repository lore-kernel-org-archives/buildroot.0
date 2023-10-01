Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02081E748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 17:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B2BA41D8D;
	Sun,  1 Oct 2023 17:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B2BA41D8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kOlx1fOb9fzE; Sun,  1 Oct 2023 17:29:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F62F41D8E;
	Sun,  1 Oct 2023 17:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F62F41D8E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78C351BF5AA
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 17:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5202E40576
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 17:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5202E40576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pQO0gRlC2BfL for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 17:29:12 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42973400AF
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 17:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42973400AF
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40572aeb73cso128541095e9.3
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 10:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696181350; x=1696786150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iXek1uPD+N02QnEPYcKBvN2PyEG2E5RnpGoJISYhzCc=;
 b=do5IkmhEn+S83VKS2ngKcMtxTZHSOyzgDa6qX44rfWV2uvEw2QfGQWs9IdKhJRm2rx
 a6rEaUXw8MBFDeUAMzHtz/OptePwszHGfdl4iXfWt3oha2NuKiLNAyAuVOgVzgPQfima
 cSPF2qLpZpw3HYQuR6FrSqx/rilArXdt1c0LN0SJgt8oBg5f+sjHMt2RSI2gA2q/iRDH
 ndOgspMx+SPPlPfD7EPDUWsf+udne91navXJjsY/3nqnfumkbPyuIHx/THqBEnRbia5S
 1Gi3bV6Pgz01nTJQYHnCH/SRDy/FeUFzkoR+CvYmhuHl/p9FILnjX+pLTEHbJPGS65Of
 clMA==
X-Gm-Message-State: AOJu0YwYT5beFJsm2GNqSjKdlonZ6dOgYSbbkWh1ZZFVRWg1RPWeYULo
 ed/n1zBJsPrd0UB0cFs7r2480vnZHHUpwaf2
X-Google-Smtp-Source: AGHT+IEzir/d+tWngXKzfQcWBqKqxTbjNkCfpJT9Cb0EXKrIFddOYYO8f9wovmjk5RAd1GgxpHBKuA==
X-Received: by 2002:a5d:4569:0:b0:31f:f9a9:a742 with SMTP id
 a9-20020a5d4569000000b0031ff9a9a742mr7827061wrc.23.1696181349605; 
 Sun, 01 Oct 2023 10:29:09 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 bt14-20020a056000080e00b003200c918c81sm19759235wrb.112.2023.10.01.10.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 10:29:09 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 19:29:05 +0200
Message-ID: <20231001172905.1962565-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696181350; x=1696786150; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=iXek1uPD+N02QnEPYcKBvN2PyEG2E5RnpGoJISYhzCc=;
 b=KKNjnt+LtqFfv2n/T8Nn2/x/CJNJ1gd9/Oj5RCV99uhvAUf58Cd38PD5BWV3Q4KZrJ
 WcVpTGhzwbjLABJpd2R3AELqK/DXtGgB6ZeWukwX45LqiWX3rqZljnXV6ZeEcAIrfLCq
 P7PqdhorwmnZ8xoyEbIw0aNpoMdYwFQpS4QX+kB6rt4yz+hOyh8Arkre8vmOG90dvYXk
 jb1IDikUkhvFrX+udgV1FbfVfXBRhQd1r8Ai4iGbz6A0FySR5cZKK7KTELLGmOxEDZ71
 tXvmJdJBH9CI8Uxkw6Q+76AEe0b0VykzsXrrbrkCA25pLXgh8USM06HHwYvhFnnvEP7Q
 h1CA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KKNjnt+L
Subject: [Buildroot] [PATCH v1] package/wpewebkit: needs >= GCC 9
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Raise the minimal GCC version to 9.3, which is required since wpewebkit-2.40.0 [1].
Similar to commit 09af6d8bfd8ece6b021b877aaf5cbd36a78ffad9,
we do check on >= GCC 9, because we can't check on >= GCC 9.3.

[1] https://github.com/WebKit/WebKit/commit/f9c142d9b5b8c48fe310bc6d3620e634901b2930

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/wpewebkit/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index f1d38c7cad..81b66f8429 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -16,12 +16,12 @@ config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7, host gcc >= 4.9"
+comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 9, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
 		|| !BR2_HOST_GCC_AT_LEAST_4_9
 
 comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
@@ -37,7 +37,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
