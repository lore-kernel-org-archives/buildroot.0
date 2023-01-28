Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF488C27C76
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 17:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 331D9408FF;
	Sat, 28 Jan 2023 17:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 331D9408FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f7nY0eSkzKfg; Sat, 28 Jan 2023 17:47:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7932D408F8;
	Sat, 28 Jan 2023 17:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7932D408F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC1101BF215
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 17:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F4F541675
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 17:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F4F541675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bxg0lCzNQ5H8 for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 17:47:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D0B841635
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D0B841635
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 17:47:40 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d14so7638714wrr.9
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 09:47:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lm+xg10sAxDglr3t6okDODPKnEqIrkxhFfb4JtVtMyk=;
 b=PIoFaobiVmmA3QfimsFY6LdygVTADaTdDIvn2vCGREc4FYb8Wtqi+MkvdfyL8FHTgC
 DGfYK9UNMKbTKAeroZ7oYyyGQUIvwCpuamZXOQmhd85X1GMKMvDgylU+fHDfOtvAkxU1
 iBhfPQW53OFTWjVFm8+WMEGVv0R2+vZxuh+EvPt4Rz7pocJMb/Gqba4zQvKg1m3kNIDu
 hILO+BDEmWx0m40ilEIztjPhd7wOmBbh27Rpk11guD/SI5XK1ZLEEMDOQ5CDGG8xxJN0
 E+oEYzPt21DEBkLGzMlHx2V+aS+8sNpRk+ruinqE12AYqYmVNDoNWUznfoG+thWVcytc
 G8iw==
X-Gm-Message-State: AO0yUKXmuVQTVtDbxf03SG1qfgmUyFcg/KanWdGev3K4H3MYkDLG0KpL
 vCFEzKua1Fwhbjz5ppg38mTGuIx4/Lgvvd29
X-Google-Smtp-Source: AK7set+OPLVm57gApXKuNcWVwR/LYuHtQkRkCzkBOXSBhIxjPgAS2V5n3J1Dl1LcNPsNavKrmZZl7w==
X-Received: by 2002:a5d:6107:0:b0:2bf:d2b8:8c09 with SMTP id
 v7-20020a5d6107000000b002bfd2b88c09mr6149255wrt.61.1674928057854; 
 Sat, 28 Jan 2023 09:47:37 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 y8-20020adfdf08000000b002bfb31bda06sm7614644wrl.76.2023.01.28.09.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 09:47:37 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 18:47:29 +0100
Message-Id: <20230128174731.3816982-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=Lm+xg10sAxDglr3t6okDODPKnEqIrkxhFfb4JtVtMyk=;
 b=XaOTJ1fnGEzTml+AMGFC+3b1O8aKoekQUrmaThmAW8I0aNxWjIwU5GHERq72TTYZ8V
 t0z7zz+a1Dw+61xaQRy4wSlo6g1oZr435FvtazYEdcTY0Tdj2J66XgJnU5y1NtY4IG44
 O+Aq9Y80crd+6cbMvMAAmXuom1OGyJme3+/9De3zfD+PFeeZ7ZAp298T5+a4zYwr0YIF
 1M0k72gQS20xcHcx/sX+V8xaHzYcFoPmG7wdqNdyoKtpQa1vOOg4r8F6U2NnVMUdOZOj
 Bk+Cp6NLhazTAg2nRVMYOCV6zBUCTQGzwo6voDopkxCyM+pjtLyqry331hKHrMJGJowH
 ZQQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XaOTJ1fn
Subject: [Buildroot] [PATCH] fluent-bit: needs C++
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@gmail.com>

Fixes:
 - http://autobuild.buildroot.net/results/007/007c7c69e54b8ff663891da4535e2e95d40c42a2/build-end.log
 - http://autobuild.buildroot.net/results/ede/ede6f9fb67c0c26ff02e71a3d20e3d4344ea59f0/build-end.log

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
---
 package/fluent-bit/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index 11ceb55d4f..bd89c05faa 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FLUENT_BIT
 	bool "fluent-bit"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBYAML
@@ -8,5 +9,5 @@ config BR2_PACKAGE_FLUENT_BIT
 
 	  https://github.com/fluent/fluent-bit
 
-comment "fluent-bit needs a glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+comment "fluent-bit needs a glibc toolchain w/ C++"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
