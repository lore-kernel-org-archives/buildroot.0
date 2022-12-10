Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDE3C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 09:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 005748149B;
	Sat, 10 Dec 2022 09:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 005748149B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HSa0ZCQY4syS; Sat, 10 Dec 2022 09:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FBA581464;
	Sat, 10 Dec 2022 09:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FBA581464
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58FDA1BF32D
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 09:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 344728144A
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 09:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 344728144A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pcsIcHju4Uqu for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 09:54:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 017D98135E
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 017D98135E
 for <buildroot@busybox.net>; Sat, 10 Dec 2022 09:54:43 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 n9-20020a05600c3b8900b003d0944dba41so1494074wms.4
 for <buildroot@busybox.net>; Sat, 10 Dec 2022 01:54:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RJCnAwfAEJ0mSekavir5sxRUh2Y+EVHNpLRlrjshWz4=;
 b=qqJ2pxo6EudZ/GjDSbYhzQBKpQGULiWm7krjcWcncGM3ZQbUkdCJhuNEk3MAJdo+LG
 LCZCbnhCQAOC5mCBAFJKXXdGVwMjJoKmOjdEJpB9Do6j8CuDcm6lFuvUx220EV7LmlqF
 CgWq3tBpq+BliDSE1P/JvNHijnhEo4S/kR5+zrtIhtti1G+0EeUqZ5ULoWZs/eynLzOV
 yScPMRP+512+oSadopmJJlxb4MOmKB9aIkp22rzteqIj2CXWzp4mRvlnSO/+v7joyBUq
 r5anZJkHiqkmn5WoSoCBx49hopKy+cwCTf2+yIAL2WkRrVlIiej4BgbPhcFjQSpxykFD
 Gh9g==
X-Gm-Message-State: ANoB5pnomG9Bv6QPZ3fBJiFf2wx2Ylgrzf9J5SoMxZk6al0r+NHclq4N
 efJp/NNlEQad8o/A+CjRGzTdMBAUzYs=
X-Google-Smtp-Source: AA0mqf6eyR5HJlMOJXAVgg7ykLhvEoROi7UBa7QjMSMawTbzVBc9iasyoFQ0K+LAiEYKulZuyCjcZQ==
X-Received: by 2002:a05:600c:384e:b0:3cf:a483:3100 with SMTP id
 s14-20020a05600c384e00b003cfa4833100mr7715457wmr.3.1670666081924; 
 Sat, 10 Dec 2022 01:54:41 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 iz2-20020a05600c554200b003cf78aafdd7sm2271980wmb.39.2022.12.10.01.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 01:54:41 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 10 Dec 2022 10:54:35 +0100
Message-Id: <20221210095435.3050998-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RJCnAwfAEJ0mSekavir5sxRUh2Y+EVHNpLRlrjshWz4=;
 b=mU6IEE71m8RIGMYyELSsFeAC+FkgLIe+0FC5lZCdLoMR19yt2dNbr7nqld0f3Ic8ty
 lXsGhRTCW9xXp686qDuA8Bs7AQeUm7yhbYhNLWuKzi8C8sNB28syGbqKZA7Te+CNd8OV
 7hSYTZAWakeGjZtn+1SWAGzukesXNgBgVjR+vQG94YhdPt7sdbigFLWRK08mNW7CY7sD
 VjmXKQ7OW+jANYiZgI27SjDcmsG9yjG/RwQeqaNLFBdT8HM9lykRjyMuYrqDOSQI0dM2
 tW9wBegqAMKUT1yNp7ALe3loWg7TiymbZrCK7vITzTYGv8v+awFY+JIk1NseUhEV1+c7
 a3eA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mU6IEE71
Subject: [Buildroot] [PATCH] package/ruby: security bump to version 3.1.3
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

fix CVE-2021-33621: HTTP response splitting in CGI

see https://www.ruby-lang.org/en/news/2022/11/24/ruby-3-1-3-released/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch | 2 +-
 package/ruby/ruby.hash                              | 4 ++--
 package/ruby/ruby.mk                                | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch b/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
index 039a6466d..805dfd2f8 100644
--- a/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
+++ b/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
@@ -14,7 +14,7 @@ diff --git a/ext/openssl/ossl_pkey.c b/ext/openssl/ossl_pkey.c
 index 2a4835a2..24d0da46 100644
 --- a/ext/openssl/ossl_pkey.c
 +++ b/ext/openssl/ossl_pkey.c
-@@ -670,7 +670,7 @@ ossl_pkey_export_traditional(int argc, VALUE *argv, VALUE self, int to_der)
+@@ -710,7 +710,7 @@ ossl_pkey_export_traditional(int argc, VALUE *argv, VALUE self, int to_der)
  	}
      }
      else {
diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index da6221ec5..42d8a2497 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2022/04/12/ruby-3-1-2-released/
-sha512  4a74e9efc6ea4b3eff4fec7534eb1fff4794d021531defc2e9937e53c6668db8ecdc0fff2bc23d5e6602d0df344a2caa85b31c5414309541e3d5313ec82b6e21  ruby-3.1.2.tar.xz
+# https://www.ruby-lang.org/en/news/2022/11/24/ruby-3-1-3-released/
+sha512  4b0fd334ae56132ba98b8a69adad54bdcf7f7aeabd5eba5b0f0399a3868e2054f9026ca1b1cb2dbb197a9e9b0610b263481949c0623a62071546bc5adff8ca69  ruby-3.1.3.tar.xz
 
 # License files, Locally calculated
 sha256  794c384f94396ab07e3e6f53a9f8be093facb7eb4193266024302b93b29e12dc  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index cbdfa4b82..28b1ec13e 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.1
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
 RUBY_VERSION_EXT = 3.1.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
