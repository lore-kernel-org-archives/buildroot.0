Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B0ACD37BD
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2275409EF;
	Sat, 16 Sep 2023 15:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2275409EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JCYg-d5HGqZ4; Sat, 16 Sep 2023 15:45:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E7334107B;
	Sat, 16 Sep 2023 15:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E7334107B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7203C1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5758F81CAD
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5758F81CAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pzDitJgZy7rX for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:44:15 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 557AE81CA3
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 15:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 557AE81CA3
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3200257b9a3so354864f8f.3
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 08:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694879053; x=1695483853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T0DK3BmQsqpGu/I6vtU7NzFlRQgTRa2g5y9kO6xsJ9w=;
 b=v3Dn0qSjldJIvXZpltJZRUQ2l92XSrfPz4lMnCl8PjMsP7FnYz8ubpwJZP16v0Bu3v
 X6wwGfhzlRveftxtnLdwnBewstRJqp6CKUOGwKd4Ki9U6e1G5zwJWU8DOsHkvGUd1F4V
 SaVhgeDeEXNboUw5iQy0wnSuHd8TVC1CB9BAgxPZAq1OixgrdF9lDj/KwbMResd8hMDP
 /msAfNNiTJmYS90ld3FKuHJgRWa9LsI+WeYbxrlW/brZ5uKlMF72DmtwMrNEXOW4WRfG
 E4kgS2Z0mUnqYs2M1FsU695eTyFUKD/ZZm5YDZJfjeDcGZeCz0V+ASq9nGoeNyRv7nMu
 S9rA==
X-Gm-Message-State: AOJu0YxZMc4LnrEWDfcJhATqNzxR/xFeHEB695tIuXqk4qBCMPYBdpvA
 pLGY2a9bUmSthwP+XOmV4ycjrmfPiMU=
X-Google-Smtp-Source: AGHT+IELX6Z7nf+dG0480lb4sOnN95XmHWMd6TkavZFjc0Phw8/zxyjoxjwimGZRHnFMaH5FwHwHCA==
X-Received: by 2002:a5d:508e:0:b0:31f:e1b4:5846 with SMTP id
 a14-20020a5d508e000000b0031fe1b45846mr3628270wrt.53.1694879053463; 
 Sat, 16 Sep 2023 08:44:13 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0031de43fe9bfsm7522010wrw.0.2023.09.16.08.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:44:13 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Sep 2023 17:43:42 +0200
Message-Id: <20230916154351.2747233-7-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230916154351.2747233-1-francois.perrad@gadz.org>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694879053; x=1695483853; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T0DK3BmQsqpGu/I6vtU7NzFlRQgTRa2g5y9kO6xsJ9w=;
 b=hK7EDWuB25ratVEGiB0oq9WYjbCOSsWcFIc5m5SbaoX1ihkHf0CvqNdqeh0jvFm8Q3
 sPw+aeZv5fGVzL35PB9rSrAT3c1v2gxb6xMsjmukVanXLW8PjWCQ8EhOCfCtrQPB56kx
 NcQo7GV1+T3yHkLX3eBADW9WjGqAagY9p6PonMiOUB0739fi2m+I9Z+ydSbBlq2bln8q
 oVxNWoReNROjAcum4QNCladK1zA3lZDez5tjX1xsqBlzDt7h/IwXCU2ra6SOt2YWeNFW
 kH7fhJMu7v7NjHuW2/zZfFn94fSVepZw1aPGeRffiLUn7Q1jerwDnwdYh8xNbunsaWO/
 wrCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hK7EDWuB
Subject: [Buildroot] [PATCH 07/16] package/perl-json-maybexs: bump to
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
see https://metacpan.org/release/ETHER/JSON-MaybeXS-1.004003/diff/ETHER/JSON-MaybeXS-1.004005#LICENSE

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
