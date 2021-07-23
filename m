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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0182EC4320A
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:33:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B30A460F23
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B30A460F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 732194067A;
	Fri, 23 Jul 2021 20:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9m0U2mQv1QIu; Fri, 23 Jul 2021 20:33:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8763B41486;
	Fri, 23 Jul 2021 20:32:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB9341BF3FF
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B15D883B5E
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:32:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4CGav-x3QgKM for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 20:32:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8B4283B5B
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 20:32:56 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id z8so3601136wru.7
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 13:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sWJvx+dMHxU83g0PH2xLlpyEFPdvdfKCDbk76bE6clI=;
 b=jPMvGmPHlsKr1l/gyL1YUvL19Byt5iS9T6EWdKVUm41pkT5SwglHSv8/vmDDqHIn3f
 651vMV8POJBlEzpTNznBFsYWyNSeqAxr0F0lb6z5huhnUvlGfndnSke6BSYVNSwXwNY/
 fKO3Z86TWLiOhfRez5onx5ZAG25C3mfu+nGh+rT7/6/pEuNvKqfqFcTohOdTa6979vZR
 B0IHU94S2f+OSSR5p9QFkMP1Fk+fDZ0RXoSnrVd6QncHjBTUxrXvANdmfuMS5FXcNOFI
 pLY/DNjLX/evQ00jycUZlUjbJSUXKUn3jPiqzPqisX3t26BWrd/a8X13N0BCQBDrC5fB
 8I+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sWJvx+dMHxU83g0PH2xLlpyEFPdvdfKCDbk76bE6clI=;
 b=ihSefSHqdYWhDr/0cSVfjTIGTgY/p5nUN12Sz6KD8YFetGaMAtRVPGcJZcZZDH0OP1
 Vc5Jmyc/WTvbxEWZoo56csVzZ8RFODNvmgjjIYkOtGwlig8xKT6tQAKgTWJlNKBDk+3a
 DHhQml2ho3iElsCnGCWwGEitwfsmdPiXKX9UekLbXHugNQbipNEI9y5oqiV7eToEizhP
 a3PiQXcFio51nAkO2gW+QvClfu+Bh1ZhaMku+a9j0fuRp4PiDfPGBzKpnLTUiup+Y8KX
 Ry0qDKUJ3LxuP9lCVSWl49PGtZB6miTLwu51tzu31sGKImGR3IYqQrIY9lcRIt/W/el5
 2Qwg==
X-Gm-Message-State: AOAM531Jw2udR1SHggIxIYxtytC5ZjhkdiFU7GAgBrynSmvFvByD5kQ/
 XrnsHtQ4rV5x5XlGvK9x9OHsfsrAFa0=
X-Google-Smtp-Source: ABdhPJwZdTVliur0TKWbMNXO779eECzJwul9ndq+RwyFLwCfyLT10ngVtlK+owd/PN6tRlDIysOwaQ==
X-Received: by 2002:a5d:4fd2:: with SMTP id h18mr6777164wrw.289.1627072375035; 
 Fri, 23 Jul 2021 13:32:55 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id n17sm2128422wmo.18.2021.07.23.13.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 13:32:54 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 23 Jul 2021 22:32:34 +0200
Message-Id: <20210723203242.2531909-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/9] package/perl-data-dump: bump to version 1.25
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

README rewritten in README.md, but same copyright holders:
    Copyright 1998-2010 Gisle Aas.
    Copyright 1996-1998 Gurusamy Sarathy.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-data-dump/perl-data-dump.hash | 6 +++---
 package/perl-data-dump/perl-data-dump.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-data-dump/perl-data-dump.hash b/package/perl-data-dump/perl-data-dump.hash
index 87850326d..cc1986e74 100644
--- a/package/perl-data-dump/perl-data-dump.hash
+++ b/package/perl-data-dump/perl-data-dump.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    762c111e525c82ff23d62c90821b26e9 Data-Dump-1.23.tar.gz
-sha256 af53b05ef1387b4cab4427e6789179283e4f0da8cf036e8db516ddb344512b65 Data-Dump-1.23.tar.gz
+md5  9bd7131ef0441e1e0e001bf85e9fae31  Data-Dump-1.25.tar.gz
+sha256  a4aa6e0ddbf39d5ad49bddfe0f89d9da864e3bc00f627125d1bc580472f53fbd  Data-Dump-1.25.tar.gz
 
 # computed by scancpan
-sha256 31d1b6482bcc3db87a38ad02065554f9d3bc13321d4ef8e96042464045e2abcf README
+sha256  8bdd655ceab54bbeb1105a101f0412ec764098abf09b4e92bc430d56befa10cb  README.md
diff --git a/package/perl-data-dump/perl-data-dump.mk b/package/perl-data-dump/perl-data-dump.mk
index 54d3a925f..e70de2a21 100644
--- a/package/perl-data-dump/perl-data-dump.mk
+++ b/package/perl-data-dump/perl-data-dump.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_DATA_DUMP_VERSION = 1.23
+PERL_DATA_DUMP_VERSION = 1.25
 PERL_DATA_DUMP_SOURCE = Data-Dump-$(PERL_DATA_DUMP_VERSION).tar.gz
-PERL_DATA_DUMP_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_DATA_DUMP_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GARU
 PERL_DATA_DUMP_LICENSE = Artistic or GPL-1.0+
-PERL_DATA_DUMP_LICENSE_FILES = README
+PERL_DATA_DUMP_LICENSE_FILES = README.md
 PERL_DATA_DUMP_DISTNAME = Data-Dump
 
 $(eval $(perl-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
