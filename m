Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7E2C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B99F342446;
	Sat, 23 Jul 2022 20:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B99F342446
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O-YEx_yZvMa8; Sat, 23 Jul 2022 20:10:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58B0F422CF;
	Sat, 23 Jul 2022 20:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58B0F422CF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81E901BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 594C64019C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 594C64019C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDeOeaVHG9cF for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:10:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A92C40178
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A92C40178
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:10:35 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id g2so2692618wru.3
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4BFvcgzPtbH4PYBDqaLwK8zFNr8DkR2RU/wZ8E5uAEE=;
 b=YIA8NZkACeRjWJvOU3JmANTBvSASQuWPJtM+edwRdTWkKC5V/+XawfiPqYdi3ZbOlP
 fUTqHUZH6D6JALZWgN4kA/iJ7BZWGaX5227hhzODAePy79pseXnStOmU9Nn3EDkXIWQS
 Q/wJP5ovDFznSt5Q/7IC3z8kbU5EJncydLJb48MvayNBGaJKIyScnjg/2I1uC3LvF0Cy
 Lq0B/rHvIetuIJJqnSxUHnkG7xkkOLZJIM3mF0yxBrkhbeIebIsnzp+Kns/8apqQqeGl
 N8S9KGxP6d+twFyMoqB8KfimLhmIF5ww7Fu7P+D+pnBPu/Y+dHzJVbtY7iTBrnCZSqYf
 9jgA==
X-Gm-Message-State: AJIora/RhpxZ8q0xKbZwBYgbp2w17GPZukEgdcw7GSo6KNmD81apLSE4
 YNnkd3WO5j9lOilWMxi9PLjRL79CswM=
X-Google-Smtp-Source: AGRyM1v00gD1VZtROU7joUNXKQQ+W61JBbQSMBn2wqVufDg0EHDsjGFmwXyYAsyEYNPJ7WFoLQKFzw==
X-Received: by 2002:a05:6000:1a8d:b0:21d:9055:96a6 with SMTP id
 f13-20020a0560001a8d00b0021d905596a6mr3431208wry.245.1658607032766; 
 Sat, 23 Jul 2022 13:10:32 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a056000105200b0021e4f446d43sm7569965wrx.58.2022.07.23.13.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 13:10:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:10:14 +0200
Message-Id: <20220723201014.218864-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4BFvcgzPtbH4PYBDqaLwK8zFNr8DkR2RU/wZ8E5uAEE=;
 b=ZYDZ5zjwWjFNUuIl1LsZXxgZ0OSzVXk7immdM1UPrmd52794pIIuHHRB6en5Hs44yv
 NuqJkLO/Ss3WTSyNGAVOBezCJH4XfdIBwV/T89kXZgiq2CPSZxPPRet/vX0YKOWr3A8h
 7tVZeEQu9WA0EXSaXK40din6xRBTiSP5GIRm+Z24zP+qBZAkNLOsb+7scRtgmj4OlP3p
 6dPM3yP70ueAacwsRxe8kn5mhQD4f0P31B/f+KtAHzQzego/g/Y5LlopjJ2KaVpL5Qu4
 at6EfgnSzMYyEeSdmgcAzwASNJwPuLVYKThupxwamZgwkd9KCcDYRG4zj4wFmb/RlJZo
 +nfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZYDZ5zjw
Subject: [Buildroot] [PATCH 1/1] package/jquery-validation: security bump to
 version 1.19.5
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

- Fix CVE-2021-43306: An exponential ReDoS (Regular Expression Denial
  of Service) can be triggered in the jquery-validation npm package,
  when an attacker is able to supply arbitrary input to the url2 method
- Fix CVE-2022-31147: The jQuery Validation Plugin (jquery-validation)
  provides drop-in validation for forms. Versions of jquery-validation
  prior to 1.19.5 are vulnerable to regular expression denial of service
  (ReDoS) when an attacker is able to supply arbitrary input to the url2
  method. This is due to an incomplete fix for CVE-2021-43306. Users
  should upgrade to version 1.19.5 to receive a patch.
- Use LICENSE.md instead of README.md which is available since version
  1.14.0 and
  https://github.com/jquery-validation/jquery-validation/commit/96b7036eb45375eb4861082d8ca442d94a9c666c

https://github.com/jquery-validation/jquery-validation/releases/tag/1.19.4
https://github.com/jquery-validation/jquery-validation/releases/tag/1.19.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jquery-validation/jquery-validation.hash | 4 ++--
 package/jquery-validation/jquery-validation.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/jquery-validation/jquery-validation.hash b/package/jquery-validation/jquery-validation.hash
index 4dbe07e218..31ecd62bcb 100644
--- a/package/jquery-validation/jquery-validation.hash
+++ b/package/jquery-validation/jquery-validation.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  01ad2ef0a7f9cd413aeb51081651293916da47d20e5c0a59ec62587e58b03564  jquery-validation-1.19.3.zip
-sha256  3e5a99460077c16bf75f6821a30cdac9baa339119ebf63b2a6c49f4f50421ca4  README.md
+sha256  52381e080f266f8bca1a17acd6a4a68be4c2606a8b16f8a12e597cc69f2c0584  jquery-validation-1.19.5.zip
+sha256  f398878cab338b869638bdac1aeae76bf3ac11b2b89da6e0b68bc1a645733440  LICENSE.md
diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index 920ed1cece..1ed37ee73b 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-JQUERY_VALIDATION_VERSION = 1.19.3
+JQUERY_VALIDATION_VERSION = 1.19.5
 JQUERY_VALIDATION_SITE = https://github.com/jquery-validation/jquery-validation/releases/download/$(JQUERY_VALIDATION_VERSION)
 JQUERY_VALIDATION_SOURCE = jquery-validation-$(JQUERY_VALIDATION_VERSION).zip
 JQUERY_VALIDATION_LICENSE = MIT
-JQUERY_VALIDATION_LICENSE_FILES = README.md
+JQUERY_VALIDATION_LICENSE_FILES = LICENSE.md
 JQUERY_VALIDATION_CPE_ID_VENDOR = jqueryvalidation
 JQUERY_VALIDATION_CPE_ID_PRODUCT = jquery_validation
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
