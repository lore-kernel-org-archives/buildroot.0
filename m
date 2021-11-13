Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280E7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 16:06:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BF6360F26
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 16:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BF6360F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B7E66064A;
	Sat, 13 Nov 2021 16:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nz-FjEoiSz8b; Sat, 13 Nov 2021 16:06:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F4026062C;
	Sat, 13 Nov 2021 16:06:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 938231BF20B
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 16:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B47D40468
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 16:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GBKHRC_SNmIe for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 16:06:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EDBE4045B
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 16:06:50 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso8886475wmh.0
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 08:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vsiz7s3mT2hnGWadGrrZUjlf0U4eMC5hEdQp26YXDEc=;
 b=WvXgLvlhkXko4v9iWbtz3wFKX/uunSKrf9F64B+4V4gpJ9C+rb2ear55OJ2KNOwUWU
 jl9Qlr9FSDDSUGB/ol7SnUpAStKC30PilIaFyUQ1/ggDyyjh0HVNcWRpqQM4EroyvVn9
 Z8r14yAGWlt1g3EQ8todpfBov3IQUT+CepynK4NCX8NBLoC9Cd1SM4Uagd7/XT76hGGf
 s421V0EHwkfjY8l/TfpDWSG6uWGAyvhBsaMf+mE1sUV7wrVDlPrxIz6gRshxDe1OXqTi
 92e18qodOEFnGfOhgetfz+herYBOrx695MV5dWFS+3X6HJA+JqzGWm0QsRMfVLspfjeM
 xqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vsiz7s3mT2hnGWadGrrZUjlf0U4eMC5hEdQp26YXDEc=;
 b=RmwdlY9fhUuHpYthdKRE25YqVKk4JNaO/NuZjsOXhmOau30MdowxpW05Lc8soUpFeZ
 fUWT1YV6UzvVPrXWF+hxm9qAnuLgNshYUu8iO7+wvbOL7GhWjkzlDvEiNTS+yoSFw3U/
 CGhdWBgYx6iUY76Aori1es7JJU/Y+XI3NW5KtplMA5DpebbEJTV7MLi4cNIngCqfD/zE
 1C3jKw+8IH32NqYPqNbwGpJDcbssx2J5+KnyLQKgl1NhYxUT3Cp6rHyZYwcJdxYNUjzZ
 ncdiztHwefWQRyz2Vavcg6FxV1iQCQFek7OE1wbYoepS6kusmWMpXZPqi5ZvcEv7flhW
 Gnhw==
X-Gm-Message-State: AOAM530bxFmZrBodTkhQMBwG1IrsYdFBALrC/kZuC1HwTbY+pBP6ta9X
 FaQsMCKettKDxD/JcDHL/pVu4zLGRrY=
X-Google-Smtp-Source: ABdhPJzBKfVviIumVREJIeoT9IQ3gNaihTZYUKxkZLh2g4XdOrFCL0mAsW5iLV0bv76zptJ4UlVTcg==
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr44508699wmq.21.1636819608395; 
 Sat, 13 Nov 2021 08:06:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id a10sm10984913wmq.27.2021.11.13.08.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 08:06:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 17:04:44 +0100
Message-Id: <20211113160444.544804-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/firmware-utils: needs dynamic
 library
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
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As usual with cmake packages, static builds are not supported and result
in the following build failure:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/9.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(c_zlib.o): in function `zlib_stateful_expand_block':
c_zlib.c:(.text+0x54): undefined reference to `inflate'

Instead of patching CMakeLists.txt to add a call to pkg-config, add a
dependency on dynamic library

Fixes:
 - http://autobuild.buildroot.org/results/16a89075e6a809a551e7155a64a4e6b6701428e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/firmware-utils/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/firmware-utils/Config.in b/package/firmware-utils/Config.in
index 501b89b453..7753360702 100644
--- a/package/firmware-utils/Config.in
+++ b/package/firmware-utils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FIRMWARE_UTILS
 	bool "firmware-utils"
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_ZLIB
@@ -14,3 +15,6 @@ config BR2_PACKAGE_FIRMWARE_UTILS
 	  extract a part of firmware image and flash it.
 
 	  https://git.openwrt.org/?p=project/firmware-utils.git;a=summary
+
+comment "firmware-utils needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
