Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03C2C7EE23
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 17:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0814781F58;
	Mon, 27 Feb 2023 17:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0814781F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wzpel1r80Cuf; Mon, 27 Feb 2023 17:15:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57FB681F60;
	Mon, 27 Feb 2023 17:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57FB681F60
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D83E1BF370
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 17:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 474B840A68
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 17:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 474B840A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NUqpX7j8Kd8A for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 17:15:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DA84404F5
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DA84404F5
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 17:15:54 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id bx12so3855757wrb.11
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 09:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3yrMS9mheqFzGS5+ABEMKf30WjDgS2h793t4FSuqRQc=;
 b=U0Tlv0nI2nN814va9lQehxU1msnlWihaX8kJ1XsjUefoR7zE/nhClnNZ30VW5xhPhZ
 qhmXZs63bSP+f869d1WHyGo6B209/xHZ1VLR9e16L+K81DEJsRb/HN0gDMGBk0wDgjHY
 ESiYw+3fd8RvOR4aawRhhnZd49bH1unmpz6wWHADQ2NcNrwhPx590zt691K4yxWToxZa
 7a0iO8WB1Kal5/9yohNRKnUDeA4aqxserBNDTvrgasrmuhRL34FzBvlfK0iCK25sE1on
 P89cObOwZSDmyjv5xLLzdTsSfBFjLG93wCRerfU4h65JUCDXU6fI5Fwm7X9GRa8SsMIL
 Etbg==
X-Gm-Message-State: AO0yUKXhU/GWkroUhMuahF6ufH4GzFPOto7Zb95HfDNASD4gQWN0+MAM
 x6ss5OH+qzmnXGqtIa7s/cOSdG0KG7w=
X-Google-Smtp-Source: AK7set8K/PljtVEyQ2XDtFrHGHM4Hj3UJQxxZUy/Ckyzzva7dD3MjMoofTu2o63/Z7mBFV17o3K43w==
X-Received: by 2002:a5d:61ce:0:b0:2c7:4865:f21e with SMTP id
 q14-20020a5d61ce000000b002c74865f21emr10147053wrv.44.1677518151803; 
 Mon, 27 Feb 2023 09:15:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l8-20020adff488000000b002c557f82e27sm7664538wro.99.2023.02.27.09.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:15:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 18:15:48 +0100
Message-Id: <20230227171548.140054-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3yrMS9mheqFzGS5+ABEMKf30WjDgS2h793t4FSuqRQc=;
 b=iBEZiwQv/gI9Zkx5VaRtuSbErcHGQttjVgmCLP+W2ly8NNw3M3YdSszXXVJiCmb0Va
 dx/WH/+zpm3Tcc/9TzodI7JH/RTbtGo6oHkDKLEjryc+ahUyw1a0h6q7MegwhSW14cN1
 WxzAoVSzQlHzbEKzBJZCu6GbsdztFpT03OLSpkOyiuH0P/kKcJ7eJwsYcihEBfBEcTFr
 7Sq8UWIucAXZBOLNDsTVhs9LW9ZfjhKoEexXF02XRgZRfcnR9NSkN0JGzvQZ9r/El2oY
 ZNc1BdAbbStaEIoV5P+i7VwrGSSYQqekm/EFB4pIBa5km7Ycttr0E0tG0PkIE749/ZRh
 FiYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iBEZiwQv
Subject: [Buildroot] [PATCH 1/1] package/gerbera: disable with header-only
 pugixml
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

Fix the following build failure with header-only pugixml raised since
commit cc3a4a7b1de7b158354c650d234339e8a969a730:

/home/thomas/autobuild/instance-2/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/10.4.0/../../../../nios2-buildroot-linux-gnu/bin/ld: CMakeFiles/gerbera.dir/src/main.cc.o: in function `ConfigGenerator::~ConfigGenerator()':
/home/thomas/autobuild/instance-2/output-1/build/gerbera-1.10.0/src/config/config_generator.h:33: undefined reference to `pugi::xml_document::~xml_document()'

Fixes:
 - http://autobuild.buildroot.org/results/800537a1ef5f48d24c20aad7a9c96c56dfdc77f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gerbera/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index 46a163ec78..e1f09e6780 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_GERBERA
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # fmt
+	depends on !BR2_PACKAGE_PUGIXML_HEADER_ONLY
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBUPNP if !BR2_PACKAGE_LIBNPUPNP
@@ -32,3 +33,6 @@ comment "gerbera needs a toolchain w/ C++, dynamic library, threads, wchar, gcc
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
+comment "gerbera can't be built with header-only pugixml"
+	depends on BR2_PACKAGE_PUGIXML_HEADER_ONLY
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
