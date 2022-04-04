Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E2FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 21:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EE9940393;
	Mon,  4 Apr 2022 21:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPMcwdT68Rob; Mon,  4 Apr 2022 21:21:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B681940204;
	Mon,  4 Apr 2022 21:21:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B6D91BF23C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 21:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3828140948
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 21:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dBLR9QUeIPRo for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 21:21:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEA6B40922
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 21:21:26 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id u3so16479091wrg.3
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 14:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W0dAvWQsky0KtT5wrgm6bLNFuHgm6/XuHolAVjqNhpE=;
 b=kueHXmzSJ85GYYvuYGP0Y/x0DWBo3uiMxnVrKQcJxUFWHKbx/iYqXDnTSMqrC2WbPR
 nhNR4nLPNm5JzIzS4b4exuzVqmqeXNmL9OEmi+Zw1yf1WcajDFszYMjnCDjLsHCt59Lj
 NYcQMK3hcHFnkE7UA3tWPWUvQLqpGmutolHcUBW5WmmCzuDXDII7mFHuImAIdiFU0f78
 Upzw+o7T74gjdP1BjPRzysjipbAATsI5UWCrDdv+2z2I9a+jb+bOovaPy1zUMk46S+r8
 KB1GMu0jkozsUS6FpxprkJID80Q0ZHT2106lK4hMxp1+Ww6Q8uzX0oESQcza49rAYU+S
 kpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W0dAvWQsky0KtT5wrgm6bLNFuHgm6/XuHolAVjqNhpE=;
 b=1O2ESCIGLQvthG127URPaJ1AVHYXZdqyhobc/VQaUgEUT6OCE3Esv3Y+rsBSiLFQDD
 kbTHSE5PEt0QzwVr4wKMH0/n+n/5fa7vZTaFOBRXzQYR34kEJ6MXC88hxN7+XYQC7d7R
 459W911OxmyQa99+mttzaDTXCaTvjD4FonJ0lPZw+EZrgdfz8jBJy2wnDSEm4SVulzyX
 QM85jNa2VEb5ILLhO/YEgfn5YbqvTEG5B0QfEbBrCWyAgWvoqlE66+KdyxItJWGCd16m
 93vLXS0mIkfsRxCGFlH/Qp6HmhjmZffsAKFIgLEcc/SDM/uh3Q9oCg9Mv3opiE01msXi
 YEBw==
X-Gm-Message-State: AOAM531oRVE6GLjRlI9wtZ2P65sAFNdfurYhmk53YkB+tH+WgdEX3JBY
 duWS/DxDmrDG9QZTRg2uPwXL1TPKkN0=
X-Google-Smtp-Source: ABdhPJwf4341AD6dU6cdVHaFJb1sxcouEt/WtRRhFPeqgvKBop68w3VQmuIAUHRpOqN8p25Qiq4hGw==
X-Received: by 2002:a05:6000:1ac8:b0:204:2917:acd4 with SMTP id
 i8-20020a0560001ac800b002042917acd4mr127321wry.31.1649107285000; 
 Mon, 04 Apr 2022 14:21:25 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a16-20020adfdd10000000b002060b4e240dsm6242605wrm.93.2022.04.04.14.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 14:21:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Apr 2022 23:19:41 +0200
Message-Id: <20220404211941.721192-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libest: fix build with libressl
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
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl raised since the addition
of the package in commit f6f0e1e58168dfa9194db2e073efd20a98c15728:

In file included from est.c:28:
est.h:27:10: fatal error: openssl/srp.h: No such file or directory
   27 | #include <openssl/srp.h>
      |          ^~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/0dd755effbdddfa1b578fec9f1b1c9366b6822bc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libest/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libest/Config.in b/package/libest/Config.in
index d8271ad69e..6abe9d2848 100644
--- a/package/libest/Config.in
+++ b/package/libest/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBEST
 	depends on !BR2_STATIC_LIBS # libexecinfo or glibc
 	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  libest is a C implementation of RFC 7030 (Enrollment over
 	  Secure Transport).
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
