Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7D3C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 16:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A11D241BF9;
	Fri, 22 Apr 2022 16:16:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l4mj-xiSDLkX; Fri, 22 Apr 2022 16:16:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EA5C41BBC;
	Fri, 22 Apr 2022 16:16:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E04A1BF842
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 16:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60513829A9
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 16:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUYVhkxwQxSN for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 16:15:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69F79826FF
 for <buildroot@busybox.net>; Fri, 22 Apr 2022 16:15:37 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v12so4965682wrv.10
 for <buildroot@busybox.net>; Fri, 22 Apr 2022 09:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ziGcXKVqukAAxGIZg44M/kHbPJNouV+0EG+7XwiCIZw=;
 b=TSGKOvRyyOaBta8JKK6ZQWCQ269z/eAU7B7rJ2TZ8P1e0vpB8/sicM5ZsZs+TirP7E
 w9FfrL2bKul9bXIQyWh1sDEbVn23tZg8sFgOfHiZqZ/ZkoWbRgyGfNlviW3A113HDzKN
 RvGFrx615euZGACUhXWt5GLlCI3+6M0clYiSUwrOgfWyYAklt2u5UdDCBgmJyWoWmIaQ
 1mf0ZJP6gIXcfmXGfwJbLILxwu/KkYHk99ebdXeGNxjJLCJ5AFTc6Ew9i9ILyOQKOSPX
 uCbEZtENhvmjItfydsI+wDceInF24MpRN2qkopMkOM66xTY3G+iTJXN+OWi6skz3UtjF
 dwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ziGcXKVqukAAxGIZg44M/kHbPJNouV+0EG+7XwiCIZw=;
 b=H27CXP9wMe7LtSeTa2RyMpznnlb6Ce2UHQ/YYup34CGRpmaoxdNk22X402/PotRcE5
 QBU3hacReSJfMrr4fpXkMGLcd9gvssRDNhKSCixnMkT4jMpuuXjHhXi6ynhFZUvdTCme
 sc2AxSGFOa8/MYqlmk1GDQ8BrAtwtGp3IIMQnYgKUKjNzf040SDGofQrgFuoClCgIvB+
 Cz9yot4ebx96iVX2w5mwuNceHVNwfNPcf03WmIdZ1q7l1qgoqY8EGqG+DzLyFBo4H113
 cusHmpTOQLKC+obBiKjfRU/YqC2RUR9M1IbRWwiOQOCxKOPJNQyajBVH/exf3AFMEAz2
 ZFTg==
X-Gm-Message-State: AOAM530R71MYCVthB3NHKbP7iR+kLc3+Ftpt8fpXtGTwXf7lkZOKhmB9
 2CdJM65KEFQwLu0WlCmRXV1zxb5dPSE=
X-Google-Smtp-Source: ABdhPJzfde02vZ5praRg6tAksNPwWOz/BLyjLwxO7RUmwyDzsVbQ2fpTUbRuQkrraHil93sG1Nst1w==
X-Received: by 2002:a05:6000:144c:b0:20a:818d:e3c0 with SMTP id
 v12-20020a056000144c00b0020a818de3c0mr4349860wrx.584.1650644135716; 
 Fri, 22 Apr 2022 09:15:35 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 c186-20020a1c35c3000000b0038e6c6fc860sm2010671wma.37.2022.04.22.09.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:15:35 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 22 Apr 2022 18:15:11 +0200
Message-Id: <20220422161514.3449177-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220422161514.3449177-1-francois.perrad@gadz.org>
References: <20220422161514.3449177-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/8] package/perl-libwww-perl: bump to version
 6.62
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
 package/perl-libwww-perl/perl-libwww-perl.hash | 4 ++--
 package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index e32258050..25b6675ec 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  ce5180358d9279b2843a6518bf2de200  libwww-perl-6.60.tar.gz
-sha256  cdd28b9237b9c6791725b9099695c7c3c720b33881606fd6cc7635a5495bb07c  libwww-perl-6.60.tar.gz
+md5  3cc193bbddb1dc9e867e88582b440a92  libwww-perl-6.62.tar.gz
+sha256  569ac15eb69d54b2a8d932403610690b89c68d6a987eab2f627c0639bae7de18  libwww-perl-6.62.tar.gz
 
 # computed by scancpan
 sha256  311f168ba9a7819ffab4fea19858f9e880737baf6d112929d11530205035a4cc  LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index aa15ebb59..43bd4db78 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.60
+PERL_LIBWWW_PERL_VERSION = 6.62
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
