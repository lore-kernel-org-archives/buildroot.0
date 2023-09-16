Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE73CD37BD
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 961AE4107F;
	Sat, 16 Sep 2023 15:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 961AE4107F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qslUQvXMhF6E; Sat, 16 Sep 2023 15:45:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D46AF40D9A;
	Sat, 16 Sep 2023 15:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D46AF40D9A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58B501BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA54581E0B
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA54581E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EPjwPn5jTNKx for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:44:17 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA1F481CA3
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 15:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA1F481CA3
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-402c46c49f4so33653445e9.1
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 08:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694879055; x=1695483855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dRyBMXpzeLVcG3ArXa8T4hkAceNmG1b+BBYx3Eqjpeo=;
 b=jwkOsxhZYOinQ+g4qcnwsV1GgAwCNCJGKI+rT98A5VeuepOXTLDT3l8I5ZnxpazXmK
 C2L6Aw2fTnXTrrUN1c0w4k4anRQT7MjCmUuReB+ltmEhvrTJYcl+OIqTPRm7kFwWbU5g
 7bYg8bp3VDgYjJbukdotj6Bq7rBIMUto8475SUTC+qOY0tS6ZijvfGAxhWbDTXEE6zrB
 GBdS+LgeTcBmkhSZE2xUrAIlZwU1JF0kdoFgYWRiUSbcSzS6P0l7fUgtW74DlIo1n/Ts
 /hnStwwtdOlDw37nbg0Lfzox+OwGRTP/I8zgTvb+TtcX3UKFXxqNmdJ2a8ADmWm/LnWQ
 I1mg==
X-Gm-Message-State: AOJu0YwQNj+6qcNGtvhcYIY3ylpdVPRBIM66NEMhuWqiKduCuk6v+EbB
 4w4ZzLjHqHQXKvsBPJkwU0fZ3AYQCe4=
X-Google-Smtp-Source: AGHT+IFQzyYTBMJirtdNZJAr2i4hUgTCtHeu6WQGbS1wpZJ3DAd/h7k+vcD1kTiC65hH+PMRceoCtw==
X-Received: by 2002:adf:ec4f:0:b0:314:ca7:f30b with SMTP id
 w15-20020adfec4f000000b003140ca7f30bmr3743512wrn.54.1694879054764; 
 Sat, 16 Sep 2023 08:44:14 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0031de43fe9bfsm7522010wrw.0.2023.09.16.08.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:44:14 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Sep 2023 17:43:44 +0200
Message-Id: <20230916154351.2747233-9-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230916154351.2747233-1-francois.perrad@gadz.org>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694879055; x=1695483855; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dRyBMXpzeLVcG3ArXa8T4hkAceNmG1b+BBYx3Eqjpeo=;
 b=EZoCrhDpdseWBe7vNgMja35fN4Wg/jDTIpGKTwuvcvCYyNp+mEhInQGhf0XDT9qnsh
 tl0Ux3CigghguQjWLj06eaGYt7USHsD14uoaVVSA/+iyCGWEilXZIPCaz3lLt4KT4RP6
 X52+OHTv1qYXgS3P/URdinUO3Ao296IpnxfByIdEp36aax1PKbPlFd5ZnE6pTzzvfaya
 tRbyQ8/hvg3jtKhiLM2STxsu1iOBGX7IQoE2o183GzDMJVDSrRN7GolWrFEsfj4x131I
 93VWF6nMazlpUWSlWCij/Lkksg3ZXB5WKi/YB5f1R5rygw8A/bYuftKyFPTmwLS0zYzQ
 w3Hg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EZoCrhDp
Subject: [Buildroot] [PATCH 09/16]
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
see https://metacpan.org/release/JJATRIA/Mojolicious-Plugin-Authentication-1.37/diff/JJATRIA/Mojolicious-Plugin-Authentication-1.39#LICENSE

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
