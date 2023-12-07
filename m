Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C7DC4167B
	for <buildroot@archiver.kernel.org>; Thu,  7 Dec 2023 21:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D462160E73;
	Thu,  7 Dec 2023 21:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D462160E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dvz4vmSMgtw; Thu,  7 Dec 2023 21:39:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 302D360E72;
	Thu,  7 Dec 2023 21:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 302D360E72
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EA8B1BF2F1
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 21:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5109783DE0
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 21:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5109783DE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xNYep6L5x8BU for <buildroot@lists.busybox.net>;
 Thu,  7 Dec 2023 21:39:55 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4389381417
 for <buildroot@buildroot.org>; Thu,  7 Dec 2023 21:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4389381417
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c09f5a7cfso16402685e9.0
 for <buildroot@buildroot.org>; Thu, 07 Dec 2023 13:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701985193; x=1702589993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kghx2r4jJKcsNhxmC+tLUnOo+fr9kgdwQlK+xm6748U=;
 b=OxVzDj3NSxhck5zWpzuPTChIx9kCBJvLdThNOY5hoCR/2bt6L1E5OiJI/Ns07Abdya
 yy0jPavjSSioIbTlfID0U9CEslbh3CYoYTiGU+qrrc0Hkphv+9lkPDTEqpypE0k/wW+s
 N1WB3XKxcUTAvK94Gu0xaR1rM9xBIpmuTVMPZWsg0nMrPKAC9FxYAzmgHKBR+v/kyhi3
 z/KL0N8SJyfKr9RDBerh3zynb1NBRAOEn8akZNeKV0JKdoUAdGliBKKDANhNur64WWb4
 rWwjYxmB0sDNXsZDR2uCVVaZGH24ab/nQmGyQwBtY6yT50FtuM+94HxBMBieyahIeLtd
 3oTg==
X-Gm-Message-State: AOJu0YztR/II/OlMi/SYqB36K1scKG8fyNZxSQRR3PoMWS4O7SQpzLqN
 KTQM4BHU6FZ+YUGAX8hRuzMn872OPLU=
X-Google-Smtp-Source: AGHT+IEhJEVctW1BVvxWjRUVxNvcfsIAClf2K/iSKOk68oNpSfqLzBMVQv4PihahSjsZ+7FvTB5yDA==
X-Received: by 2002:a05:600c:a001:b0:40c:2a82:fee5 with SMTP id
 jg1-20020a05600ca00100b0040c2a82fee5mr878404wmb.114.1701985192524; 
 Thu, 07 Dec 2023 13:39:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fm21-20020a05600c0c1500b0040c03c3289bsm798484wmb.37.2023.12.07.13.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 13:39:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Dec 2023 22:39:48 +0100
Message-ID: <20231207213948.1007025-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701985193; x=1702589993; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Kghx2r4jJKcsNhxmC+tLUnOo+fr9kgdwQlK+xm6748U=;
 b=QriOoH1YLlAYQijEkinxQ9w5ZJD+qmh/QqgFuMgHJXQxp5b+ghG3h9mq/xtQot+liq
 XnEjC2Kh7Ov4QGBuYOJlB57ymEvGqy8t1sC7YNeBJIHDH/RB+KJrUJe0/01XAzPhDLth
 GQqovEhdnewZEMxa1Zo7Bi2AOdD3pojdvOAEqKhgDxhClQ6yb4omikhPujv077ZY3P+6
 k93XWxLCI+g6YAnre3wI0LJDS4L1ra9OwMmP0epDnNxfYfxgoYGP2rcy+w8Q7O7WJd39
 tZs1+kvajy9AdUD7b9tWkWi9tlkR8qQdyBjyUHKhNKS7HXepbqfpHd4jXYlNtNRkF1Nx
 nUZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QriOoH1Y
Subject: [Buildroot] [PATCH 1/1] package/erlang: requires DES in openssl
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

Enable DES in openssl to avoid the following build failure raised since
bump to version 26.0.2 in commit
2cfa86a54882f2831b36a78a0ca642aa3a4bd0a4:

cipher.c:51:42: error: 'EVP_des_ede3_cbc' undeclared here (not in a function); did you mean 'SN_des_ede3_cbc'?
   51 |     {{"des_ede3_cbc"}, "des-ede3-cbc", {&EVP_des_ede3_cbc}, 0, 0},
      |                                          ^~~~~~~~~~~~~~~~
      |                                          SN_des_ede3_cbc

Fixes:
 - http://autobuild.buildroot.org/results/1aace0ee738f8ec4aa2c9a739fc7535c3b6bf884

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/erlang/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 724f91123b..1cdaeeaf83 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -29,6 +29,7 @@ config BR2_PACKAGE_ERLANG
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  Erlang is a programming language used to build massively
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
