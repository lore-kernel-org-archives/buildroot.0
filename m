Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C4DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Jun 2022 07:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 036A14177E;
	Sat, 18 Jun 2022 07:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 036A14177E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E4VyKhPJAGwg; Sat, 18 Jun 2022 07:40:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC601415FC;
	Sat, 18 Jun 2022 07:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC601415FC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAB6D1BF48C
 for <buildroot@lists.busybox.net>; Sat, 18 Jun 2022 07:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2750829FE
 for <buildroot@lists.busybox.net>; Sat, 18 Jun 2022 07:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2750829FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v_c76JpHKis3 for <buildroot@lists.busybox.net>;
 Sat, 18 Jun 2022 07:40:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB049829F2
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB049829F2
 for <buildroot@busybox.net>; Sat, 18 Jun 2022 07:40:53 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z11so2671404edp.9
 for <buildroot@busybox.net>; Sat, 18 Jun 2022 00:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=YNQ0pU7BDVdruPHYx7K2dA2nRC9jOUWje9aQQA0XODw=;
 b=t9bluDhIQEfXY54p4kE6BH7kN0GQi0EFbQNXsIE3hB1B3BseQGkw4kBv5pgkIRrdyh
 IPk3/N+6ZLr4IqLkvNMeKp1KCoAYq3cxJPbnckKbzZADfQHC8ig3rFc3gleJG76FhfIy
 yr0aqak38t2Kt9o4SWq8MyOcGjUG8CuiwAs1OuB7Gh5nyQydyOViqpL2R0OPuyXGvjQv
 kSu2GaqfdRFwEZTnU0Cj0Ld1tC4noTA6GGdKpGFXATSflyXbRA41BaKC/i+lC3SNJdw0
 EnWpMEr6mqNJqJFWRFt8nZtD75DlRcGKYvJ8UCN7TiiCbcWeWTdaGLbooHLJpsKQnAUx
 iUmQ==
X-Gm-Message-State: AJIora8faLbsnRkbhDFScapCasPVHlREUVNs04bRLeNn+6tahy0IbwPJ
 g0Xgms/nEDb5EYj+vN4sxQgJXEUeLLg=
X-Google-Smtp-Source: AGRyM1vN4V0C13tjRmM6H0KtOLrzGofnjWZP0reM7HEyjE5tO1+vl1gXNJ2Thh4a6PTxT1Mpu/C50A==
X-Received: by 2002:a05:6402:3448:b0:435:71ca:b46b with SMTP id
 l8-20020a056402344800b0043571cab46bmr902912edc.348.1655538051825; 
 Sat, 18 Jun 2022 00:40:51 -0700 (PDT)
Received: from einstein.dilieto.eu (smtp.dilieto.eu. [188.68.43.228])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a170906471100b00704dccefd2bsm3017358ejq.204.2022.06.18.00.40.51
 for <buildroot@busybox.net>
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 18 Jun 2022 00:40:51 -0700 (PDT)
Date: Sat, 18 Jun 2022 09:40:48 +0200
From: Nicola Di Lieto <nicola.dilieto@gmail.com>
To: buildroot@busybox.net
Message-ID: <Yq2BgE6StduAjH5Z@einstein.dilieto.eu>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH] package/uacme: allow ualpn with mbedTLS
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following the update to mbedTLS 2.28.0 in commit 0f8aab08, ualpn can
work with mbedTLS without restrictions.

References
https://git.buildroot.net/buildroot/commit?id=96c3b52132b41716ca445b4c73a1a8886c26e5ee
https://github.com/ndilieto/uacme/issues/23#issuecomment-1043409796
https://github.com/ndilieto/uacme/commit/bbee626cf5f60908f064c123f7a9622639348c3d
https://github.com/Mbed-TLS/mbedtls/pull/3243

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
---
  package/uacme/Config.in | 4 ----
  1 file changed, 4 deletions(-)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index d693436115..58b7c534e7 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -19,7 +19,6 @@ if BR2_PACKAGE_UACME
  config BR2_PACKAGE_UACME_UALPN
  	bool "enable ualpn"
  	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS
  	select BR2_PACKAGE_LIBEV
  	help
  	  Build and install ualpn, the transparent proxying tls-alpn-01
@@ -28,7 +27,4 @@ config BR2_PACKAGE_UACME_UALPN
  comment "ualpn needs a toolchain w/ threads"
  	depends on !BR2_TOOLCHAIN_HAS_THREADS
  
-comment "ualpn needs either OpenSSL or GnuTLS"
-	depends on !(BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS)
-
  endif
-- 
2.11.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
