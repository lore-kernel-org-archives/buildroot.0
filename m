Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31517C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 10:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7E766153D;
	Wed, 24 Jan 2024 10:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7E766153D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XS0RbcpgnjOL; Wed, 24 Jan 2024 10:37:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C4AD61446;
	Wed, 24 Jan 2024 10:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C4AD61446
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10D401BF94D
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F19D983EB3
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F19D983EB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NBSWmlynvgbq for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 10:35:13 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 593A383EC4
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 10:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 593A383EC4
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40ec34160baso9502815e9.1
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 02:35:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706092511; x=1706697311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=abvn5EAbZesUgYCBrrfE7pBRaU/dN6Uq55NHt4S+E70=;
 b=ITa24Mhj6COvQlJ86R5nbZRckYNvRsWyxPiCaQiUVgOQAu0AgbVIPhHZw/kJn2vroI
 /BjXTVLVlfikjzwGTvBl44e5qkLxfv2y67GvbTs8Vb7xpTdVhFcdoc44NysjWn+Sct28
 UU98C2MXE8MpD+l9tp7hxKwNmOk98ZMoWwc2NiWGfAxgruwKt9cYPKCxgHhwuQs15viA
 mufA7DUrkkEfvTJ9lR/kg7BiZxKatVCHtlFiG9h3B6nXZd/CHpr5qXrWa8Dt2PkOxJUd
 +1WE9LwiV3WiSd7YFsxohZW7SLyXsYCo/fTOwhCNyy65U6zRWmeIIM807nM0/3zr/enH
 x54g==
X-Gm-Message-State: AOJu0YylYR6qllnWhg2Ch5rTqpOrSYolkB20is/tXcaqpagPrQomNSe2
 zZAh2+ZoCY5+FF+LEBlAMWIEHTyAO3Hzc1ogQitYzBy0SARpZv2hnxY0S7wf
X-Google-Smtp-Source: AGHT+IGq9RpAkHcx2zJ005Qwk0jmGQA52Kr7OuOcHEg8Kulk03+Wi1WmjL+KM5hFs81eBhnjBdACqA==
X-Received: by 2002:a05:600c:1385:b0:40e:b0e9:e7d1 with SMTP id
 u5-20020a05600c138500b0040eb0e9e7d1mr1439297wmf.1.1706092511535; 
 Wed, 24 Jan 2024 02:35:11 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b0040e549c77a1sm49195392wmq.32.2024.01.24.02.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 02:35:11 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Jan 2024 11:34:53 +0100
Message-Id: <20240124103453.623733-10-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240124103453.623733-1-francois.perrad@gadz.org>
References: <20240124103453.623733-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706092511; x=1706697311; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=abvn5EAbZesUgYCBrrfE7pBRaU/dN6Uq55NHt4S+E70=;
 b=c3ggosA8G107RSpiYO4wb2jPR8SssTYNOR0xOprmsRLZDiuXnyqrilRMDx1z670uwf
 KLIrxWpD552EiXDPnrc6kT2U4yYIs54notic6kFI05QHFM79MQOAdwfsje5caoIEOnh+
 9itUUiGLtrQ9Iqnwy2lTc18XVUoyV3Upjx67dh5rW5TCcLOs3WZptyMMgUmsz43ovrwa
 TEHOAJn1O8kw/9u3+xhSfVuJxxoaWGG78CG0QxterEGpROsYZG30YLPgwVlnutxX140f
 nnev/2JiATtfqknH+718vSEu290KScStJpeMAgRrtx8RArfMVZ87Glasg0Unh8ZNN5/5
 r1Pw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c3ggosA8
Subject: [Buildroot] [PATCH 10/10] package/perl-posix-strftime-compiler:
 bump to version 0.46
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-posix-strftime-compiler.hash                       | 6 +++---
 .../perl-posix-strftime-compiler.mk                         | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash
index bdc6fd45a..cad4b03f2 100644
--- a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash
+++ b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  3a5ae7d56a5917410c1b661e01ed1a68  POSIX-strftime-Compiler-0.44.tar.gz
-sha256  dfd3c97398dcfe51c8236b85e3dc28035667b76531f7aa0a6535f3aa5405b35a  POSIX-strftime-Compiler-0.44.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  e64777d20d363a1b47acf85774d108da  POSIX-strftime-Compiler-0.46.tar.gz
+sha256  bf88873248ef88cc5e68ed074493496be684ec334e11273d4654306dd9dae485  POSIX-strftime-Compiler-0.46.tar.gz
 
 # computed by scancpan
 sha256  79c2a066104e71602785fd815c5aea6f7db78c19451d68521380083f9c2a8805  LICENSE
diff --git a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
index c11ed5851..f7f6745ec 100644
--- a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
+++ b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_POSIX_STRFTIME_COMPILER_VERSION = 0.44
+PERL_POSIX_STRFTIME_COMPILER_VERSION = 0.46
 PERL_POSIX_STRFTIME_COMPILER_SOURCE = POSIX-strftime-Compiler-$(PERL_POSIX_STRFTIME_COMPILER_VERSION).tar.gz
 PERL_POSIX_STRFTIME_COMPILER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
 PERL_POSIX_STRFTIME_COMPILER_DEPENDENCIES = host-perl-module-build-tiny
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
