Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7553CCE7A8C
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 07:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A09041ABD;
	Sat, 23 Sep 2023 07:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A09041ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aIjLg3w5JO3s; Sat, 23 Sep 2023 07:23:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37FA741AB4;
	Sat, 23 Sep 2023 07:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37FA741AB4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E16C01BF3DF
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9CDF82143
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9CDF82143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XRh9H76Uyl5u for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 07:21:56 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD47882141
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 07:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD47882141
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32167a4adaaso3187336f8f.1
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 00:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695453714; x=1696058514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AbuEW8SwQgbLyShJ9PvKy8er37lap5RHkb6CsEDBzww=;
 b=jrYXsIcnLrlz3KhnfDeam6e2M9zXarUvKl4ONCyYm422Xu/kKmpT4fRl+wUKZOv8J+
 VmZZ5/vCSg3WmHNLmcW2lg9NRfctzfahVK1XmbYSwSQsrEA5tmI5R4qxxS+7YGDp5cAi
 zaGi7j4AOXgU5hsGfBNwkq8hF7Fb6y+ukDqTgG1ahRmPfzjRJU38uTzUVgcP/yAlwjNU
 q8q33pD+Jmt9K4CzUG9LuXiFCJlf2q6f+EL65O/C2SuZInMUxE5nlr0KW9bcMt4pUcL+
 cbZ4HM1SNMePyN0T52OPtTZ3JjaeiVQ+wwnMOJttLigglkSfWVNMRcMVf+iaAax7FFiG
 436Q==
X-Gm-Message-State: AOJu0YxXBX38IeSnIflFyh/jc8OkhYOhNNUVhFFExJkywHWM8KU3UDnn
 SNOx5t5anLVywi3G6o8THAPFVPMvweg=
X-Google-Smtp-Source: AGHT+IFKrOhBDhYmOQ5rdw+l+iaoxj4GoZZMd333ar0SUGXQ4B4v9CRwjSsyUSVtTEYd5ZV9kbprvg==
X-Received: by 2002:adf:e405:0:b0:31f:b0ba:f2ce with SMTP id
 g5-20020adfe405000000b0031fb0baf2cemr1550998wrm.9.1695453713877; 
 Sat, 23 Sep 2023 00:21:53 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 d4-20020adffd84000000b0031f34a395e7sm6156999wrr.45.2023.09.23.00.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 00:21:53 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 23 Sep 2023 09:21:29 +0200
Message-Id: <20230923072133.3122644-8-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923072133.3122644-1-francois.perrad@gadz.org>
References: <20230923072133.3122644-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695453714; x=1696058514; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AbuEW8SwQgbLyShJ9PvKy8er37lap5RHkb6CsEDBzww=;
 b=e/Nb6hnZuQ1p7tUvVEXTCg0fuDjqa3LD3Nn9Xucr2XWIL+BmIlqfiq3/Czhy24e9hr
 FgGxb8sPz2DbMT7NPld35qChsUkKB0Yg9MBSctAhgv7dcmeUgEDJbBA8ii0RlKRvCn9J
 Pc6SAVk2OlON9Wls04d/yXOSHXOfSL5wSuzRWymun1iG6xZNn4OJJC2+1vN6kK/pBgSc
 YSng4fHvYmECK5cNf0CiW3dZhinCs6APs8WZEJioE2opG+DgJXaCntvwtxlXH3UOBrH2
 bvX908MCmskiulPWQmfzbLla9AoTBzXSMKdDe8a58tEVUnE6RrrrcmYVqLgrIVcFPahK
 mpjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=e/Nb6hnZ
Subject: [Buildroot] [PATCH v2 08/12] package/perl-package-stash: bump to
 version 0.40
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

LICENSE: update copyright dates && remove trailing spaces
see https://metacpan.org/release/ETHER/Package-Stash-0.40/diff/ETHER/Package-Stash-0.39#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-package-stash/Config.in               | 4 ++--
 package/perl-package-stash/perl-package-stash.hash | 8 ++++----
 package/perl-package-stash/perl-package-stash.mk   | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/perl-package-stash/Config.in b/package/perl-package-stash/Config.in
index 6b7ca2478..05506c242 100644
--- a/package/perl-package-stash/Config.in
+++ b/package/perl-package-stash/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_PERL_PACKAGE_STASH
 	select BR2_PACKAGE_PERL_DIST_CHECKCONFLICTS # runtime
 	select BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION # runtime
 	help
-	  routines for manipulating stashes.
+	  Routines for manipulating stashes.
 
-	  http://metacpan.org/release/Package-Stash
+	  https://github.com/moose/Package-Stash
diff --git a/package/perl-package-stash/perl-package-stash.hash b/package/perl-package-stash/perl-package-stash.hash
index 0bbac515e..329d2dbbb 100644
--- a/package/perl-package-stash/perl-package-stash.hash
+++ b/package/perl-package-stash/perl-package-stash.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  287d80c9115c9230912aca684f8ca92e  Package-Stash-0.39.tar.gz
-sha256  9165f555112e080493ce0e9129de0886da30b2593fb353a2abd1c76b2d2621b5  Package-Stash-0.39.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  7a2922941cc2aad6a52642e4fb13d07b  Package-Stash-0.40.tar.gz
+sha256  5a9722c6d9cb29ee133e5f7b08a5362762a0b5633ff5170642a5b0686e95e066  Package-Stash-0.40.tar.gz
 
 # computed by scancpan
-sha256  810b319a6f4a53c9cbbef513da17b2f0c872accd149bb889f153f4b78cf8cbb8  LICENSE
+sha256  5f82745d355b43f451c557642618cbd903251192b89f31ca53eaab90c35aeb7c  LICENSE
diff --git a/package/perl-package-stash/perl-package-stash.mk b/package/perl-package-stash/perl-package-stash.mk
index bc116abca..dd93314d8 100644
--- a/package/perl-package-stash/perl-package-stash.mk
+++ b/package/perl-package-stash/perl-package-stash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PACKAGE_STASH_VERSION = 0.39
+PERL_PACKAGE_STASH_VERSION = 0.40
 PERL_PACKAGE_STASH_SOURCE = Package-Stash-$(PERL_PACKAGE_STASH_VERSION).tar.gz
 PERL_PACKAGE_STASH_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_PACKAGE_STASH_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
