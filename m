Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67E0ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 03:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7981F418AC;
	Mon, 12 Sep 2022 03:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7981F418AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wv2-IdFh9y55; Mon, 12 Sep 2022 03:35:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F9784014A;
	Mon, 12 Sep 2022 03:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F9784014A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8923D1BF9AD
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B46C841C2
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B46C841C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QKv14ATiMTeK for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 03:34:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D544E84214
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D544E84214
 for <buildroot@busybox.net>; Mon, 12 Sep 2022 03:34:36 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 bg5-20020a05600c3c8500b003a7b6ae4eb2so10073595wmb.4
 for <buildroot@busybox.net>; Sun, 11 Sep 2022 20:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WW3LVJHCd2FMXbWlSs+VKEHldmQmAzOhgp9tfvdbkeQ=;
 b=blisZC3YrASYoTEuKngObi4TQCOycfljKK7erfGcXVXligPOWlJE/EslRwBjmoqDx0
 bMBNRZqQM4cn+Xwp6i8CMj0tJ0+aij4kS+ays/DGmapso5PsrK+N8d1pP8SzQEvlLHeT
 JZj9VGExbJeehpbwYNMxyvcqUSKWh8D5iXRj9smamiOctg5arfyeKoTybkAcUdh7H2ru
 rouUFEOjOd0DCS5416+jhquxIXPQ1sPd7zkuN0qPw0Pr6ulQmMki0UvC60wVL6ABFKnN
 gfvGkN0Ip9X1JzJDjlg7C+CN8kx8cRhwKSNspS2LpXrNWM2HhyzriVE2TSNA/dXUFjqI
 /Nqg==
X-Gm-Message-State: ACgBeo087Yy+jHvFCUzL3K2TFSrlp+/HBWAtEZhwC4VjzC0UE3KmFQYh
 P6rtnUMtghlFn+l0XyONFP6n5Hq6uRU=
X-Google-Smtp-Source: AA6agR4pqyMxNyJdcc1CR/jv2HMBPwcFQlDoMMsDaY9BlvqfamKKCpfC8eFLWHgxZuMSdAJWfALa2A==
X-Received: by 2002:a05:600c:2311:b0:3a5:af18:75c1 with SMTP id
 17-20020a05600c231100b003a5af1875c1mr12391459wmo.90.1662953674044; 
 Sun, 11 Sep 2022 20:34:34 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a5d60ce000000b0022862fd933asm6009588wrt.96.2022.09.11.20.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 20:34:33 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 12 Sep 2022 05:34:16 +0200
Message-Id: <20220912033418.2587016-7-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912033418.2587016-1-francois.perrad@gadz.org>
References: <20220912033418.2587016-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WW3LVJHCd2FMXbWlSs+VKEHldmQmAzOhgp9tfvdbkeQ=;
 b=WdAAkXpENtL0+KAQ+zBhoYciH7JRcRPy7Yg4qYfVVWR2MlzfdBdWlZNMy4CZHqI7uP
 35kMFmXxyjCNu031GE253akkZ4GbxviR8vqoU5/rBYMRl/ju7pggfysllIoNSf7lX/bU
 4zm2f+FMUana5x5rGbR563z1KwaiU1FqUE4VZGP9TX4lGVgLFGrjhJ9sRMkcz9ptx0/m
 rP4ZjJ50C/6+m/P3kAFjbAvbZ9otrLbZYxwQmO0RCByaKHjfOWLJXZv9iq41SM5M6uqU
 M1GvIhdCdoU6ke01XRC9gt3E+5qRSfPx9Dp4rsmFI4/6ul8PDkuKPnFzRuFcWyNDPbD9
 9u8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WdAAkXpE
Subject: [Buildroot] [PATCH 7/9] package/perl-net-http: bump to version 6.22
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

diff LICENSE:
-This software is copyright (c) 2020 by Toby Inkster.
+This software is copyright (c) 2022 by Toby Inkster.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-http/perl-net-http.hash | 6 +++---
 package/perl-net-http/perl-net-http.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-net-http/perl-net-http.hash b/package/perl-net-http/perl-net-http.hash
index 85ddad6ee..f02fd9080 100644
--- a/package/perl-net-http/perl-net-http.hash
+++ b/package/perl-net-http/perl-net-http.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  dbe27483034a79a7d43f61cc48540641  Net-HTTP-6.21.tar.gz
-sha256  375aa35b76be99f06464089174d66ac76f78ce83a5c92a907bbfab18b099eec4  Net-HTTP-6.21.tar.gz
+md5  1d46019fb8559070a5ec1d838b690657  Net-HTTP-6.22.tar.gz
+sha256  62faf9a5b84235443fe18f780e69cecf057dea3de271d7d8a0ba72724458a1a2  Net-HTTP-6.22.tar.gz
 
 # computed by scancpan
-sha256  49fbcc80e17295888b909176a0029f275a8c17b6cbfaf8867fe571ebe9a9ca79  LICENSE
+sha256  0ed700a4bfc022e999d83407f71ab62ead96662d8f7bbebfd857376bf3ed6528  LICENSE
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index de0809d0b..b4cef6188 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_HTTP_VERSION = 6.21
+PERL_NET_HTTP_VERSION = 6.22
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
 PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_NET_HTTP_LICENSE = Artistic or GPL-1.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
