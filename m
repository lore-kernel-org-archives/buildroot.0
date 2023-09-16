Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B82CD37BD
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A03B4411A1;
	Sat, 16 Sep 2023 15:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A03B4411A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U629E7rx9r7o; Sat, 16 Sep 2023 15:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E45F4410AC;
	Sat, 16 Sep 2023 15:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E45F4410AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 179C21BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BDC881E2D
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BDC881E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zw6UpqDyUufu for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:44:20 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F9C081CAD
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 15:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F9C081CAD
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31dcf18f9e2so2948200f8f.0
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 08:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694879058; x=1695483858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ln6JfiN2qEVjVpTig7P/rXNHOQjdOaXjIc/TnKrVJ+M=;
 b=mIvUr45vzd/WxoPj8GAwa+JC1zNg+8Pk/uZq641MB9duTqZcLNQCrqcK8yXWW0QpoL
 BNbXlUe6MjMh2tzRreW9z5mvXi7lVlQW7Q/H5raZ/J/GejBtnhtIMZcP73yYv6YPEOC8
 k4LyOfEQzb2sjN2owm2k+9YbqQJZdKgTXoeNKq6JcZ0fFvW+7DWITaVPDounKUZZitWK
 X0LIGhnax6aaSVVUsrhIXurcoP33pU6zO6zL6/FxqCndUE3l8N+L8eDMgZ3NFZnHwKCV
 T6ou5TiKqsyWBgX1rLL8OJpuWuuibXCxPlO6GqBXXHtTBLSZi+tSqhd+EcBEj0nKEsFO
 /YtA==
X-Gm-Message-State: AOJu0YyGCbnAWqFg0LQF/xLbN9s+jlLYEZHK90mMHhd1TQGCEl+7G/gU
 9rmMQybJENOkGyY23h9cuEiIKbEArhE=
X-Google-Smtp-Source: AGHT+IHgSJlRDya39uwEOQ+JvHnXwGYiDlfhGS03Pp1E/0dteKr9nr+XQ0uL3oAo131mv9M7zOQSpA==
X-Received: by 2002:a5d:526d:0:b0:31f:d15a:2230 with SMTP id
 l13-20020a5d526d000000b0031fd15a2230mr4162168wrc.20.1694879058150; 
 Sat, 16 Sep 2023 08:44:18 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0031de43fe9bfsm7522010wrw.0.2023.09.16.08.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:44:17 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Sep 2023 17:43:49 +0200
Message-Id: <20230916154351.2747233-14-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230916154351.2747233-1-francois.perrad@gadz.org>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694879058; x=1695483858; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ln6JfiN2qEVjVpTig7P/rXNHOQjdOaXjIc/TnKrVJ+M=;
 b=JDCR90gfxlUHzidIfJ7D/dvgpz8mdpS6JIua2Zdhc0PXJdAHoeGo0u1Qqnestvfn5f
 aSg7f+3vOfx4C8nS1Sn/E6JnDv9PQwBDMYJIfyCwrdqJ2+07sFx+28ch40zBSXtSslo8
 DWgYouxiRWinUX/pEni9MwXr7liRfjMxy5DapJehkjMcX7WYQ9WNHXeDiCxjI1uZP1hU
 T2y05ZpffLh88pkHrLH8dFR9Xk/vFQtB4kCF08B3YDZHspGlYjvysEDATck2/RRXTiON
 9i9vb6jz9saVK7eirLbQmi+NkinRBgTrVdUfAc92z3Dk7YB3IyFcqruDk80sTN4xUb0a
 1Lkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JDCR90gf
Subject: [Buildroot] [PATCH 14/16] package/perl-sub-quote: bump to version
 2.006008
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
see https://metacpan.org/release/HAARG/Sub-Quote-2.006006/diff/HAARG/Sub-Quote-2.006008#LICENSE

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
