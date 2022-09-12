Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67D2ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 03:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6854C4257C;
	Mon, 12 Sep 2022 03:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6854C4257C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2el2awtoMA4s; Mon, 12 Sep 2022 03:34:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26D3A42577;
	Mon, 12 Sep 2022 03:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26D3A42577
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 235EF1BF9AD
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FA4584012
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FA4584012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSJo6ZuAv2v5 for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 03:34:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B962841C2
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B962841C2
 for <buildroot@busybox.net>; Mon, 12 Sep 2022 03:34:33 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 az24-20020a05600c601800b003a842e4983cso6345995wmb.0
 for <buildroot@busybox.net>; Sun, 11 Sep 2022 20:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wk8IzC5KKAsZoAcFlWcb105t4V0aDusIlQOYXfqGqYE=;
 b=J7szXBPUiodJflbsuu+tu+uOkz9RskFVers4lxy2WWEhkvbTY9cyWmIz3ObCYBHT2V
 ip/ACbJ8k9pjKwd9f/4BDpCwaJ6UZNg941ysNZUF4wUojZnXsxGomORkE+Oq9S4/G+Ek
 Dijon/SipZRupVi2ggJ1LDjlZJg9xsA+8VQQTfltzdTkrwH7L26kMdFkBH85cYhLo+yg
 llSMlR4DiY3hsw5UvGnezXdjCB5+CQVQC/AzScCQeSCm9q2i1Zv15AihjpZ3QD37HMKr
 EkWvwCsy34sjrOvacxk5TbybZPIGO7Q7DgFCNMoCFStTVSJmcEPdq+BL+d5sz+cMKtjV
 zXzQ==
X-Gm-Message-State: ACgBeo0I9l0yHSeo1dPYMEIIpXi9xT6ELM1f2rdPj38m/SfDjZWWXbh+
 EwSW/hWHSwTViEjGwmNSF4nWFJNNiTU=
X-Google-Smtp-Source: AA6agR5Dz8dfOMuPp6TWxjXr7F0kQ4Xy4s1W60eAdUwcdIQ0vIUGBWWyr3TL9jCDFll1D+IytEMESQ==
X-Received: by 2002:a05:600c:2608:b0:3b4:8dac:342a with SMTP id
 h8-20020a05600c260800b003b48dac342amr603553wma.102.1662953669472; 
 Sun, 11 Sep 2022 20:34:29 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a5d60ce000000b0022862fd933asm6009588wrt.96.2022.09.11.20.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 20:34:29 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 12 Sep 2022 05:34:11 +0200
Message-Id: <20220912033418.2587016-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912033418.2587016-1-francois.perrad@gadz.org>
References: <20220912033418.2587016-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wk8IzC5KKAsZoAcFlWcb105t4V0aDusIlQOYXfqGqYE=;
 b=QHcezxxBIYFhLVfAegJvhEMnSlpj30yGFCeDKMUKzzTIhXfNSRQcjDs0wi2FkFQ8tp
 n+R1tcplyNxDj0WqCLlkHdK7XUW9Nz22nbyMsrCYB20gtdVGoSmiMkfPS9Nfe9opEFar
 4CnJkt9wTJxq0mJWlkq2bXe5SgWZAKUqzIuec4qUxdhN979J4d3zoBQST0ylu6PRuM8U
 vI7PrQ+F4u5IWTTglqR/pTcBYnX4iSoWMOoKz2Qrj/jM5xhaXOmsFlF4PISjeddWUceN
 FkVcTihPpstWgyUMZkY+ZXZTnP+lNuGLsLYNnsC8Cq7Q908zXpka6suRKjDB+TI9CYxA
 r/Xg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QHcezxxB
Subject: [Buildroot] [PATCH 2/9] package/perl-http-message: bump to version
 6.37
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
 package/perl-http-message/perl-http-message.hash | 4 ++--
 package/perl-http-message/perl-http-message.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index 1a5d9ad0d..0e05da644 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  e847fb3e297e740080ab6fd1ac127f7f  HTTP-Message-6.36.tar.gz
-sha256  576a53b486af87db56261a36099776370c06f0087d179fc8c7bb803b48cddd76  HTTP-Message-6.36.tar.gz
+md5  17ca8ec3be118d50c5299b232f3109d7  HTTP-Message-6.37.tar.gz
+sha256  0e59da0a85e248831327ebfba66796314cb69f1bfeeff7a9da44ad766d07d802  HTTP-Message-6.37.tar.gz
 
 # computed by scancpan
 sha256  f2f428b5f8a3bf4e6a71cd5ea92558a3d123d3d7c5075d34923e71e46dea94df  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 3b5d6e7b5..79402c329 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.36
+PERL_HTTP_MESSAGE_VERSION = 6.37
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_LICENSE = Artistic or GPL-1.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
