Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCDAC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24F874041C;
	Sat, 23 Jul 2022 19:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24F874041C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMJFrnyaDwA3; Sat, 23 Jul 2022 19:28:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BB4540566;
	Sat, 23 Jul 2022 19:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BB4540566
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59EE11BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3496240354
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3496240354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HRdoYRQ0S3fG for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:28:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34EAC401B2
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34EAC401B2
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:28:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d13so3001786wrn.10
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qUCOcxnrju37wCyteE/HLGxNJYnWdHpgudZNXNJ8o6s=;
 b=1MW2XO1jepCwso2QVSNVN9kdaRrwHLxU1RlwYGSw5wJ3ni5A0PiHbgJvM/xF1SNoc6
 XeKRbHTLu2e1Nsj9pfjGBn+mf4MF31MYFXs5Ip3jAgSRS8R/U3Bn6XQMVe7W3uI12xSD
 A/g78G45+TP9keJ6RSxyS29aOCSz2yuO9I1LDIBACj6MjfpnJTFXz9VxMLI5tdtM4Apv
 +Ynl00HCNhBxOW97FXblktF5i0pEGlXLYoGlV6hEPq1vvfeCvQv5gBwDpuXhILA65rFR
 nj24hEkOcn/efyTnK7bITYn7NQEn57PHDzNPRg/Kaxo5ESnOgCwXk78aAuTw73qLU1eu
 oA0A==
X-Gm-Message-State: AJIora9UBWWcDSPHtqohmknlwu8+HzR1V3nAQ2OajSwfUzRtSYb4D6Sy
 kxaX1VvKpA7/nzZEkNZKojaJ78cu+sY=
X-Google-Smtp-Source: AGRyM1uoqeyP6kW3U9GdTDtoIncoCi1vVS1aWUpQFtxC85YbeDhIb5mFphwLuQdIP/76NzErqSoyMg==
X-Received: by 2002:a5d:60cc:0:b0:21e:5844:578a with SMTP id
 x12-20020a5d60cc000000b0021e5844578amr3392243wrt.505.1658604526125; 
 Sat, 23 Jul 2022 12:28:46 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a7bc8d2000000b003a327b98c0asm8680188wml.22.2022.07.23.12.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 12:28:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 23:28:07 +0200
Message-Id: <20220723212807.4912-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qUCOcxnrju37wCyteE/HLGxNJYnWdHpgudZNXNJ8o6s=;
 b=GLfsMX3nfQp88vSd9ZJpFlmc6H+xPxZxOApAmJ95LxzUbj27bxaD3zRGdBjD/KVEt4
 MkQJFoiS9aZ+kvXKHr+WHOeJtVe0QhoJFYIMEj134qY3PixZCMwmG0LtkCbmEWFjunA7
 OZ4Y9PkjMJtHPJ+WUJSz5xfziVarRrH85qr7W0xFJWku1pbKQeWYlG6YWG4LZyFPxzsd
 aWhCj2Tft66Z8JmHIEjXMoHl9Uf3+gAtL7YVIkaQ0jMbPAyivjh8GuqmVmPWUiytJW+h
 DqrYOwr+ucyITz0Cw03Mbrf9IAZzOUGfazxjbXinczkKI6bvm4bjrsG0X6DV2eynd4r3
 Sptg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GLfsMX3n
Subject: [Buildroot] [PATCH 1/1] package/ntpsec: depends on python3
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Depends on python3 instead of selecting it to avoid the following build
failure raised since the addition of the package in commit
27b8d0ba8c4004819e092fb81c0f64f284b3aa4a:

Makefile:576: *** libffi is in the dependency chain of python3 that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/2893c213f49d37a0878dcf14ec68ef991471c70f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ntpsec/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/ntpsec/Config.in b/package/ntpsec/Config.in
index 1e88046420..febfc31a76 100644
--- a/package/ntpsec/Config.in
+++ b/package/ntpsec/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_NTPSEC
 	bool "ntpsec"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_PYTHON3
 	help
 	  NTPsec project - a secure, hardened, and improved
 	  implementation of Network Time Protocol derived
@@ -26,3 +26,6 @@ config BR2_PACKAGE_NTPSEC_NTS
 	  Enable Network Time Security (NTS) support.
 
 endif
+
+comment "ntpsec depends on python3"
+	depends on !BR2_PACKAGE_PYTHON3
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
