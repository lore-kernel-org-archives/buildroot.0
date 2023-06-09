Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C7EC7EE2E
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 16:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70B2841A26;
	Fri,  9 Jun 2023 16:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70B2841A26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZnaEUjnwS29; Fri,  9 Jun 2023 16:20:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AD8D418FD;
	Fri,  9 Jun 2023 16:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AD8D418FD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 691191BF2AA
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F50283C65
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F50283C65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1oJZ8eyaMWzP for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 16:20:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FF6583B97
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FF6583B97
 for <buildroot@busybox.net>; Fri,  9 Jun 2023 16:20:27 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f6da07ff00so19919445e9.3
 for <buildroot@busybox.net>; Fri, 09 Jun 2023 09:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686327625; x=1688919625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qNZnxI3oUKp9uDCzLHjhRv0jKvry2qeLUfNoof9hOEg=;
 b=hNeMvofppbSe86JXSsa3KdQHSH5BWtvrNqOSNkPWkcDLEr4lo4mzMknzHIPxr+Zvhj
 FIfXqt8bmclYQmtrPWe/YDy0OInsxDiHiqiPGI8FOjw3fuGsgArbROVM9mM+Bx/GGhJR
 +u+hJFOlg3qf5qbALD+yPzhOrrXy7qTItyWjVXBLejq3Hq3n8+KxdbudTFA1VMRWzXve
 t10YvGn6RQOea0AK1GN1zHe75Qn2DbG3e/4T7V2BD7A4lsVscBndfWbJu6bR3WM4YwbZ
 PPwoIU6jGoSH+FBedgUYiN56sea5yxHyY2IRRfR6qrzn70OyomIxj0hZpGHjeGPgwXaH
 6YOw==
X-Gm-Message-State: AC+VfDzSdnc09B4yjLnPLsUYD6QdutozmMuXKUNqLsKDcDu6+H2Aub1s
 jrWBKAkLdLAk3Oh3DMjd21jUwXPyN58=
X-Google-Smtp-Source: ACHHUZ5Pkp9rwDs3N/A9lOi4mD8ujbyd575IlpyZwyJVV8RbQzDOmR3De/srH4YUavYOlkJirysuRw==
X-Received: by 2002:a05:600c:210c:b0:3f7:4961:52b6 with SMTP id
 u12-20020a05600c210c00b003f7496152b6mr1609988wml.25.1686327625396; 
 Fri, 09 Jun 2023 09:20:25 -0700 (PDT)
Received: from vm.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a1c7c13000000b003f7aad8c160sm3141044wmc.11.2023.06.09.09.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 09:20:24 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  9 Jun 2023 18:20:13 +0200
Message-Id: <20230609162018.1231615-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609162018.1231615-1-francois.perrad@gadz.org>
References: <20230609162018.1231615-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686327625; x=1688919625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qNZnxI3oUKp9uDCzLHjhRv0jKvry2qeLUfNoof9hOEg=;
 b=MJwgK+GjFqTnbtpAK2KIrx32UcjbRI+3eZnLfgmGob0qW4+emWTDQm98WpvYyyYyXp
 TAUZmSoMjbgRfd15yCoyvBQD5InmX8DIOeru+2dLMl8uM84We4GC+h759QbnvTCzYjuq
 +sV0ZZISX4iV4rgHm0EcH32sDDJZkbb7Ct3b8zztRRnAdRmxz/XQ36t0reT5fBacYMli
 VXVvPpZDfFo0tt3uGIdCQC2BZCSAUa+oF2+Ba0BSyO95ps353jZWVy9gk/0OwLMlx+l0
 5dJUVvoC2dEcIg1hBVtr3Tvh1czdtO6HwXGbBuK/ooJtls8vjq7cTlh55hMnQ1muvwhW
 fN+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=MJwgK+Gj
Subject: [Buildroot] [PATCH 3/8] package/perl-gd: bump to version 2.77
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
 package/perl-gd/Config.in    | 2 +-
 package/perl-gd/perl-gd.hash | 6 +++---
 package/perl-gd/perl-gd.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-gd/Config.in b/package/perl-gd/Config.in
index 044e60102..bff6244d9 100644
--- a/package/perl-gd/Config.in
+++ b/package/perl-gd/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PERL_GD
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_GD
 	help
-	  Perl interface to the gd2 graphics library.
+	  Perl interface to the libgd graphics library.
 
 	  https://metacpan.org/release/GD
 
diff --git a/package/perl-gd/perl-gd.hash b/package/perl-gd/perl-gd.hash
index 97f1da821..fd9321be6 100644
--- a/package/perl-gd/perl-gd.hash
+++ b/package/perl-gd/perl-gd.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  fb4bacab10ed4f28d52c2aabdaf866bb  GD-2.76.tar.gz
-sha256  693d9e3d709e9188a682cb9090a77b70aac12a04e84128677577b94e4331775b  GD-2.76.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  da3f969367ea2e6d217ec05d3b98bc6f  GD-2.77.tar.gz
+sha256  b56c88b8ef3be016ce29bb62dd1f1b6f6b5fbcaa57fea59e9468af6901016fb5  GD-2.77.tar.gz
 
 # computed by scancpan
 sha256  1e2250289d6df4ba1c24f7550982d7ffaff2c97cd02e847659406e1afd28e83f  LICENSE
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index cd32c7fb8..17c24bc97 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_GD_VERSION = 2.76
+PERL_GD_VERSION = 2.77
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_GD_DEPENDENCIES = host-perl-extutils-pkgconfig zlib gd
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
