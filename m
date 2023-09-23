Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AF3CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 07:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 705374144F;
	Sat, 23 Sep 2023 07:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 705374144F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SiYrSkBNRWdl; Sat, 23 Sep 2023 07:22:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A06E41AB6;
	Sat, 23 Sep 2023 07:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A06E41AB6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 452A01BF3DF
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7B07820C3
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7B07820C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B3AeVnJiBUzu for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 07:21:51 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EFD1820F1
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 07:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EFD1820F1
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31f71b25a99so3225884f8f.2
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 00:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695453710; x=1696058510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kk+Ti9C43u5h1XHuxWx/rfKTPpzTEcOEo1iUV3Tpd04=;
 b=ZUkYpLt78Eljpmyj5Rz1/XO6bC66cOs85O8y385C7+mUoik4z06yHfpJlEDIJLvM8H
 96d2MazQnm1fUzullriZrzfDYeXG1gJSjImKOQHUyTfDXY7+4SG+0hDxDrC8zCWrMRPF
 U78mLTh5+0ly24qoNBmrQHWkWOVdxLzaBL8aRu982CCrJcJLPfHSTDTyBklWdOwgLcc1
 icHTku0e26iLv7mQHTr26g4FTeUF+/USXPhB4ZrHrTOUfu49X6sOtcqOtrmj6wzN1JxW
 jwe5LR1JkE7O7JYMAAUj9JUYkofwIyivtxfrFh7LUWy6AzLqhoxCRaZoJa52jnrePJLM
 o7bQ==
X-Gm-Message-State: AOJu0YybaXbhXzVbBiZiUoHOtxo3U4VymIf5TQqgECFaR4iqUCbYKPa1
 FZANvf3+pNGB+60JHqrT+gb7MOJaHiI=
X-Google-Smtp-Source: AGHT+IFD6pxzQNeVu2JhNutd8lTWmJ3IMfBhNkFf/aL2phx9fu+kqZ6vJUA4yjnsb/nXlLzglKh6nQ==
X-Received: by 2002:adf:f485:0:b0:31d:c3d2:4300 with SMTP id
 l5-20020adff485000000b0031dc3d24300mr1413669wro.71.1695453709445; 
 Sat, 23 Sep 2023 00:21:49 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 d4-20020adffd84000000b0031f34a395e7sm6156999wrr.45.2023.09.23.00.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 00:21:49 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 23 Sep 2023 09:21:23 +0200
Message-Id: <20230923072133.3122644-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923072133.3122644-1-francois.perrad@gadz.org>
References: <20230923072133.3122644-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695453710; x=1696058510; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kk+Ti9C43u5h1XHuxWx/rfKTPpzTEcOEo1iUV3Tpd04=;
 b=RgYXGZOwzFvTkOsunwUum5f+cCePU0E1RxMh0lKO4OhPe3HEIr4Dnqu1a7dFymfvlx
 V4xQvu2JxBD6ugZpH5IPQhZ+f3hfi9hwREZ1xHGZzxttOeAlAq5O1fOmGMvWm2T3Q7qz
 r5G8jrD5qNGudQfYm+CWoQDuZKS9SnXuzAGy7AHDNiSdZGbDM2yY6FCbJCYJtbx8XqjP
 ucEq6kvC2YFqCEMDHj9w/EgRoHkR8q1co6CDsQIMnB8xiYmN5kVnIgZ+CuW9uAnbDHOG
 ZKOT2TMpWrk+pH6R/hooTjDHhdPx2kHH2Cc4tvysyfhQ4H1aeSVe5CSuEpBcvOfq56Ir
 u+9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RgYXGZOw
Subject: [Buildroot] [PATCH v2 02/12] package/perl-exporter-tiny: bump to
 version 1.006002
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

move homepage to https://exportertiny.github.io

LICENSE: update copyright dates & remove trailing spaces
see https://metacpan.org/release/TOBYINK/Exporter-Tiny-1.006002/diff/TOBYINK/Exporter-Tiny-1.006000#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-exporter-tiny/Config.in               | 2 +-
 package/perl-exporter-tiny/perl-exporter-tiny.hash | 8 ++++----
 package/perl-exporter-tiny/perl-exporter-tiny.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-exporter-tiny/Config.in b/package/perl-exporter-tiny/Config.in
index 04839ac15..c3ac89ba2 100644
--- a/package/perl-exporter-tiny/Config.in
+++ b/package/perl-exporter-tiny/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PERL_EXPORTER_TINY
 	  an exporter with the features of Sub::Exporter but only core
 	  dependencies.
 
-	  https://metacpan.org/release/Exporter-Tiny
+	  https://exportertiny.github.io/
diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.hash b/package/perl-exporter-tiny/perl-exporter-tiny.hash
index 0ecdf7848..0e16f92b1 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.hash
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  2d555e289eac6450052e8683c292cbf7  Exporter-Tiny-1.006000.tar.gz
-sha256  d95479ff085699d6422f7fc8306db085e34b626438deb82ec82d41df2295f400  Exporter-Tiny-1.006000.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  0545ee8f4edcb9dc5a87b21ed25edd74  Exporter-Tiny-1.006002.tar.gz
+sha256  6f295e2cbffb1dbc15bdb9dadc341671c1e0cd2bdf2d312b17526273c322638d  Exporter-Tiny-1.006002.tar.gz
 
 # computed by scancpan
-sha256  a4f85c6f4d6e8bdd37b7ab08013e3e3bee1fe8e910e20f8f54d5025ffe40f384  LICENSE
+sha256  1a2929dacaef239beca27a85f7f97b793628dfb22f07fdfb406cb6f3f0d22a6b  LICENSE
diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.mk b/package/perl-exporter-tiny/perl-exporter-tiny.mk
index 489ee54e1..715070623 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.mk
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_EXPORTER_TINY_VERSION = 1.006000
+PERL_EXPORTER_TINY_VERSION = 1.006002
 PERL_EXPORTER_TINY_SOURCE = Exporter-Tiny-$(PERL_EXPORTER_TINY_VERSION).tar.gz
 PERL_EXPORTER_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_EXPORTER_TINY_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
