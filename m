Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB29DCE7A8C
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 07:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A500941AC6;
	Sat, 23 Sep 2023 07:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A500941AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HkxnUdH2wUob; Sat, 23 Sep 2023 07:23:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3F9741AC4;
	Sat, 23 Sep 2023 07:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3F9741AC4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FDF11BF3DF
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0D7382140
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0D7382140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q5eKTUf1EasB for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 07:21:58 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C07DB820F1
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 07:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C07DB820F1
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-32155a45957so3253135f8f.0
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 00:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695453716; x=1696058516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+57YiTbfOXligWeuMbRIJ3tdbLcUO+oTYK7MI0W8/L0=;
 b=QEKUF8DbyeepNfwzwpLi3HcBW0Udmj68z+yiJ3s/hXnZavgBEX3gYWCI+8VXRC01nv
 kFPQizCKA96QoUhwiXg/xwKk4jhRWRPY1zd9gfp/00o+N+mPKPAR0XtaKr/8VKF5YHDQ
 SUzz4JX2edFTwqEyT12IwukdLCLe2ATEv4xA6QAJZc/57hf+kK83hyiPF1Y/Avu4RRJc
 L+wEcP1CBwltzoMWf7kRTUr6aRMxOWnR6qJLoecPcP9Lkwzp6wH0IUjhogUQzBAxD3Qx
 Jpg2lAwH7Jmts/FwOoHeL5M+i3kDRWTVyIBSFqDCsMbM+Yq/bZKIR3mR0EutI6Tg5SBv
 0rmA==
X-Gm-Message-State: AOJu0YymefCikUFO8+wWW/rz7DtRVeLEtRtw6jpgLFKxEgBq8wVzTWfE
 H5aLh6jj/bMNarYNbfwVj5OBHQPPxnA=
X-Google-Smtp-Source: AGHT+IE6IEqkFhhpgNUJbPMlR8yFu09NymbJN4kNd1UlhQ8XnqDuaGJhhtdQp01oAfVc6YQD/tAXnA==
X-Received: by 2002:adf:ed12:0:b0:31a:e772:ddf0 with SMTP id
 a18-20020adfed12000000b0031ae772ddf0mr1636823wro.53.1695453715929; 
 Sat, 23 Sep 2023 00:21:55 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 d4-20020adffd84000000b0031f34a395e7sm6156999wrr.45.2023.09.23.00.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 00:21:55 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 23 Sep 2023 09:21:32 +0200
Message-Id: <20230923072133.3122644-11-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923072133.3122644-1-francois.perrad@gadz.org>
References: <20230923072133.3122644-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695453716; x=1696058516; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+57YiTbfOXligWeuMbRIJ3tdbLcUO+oTYK7MI0W8/L0=;
 b=QSNNHd5vmyWc044LF9f/VNlpEfjHDDqpg5ozRzWh528O7EOSUe/xWPve74vqz+0kdA
 riqhCbjQGW/yBpdi97IBIIsS5n9cFNSAF9jxYlWYiSL6PwfhCWC1NtEr9CuQmVPs3OOd
 jmQecfc1NzcP3M7UimTe5lvaEEGKvrrqSeD9GsJd2X7Hgv9ic1pAcSuddsyHz8xxZGx4
 mcEtgIbNLDK9Lkak4tFg41vxlljD5lFYqtvznJFR1OJchk84d1uc5kc5KsWwXFcGvcCj
 qRp9Ohqy/za2+5F8kuUiZkE9EDAQNokDCiun9H+Hzu9jPzsGbnI0IJlVRoee17cAulAO
 fp9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QSNNHd5v
Subject: [Buildroot] [PATCH v2 11/12] package/perl-sub-quote: bump to
 version 2.006008
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

LICENSE: update copyright dates & remove trailing spaces
see https://metacpan.org/release/HAARG/Sub-Quote-2.006008/diff/HAARG/Sub-Quote-2.006006#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-sub-quote/perl-sub-quote.hash | 8 ++++----
 package/perl-sub-quote/perl-sub-quote.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-sub-quote/perl-sub-quote.hash b/package/perl-sub-quote/perl-sub-quote.hash
index 602ff92ce..8db560fd4 100644
--- a/package/perl-sub-quote/perl-sub-quote.hash
+++ b/package/perl-sub-quote/perl-sub-quote.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  1bb9caee697bcfa738f419d40505e506  Sub-Quote-2.006006.tar.gz
-sha256  6e4e2af42388fa6d2609e0e82417de7cc6be47223f576592c656c73c7524d89d  Sub-Quote-2.006006.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  f19c60039ba87f69f7f9357fc0a03e07  Sub-Quote-2.006008.tar.gz
+sha256  94bebd500af55762e83ea2f2bc594d87af828072370c7110c60c238a800d15b2  Sub-Quote-2.006008.tar.gz
 
 # computed by scancpan
-sha256  88f4a8719c584d756dcfeebc7f35643066354188bfb57c672fbafcd44e044e9c  LICENSE
+sha256  de7a14750e81d97e19e111df58a3b51e3f2c8ec2d2dd90f576f54243251972c6  LICENSE
diff --git a/package/perl-sub-quote/perl-sub-quote.mk b/package/perl-sub-quote/perl-sub-quote.mk
index a22da1692..3c2a25be5 100644
--- a/package/perl-sub-quote/perl-sub-quote.mk
+++ b/package/perl-sub-quote/perl-sub-quote.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_SUB_QUOTE_VERSION = 2.006006
+PERL_SUB_QUOTE_VERSION = 2.006008
 PERL_SUB_QUOTE_SOURCE = Sub-Quote-$(PERL_SUB_QUOTE_VERSION).tar.gz
 PERL_SUB_QUOTE_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_SUB_QUOTE_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
