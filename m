Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1E7C43217
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 14:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80CDD6FB00;
	Thu, 20 Oct 2022 14:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80CDD6FB00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ML83a0posRYo; Thu, 20 Oct 2022 14:15:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 609BD6FAF4;
	Thu, 20 Oct 2022 14:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 609BD6FAF4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 913461BF312
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 14:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D39A8429D
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 14:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D39A8429D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rMNv9tZg0M5P for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 14:14:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67BAD84347
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67BAD84347
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 14:14:42 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id x18so26588995ljm.1
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 07:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4kk9lzxMx6avWsa1WEy8dtK3UyQn3IBtXhvNrUJidJM=;
 b=X6m1L4InX/MoK4HYgnQdaahF78D4WNkXvxLvH+oq04PTj/pCFmhFrc/PqXd0UXDqeY
 SPvH4T6M/vYn5mNlxaEE9ZlnJybZPWAaKz+XWgSKBZJeJ8fmYBjmJCkAD7z8mXmgZPyp
 9yU2b2IURytYBlukRnUio8UPGWoAWhywktwfbqAFZic9l1Ra0nsYrEMA8u8ttiULXAYR
 J/5Dez5zepWcQdLa8oCjrGGbQVW1LJUQJOvh32e60Sx1hyLz1hQY8kvR6izVv9yyc+/M
 7Q+eyduIQSg6dCDZwQQGpC3oMBFIgWiShPgK5WtDX82cGaP2CWWGVb9s+Esx/E6yMCkL
 fEzw==
X-Gm-Message-State: ACrzQf3Z81M6RfM6GS/uXVuN9WJoxFqr9hvEw15tAUQip7HQ0XcuwG8z
 F73SGb5Ojj6xo3mL3heOWn6KcJEtjCX1kg==
X-Google-Smtp-Source: AMsMyM6gxyqp0y6mcrQqeWtqUdQ3L/dFBF+FpYnTSp1aSL6SZmRvohYAekdW3R9+rH/4v6VayA4nGw==
X-Received: by 2002:a05:651c:b2b:b0:26f:cf40:a560 with SMTP id
 b43-20020a05651c0b2b00b0026fcf40a560mr5181671ljr.516.1666275278658; 
 Thu, 20 Oct 2022 07:14:38 -0700 (PDT)
Received: from wkz-x13.addiva.ad (a120.broadband3.quicknet.se. [46.17.184.120])
 by smtp.gmail.com with ESMTPSA id
 a3-20020ac25e63000000b0048b969ac5cdsm2739975lfr.5.2022.10.20.07.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 07:14:38 -0700 (PDT)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 16:14:10 +0200
Message-Id: <20221020141412.346992-3-tobias@waldekranz.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020141412.346992-1-tobias@waldekranz.com>
References: <20221020141412.346992-1-tobias@waldekranz.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4kk9lzxMx6avWsa1WEy8dtK3UyQn3IBtXhvNrUJidJM=;
 b=D93sjqmn6Lkfi4ivpyO2i3//fSFaasJwXhVp/pgGMT1JTHOq4kFk21t71Zh/PC7byZ
 tNDtDy8qD3IHR6WE2lJ+ruwJR1gFgrImcXl7NoOiLMEsB3Ijodd1nMWPKlPdnEg/+bJA
 HkE4NH17yyii1EogsO5DnFLGXW2PuXbUC2N3UG+nvs99A15eTwsU/d2I+GAucHrvrCLl
 xV7X+Wlr4qXA9rK9YDGEW8jd2sChn3UAWt/gh3NiVBTyHa39Toit9DAHz02L+JuhHUUz
 2eyAxT1sjeTHRI4DLsss84Ttlr5pqzeX7iZN5hSqRjpP5TiIYgQSFM2+G81OqimNHqpF
 jBEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=waldekranz-com.20210112.gappssmtp.com
 header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=D93sjqmn
Subject: [Buildroot] [PATCH 2/4] package/libbpf: remove architecture
 restrictions
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since 3145adfb69ba, libbpf depends on Linux headers >= 4.13. This
requirement renders the explicit list of supported architectures,
previously added in f693354c30bd overly restrictive, as the syscall
number for bpf(2) has been defined since Linux 3.18.

f693354c30bd was introduced to fix a build issue where a toolchain
using very old kernel headers (3.13) failed to build libbpf for ARM.

Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
---
 package/libbpf/Config.in | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/package/libbpf/Config.in b/package/libbpf/Config.in
index b3d6e44c6a..1465366c9e 100644
--- a/package/libbpf/Config.in
+++ b/package/libbpf/Config.in
@@ -1,15 +1,5 @@
-config BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
-	bool
-	# see src/bpf.c
-	default y if BR2_arc
-	default y if BR2_aarch64 || BR2_aarch64_be
-	default y if BR2_i386 || BR2_x86_64
-	default y if BR2_sparc || BR2_sparc64
-	default y if BR2_s390x
-
 config BR2_PACKAGE_LIBBPF
 	bool "libbpf"
-	depends on BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
@@ -27,7 +17,6 @@ config BR2_PACKAGE_LIBBPF
 	  https://github.com/libbpf/libbpf
 
 comment "libbpf needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.13"
-	depends on BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
