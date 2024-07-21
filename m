Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF605C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 21:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44EDD605DE;
	Sun, 21 Jul 2024 21:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFS0wU4aET18; Sun, 21 Jul 2024 21:16:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42E46607CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42E46607CC;
	Sun, 21 Jul 2024 21:16:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25A1E1BF2FC
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 21:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13C90607CC
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 21:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PyOobPou74rq for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 21:16:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0ACB6605DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ACB6605DE
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0ACB6605DE
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 21:16:33 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4266b1f1b21so27229055e9.1
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 14:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721596591; x=1722201391;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8T77Pf6QMRPxp0JA4aKCzzN8dgXBwgBXPE7hGgwhGFQ=;
 b=PplV3Eav46iL3O6kJOhUZNTaGjEaf41HqzXOKwORkxFMdV6DJHLzSpZuVL0cCB/XYZ
 G9xJXDWjhqFVkbUn3rn7SKS4byh6cpKUQxl7ov/mg6HawDK0SM5jjJHhbsmXe0m1iAFU
 ddS84S5nRLll4GqyoA03Jo9X6lqmfBs06oEk2OD3Gq7VbM60Fq5wtAFFWGqjsdfLhOTa
 fjLo97RD0MXRu47LU05LSTk+vM4Jl4lp9dwK588hhWqXW7k2h9/MAG1EZBvfjiQGmDEf
 D7Dn5lhV1HiXCjRq61EqNhekhq3BxW2BxU9xUtydEkuVJHOuB1WVv6ujebIsz2E8kwDl
 h2vA==
X-Gm-Message-State: AOJu0Yxp/Pjg9mn+7WFl7vm6Ah2x0Ugb5JVqI7HG6inuoepCJ/3MZfN3
 QFu7decCNVvem4Yj5omor+qcRBbti6w7zWRAubxYDEJnwvhs83D5J7eOGw==
X-Google-Smtp-Source: AGHT+IEUQDPzduM5s8SBDafyN7RoDw6OcOybwxbzCj2eJo0PQ8MLTWXIhxOE7VX3UkCxQGJ2pT37Kg==
X-Received: by 2002:a05:600c:4ec7:b0:426:6f15:2e4d with SMTP id
 5b1f17b1804b1-427dc51cecbmr32310825e9.9.1721596591346; 
 Sun, 21 Jul 2024 14:16:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d69019a5sm102152325e9.18.2024.07.21.14.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 14:16:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 23:16:28 +0200
Message-ID: <20240721211628.3485003-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721596591; x=1722201391; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8T77Pf6QMRPxp0JA4aKCzzN8dgXBwgBXPE7hGgwhGFQ=;
 b=adwnSNPhCgBhQ7izFK1/sGpXExyVYgxfmi7htrE3SEXtV1uifkMG4KGUForgVIqqrv
 12L+/JmuSbP5OfbsydEvbNDNBx/KYK8cYnNir42dFwejauCXOgduvc8zZrs9ac4DPIoi
 CXRaOfDov9/Pc4LZf15L5lVxVmBcpdCI89dXieHh/UApEpNQ8m+Pl+ed1sXctrCV+Sf0
 PxTUiYPr8iCYIwBxJUSyomlSiZurL6s62KkSCV+EmCNrKV/wobXN+GeTJpgvhJ25LU6A
 fGf4Bk4Y3HDJg+bjJ/J8jr3s+9xb96gA7x/l0JnQllSsPkOllyb9OTP5vw6TiTV0+pkP
 A7Qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=adwnSNPh
Subject: [Buildroot] [PATCH 1/1] package/apr-util: requires DES in openssl
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable DES in openssl to avoid the following build failure raised since
commit a83d41867c8d69a77d5cd0a665aa216af5340359:

crypto/apr_crypto_openssl.c: In function 'crypto_cipher_mechanism':
crypto/apr_crypto_openssl.c:385:27: error: implicit declaration of function 'EVP_des_ede3_cbc'; did you mean 'NID_des_ede3_cbc'? [-Wimplicit-function-declaration]
  385 |             key->cipher = EVP_des_ede3_cbc();
      |                           ^~~~~~~~~~~~~~~~
      |                           NID_des_ede3_cbc

Fixes: a83d41867c8d69a77d5cd0a665aa216af5340359
 - http://autobuild.buildroot.org/results/4b1088a705f8564f85e629316f5cfc92953f0047

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apr-util/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index f7c119db48..06b6c2684c 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_APR_UTIL
 	depends on BR2_USE_MMU # apr
 	select BR2_PACKAGE_APR
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  The utility library for the apache runtime project
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
