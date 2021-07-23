Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D19C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:33:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A70BC60F23
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A70BC60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75773605B3;
	Fri, 23 Jul 2021 20:33:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xPpc6lU6wQKR; Fri, 23 Jul 2021 20:33:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D20F760590;
	Fri, 23 Jul 2021 20:33:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7488E1BF3FF
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E41383B5E
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VC44UIS8ZXta for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 20:32:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 726E083B5B
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 20:32:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z7so3554509wrn.11
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 13:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W8pid84n4S+x2uwGzc8VpkSzVr2cHFPJxaADQd0cyUE=;
 b=PQip1HC/ZZkygkelFphEMzPsLTMMRJBr0l9RduWRSjMyrRX/pdCIIa3BCL0TEp939J
 qMru8cIQZGLsnpUhG87jTrcmz7fRMHeIRwfHQ0+lWqWS3+qil+f71J/8KUx0JF5l4PG/
 Z/NkJY9QW3XDHiKqpCHvevkP6PAqODefARJSukUKD2KH7R5Ecrn8ENQAv9kIUQ2vg2Ek
 YhnmgwSOq0kHW9+a2/6JQqJRNIn0a0CWk59Aibw21BG4VXpT1Vc6i4s8UAPVUMlXeqat
 Lv7pH1I8yd7uo5+nTf2xq1wEQ2roxwMuLHxPckv1yBFEs0G4JC3wBFbO1wwYhUUAzs4L
 TkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W8pid84n4S+x2uwGzc8VpkSzVr2cHFPJxaADQd0cyUE=;
 b=XDLIRCAD7CthJtPxqGBKTnwoYlF6MDjDhAlp82sFQqS2s9LtjaLeIbSE5UheRKRV66
 hXoF8rnMWAi9pQv9tOn5m8c6/1kY1NL5OUcoGc5tn6vgYeacZtt5IEPZh3zou7w7s9VS
 x5nK4rrDQl3lddtleePb5jCZQShZ/VrTF4NgXk30Ac9vLJcRyZvSqRH0NGS93cOSGDxW
 dUHoXiguSJPrGyaq2GPr4a/5QYVi0gfP+rsmh8wPu0UpW5LY3Cre8tunk+rrN95T0s3b
 fbVCRhLRq97WJbjpNAfD6HS6x54mAWx0uJETAaYKdPa1XWxphHwd6x+vXyMXVO7WtwyT
 MKyw==
X-Gm-Message-State: AOAM532bl/wvJ0PPG+NuCMaEIIUzginp9j+f8kLvsYOX6BzhUWY6VBsv
 kLxun8hY6HGBsUX+nAKicMTmYnBdwIY=
X-Google-Smtp-Source: ABdhPJxB7Hk+A11c38GLT2N9qvid1hZG7xlFg1RT5cntu/60CYiAMtSarse2KKQapf8EEkiGMRBdJA==
X-Received: by 2002:adf:e4d1:: with SMTP id v17mr6856950wrm.206.1627072377772; 
 Fri, 23 Jul 2021 13:32:57 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id n17sm2128422wmo.18.2021.07.23.13.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 13:32:57 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 23 Jul 2021 22:32:37 +0200
Message-Id: <20210723203242.2531909-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723203242.2531909-1-francois.perrad@gadz.org>
References: <20210723203242.2531909-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/9] package/perl-libwww-perl: bump to version
 6.55
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
 package/perl-libwww-perl/perl-libwww-perl.hash | 4 ++--
 package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index d04fb9699..c419c1d7b 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  aea3e2a207b128371db0ef0f86229667  libwww-perl-6.54.tar.gz
-sha256  76917708bd91fbb15eb5eece25ddd2ed1fa65a5b6b05a3ab2a7facce17dfc81d  libwww-perl-6.54.tar.gz
+md5  4df22c50511a3f01063d2ba4d91bfbec  libwww-perl-6.55.tar.gz
+sha256  c1d0d3a44a039b136ebac7336f576e3f5c232347e8221abd69ceb4108e85c920  libwww-perl-6.55.tar.gz
 
 # computed by scancpan
 sha256  e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc  LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index 877ab9b36..99adb5665 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.54
+PERL_LIBWWW_PERL_VERSION = 6.55
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
