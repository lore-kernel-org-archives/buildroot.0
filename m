Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76485C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:25:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1560B60F13
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1560B60F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D81FA40480;
	Mon,  6 Sep 2021 15:25:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f2482UiOOJkB; Mon,  6 Sep 2021 15:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 097414047D;
	Mon,  6 Sep 2021 15:25:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 438E51BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40B4880F46
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wYv7cTBoPsTD for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 15:25:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73F9A80EEB
 for <buildroot@busybox.net>; Mon,  6 Sep 2021 15:25:37 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b6so10380721wrh.10
 for <buildroot@busybox.net>; Mon, 06 Sep 2021 08:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3xort2Cn0H6cLUwyf/LpKGk3PKGs3YxtZEL1MT9zy24=;
 b=lrgM3Bp3G6BAQDrTh5DnTaGZrThQMPqPGuEgm+Dcwa4jKtfXzfD2Nf/hihREokcuDO
 eO7P7eVjiJ+tD3IOZSCQF1NthuVb/VC2SXI+V9/t9tr4fPK20iskw+hWsJAn4sHJYvFi
 Rm7aIeGEiOtj6eaK99xuOYzNq0NLzQ3zRJKhIRQuLaMluLwAZVirDLpdPRrZDZt8jGDP
 XHYFnEC0IK+pQyypxG61VuAUoGxl9GregLnb3M8QG962ny4mKUcwFp5vkg6qXxxpmFw1
 2ndNbmr/82AfC+Gmj6IAVFb14lmDJpQdLXQ/42WRb5oXUgoglW8eq/Msud1aiCxpPXQm
 YaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3xort2Cn0H6cLUwyf/LpKGk3PKGs3YxtZEL1MT9zy24=;
 b=A1zYkG6YZjLTUTpkQ87I3QWuOfnrQ2MDSYz+60SL+PgxXSc5+w/uWc8xDkaN9xz7gL
 olIpQRT3+ojfuAuk3g4wdscbsb88atM+rVvLYL3zgRcmZep4nXKgMwW/rroWbUvi/H1P
 tL09o4C96WeuzXxf7fNXmkYMInOx9CJB2td9dnPiHjTVC0aDSwFdc+UwgWs0QeIrfGg8
 QAzvbIrmnM3mIHnNqGa5Uua3Z9lbPQ17kEXXhcSAK10PakoE7lJF11/2uTBKjTHhta8p
 jyOexPE1fNGHfCSymDHENW4joFom6mWWIf6sFO0wJVns7o60vjVCB0n7a/w2NXHOxg9z
 zMlA==
X-Gm-Message-State: AOAM533i6dUeeBXz6bRL9xd9u91Qg22UV9KCNu2GC496Hd0iKUoVIk7y
 Jy7w+QUjm8Dtpyov0y+0XGt2frRcY10=
X-Google-Smtp-Source: ABdhPJwokdlRHn2HQlymwbf4G0oiK8q6xOevd15QQhS+jB7ftjrWJr9EP2KaVy8VggP4U7iBV0EDRw==
X-Received: by 2002:adf:dd4f:: with SMTP id u15mr14496102wrm.237.1630941935800; 
 Mon, 06 Sep 2021 08:25:35 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id b1sm8422223wrh.85.2021.09.06.08.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 08:25:34 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  6 Sep 2021 17:25:24 +0200
Message-Id: <20210906152525.1831463-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210906152525.1831463-1-francois.perrad@gadz.org>
References: <20210906152525.1831463-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] perl-libwww-perl: bump to version 6.56
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-libwww-perl/perl-libwww-perl.hash | 6 +++---
 package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index c419c1d7b..709e94647 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  4df22c50511a3f01063d2ba4d91bfbec  libwww-perl-6.55.tar.gz
-sha256  c1d0d3a44a039b136ebac7336f576e3f5c232347e8221abd69ceb4108e85c920  libwww-perl-6.55.tar.gz
+md5  0ef270c43ee93e22c2086ba9998aa11a  libwww-perl-6.56.tar.gz
+sha256  94362e68e5c6782f3987a9dec6adc409d20e28665dbf28ff47d1d701443ce7ce  libwww-perl-6.56.tar.gz
 
 # computed by scancpan
-sha256  e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc  LICENSE
+sha256  311f168ba9a7819ffab4fea19858f9e880737baf6d112929d11530205035a4cc  LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index 99adb5665..10fda9de6 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.55
+PERL_LIBWWW_PERL_VERSION = 6.56
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
