Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3453C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 10:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F58661409;
	Wed, 24 Jan 2024 10:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F58661409
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iECKfwMyia2s; Wed, 24 Jan 2024 10:35:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5603561461;
	Wed, 24 Jan 2024 10:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5603561461
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15E361BF391
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1490783EC4
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1490783EC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxnrjSf3wOTB for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 10:35:09 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00C5383EBC
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 10:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00C5383EBC
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e8fec0968so68202605e9.1
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 02:35:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706092507; x=1706697307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LMOMTFprgKvDq9aDpMUtgn+QoXdFpn9kzA5aHUGwhpk=;
 b=dgFkv5eU5YsN/lylfYKo07ciGwQJ1pXWkfO8BCjVQz/8DZMgIa0VJv3Rowgt4I7dzi
 IsGj/uce0ZroVBUVvFeD3VzEiIKzSEU0BN5uORSDBz+FG/iWxoz7sP8c6NJeAGJZavOn
 Tg6n+KVm+FMNAhXfl2IrfuwDUMeT9rAnYGy/3wyn2UoGln2NuBER6YAP/Z1mReleHMaV
 hZgvw8tgBeqlB05xg1gPr1tz6cS8KnAb7ccNnhpqI95EqmcJiaecgd3DurIepQBdwmYG
 QPAvIv/x/rtSTD86gEUdVgc3gtxtkEQdzCjyjK2bxdUkh03szCeobrXuGuQL04zwxfj/
 P+lA==
X-Gm-Message-State: AOJu0YysHOf0RSnvbnH5FdkvRMIEa4On3aafawTMUS3U4rgJfLLVyRI4
 NS0c8gylzgmKQW9jvnm91fvYinZ2frLCZjckIZUKNxxGHOuDVUaFGfWbOsTi
X-Google-Smtp-Source: AGHT+IE+FN18ayJhDdUS8xyU6jGvzjqyc7RX93OdEBky6j5WjhxBFfTf5DbchODwbd8YcgbpGKMfWw==
X-Received: by 2002:a05:600c:6d7:b0:40e:c193:1de8 with SMTP id
 b23-20020a05600c06d700b0040ec1931de8mr948101wmn.232.1706092506855; 
 Wed, 24 Jan 2024 02:35:06 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b0040e549c77a1sm49195392wmq.32.2024.01.24.02.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 02:35:06 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Jan 2024 11:34:46 +0100
Message-Id: <20240124103453.623733-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240124103453.623733-1-francois.perrad@gadz.org>
References: <20240124103453.623733-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706092507; x=1706697307; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LMOMTFprgKvDq9aDpMUtgn+QoXdFpn9kzA5aHUGwhpk=;
 b=i/8FZ1TLCw1Lj9zQFhW8dl/9I0BDmcG3iEIevz+MpRMi3bziIHwF5rghg18W4fgMVR
 eAI+iKjQwkpodp+wuEwn6jWaRvFW7PzSvRrLjgNoXkyseAESJGztrjNq7tItu05qprxT
 FmJdx15c9tlgpIRhMjWhmjmjzyCWSCP+lYfZuADv8Je/mWnGB9goULX3lRz6tGDESjSs
 XstxLMPRwr43QGFZoIh6tuth6uYOttBE00ArWldbfDCBStFmra4lbUR2ML+mN0CPrpat
 VNSw8+BkommYQRlRHvvBfv/L9I3GaidgobgUO4WX5v/KJv5NonAfc5Pi37sxS+kydrbG
 EQZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i/8FZ1TL
Subject: [Buildroot] [PATCH 03/10] package/perl-devel-stacktrace: bump to
 version 2.05
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
    -This software is Copyright (c) 2000 - 2019 by David Rolsky.
    +This software is Copyright (c) 2000 - 2024 by David Rolsky.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-devel-stacktrace/perl-devel-stacktrace.hash | 8 ++++----
 package/perl-devel-stacktrace/perl-devel-stacktrace.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-devel-stacktrace/perl-devel-stacktrace.hash b/package/perl-devel-stacktrace/perl-devel-stacktrace.hash
index 4e64ef171..7525ebbb9 100644
--- a/package/perl-devel-stacktrace/perl-devel-stacktrace.hash
+++ b/package/perl-devel-stacktrace/perl-devel-stacktrace.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  a5b09f7be7f2b10b525a9740676906d8  Devel-StackTrace-2.04.tar.gz
-sha256  cd3c03ed547d3d42c61fa5814c98296139392e7971c092e09a431f2c9f5d6855  Devel-StackTrace-2.04.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  b8ca19bb4c76e98a04373618db9c7c3c  Devel-StackTrace-2.05.tar.gz
+sha256  63cb6196e986a7e578c4d28b3c780e7194835bfc78b68eeb8f00599d4444888c  Devel-StackTrace-2.05.tar.gz
 
 # computed by scancpan
-sha256  dbd3162d261db5b40cac4d85afba619ec6a196398003c57b85c2333e7ef4c393  LICENSE
+sha256  74f17bdbecbdfb75998f953c1dedb27d72199c8f0b612b1fca7834e4bfd87f90  LICENSE
diff --git a/package/perl-devel-stacktrace/perl-devel-stacktrace.mk b/package/perl-devel-stacktrace/perl-devel-stacktrace.mk
index 017839014..557f21bb8 100644
--- a/package/perl-devel-stacktrace/perl-devel-stacktrace.mk
+++ b/package/perl-devel-stacktrace/perl-devel-stacktrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DEVEL_STACKTRACE_VERSION = 2.04
+PERL_DEVEL_STACKTRACE_VERSION = 2.05
 PERL_DEVEL_STACKTRACE_SOURCE = Devel-StackTrace-$(PERL_DEVEL_STACKTRACE_VERSION).tar.gz
 PERL_DEVEL_STACKTRACE_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DR/DROLSKY
 PERL_DEVEL_STACKTRACE_LICENSE = Artistic-2.0
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
