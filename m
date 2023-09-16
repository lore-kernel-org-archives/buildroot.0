Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553CACD37BD
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 117B340467;
	Sat, 16 Sep 2023 15:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 117B340467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hgeA8DDnGCM7; Sat, 16 Sep 2023 15:47:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65410411A6;
	Sat, 16 Sep 2023 15:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65410411A6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1697A1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C465F81CC3
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C465F81CC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aOzxBZggzl3u for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:44:21 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59DAA81CAD
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 15:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59DAA81CAD
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-31c6d17aec4so2876508f8f.1
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 08:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694879059; x=1695483859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Z7e/GrWXA7NjcqIIxVnRS1iKn+VLoeF3qxSCir+yAk=;
 b=SWJlaJbUMU3o8FxPMFh2pC7ityr7mdzurFJQ6+qSu/T4iDUi0CwArautHevv65womf
 AYpOT64Alp2h7Cypb5U2zSil8QkEWFjHgdbR/kuohRIC9+A767Tp7tUEaG+/PWbuN9c2
 WCtnOQ7YIGTywy3BZaXxCeoSsdi06wXsBf2rntrhK0sDE79ylOB+8s3z00jfJrYx6Ohp
 Vkg3/3wxPUnp6PijKsQCmZEWtDZE9JD9I7Ai8w7FriSxB4sNBvzBvlIppJevMnKsLG9B
 1hTGNDXf+WOJhIuaS3kEOSvzA4rSDmeZTMhkxbSfWhZl4vZR1qFGcBRNsAe4008j4PGe
 Ofrw==
X-Gm-Message-State: AOJu0YxzmOtq8bGHZvPI2rYuqt5zWjBf7aJB/sIzCIlEClOucB5uZelq
 Q98XYaUHk6ClfcuPh2s/o/sceXpO5Lo=
X-Google-Smtp-Source: AGHT+IE22TmZiaVDCN04navVfijTg524zBnjtXvo9qrIppQPxv6214GiV2Gpm0fmSt3otCzLYmuvxA==
X-Received: by 2002:a5d:6f03:0:b0:31f:f91c:d872 with SMTP id
 ay3-20020a5d6f03000000b0031ff91cd872mr4119182wrb.19.1694879059494; 
 Sat, 16 Sep 2023 08:44:19 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0031de43fe9bfsm7522010wrw.0.2023.09.16.08.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:44:19 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Sep 2023 17:43:51 +0200
Message-Id: <20230916154351.2747233-16-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230916154351.2747233-1-francois.perrad@gadz.org>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694879059; x=1695483859; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Z7e/GrWXA7NjcqIIxVnRS1iKn+VLoeF3qxSCir+yAk=;
 b=KIsexGVHxV1XMqPi0MWL+cuAwBn6/T3rI6NIPai9nNKHOgxfrGSfERuVBpnY0PRUCz
 5HCYGmeB4kS7QYUO2v2vhVoEkCXVX8yR7ICucLkZ9X9SIx2+v1IsE8esTygFAggclW4X
 yyAhd5o7iqSU4FqD3vjfYlLxSa1n7TyU7ae8sftfhq1VmKBHRCjKQTbpJxTmkYJ92q+3
 qmbLt0lMGoT5G0eSP3Zi61RXpIEQnkrJuiwr8XCjcBsqrjzp3c8XY75gYCpWjWSWm2TT
 uvSR5oSEevkbsUIEOY1ZAWVOsPUxNFeuky1eASHB2Dy7j423MhzXSawPEjI17k2eSJvX
 q/sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KIsexGVH
Subject: [Buildroot] [PATCH 16/16] package/perl-uri: bump to version 5.21
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

LICENSE: reformated Artistic License part
see https://metacpan.org/release/SIMBABQUE/URI-5.19/diff/OALDERS/URI-5.21#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-uri/perl-uri.hash | 7 ++++---
 package/perl-uri/perl-uri.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

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
index a7fab863a..fc07e69db 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.19
+PERL_URI_VERSION = 5.21
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
-PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SI/SIMBABQUE
+PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_URI_LICENSE = Artistic or GPL-1.0+
 PERL_URI_LICENSE_FILES = LICENSE
 PERL_URI_DISTNAME = URI
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
