Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E79C7EE25
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 16:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6BE040448;
	Fri,  9 Jun 2023 16:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6BE040448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uVt4HmD5_tsI; Fri,  9 Jun 2023 16:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D78F7419FC;
	Fri,  9 Jun 2023 16:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D78F7419FC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6473A1BF2AA
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E26783B97
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E26783B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gkTwU7VLD3Jg for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 16:20:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D95483C65
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D95483C65
 for <buildroot@busybox.net>; Fri,  9 Jun 2023 16:20:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f7fcdc7f7fso13388385e9.0
 for <buildroot@busybox.net>; Fri, 09 Jun 2023 09:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686327627; x=1688919627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W3f2HJff5/jX9BnU3g06ymQDSfT8MVCo+h5Bxr8Q3Bc=;
 b=JFgYmAkzA431GqOSdMAILWpO5eVGmbn5qGbjIQjwEvjhgdrFqadeMSejm2znj5AK+S
 tijT5ofFqWFX6WfIhqK7IFa7hbbfUjyJ0pI2B2DynSEkj1sX94r7PY3NMD/TkUDjqmBS
 7oqp2nDdHg8ZerSpUug5GjIxyE55ChX2kN83V3VrCOoH1kT5L8z4Mar7U38Cu0i88KRm
 wtwuuy2RIVvQqN8LDa+px+Y1NuRSo4dQQ83J1yrZuTzfjAy2+7cxUNuTTWQt+HvCVAzu
 KFuvUoLqadowi8vYD6nk4nxBepNceZW+rWGRbaGD0gow1tt9bXIVnpfY2uN+w247r4gv
 DqfQ==
X-Gm-Message-State: AC+VfDyyra5W2RAwjYhSI78fLK74cMkUPyOHulyJVYHCv1k+VZKwJUiQ
 p5XN47hmZicfktQ0ymTpf70X2Fgmbs0=
X-Google-Smtp-Source: ACHHUZ5Et8R+YcIBZavWIWxSK/bmIgnEbHGI6BSHkfJHereR3i5ihSYMbxfV7aUXgg1I9qpSVStH2g==
X-Received: by 2002:a05:600c:4c17:b0:3f7:3284:4e51 with SMTP id
 d23-20020a05600c4c1700b003f732844e51mr4278786wmp.4.1686327627385; 
 Fri, 09 Jun 2023 09:20:27 -0700 (PDT)
Received: from vm.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a1c7c13000000b003f7aad8c160sm3141044wmc.11.2023.06.09.09.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 09:20:27 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  9 Jun 2023 18:20:15 +0200
Message-Id: <20230609162018.1231615-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609162018.1231615-1-francois.perrad@gadz.org>
References: <20230609162018.1231615-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686327627; x=1688919627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W3f2HJff5/jX9BnU3g06ymQDSfT8MVCo+h5Bxr8Q3Bc=;
 b=SoI0bpvq73DVkgdi/Iow0X9JbAU0IZYB7XwHKZAaBqGSONX1hAoWSsjOEgLqai/GCt
 e4+hpsqjf6MXqXGtGibgDV87BmxTzB9Y9t+FnwacFicp+dJXeBdz3N0hLCd7hxP2lpu8
 YCheVA0rpDHbdQxHZ8Du7+yU8WBcCwV4PBGpIvIRGDwCWvDQHmwWNBOiVxidohvjnprC
 pwS3fLFlfJ80NH88Cgh7HrSwF49Tf3W3rlu+Vy4bRXSfDfzOOR2Azs4sZ2RXry++WCBq
 rfQp6dOCrUJ0MmYnQZVWqHQbgtwE4O0MEHTveokVzJNIidMqYP14ZuvmpSvCrWW5/4aL
 UnHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=SoI0bpvq
Subject: [Buildroot] [PATCH 5/8] package/perl-http-daemon: bump to version
 6.16
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
 package/perl-http-daemon/perl-http-daemon.hash | 6 +++---
 package/perl-http-daemon/perl-http-daemon.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-daemon/perl-http-daemon.hash b/package/perl-http-daemon/perl-http-daemon.hash
index c19b3b955..e297362be 100644
--- a/package/perl-http-daemon/perl-http-daemon.hash
+++ b/package/perl-http-daemon/perl-http-daemon.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  3111b0081d08d8b225f52884033de349  HTTP-Daemon-6.14.tar.gz
-sha256  f0767e7f3cbb80b21313c761f07ad8ed253bce9fa2d0ba806b3fb72d309b2e1d  HTTP-Daemon-6.14.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  51425462790165aeafc2819a7359706f  HTTP-Daemon-6.16.tar.gz
+sha256  b38d092725e6fa4e0c4dc2a47e157070491bafa0dbe16c78a358e806aa7e173d  HTTP-Daemon-6.16.tar.gz
 
 # computed by scancpan
 sha256  311f168ba9a7819ffab4fea19858f9e880737baf6d112929d11530205035a4cc  LICENCE
diff --git a/package/perl-http-daemon/perl-http-daemon.mk b/package/perl-http-daemon/perl-http-daemon.mk
index fe50c768b..c017c4e09 100644
--- a/package/perl-http-daemon/perl-http-daemon.mk
+++ b/package/perl-http-daemon/perl-http-daemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_DAEMON_VERSION = 6.14
+PERL_HTTP_DAEMON_VERSION = 6.16
 PERL_HTTP_DAEMON_SOURCE = HTTP-Daemon-$(PERL_HTTP_DAEMON_VERSION).tar.gz
 PERL_HTTP_DAEMON_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_DAEMON_DEPENDENCIES = host-perl-module-build-tiny
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
