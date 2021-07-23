Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DF0C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:34:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFF7760F23
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFF7760F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ECC54061C;
	Fri, 23 Jul 2021 20:34:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ha7wQrViIjmM; Fri, 23 Jul 2021 20:34:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB43240611;
	Fri, 23 Jul 2021 20:34:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12BC11BF3FF
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA5F283B5E
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DiX7uUNkrW-4 for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 20:33:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06A2183B5B
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 20:33:00 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r2so3646321wrl.1
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 13:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4k8EnsO8dHPMQfTdOAZj24tplBtHxfvaKYoSXaaNquU=;
 b=HhxpAMtvxY2woEw+acgp7QLcwLLwqV9wlA5u+oj91KYSE7k+VeAfVg7Lm8acIPzvgW
 TyazKxVUYfdrIKfu4QA9f4PCy/rIIEKI8NoIMZ5t4BR6/5Nmx1ZrUXhH9zgSX+reB8GS
 dtOAn2nGKrcLbiHyQOllVZHCLbPMa13j+twKhhKWSKIxNMBbTrk2S6sLKxdNzlXqb3Ug
 jFWhb1kL1UmbVupYbTsOtHIIz63MXcl0D3Ph2gQxUXdLJXPZcof8rQT9dwIR/NC9knfC
 mIYDrA7uVQSiRRIuHz2ybJKST0rHNFxOzGiK44Se+WeHBh5Zejoc3PtOm/7fJMgTp4UD
 VEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4k8EnsO8dHPMQfTdOAZj24tplBtHxfvaKYoSXaaNquU=;
 b=jWX/dOv8xV76SYvujcjmKGM7W+5nOilq3+IYRM129c6nyVgTr92KJ6DPZY7j9i4QI6
 5tma2/nqxV9PB0EdS9wT61a/1ea+DOKYqKhgR9J6BQL7uFKTfDGQwrp1mT4ws1YoX6F5
 BFUGUA2HD+p5wFWwHOMJ9J/Tg4q8pWy70MYOkMghw0Ch49MpwTjj2puT277c51unmdhm
 KGpkTJJlkzZ1SbMbz3C4N2fg20dlZUg4YLS7/SpEOSiIatjITqk+nFI3qUA/DKDzd1Ml
 X6hwS/3KyG6tNR4Zb3DvdrqBE1PyXV2hJ8OpNhIhrh1RfOhKuklbr+NE31Q5vHqolcrg
 pVBg==
X-Gm-Message-State: AOAM531yaMDVr2dEOaHX4ALS21abLj3UUeFtUyAH8v9fRI8Ib9ewsXrP
 AiIzgeYh3NxBcgCZ/CI+4y+c6rsnOGc=
X-Google-Smtp-Source: ABdhPJylepWzkrrQ5oKVdK13zBKX7gdT9XyawTTl9NymdIsXOnPsdyJFwsXz7CK7kCRbOJmlYq5U9g==
X-Received: by 2002:adf:f411:: with SMTP id g17mr6952130wro.160.1627072379283; 
 Fri, 23 Jul 2021 13:32:59 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id n17sm2128422wmo.18.2021.07.23.13.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 13:32:59 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 23 Jul 2021 22:32:39 +0200
Message-Id: <20210723203242.2531909-6-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723203242.2531909-1-francois.perrad@gadz.org>
References: <20210723203242.2531909-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/9]
 package/perl-mojolicious-plugin-authentication: bump to version 1.37
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mojolicious-plugin-authentication/Config.in      | 2 +-
 .../perl-mojolicious-plugin-authentication.hash               | 4 ++--
 .../perl-mojolicious-plugin-authentication.mk                 | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-mojolicious-plugin-authentication/Config.in b/package/perl-mojolicious-plugin-authentication/Config.in
index 4fa01806f..2f51989f2 100644
--- a/package/perl-mojolicious-plugin-authentication/Config.in
+++ b/package/perl-mojolicious-plugin-authentication/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION
 	help
 	  A plugin to make authentication a bit easier.
 
-	  https://metacpan.org/release/Mojolicious-Plugin-Authentication
+	  https://github.com/benvanstaveren/Mojolicious-Plugin-Authentication
diff --git a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
index dc14b7e68..34362f5d8 100644
--- a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
+++ b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  7eda1fadc272de097aa8d58abb9197ad  Mojolicious-Plugin-Authentication-1.36.tar.gz
-sha256  8bc48363925261b253e3e10eacf60d71d9930de772936b7f3e5221691841f9bb  Mojolicious-Plugin-Authentication-1.36.tar.gz
+md5  c475f2d3962441698b178ad1bd7d2e29  Mojolicious-Plugin-Authentication-1.37.tar.gz
+sha256  a7ed206725b7b395d4fca12e3f1d923da644d913333ff48ea231e064ecb1abb6  Mojolicious-Plugin-Authentication-1.37.tar.gz
 
 # computed by scancpan
 sha256  37d219684a6c5f8754435fb0dd36a779121e416553fd6a75e22a7545039d1021  LICENSE
diff --git a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
index 63500864d..57c356eee 100644
--- a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
+++ b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION = 1.36
+PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION = 1.37
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SOURCE = Mojolicious-Plugin-Authentication-$(PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION).tar.gz
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JJ/JJATRIA
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_LICENSE = Artistic or GPL-1.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
