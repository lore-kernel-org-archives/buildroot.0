Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1D3C021A4
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 21:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6856C60BEB;
	Sat, 15 Feb 2025 21:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5nSKwQlRAj8o; Sat, 15 Feb 2025 21:22:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 700BC60BE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 700BC60BE1;
	Sat, 15 Feb 2025 21:22:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9839DF
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 21:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD8A4847F5
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 21:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSSlSbq_f_i4 for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 21:22:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B001F847F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B001F847F1
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B001F847F1
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 21:22:37 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43963935585so31050675e9.0
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 13:22:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739654555; x=1740259355;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IcionFFvV241vbOe0NSoBol37VrB51FennBwotRfWMk=;
 b=hleie3DYeiL4YM4JpAbI+Ay8+/Jl6468e4P2RCWXCbgVfKrxeXd4k1vcURRGkcl5lx
 0ufX46J+MdwA4upMaT9nuGXbkEIqTE/HPDCQsyBQIVSzwk1AfSEkNSn5No848mczA0y0
 g1zQuZiQkiP0c5Hw/ZUQj6S11ridJNY8gAONBHBJ49nHyIep0gcFJ2meaM9AYjZ2Si02
 vTzbiD2E4ZmKuiw/88zFTsZqsuhFLZ/uhwnthsn/maqOProtjNY4vKlXi4JsWeqwYDLP
 YOJ9dtUcdkvH22JTpiJOnI4Tuptm76yL7wzLTJ3+euZ3A+/ppGd5l15jxSoqy1qT2WWw
 euDQ==
X-Gm-Message-State: AOJu0YzGz6rsfDG2jhrZ+kb5AUHMsAtHUvVLTAiwUf3jD4OnIaW2XB13
 PoX72glsKWHYetcECW1zDeA2FheXvsEdvLLFk4lKf8LMvQIoghMMN4GMFg==
X-Gm-Gg: ASbGncvxJ8AvnXq3v5qCAcYvdPeg983pid3j3xiHnOg7vFhzBjzoIoellOQH4fsO3dh
 iYpJUuorng7k06VpaiikTyUuzkyAEstNghkEiwhMNFv9HRh+29XL1xh1uZVaxvpVqNBuX5X7T+T
 t/S1iD2Z3Bt4xOgC/USAl7RsUixwXi/ov/NXHE/8TjC6PlQ9FRu43FjHR0/J7hk/GogR0ODDG4h
 UDxhx644CwssfzxOVm1whkpCxSZ9a9xhgZA81fVaogrTAIUT35j+yuTxxEAuGwJLBP9VI6OyQU3
 HBTsyS0q/kohaX+87tN+od2q0w==
X-Google-Smtp-Source: AGHT+IFYznIR4vttS0YgpegNTnqgXBLdKJwhsGJNHdYsBP596M3fZ6uey6VyN7DHMNRt3VbkjVoj2A==
X-Received: by 2002:a05:600c:1d1c:b0:439:689b:99eb with SMTP id
 5b1f17b1804b1-4396e6a6d6dmr47556495e9.7.1739654555062; 
 Sat, 15 Feb 2025 13:22:35 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43961884f88sm78242285e9.28.2025.02.15.13.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2025 13:22:34 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Simon Dawson <spdawson@gmail.com>
Date: Sat, 15 Feb 2025 22:22:34 +0100
Message-ID: <20250215212234.1840388-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739654555; x=1740259355; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=IcionFFvV241vbOe0NSoBol37VrB51FennBwotRfWMk=;
 b=OyHLq8EFSAj7FZrsNJYWqT7LdSucFXPM8WqpDKtWZ7xJXdPvcrLL4CYoYMxFmpU3ci
 sZ0QktHsr4h5BoeBKsjWvfkK5qtlk10fMriiBdL1+VxZA1/LSgFrnkPuPGoDpIH9S1pJ
 D22aEhkoRWEVMFw7uAuP8AwsHFbWs7v+D5k5BQX39I7Q1s/AKk9fO/JcWl1unf+Hu/1J
 xoQOuAVJFDYiMxA569Vm35XOHy7oe3Gj0OnJvTFu3i3wF5dz3hRZEkGogJwgjyCx2E47
 hOo53qJ1lwMRPXULRU8s+GVbFEGo2o3JphCZHcq2krgiB6b+uSoPX3kRFkZE1Jr91bvM
 KoGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OyHLq8EF
Subject: [Buildroot] [PATCH] package/zmqpp: unbreak indentation of option in
 menuconfig
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

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Simon Dawson <spdawson@gmail.com>
---
 package/zmqpp/Config.in | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index 2c80e2883d..8c08b9d862 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -14,13 +14,6 @@ config BR2_PACKAGE_ZMQPP
 
 	  http://github.com/benjamg/zmqpp
 
-comment "zmqpp needs a toolchain w/ C++, threads, gcc >= 4.7"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-
-comment "zmqpp needs exception_ptr"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-
 if BR2_PACKAGE_ZMQPP
 
 config BR2_PACKAGE_ZMQPP_CLIENT
@@ -39,3 +32,10 @@ comment "zmqpp client needs a toolchain w/ dynamic library, threads, wchar"
 		|| !BR2_USE_WCHAR
 
 endif
+
+comment "zmqpp needs a toolchain w/ C++, threads, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+
+comment "zmqpp needs exception_ptr"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
