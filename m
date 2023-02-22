Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA32EC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 21:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 534E26138C;
	Wed, 22 Feb 2023 21:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 534E26138C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJCKc7lmqsGP; Wed, 22 Feb 2023 21:22:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 888A661383;
	Wed, 22 Feb 2023 21:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 888A661383
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EE8A1BF400
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 21:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4274681FDA
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 21:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4274681FDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ht7ACtZ7rkgW for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 21:22:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D95C981F98
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D95C981F98
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 21:22:42 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id p16so4604771wmq.5
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 13:22:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ria1V9PpjD6bDi8L8vSCfV8CZe7Lzx7HxDIFQF0zqSE=;
 b=pLRHBVaLK3c9uccf5Qktvb62/ses5rRgYfaANgAlmTyltbTZdM2EFa9UYjqvrh7g+S
 TejHxQcfrKAgWpWSu+eKj77RGXbW2IrCBuSmes0PZeO3pwmJjtCfiNGP0EXjNQg8Yo8C
 aE30rUGQrZG+ghBhbDFmfgTvvuIzlD9xWxpppZ4xKKb/aWlBlr2JtOIxvX8j6TRXxIOa
 LQ3qFbyZsLn3b52e/8Arfr8PyTGiCjPEUSrDE/Jyh1O3ELnzPEn27/fj98gX9IUKHdJK
 uU+7dH6VYlfBoAYYRG/pE9Wqg5r1ws564Nh6YVEBtzT+BkkoqcjiW4egphPVUHI9/hlB
 waZQ==
X-Gm-Message-State: AO0yUKWJwNV9Zh8VUzh8TAUp9M85ooR52loM8TEcsfUW6m/w/yX19hTp
 5Ydanh9+dEexaR2RbiXsGUh5s5VB/FI=
X-Google-Smtp-Source: AK7set/eCkst9u4fT72lyOSn0ML2XWlFigguF/JcEUFZiOYV80F6jDHPZlVzp8qPfbHAd8VA8WvUjw==
X-Received: by 2002:a05:600c:907:b0:3e2:636:24ac with SMTP id
 m7-20020a05600c090700b003e2063624acmr6415081wmp.14.1677100960394; 
 Wed, 22 Feb 2023 13:22:40 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 26-20020a05600c229a00b003de2fc8214esm8848728wmf.20.2023.02.22.13.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 13:22:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 22:22:35 +0100
Message-Id: <20230222212235.16202-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ria1V9PpjD6bDi8L8vSCfV8CZe7Lzx7HxDIFQF0zqSE=;
 b=q63wFrxE2TsDJ09AvOSj4HVJVI21G2VAWP5kZ8Vj6lBDykDDeFlB7fFWgVR0Lt+AMM
 xxkX4ZvnGsJwP4ZieN84ZxMo1GJABf15NI7X2i89m6Kju6ujCUbvAHy+saRmAFDnhhZm
 BGCuHQRXdsRVPrgufz1DYTeppSqZQTsIZp/vGYef5HI+1p9EyRBkHHUSY333vNmC0o0D
 zJwsyED8dKrydw8bUn4xdwf8tuDRLfswQk+/A3kVDRyBq9fzxl9NOnRLeTRAkUB1YBe8
 fwftMCUL0ZiKQdURQAGw81mTkuxotaFgE4ggFpISfcKzAW4naEgnEtI0i6yo8wbCUbnm
 K1sA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=q63wFrxE
Subject: [Buildroot] [PATCH 1/1] package/netsurf: force libopenssl
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

netsurf raises the following build failure since bump of libressl to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

content/fetchers/about.c: In function 'ns_X509_get_signature_nid':
content/fetchers/about.c:548:25: error: dereferencing pointer to incomplete type 'X509 {aka struct x509_st}'
  return OBJ_obj2nid(cert->cert_info->key->algor->algorithm);
                         ^~

Fixes:
 - http://autobuild.buildroot.org/results/c225aaac31398ba495921bd4b85e588199822561

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netsurf/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netsurf/Config.in b/package/netsurf/Config.in
index 4f7d5c2713..394befcf28 100644
--- a/package/netsurf/Config.in
+++ b/package/netsurf/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_NETSURF
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_OPENSSL if BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if BR2_PACKAGE_LIBCURL
 	help
 	  NetSurf is a compact graphical web browser which aims for
 	  HTML5, CSS and JavaScript support.
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
