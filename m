Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66AAC636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 16:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3437842E53;
	Tue, 21 Feb 2023 16:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3437842E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v7XCds4wQqf2; Tue, 21 Feb 2023 16:01:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3152042DDA;
	Tue, 21 Feb 2023 16:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3152042DDA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE7E1BF390
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 16:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 667E860B43
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 16:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 667E860B43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vltjlvpj0_a0 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 16:01:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F8FF60AF4
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F8FF60AF4
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 16:01:48 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id p16so1412739wmq.5
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:01:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FzJeWeb9eEs9nN1yW84dpOs9yrJfmFJHGZoD2Lamdyk=;
 b=8MXhZvDVMrHirWMVPMzOETqOE9lUdKD2XMS5uGz10byt6EsY+42CkALLtGlE7E2rIC
 CHxnES722GnSNH4g5WgphMJQEdJhKaGzguQ5onbqWF962om2Pk9dkGSfgmNhSItEESgx
 wD80B+p6RG92+XW+tkHVzeCcqhxdUEDZi1sJCha955nXvjuSt2FuecKCws1if7OL3OtW
 3YAuFUSzG3EQzTDkQJkSoCRvS795be5OtRYtopbSU3XxDNKYUMtMM/b7/d6/sHI9LeeD
 ZnL+Bv5QZW12XyhX6n/bV7Fs17qf7+4AI43N7b3rTO5LkiycGCgG9NFybI/KboPsPF8Y
 x3Zw==
X-Gm-Message-State: AO0yUKWk4FwCAEe0T9E8MXUEDvTuKB0UzDhYwjzrLGJhW8iIZCtHeFUH
 324MypFM1RANUu5CY3W52Es7vfAtzL8=
X-Google-Smtp-Source: AK7set/I+fFfUtixciWqzJqijqLjhew91O7Pue+WNidYZhMqImf70cvWnoghjH+JfF7o+ummy+ga/w==
X-Received: by 2002:a05:600c:4e11:b0:3df:9858:c03a with SMTP id
 b17-20020a05600c4e1100b003df9858c03amr4073062wmq.15.1676995306144; 
 Tue, 21 Feb 2023 08:01:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m28-20020a05600c3b1c00b003e21ba8684dsm960557wms.26.2023.02.21.08.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 08:01:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 17:01:37 +0100
Message-Id: <20230221160137.2904208-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FzJeWeb9eEs9nN1yW84dpOs9yrJfmFJHGZoD2Lamdyk=;
 b=Z5n5fIRjwJre74fb6sRfE58Q4QqiK5z4iYSIj/kilhXllcI8KAOIhkXIhToK04DZJt
 9br+f79CWKHBFkkv8ztsHyhdVO5g5jv0A6SV02Bsoi2xJvW0tib6cVJGSCzU1tB3jban
 b0w0Qrj2h0p3BxEB43Q5GZseDND6sdR42BR2TMUymgtSIz+UzPtqnMGAG6sZc2VFdf2c
 XheCCKZoQ6TGhwB9qMop6zaa1AJIEsIftfwNweKy6iLU6XOqiP1RfFgFqcml4ctR3p8E
 1+B9akRkiDNmNHoAEW8YYEMKRsSYW2oHqSLZJRisLI+/Y1GBTDGjZWGWbuvsZ3Se6Bib
 wd2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Z5n5fIRj
Subject: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-codescape-img-mips: disable
 gdbserver
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

>>> toolchain-external-codescape-img-mips 2018.09-02 Copying gdbserver
Could not find gdbserver in external toolchain

Fixes:
 - http://autobuild.buildroot.org/results/b0786965e0b249c8168df855682e54cfe95fa0cc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../toolchain-external-codescape-img-mips/Config.in              | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
index 2341d08832..d49c610237 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
@@ -5,6 +5,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_MIPS_CPU_MIPS32R6 || (BR2_MIPS_CPU_MIPS64R6 && !BR2_MIPS_SOFT_FLOAT)
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
