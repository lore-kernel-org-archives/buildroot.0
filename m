Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80EBEE0214
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 07:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DE3760A65;
	Wed, 11 Sep 2024 07:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yx9dUeaV8sj; Wed, 11 Sep 2024 07:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D22760A70
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D22760A70;
	Wed, 11 Sep 2024 07:55:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC1601BF83B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 07:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E420181099
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 07:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5vvZjtyh1Dq for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 07:55:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D4A7D81212
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4A7D81212
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4A7D81212
 for <buildroot@busybox.net>; Wed, 11 Sep 2024 07:55:51 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42ca573fd5aso45181085e9.3
 for <buildroot@busybox.net>; Wed, 11 Sep 2024 00:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726041349; x=1726646149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YIA2Va+Uzk1ohHGreGeuJO9li0wx9EaowSyuDKFpbL0=;
 b=thGBTEYwGWiE3IxIdEoFESxIyREsope2N1XFH/tA9ojbKBY8tzHgrJAZLvg4uQX5zH
 jCyvl0XVzBQ8Oo3sC2QG057Ft5HstZRRaH1oDAg5heUPgld7HROo9x8G3EXEOlOoOQfv
 YVUBY6BP0DSutChDyrNECyeXa1/FP5hXDXlqhu/3WHAtX1WwOG4iq79qxJuV6iJUZOYH
 8kUQvn+Pfvc4+2AyPC/0D/K4VlKa0kmAbS8CPwCOtWs+cDaeHNKj0gsMowbP9pRAaTNi
 Wk0IAKknJVBeRuBYdU75cYkncOgHw4LHPfc2frf/KQwADgGCPADnfLuE8zDe1MdBf9ps
 MgUw==
X-Gm-Message-State: AOJu0YySOztauErAWH8B6NST49cXcOCk48HHgvQKnhOASvclYJDZI/75
 Ddac8BzNANH9FesxS3mlfMN9UukOS86/Ytxx3PWOHGDfIq/WA0cCS6GeIN0slb7ctg0+WEFEESs
 Lnw==
X-Google-Smtp-Source: AGHT+IHbcdkUnPQh47WBnFmgv7hIQEBVaKFQ+9vrp7+n0m519sVEicvpzWGZbJwwOhtj76b8BzZlpg==
X-Received: by 2002:a05:600c:5025:b0:42c:bc04:58a5 with SMTP id
 5b1f17b1804b1-42cbc0458c9mr49799385e9.33.1726041349336; 
 Wed, 11 Sep 2024 00:55:49 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb8b7fcsm134799525e9.47.2024.09.11.00.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 00:55:48 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 11 Sep 2024 09:55:44 +0200
Message-ID: <20240911075544.3455716-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240911075544.3455716-1-francois.perrad@gadz.org>
References: <20240911075544.3455716-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1726041349; x=1726646149; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YIA2Va+Uzk1ohHGreGeuJO9li0wx9EaowSyuDKFpbL0=;
 b=jUiT9aa9UQXClKXF9XdVIGwlEKU4lAAMflLO7CMGXzEb5asnEDeCTUyKAfFBLfbjPy
 Pmq042euN/H8qgCmlbYmiwW9fK+z2aZTsKc8fnAxVWNuKaEVgFUgPXmZYtX7ahIYiwQ4
 m2LJI5jJi+LxiKRnaSn4SCbfCp5K3prA2YWynmXB9dh9d2wI8rZY8zZxCOYBNJLm+ATb
 YWr4LD+71I/hqQitGUvuMGIRxlk9NNq1R2ptAWYaHwThXQNKkVpRPnU8sTv2V4rYPotD
 cDgIQTOO+BoPQFnzac5xIkG84Q1/sIHxLHRB1/RuLuybadjT+T7qfyYlpY2Iu86Pvew7
 J2Og==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=jUiT9aa9
Subject: [Buildroot] [PATCH 2/2] package/perl-uri: bump to version 5.29
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
 package/perl-uri/Config.in     | 1 +
 package/perl-uri/perl-uri.hash | 4 ++--
 package/perl-uri/perl-uri.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/perl-uri/Config.in b/package/perl-uri/Config.in
index 3f51c517f..a09f30178 100644
--- a/package/perl-uri/Config.in
+++ b/package/perl-uri/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_URI
 	bool "perl-uri"
+	select BR2_PACKAGE_PERL_MIME_BASE32 # runtime
 	help
 	  Uniform Resource Identifiers (absolute and relative).
 
diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index c10a829e9..fb70f0c26 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  9b45e7635f0968deabe377fc4c99a8b5  URI-5.21.tar.gz
-sha256  96265860cd61bde16e8415dcfbf108056de162caa0ac37f81eb695c9d2e0ab77  URI-5.21.tar.gz
+md5  34cf48b69c4fbcc40cfebac94af39424  URI-5.29.tar.gz
+sha256  a34b9f626c3ff1e20c0d4a23ec5c8b7ae1de1fb674ecefed7e46791388137372  URI-5.29.tar.gz
 
 # computed by scancpan
 sha256  a1730c55839ce3c9182c92e3387ba8f683ad6ab8b4a3257553a20c4db194c2cf  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index aa0c1ed8b..d02a729dc 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.21
+PERL_URI_VERSION = 5.29
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_URI_LICENSE = Artistic-1.0-Perl or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
