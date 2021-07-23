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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5575C432BE
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:34:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1A6660F23
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1A6660F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 762934060A;
	Fri, 23 Jul 2021 20:34:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qOUKg2fYzgGO; Fri, 23 Jul 2021 20:34:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD01C40615;
	Fri, 23 Jul 2021 20:34:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B8591BF3FF
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE19483B5E
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:33:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCqcz7ouxjKs for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 20:33:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BAC7483B5D
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 20:33:01 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id o3so1489140wms.1
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 13:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oc3sxAAn5x7i8hXAFtRw4VNUR15qdsEBCZOiSw4XCd4=;
 b=YaQAvma/oZ1vBs1ULnv5lvPr5WyEkclaPJp5K9p8j6oFm3aKJTJTpd1u7/wVo4REKt
 JJYUTi8ABn8RrxNhUTptkybB93FrTwvRK0WhjWbGGQVUna/QaMJf5zU0RLAj2AcBdxn9
 fD3skGOOzh0Y0U85QqtWJejGdyfCf7Jd1zcK+P1BnaX6HcqRp2cTqEQ+8n0Tbb0XLXNR
 axJFHUASEn9K58j6SfbBK9f5OAvj/bzb3/HjptKE6ltuCIw8dRp3/4mMlIf3TrKQygQv
 NA3rGt9JLNONDHgJ+1sfUKe3WB8AeuqLFiqYJtZh/vqmgCem1xw3mDuqLd/SFVOtIUVh
 7H6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oc3sxAAn5x7i8hXAFtRw4VNUR15qdsEBCZOiSw4XCd4=;
 b=AUrnbb/890foipccoCqRL1RpblC+P28VgbtAQF71trWCXyy133fsyhqcChOznj321H
 ivoVSTqQB6QvbbAkWpJtxMSb1ukyyEXSxLdNfgLbFk0m6Qd6WNhF1wPNooi0w42hEHG8
 Ee6dMyhwPDzEj8gS0xxJM7f89TXjeXLEKddem5pDKWTbCVp5oPF7ePuOC/Jduepu94ly
 qaDTvdkJdXov6FsCjaM8AF6ny5oU/qY+CZQ3oDcMAfB9yBlxp1oCvVclgDcp1ln2gxxP
 zjjouBHDlQi4fjOSobWtglmF7CfqhEjt9rX1PgJp1SrkQGc2f2lmVkPNcSmMhQYPbZq1
 jzWw==
X-Gm-Message-State: AOAM533ToyE4icPO2GgkA/w6IvlMRFEsl+11A3GB8PyKkfhOAl+ADYe/
 YECbBYHnKeAvt++Rirkau7I8yEWvns8=
X-Google-Smtp-Source: ABdhPJx9KhuCEvT4/NNEIR52QRpR+hsCJ5z218uo0IYHfPi4XKkkT+WoY79nJvfTzcdFXMKb3yGzxA==
X-Received: by 2002:a1c:7407:: with SMTP id p7mr5900304wmc.111.1627072379981; 
 Fri, 23 Jul 2021 13:32:59 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id n17sm2128422wmo.18.2021.07.23.13.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 13:32:59 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 23 Jul 2021 22:32:40 +0200
Message-Id: <20210723203242.2531909-7-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723203242.2531909-1-francois.perrad@gadz.org>
References: <20210723203242.2531909-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 7/9]
 package/perl-mojolicious-plugin-authorization: bump to version 1.06
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

LICENSE was reformated, the copyright holder is unchanged:
This software is copyright (c) 2012 by John Scoles.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-mojolicious-plugin-authorization.hash              | 6 +++---
 .../perl-mojolicious-plugin-authorization.mk                | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.hash b/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.hash
index c55eefe2f..30bf87bad 100644
--- a/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.hash
+++ b/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    9c009599cf397e3eacf5d7cd0dec45b8 Mojolicious-Plugin-Authorization-1.05.tar.gz
-sha256 87f84092d5698595ad0d01e745eca1d6affd1f3d662786f39f3583c54ffed0e3 Mojolicious-Plugin-Authorization-1.05.tar.gz
+md5  7906886e2a66b84bb3c0edd7ea85c485  Mojolicious-Plugin-Authorization-1.06.tar.gz
+sha256  d21ee5ab5fd8c630bc28ce001f9c91bba500370baf7cc8f6f60c9a4e051f9a6c  Mojolicious-Plugin-Authorization-1.06.tar.gz
 
 # computed by scancpan
-sha256 fd9632faca5a3d6af4cb9cf776514de87d2b34bff3a6cf06c23eea0f9cc3ab06 LICENSE
+sha256  dfab85cd06e80a3493217a1dc741cf9065417d2e803d50756f013c0b6cb0cb3e  LICENSE
diff --git a/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.mk b/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.mk
index 3fcee08a4..f136be3ba 100644
--- a/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.mk
+++ b/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_VERSION = 1.05
+PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_VERSION = 1.06
 PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_SOURCE = Mojolicious-Plugin-Authorization-$(PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_VERSION).tar.gz
 PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BY/BYTEROCK
 PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_DEPENDENCIES = host-perl-module-build
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
