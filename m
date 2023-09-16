Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EF1CD37BF
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 803B24116C;
	Sat, 16 Sep 2023 15:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 803B24116C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3fZJ1TPJ4Dd; Sat, 16 Sep 2023 15:46:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B90EF409EF;
	Sat, 16 Sep 2023 15:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B90EF409EF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07D0C1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6787A81E0B
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6787A81E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRc_lenREeEN for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:44:19 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 720A781CA3
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 15:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 720A781CA3
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-32008e339adso178761f8f.2
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 08:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694879057; x=1695483857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZY0rCPxAEhncMzxxVKaGQC/zNy1jTKXuOa9Bylb26kw=;
 b=Ke+GSK3E5DCkRMAS8tcu/s0CNiqj2IiGkE2xHGURNIYy8sVPJ4r9/LTFGE8lEYbObF
 CDh5oDxv+n4Nox4c/reePnZa56sShHrXpU7qTxuIyfAcnNq2gWu87Xqq2zp5AxNM1FYq
 +PX3KKzou9UZ94n64XbkmwcSronh2qjEsYjbkuLeAkoe5cmxRATv/mXH9WCnZdCayrMN
 OtaUbNrDI7jh7Tgq0LlbNN7TOlfQ9rntIh8pEscZvp8RAWHay2QYSGtu5b55uyk/InfX
 ahQP9DcUrb8i+zjmC4ZXdJAf9IaIBr8aKpzRyzGDn6Lqr19ja8z9UuTRd3vdbPtiJbww
 snCg==
X-Gm-Message-State: AOJu0YxpUPWLMkqJXWK5cz0CeMoxIVMy0r1Fnt+xmbb8UIyLbC5d3AoB
 vNsCJGBQo9MSWmoFr27FpfcKdcJfh8I=
X-Google-Smtp-Source: AGHT+IEotiZb9Mg+uIO8NelkIQYGLe35iHiS+7PzHtwmi9krH1T92dT7jafvA4wfdI6+5OqAdVKrtg==
X-Received: by 2002:adf:da47:0:b0:314:4437:beab with SMTP id
 r7-20020adfda47000000b003144437beabmr3221828wrl.55.1694879057491; 
 Sat, 16 Sep 2023 08:44:17 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0031de43fe9bfsm7522010wrw.0.2023.09.16.08.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:44:17 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Sep 2023 17:43:48 +0200
Message-Id: <20230916154351.2747233-13-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230916154351.2747233-1-francois.perrad@gadz.org>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694879057; x=1695483857; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZY0rCPxAEhncMzxxVKaGQC/zNy1jTKXuOa9Bylb26kw=;
 b=clTnyAMZ9ZLjs8qKlflsmB38K3SgGkNEOTLLmDOS/o4Ey39uV3jxrWwZpfGPg+SLkQ
 /uGjx57Xck50njTuADMQ3ScmeM0RVIOmIXHzDmU4lrvWVf6RnyPdRbBuGFb4UaEoKIOH
 npmt9LxbdyiEoavrEKj8mcdrkRicQmQJAshqgmWaNLP52NHTgHrw01wqbULtoeNrIajj
 2XcbTThlwesvjyBu+ZYNYKNpeYnn6+qD9Tc8X3RN46tvKpHaB0JPo1ZcL6o31gIdIFHv
 dHcmdh4SK6Y5g+an3oT0FOs86kG49DrfVLLX0ul/aIAqwDxZV80CDdPi2LfSi7su7QOq
 hzPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=clTnyAMZ
Subject: [Buildroot] [PATCH 13/16] package/perl-sub-install: bump to version
 0.929
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
see https://metacpan.org/release/RJBS/Sub-Install-0.928/diff/RJBS/Sub-Install-0.929#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-sub-install/perl-sub-install.hash | 8 ++++----
 package/perl-sub-install/perl-sub-install.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-sub-install/perl-sub-install.hash b/package/perl-sub-install/perl-sub-install.hash
index bbac2a637..834e589ee 100644
--- a/package/perl-sub-install/perl-sub-install.hash
+++ b/package/perl-sub-install/perl-sub-install.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  e1ce4f9cb6b2f6b8778b036c31afa5ab  Sub-Install-0.928.tar.gz
-sha256  61e567a7679588887b7b86d427bc476ea6d77fffe7e0d17d640f89007d98ef0f  Sub-Install-0.928.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  81baf186c62c71f0935c3ccf1c5964c8  Sub-Install-0.929.tar.gz
+sha256  80b1e281d8cd3b2b31dac711f5c8a1657a87cd80bbe69af3924bcbeb4e5db077  Sub-Install-0.929.tar.gz
 
 # computed by scancpan
-sha256  ad5fb5c05003488f924c60ead21694d629055c9db2ee2d9dd0cf0041b9fedaca  LICENSE
+sha256  0150501749fc390e1c747739a7c1d7661607f8f1d9a9f2ad279664f12e46104e  LICENSE
diff --git a/package/perl-sub-install/perl-sub-install.mk b/package/perl-sub-install/perl-sub-install.mk
index 85d60caf5..5e02a37eb 100644
--- a/package/perl-sub-install/perl-sub-install.mk
+++ b/package/perl-sub-install/perl-sub-install.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_SUB_INSTALL_VERSION = 0.928
+PERL_SUB_INSTALL_VERSION = 0.929
 PERL_SUB_INSTALL_SOURCE = Sub-Install-$(PERL_SUB_INSTALL_VERSION).tar.gz
 PERL_SUB_INSTALL_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
 PERL_SUB_INSTALL_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
