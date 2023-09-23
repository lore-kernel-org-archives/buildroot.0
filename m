Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E162CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 07:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B947741AB4;
	Sat, 23 Sep 2023 07:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B947741AB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2CMx7xzuvsi; Sat, 23 Sep 2023 07:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 029E041AB5;
	Sat, 23 Sep 2023 07:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 029E041AB5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6E9F1BF3DF
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FACC82143
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FACC82143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6mHPZbbIjxeT for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 07:21:54 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3725F820C3
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 07:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3725F820C3
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32167a4adaaso3187319f8f.1
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 00:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695453712; x=1696058512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0aiaIHJPlE2oMGBninYIxHJfnbp5jlDknbzkHS4mow4=;
 b=EKqOVAbzqOy6L1Oy05vbkUCAVFDsQZep2xFgGmFXpXAz7h7BY9HqOvXi6O/tLm3Fzj
 wSLdDJDgw9x8QN+ZZ6IEwP3xZqCZAXvxrLhGLs2bVjiwGdb+vmlN3J3ATRi8wMak4K4F
 dXU9D6V4984cRuWLJeElOcGkdrl+ksSo9WIK8+0DX4S8TpKoeD4C1u636z9A43Q/CSg8
 AJhB9Bz3mqfQvb6SvQ25bGqM1zRAyKsHqRMseHm0XVbJOlxalzrGfwKqN77GFQjkzOlt
 Ccr+eRBF3iPsseaIxdFci1oWLNr/wCx7wx1TpOFZNogVET3K8+1V2FEMSthecTbrT2GA
 6I5g==
X-Gm-Message-State: AOJu0Yxe4W+jiXnMTjAmt5Qrf7t0vl1xn9r3hfpqgsctsE6Fh7FmJa5q
 9lfgDR5uDGvj6B21EADkweTM+nhknj8=
X-Google-Smtp-Source: AGHT+IFrEHTzvpTSBDBXu46TyXqRfaQRnLk/xeBhlUKRw8vSUZF0yVOcld6kYUnROd/dC8lsH0kwEA==
X-Received: by 2002:a5d:6101:0:b0:321:4df5:b860 with SMTP id
 v1-20020a5d6101000000b003214df5b860mr1530449wrt.34.1695453712322; 
 Sat, 23 Sep 2023 00:21:52 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 d4-20020adffd84000000b0031f34a395e7sm6156999wrr.45.2023.09.23.00.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 00:21:52 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 23 Sep 2023 09:21:27 +0200
Message-Id: <20230923072133.3122644-6-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923072133.3122644-1-francois.perrad@gadz.org>
References: <20230923072133.3122644-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695453712; x=1696058512; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0aiaIHJPlE2oMGBninYIxHJfnbp5jlDknbzkHS4mow4=;
 b=DKL6dpBmgC3WFUjRnMqS8pCMUF9/l+AA7+VY4Sv+k5BjrkSBPFD3YdvZYSkiYVrmOl
 gmyaEzYRQrD7ll1Wcf7Ymac6JgzZVitSMHDnGUm1kiwjJfuC+WR4nlVIiubmvfjcfRZV
 6xFij4emRhgTPfp04A2tGj7MxWsbjLgVf3GVUmuK4OTnx8Pt+29ZH+qiMv/+YJX5bDBR
 keDrXt4Vwkd1+LjTjXnRRjHtWft92khdBZv7EZahkmTv2VLEamaIH+s0hAkkJ9RSQEY2
 ZkgjtxOpyMJpV8LRtHSOdSypbCS0z+m3QmuoPNCNWyd3QhclyP/ZYwatlLITVv9mtvvM
 aDcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DKL6dpBm
Subject: [Buildroot] [PATCH v2 06/12]
 package/perl-mojolicious-plugin-authentication: bump to version 1.39
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

LICENSE: remove trailing spaces
see https://metacpan.org/release/JJATRIA/Mojolicious-Plugin-Authentication-1.39/diff/JJATRIA/Mojolicious-Plugin-Authentication-1.37#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-mojolicious-plugin-authentication.hash           | 8 ++++----
 .../perl-mojolicious-plugin-authentication.mk             | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
index 34362f5d8..fe39b093c 100644
--- a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
+++ b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  c475f2d3962441698b178ad1bd7d2e29  Mojolicious-Plugin-Authentication-1.37.tar.gz
-sha256  a7ed206725b7b395d4fca12e3f1d923da644d913333ff48ea231e064ecb1abb6  Mojolicious-Plugin-Authentication-1.37.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  141dd090f6d8470a0d3483dc1f7aaa20  Mojolicious-Plugin-Authentication-1.39.tar.gz
+sha256  9f99cbdf5cacaa3fa3f961bee94de97226d177a36a15e7ba303ae79d132874d1  Mojolicious-Plugin-Authentication-1.39.tar.gz
 
 # computed by scancpan
-sha256  37d219684a6c5f8754435fb0dd36a779121e416553fd6a75e22a7545039d1021  LICENSE
+sha256  a2b15d79eaf2f13f756816abfe4d3d3fb4c4c206e7fb1a36abb3e741583aac26  LICENSE
diff --git a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
index 57c356eee..1d5e2511f 100644
--- a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
+++ b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION = 1.37
+PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION = 1.39
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SOURCE = Mojolicious-Plugin-Authentication-$(PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION).tar.gz
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JJ/JJATRIA
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
