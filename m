Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF97ECAAD3
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 03:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EDAF418B2;
	Mon, 12 Sep 2022 03:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EDAF418B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zLAQ4uzopVcP; Mon, 12 Sep 2022 03:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B65D418B0;
	Mon, 12 Sep 2022 03:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B65D418B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C27A1BF9AD
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE4B783F4C
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE4B783F4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AD_cdjaA5VYS for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 03:34:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A07C84012
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A07C84012
 for <buildroot@busybox.net>; Mon, 12 Sep 2022 03:34:36 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h8so6308885wrf.3
 for <buildroot@busybox.net>; Sun, 11 Sep 2022 20:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+TR53L5siqjm2CY/0eYGf28qFwmIRHFyC2eI7sioUJA=;
 b=QMeRRZHu9n+ptE1DMGwUnHqqEOcZRRoezcjyy30JvsB2C31pzqItyzn1LC5Qrqqlp7
 KNlMAjsJ24ArceOPJUETfSlJBjtrlK/RqxdhGKtxf7rMdif7KevikK8BEGCEaP8fwJss
 4whF4xTXZ9jjPk0CPDtnAP+fqhzJrDVq6FT4pi5RufLMYeBL6Ey+gp6htGL785HgVMTh
 nHCFiV+aGVIUYwTsAu1/ZDPE5OHRR3qsCBPg8+bppwXYP9GQ/xXw/tq+MCVBMdf9xHoV
 ELMn+vTDTYiXcgkgpbG75DJvHa5D+961MTS5aZwEssuwv1i3CTGow5StTCbVtX44Phil
 GAaw==
X-Gm-Message-State: ACgBeo1G0pYeBYuiBGrGYDzNGYt6+H37AjoG2q8XFS3bpMyJoDAs6FP2
 rcsI1ZC5wYlSYXGi3nk+qZCBu+nsLJQ=
X-Google-Smtp-Source: AA6agR7ktxwFaxd9ljFGq7jJisPfNzWgcc6K92/Ui5AXg+tdibRAYmOpuA0qaJPasENO9WT1H/7ixw==
X-Received: by 2002:a5d:65c2:0:b0:228:68b7:e7b2 with SMTP id
 e2-20020a5d65c2000000b0022868b7e7b2mr13625785wrw.440.1662953671698; 
 Sun, 11 Sep 2022 20:34:31 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a5d60ce000000b0022862fd933asm6009588wrt.96.2022.09.11.20.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 20:34:31 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 12 Sep 2022 05:34:13 +0200
Message-Id: <20220912033418.2587016-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912033418.2587016-1-francois.perrad@gadz.org>
References: <20220912033418.2587016-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+TR53L5siqjm2CY/0eYGf28qFwmIRHFyC2eI7sioUJA=;
 b=gw7EOqnQMoE3idHYL0+v4tD3KDCskmEfVQ4/pTtCX9U+hxLljT5RX2SppXkajm1u4v
 Uo4532j9kJLgOIOgfamVxSRIoNb8LvkgqRMMESeFvzjJxtzQ3aG+7RDkMdVWxk/g5a7z
 fflVLnFcxv2piAgJ1E5FVEJy8qmRJNACOy8YkgmKBkDV7xN9fgygv22RTPF6ZVquJTiG
 OBH0DeMxGccgWQ3cHZgkaAIZtCcZC1aQ1QzJS25MXFR/YLKE7oV7t+AveNqxpaHuXqto
 pVhfNXkXKpn4JzM1Dl5C75GwIh26wEo2oLLFTW64/mIBQxuYCnBeW1HACPDpJ1PGLqxd
 5+sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gw7EOqnQ
Subject: [Buildroot] [PATCH 4/9] package/perl-libwww-perl: bump to version
 6.67
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
index 25b6675ec..8b4b229b5 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  3cc193bbddb1dc9e867e88582b440a92  libwww-perl-6.62.tar.gz
-sha256  569ac15eb69d54b2a8d932403610690b89c68d6a987eab2f627c0639bae7de18  libwww-perl-6.62.tar.gz
+md5  ff7621d0350da3052f24db9a74692672  libwww-perl-6.67.tar.gz
+sha256  96eec40a3fd0aa1bd834117be5eb21c438f73094d861a1a7e5774f0b1226b723  libwww-perl-6.67.tar.gz
 
 # computed by scancpan
 sha256  311f168ba9a7819ffab4fea19858f9e880737baf6d112929d11530205035a4cc  LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index 43bd4db78..6c4bd2980 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.62
+PERL_LIBWWW_PERL_VERSION = 6.67
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
