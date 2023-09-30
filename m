Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222B6E77373
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A794E41D61;
	Sat, 30 Sep 2023 13:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A794E41D61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1lyhQpuDzBV; Sat, 30 Sep 2023 13:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E4CD41D54;
	Sat, 30 Sep 2023 13:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E4CD41D54
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEEE51BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97A6E81FD8
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97A6E81FD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nqF-hAkU-9qI for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:15:20 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6817E81FD7
 for <buildroot@busybox.net>; Sat, 30 Sep 2023 13:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6817E81FD7
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5334f9a56f6so19465702a12.3
 for <buildroot@busybox.net>; Sat, 30 Sep 2023 06:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696079718; x=1696684518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M/uQ/npRoXgTItx2aY/Oe5LeKn15QxgWAPz9ORCHxVo=;
 b=qh7w/A48vmrtBFPj1WOl1mdlPBkyTcE1NDhsSPl35dwAf4JQUnYyHnKdEqLmGKVznF
 4pd11zQJ3hdoQ9mSpVbVmb94IgLLFjQDayORhQ6+G77Sg0jBQLDOBmCiavFEMpasEUVV
 7YJXCV5FsOXqejlPr4bOE6AOsBIku57Dao/LkzBKFjMsofur1FJ0v0khNJQMQGCZpieu
 YM18onfqMRkbZpQR+YyquChhGil2wIdJNnrc14cOicnAOqAURFwFTIzSsmeDhb2PuVnI
 ne0p0HxFDQFOCooxE23QA1dbnGYCTKypXlxOXFNkAHCyXn2nAn/r7dLEMukW4aH0/zdW
 3ZCw==
X-Gm-Message-State: AOJu0Yzh0G3Vp+cWDQ2evk2PbmH+umB4r17UBgCfXfaWFw3Ca+RaMX7+
 lgf42jY9CIJ/NfPM8ayTd1DZuRHJ6fE=
X-Google-Smtp-Source: AGHT+IFSR5j7mr7vJlL/LX+sufOP1eiW3Y9Pj+FYojHLfHjKF7xLSFtoTGC1e5L4h6AMmgE+O7mvMg==
X-Received: by 2002:a17:907:270a:b0:9ae:699d:8a29 with SMTP id
 w10-20020a170907270a00b009ae699d8a29mr6059674ejk.6.1696079718140; 
 Sat, 30 Sep 2023 06:15:18 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 j11-20020a170906278b00b00977eec7b7e8sm14084934ejc.68.2023.09.30.06.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 06:15:17 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 30 Sep 2023 15:15:06 +0200
Message-Id: <20230930131506.3320394-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230930131506.3320394-1-francois.perrad@gadz.org>
References: <20230930131506.3320394-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696079718; x=1696684518; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M/uQ/npRoXgTItx2aY/Oe5LeKn15QxgWAPz9ORCHxVo=;
 b=AvtbQQQcipHPSgUeyyr55ZZNTTI/b7H3JMGeH6b3SkGHavZkUcODOmc0f7c3xVftkj
 VduTyX5irm78ym6hlcajP3T1mhxxqEXSYj9Kgh9BzJw2NtyjWgv+VRlq4ecEdItZYY3H
 ekV876icTE7BZrCupcioOc+sovXKHD6TyyzcmvWOslhbFrHDnJZK3FLzY63QPJ1xUYwZ
 Uthz8RCI8bAfSVDDWMINUuvyWcbGFYzHAu/0yIEBjjLLzQXeMGYdXxIA+TEp6fXNjBup
 vsUdNGuicW2mYn0O7EXbAjtXMJkVdexRCTUHjOmFdQFEKMOohDAk/P92Hr7sdXMGfs/A
 4Ndg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AvtbQQQc
Subject: [Buildroot] [PATCH 5/5] package/perl-uri: bump to version 5.21
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

LICENSE: switch to Perl Artistic
see https://metacpan.org/release/OALDERS/URI-5.21/diff/SIMBABQUE/URI-5.19#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-uri/perl-uri.hash | 7 ++++---
 package/perl-uri/perl-uri.mk   | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index eaf57623b..c10a829e9 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,5 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-sha256  8fed5f819905c8a8e18f4447034322d042c3536b43c13ac1f09ba92e1a50a394  URI-5.19.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  9b45e7635f0968deabe377fc4c99a8b5  URI-5.21.tar.gz
+sha256  96265860cd61bde16e8415dcfbf108056de162caa0ac37f81eb695c9d2e0ab77  URI-5.21.tar.gz
 
 # computed by scancpan
-sha256  d4f0b7a8771dcb1eee79a38c2e466eb997e23565a6687dd1900a2027eabe12a0  LICENSE
+sha256  a1730c55839ce3c9182c92e3387ba8f683ad6ab8b4a3257553a20c4db194c2cf  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index a7fab863a..aa0c1ed8b 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.19
+PERL_URI_VERSION = 5.21
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
-PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SI/SIMBABQUE
-PERL_URI_LICENSE = Artistic or GPL-1.0+
+PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_URI_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 PERL_URI_LICENSE_FILES = LICENSE
 PERL_URI_DISTNAME = URI
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
