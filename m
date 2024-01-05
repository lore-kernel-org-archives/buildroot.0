Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DC0C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 18:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75C9083F0B;
	Fri,  5 Jan 2024 18:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75C9083F0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fXBTbMinpmXs; Fri,  5 Jan 2024 18:12:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B57C383D3A;
	Fri,  5 Jan 2024 18:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B57C383D3A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7533F1BF389
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 18:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AE6D423DB
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 18:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AE6D423DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UpOcYlhjY2W1 for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 18:12:15 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E755423DA
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 18:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E755423DA
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e3b43173eso3477465e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 10:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704478332; x=1705083132;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nu1P5GEDwrMjCTp87RHDPC+c1dTJFbl0BFfhXnOQmRI=;
 b=J5FQXxByBtsP3BD9NRwC49Irh35aahDkfLIsdpWlku09WaRjwmbjMW3qp01HNi3nva
 1QspvHaqEqbXfaaScID3dtUgIjJ9y6oHqVYDzTkr+h0DObgIaBucH1FUNsczBvCMMh0Z
 aK89XilI0DPjubVBIj6/Hsx4Z7CI+aGK1RzsPK0vcaMm5lNHiw4MT/33mRiFzrqCRWpf
 oYpjydw/nwch8SjfdFrqJcka5c6/DIlyTGE/gu8tTrathKsUIkABp2sGxuG2YCnw3OXL
 p9ZIJM6As5ZBA35Oo5f/Rx+VkzUw9kdgHLEzXkyCS3lVMTGlBjqxUF1NI6EuIgoi+4Wv
 hepg==
X-Gm-Message-State: AOJu0YwbFI95ZeJy3mGk29RDDpsKUlINczeSPc1UNKqOo7inT/A8XQqw
 XWc1sALwFUfES+GZ8omuH4uOxzYdLlw=
X-Google-Smtp-Source: AGHT+IHrByqOlj0c9Adyr3bAfHziZDJ85pcsBbqk8rmsqeMKX5hB/C9AhJp9N7Cg+KEU9ZFw3txv9A==
X-Received: by 2002:a05:600c:3485:b0:40e:362d:2709 with SMTP id
 a5-20020a05600c348500b0040e362d2709mr687945wmq.157.1704478332410; 
 Fri, 05 Jan 2024 10:12:12 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g2-20020a05600c000200b0040c3dcc36e6sm2225778wmc.47.2024.01.05.10.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 10:12:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 19:12:07 +0100
Message-ID: <20240105181207.748233-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704478332; x=1705083132; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nu1P5GEDwrMjCTp87RHDPC+c1dTJFbl0BFfhXnOQmRI=;
 b=krWcwsbpdVRH+UTOqinDENRiGsZH91PUWO8Dnj7rnU6dm92VUkgXSnyWTI7UB0TsdO
 LME+A2MdlLzEyXgu4SgIC35tA49/v0YaMCOZTf0H0a/KxHt5o9ZNxLDckvBsUnropWul
 UGCWWFdAAej4A2BOzw1sNovXt3nd44/OhkWoKBEUkMbhJX2vYDEnUua88Vkmq1LejywX
 oejxf1fziCVCEwltY0AisAZnqe4RzWGMCu4sdVGSA5/4UaZoBUxEmeOb3ILsQjQ9+076
 X6wLjBDImRU+B//ZbfMnHUpcvVRN/Uqtae/HC9j1/IV1TktOgag7De7q0W2iGPpPwFc3
 PR8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=krWcwsbp
Subject: [Buildroot] [PATCH 1/1] package/libostree: needs headers >= 5.8
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libostree unconditionally uses loop_config since bump to version 2023.5
in commit c64a3e9767757f6bab0ecf2df35871508003f39e and
https://github.com/containers/composefs/commit/d7f24100c932cd0da9c315de7c7d44fe7a5005cd
which is only available with kernel >= 5.8 and
https://github.com/torvalds/linux/commit/3448914e8cc550ba792d4ccc74471d1ca4293aae
resulting in the following build failure:

composefs/libcomposefs/lcfs-mount.c: In function 'setup_loopback':
composefs/libcomposefs/lcfs-mount.c:273:16: error: variable 'loopconfig' has initializer but incomplete type
  273 |         struct loop_config loopconfig = { 0 };
      |                ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/25d9d4f256861628ddd8e8ce659a39655d27b457
 - http://autobuild.buildroot.org/results/5c7e1e47c6eb43f7832ef7820ec2b5ac0f3c3696

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libostree/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libostree/Config.in b/package/libostree/Config.in
index 9c59413eb1..49eed6517e 100644
--- a/package/libostree/Config.in
+++ b/package/libostree/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBOSTREE
 	depends on BR2_USE_MMU # e2fsprogs, libglib2, libgpgme
 	# doesn't build with musl due to lack of TEMP_FAILURE_RETRY()
 	depends on !BR2_TOOLCHAIN_USES_MUSL
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 # linux/fsverity.h
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8 # loop_config
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_LIBARCHIVE if BR2_s390x
 	select BR2_PACKAGE_LIBGLIB2
@@ -19,9 +19,9 @@ config BR2_PACKAGE_LIBOSTREE
 
 	  https://ostree.readthedocs.io/en/latest/
 
-comment "libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar, headers >= 5.4"
+comment "libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar, headers >= 5.8"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
 		|| !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_MUSL || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
