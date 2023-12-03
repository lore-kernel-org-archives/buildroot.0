Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A72BC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 18:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E80BF415A7;
	Sun,  3 Dec 2023 18:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E80BF415A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f3o2IbdtsIuD; Sun,  3 Dec 2023 18:20:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A2FA41575;
	Sun,  3 Dec 2023 18:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A2FA41575
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 325351BF408
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11ED081374
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11ED081374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XuLM2Rv0vC4d for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 18:20:05 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F318B81372
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 18:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F318B81372
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33330a5617fso1925268f8f.2
 for <buildroot@buildroot.org>; Sun, 03 Dec 2023 10:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701627602; x=1702232402;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UgQ+9yy4Q/4IdM7iK7uMZXHq+70skDGdNWCAebVIHYw=;
 b=urD1Kkwykq2VfoMh/9kBZwNJ32T+PvFu4v0XAO/TrLJnivzoY8VX331IXTbnpGAhvL
 W1HWV7NXJSqBbildCmzzL2u4QANHeNDirUgtIVjVv6RfaFw125cIx8XPRKH5Q+j3VdSx
 mv2vU1sF3I9/1k6OQLBMnf3LNn+w68AMkDuLmsbJH9c/1BzUv5M0X3LrCi4yrjJSF+I6
 1fp0MB41Ozz+ozA5fgXdz+5Qf09xv+P2JsO0W1+v8X8EBF6IrDIfrHAZHAbBXyAX82HS
 IVFIjDifPNjIziS2BCWeT+Ba8EpKAg9Qvc+karD5VXRf0XnlrLm8P5WEwNTDzbfys/zs
 npyA==
X-Gm-Message-State: AOJu0Yws7ombzLIMdvNQnzndswZQVKPjBxixldpREQloiVo2x+eBMPhT
 nOGvuoDohYTqJnwbUtwdYFiQ64IQ67k=
X-Google-Smtp-Source: AGHT+IGInlNPgdyTmirqcU4hIyFRCyuS5YQ0JXa/Uurv4/Fi5EHMYPFhkHnorOU5KwZKtqmX4ZSCPQ==
X-Received: by 2002:adf:fa0c:0:b0:333:2fd2:5d1a with SMTP id
 m12-20020adffa0c000000b003332fd25d1amr2694620wrr.76.1701627601672; 
 Sun, 03 Dec 2023 10:20:01 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d22-20020adfa356000000b0033332df65absm6717979wrb.50.2023.12.03.10.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 10:20:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Dec 2023 19:19:58 +0100
Message-ID: <20231203181958.285115-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701627602; x=1702232402; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UgQ+9yy4Q/4IdM7iK7uMZXHq+70skDGdNWCAebVIHYw=;
 b=ePo5V83ZkD4MAY2pTLHn77YdYkoIAh7b1PYy5WdrV+vlFD1cEavcmwts8qlx7ljXrc
 GPKRg2MNm9Jtgx+Yfi0Rr2OIbkyb6sQ080L9VTS0U3P1ktBex83UZM2sM8Lvih3ulHHZ
 O7dCusfSf4pe8/WnF84XRb05lYauH1RR7xZU8lKTYaZjrbWU8g/T58vFUFF5DhYI+QuS
 590UXJSoI0q1kW8eTr4D9BOHZ7MPOokpUxLDfHgn1OT7R/gHS4q+US70bRE01YtTV3/+
 NQYMJiVXXix3Ohe7UQyd64CNaRyixV8QbPnMlrp1T2YuyTc2zhMEqofIv8hPGPim6/i5
 Z+iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ePo5V83Z
Subject: [Buildroot] [PATCH 1/1] package/openssl: add
 BR2_PACKAGE_LIBRESSL_ARCH_SUPPORTS
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

libressl doesn't support all architectures since bump to version 3.8.2
in commit 21eca49ed5110872407b76ab9337d2877c4cda24 and
https://github.com/libressl/portable/commit/b98c56fd5e86fa76eb55a98a2266a923f64f705c
https://github.com/libressl/portable/commit/71ce0b8c3e07079a40011d2f3515969e3bdf302e:

In file included from /home/autobuild/autobuild/instance-4/output-1/build/libressl-3.8.2/crypto/rc4/rc4_enc.c:61:
/home/autobuild/autobuild/instance-4/output-1/build/libressl-3.8.2/crypto/../include/openssl/rc4.h:75:9: error: unknown type name 'RC4_INT'
   75 |         RC4_INT x, y;
      |         ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1f6ac121b3771ccc4b0e846c061b7002ccb63963

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openssl/Config.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index c7641ecefa..9b9b656760 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -30,8 +30,20 @@ config BR2_PACKAGE_LIBOPENSSL
 
 source "package/libopenssl/Config.in"
 
+config BR2_PACKAGE_LIBRESSL_ARCH_SUPPORTS
+	bool
+	# see include/CMakeLists.txt
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_RISCV_64
+	default y if BR2_sparc64
+
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
+	depends on BR2_PACKAGE_LIBRESSL_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# uClibc doesn't provide __register_atfork() without NPTL
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
