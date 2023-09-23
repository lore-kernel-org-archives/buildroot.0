Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5988ACE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 07:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F66640199;
	Sat, 23 Sep 2023 07:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F66640199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZrNbt65GFt8T; Sat, 23 Sep 2023 07:22:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A26E41484;
	Sat, 23 Sep 2023 07:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A26E41484
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 082471BF3DF
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84624820F1
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84624820F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9IyWjwbNujRd for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 07:21:53 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6474182140
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 07:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6474182140
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso2931935f8f.0
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 00:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695453711; x=1696058511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f/LWlW3+YXGsWOPXn9wRHu5JR8n0oVngKT0YMaSpgx8=;
 b=Hlp/VXs3bGxh1i17xrmlqVL9TZqZXCCiFcqREKi5z3TTO/CPUkwxP7q541YNvNnjUG
 yQNL8YQnVjaljdsYRhXa1gWAd9CElTHW1H20g0pBQuz6BHDNsWE2IUlIELvWJL96tTpg
 bFOggouJKGJiYdhopIvD1WfZ+bT1RJPJSBa66i2H4XB5TFKVVcD8IVe5xDwlO6RB/I2i
 0/sewDt+yuQQ7wVi2b+AOaTw5vHUMzMnNmspbVxWPI54oOenUbnFrzvDwk7M8+/evPEi
 /C9uNy5YrHid2huPyR+rdLeOjU4brVf8/x5ATF+UfEfnYPiempa1mjQ6vXsPq3Q2cYwz
 9W9A==
X-Gm-Message-State: AOJu0YyUreoIVLAdzdHEtccmX9/ZoIMUEwjmmFu3c/yMwou4ULXuTWYx
 k4L2sK87jtB63xJ6i9gYUYWNhOClgUU=
X-Google-Smtp-Source: AGHT+IE+/vngZjNcfTTn2hXHNBJz3E/gDC2Ww0KriUI9K+ZpSBLRRCJNoYgkZDM2OZTZeWlTHv8YCw==
X-Received: by 2002:a5d:538f:0:b0:320:bb1:5a76 with SMTP id
 d15-20020a5d538f000000b003200bb15a76mr1415474wrv.56.1695453711507; 
 Sat, 23 Sep 2023 00:21:51 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 d4-20020adffd84000000b0031f34a395e7sm6156999wrr.45.2023.09.23.00.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 00:21:51 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 23 Sep 2023 09:21:26 +0200
Message-Id: <20230923072133.3122644-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923072133.3122644-1-francois.perrad@gadz.org>
References: <20230923072133.3122644-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695453711; x=1696058511; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/LWlW3+YXGsWOPXn9wRHu5JR8n0oVngKT0YMaSpgx8=;
 b=Y1n852e+ZfsrZShhk+EMj7841P5bavmeTMUzYtgpQyZBPRRSEraoJwNqLLRGj6Q53C
 qb/ttQeeQzdiSr5h6525x+h9tKZVAkkdfBEmoosbr6hy109mJnkrcMy6tG+K1ippt1S6
 LDAUfTQjETk2letAGO4AYtxqgtd2gujd9Oty6yhN/tcSyuhHheslOdKUhS59n85o7JZp
 ZVxERiERlV85j74sa4vAr9aR3Zdl/mHY8zVMl3jhqQMQsdroDbBlnfnPjE8D8aUPNM6J
 wLW686jbIuz+k89qUSYjsCkFamWbWb7kB23QrZLNG41bFM4m+/yVDWP6CxU/bwtAwM7S
 8DhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y1n852e+
Subject: [Buildroot] [PATCH v2 05/12] package/perl-json-maybexs: bump to
 version 1.004005
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
see https://metacpan.org/release/ETHER/JSON-MaybeXS-1.004005/diff/ETHER/JSON-MaybeXS-1.004003#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-json-maybexs/perl-json-maybexs.hash | 8 ++++----
 package/perl-json-maybexs/perl-json-maybexs.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-json-maybexs/perl-json-maybexs.hash b/package/perl-json-maybexs/perl-json-maybexs.hash
index a53d4ec61..3b603310f 100644
--- a/package/perl-json-maybexs/perl-json-maybexs.hash
+++ b/package/perl-json-maybexs/perl-json-maybexs.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  e46181e34588428d317932744597a7ab  JSON-MaybeXS-1.004003.tar.gz
-sha256  5bee3b17ff9dcffd6e99ab8cf7f35747650bfce1dc622e3ad10b85a194462fbf  JSON-MaybeXS-1.004003.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  bee9d0cba3f87e05e9613684e4ee2159  JSON-MaybeXS-1.004005.tar.gz
+sha256  f5b6bc19f579e66b7299f8748b8ac3e171936dc4e7fcb72a8a257a9bd482a331  JSON-MaybeXS-1.004005.tar.gz
 
 # computed by scancpan
-sha256  0f2d6b537f7a735c981511875d832bc8ff767bf97d62848cf0bada964e40aadd  LICENSE
+sha256  de7a14750e81d97e19e111df58a3b51e3f2c8ec2d2dd90f576f54243251972c6  LICENSE
diff --git a/package/perl-json-maybexs/perl-json-maybexs.mk b/package/perl-json-maybexs/perl-json-maybexs.mk
index e6891f680..13c9439ea 100644
--- a/package/perl-json-maybexs/perl-json-maybexs.mk
+++ b/package/perl-json-maybexs/perl-json-maybexs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_JSON_MAYBEXS_VERSION = 1.004003
+PERL_JSON_MAYBEXS_VERSION = 1.004005
 PERL_JSON_MAYBEXS_SOURCE = JSON-MaybeXS-$(PERL_JSON_MAYBEXS_VERSION).tar.gz
 PERL_JSON_MAYBEXS_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_JSON_MAYBEXS_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
