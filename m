Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF4DCE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 07:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF43041AB5;
	Sat, 23 Sep 2023 07:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF43041AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PNIgxdDssXgZ; Sat, 23 Sep 2023 07:22:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D02B7419AC;
	Sat, 23 Sep 2023 07:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D02B7419AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43AD31BF3DF
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA55982141
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA55982141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yDUrA-ESn713 for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 07:21:53 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF51D820F1
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 07:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF51D820F1
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40537481094so29869655e9.0
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 00:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695453711; x=1696058511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3O4QTvM01DLD9FnxdspgHKHv5P5axMjFaWVl6AzbEig=;
 b=FiDkn38ko6vdXExqn2j1lgwT9OqSsWt/AZw3IGFtzaaV/XxwwQ7y3qpybeojUANg/N
 AlSa4I6pFbiotiWXFyG3NdNXsO/+d+D9hh9nJ03dOrsSPeBGOnfvleO1f5OXdOvuZP+9
 ktxPiw1cW8udB0s/48/KldVNT9ntbdlLDSpCvAE4NYhs0wOVHl0R/CxdllzNmXGaLPIC
 VziSOokQmuwJZV3pV/2j0LuBzxs7Ixo0fUl68QNXlu47R6szCHy2HM+rdzxScUjMVvU1
 XxkzaZAOs2DCWYVQnlFmDbMpV1TOrQDNtcYTledLTjrmbMbe5yUHd3nR5gAp+X//52ZN
 OpsQ==
X-Gm-Message-State: AOJu0YyDAmt7TftUG3jaFTMpT2vDjU1nL20Y/S4iGGmShgkMtUZuTEhe
 uDO4eMTr6vJsOdRi2URravB0RmMETPU=
X-Google-Smtp-Source: AGHT+IF50vIBhevbDnRN+GZIc7S4FKrNWdWIbsMjofbYCCH11gqlTvL+APiZGiFUVVEswaToIEPyEw==
X-Received: by 2002:adf:f24f:0:b0:317:5bb2:aeca with SMTP id
 b15-20020adff24f000000b003175bb2aecamr1474963wrp.16.1695453710785; 
 Sat, 23 Sep 2023 00:21:50 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 d4-20020adffd84000000b0031f34a395e7sm6156999wrr.45.2023.09.23.00.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 00:21:50 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 23 Sep 2023 09:21:25 +0200
Message-Id: <20230923072133.3122644-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923072133.3122644-1-francois.perrad@gadz.org>
References: <20230923072133.3122644-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695453711; x=1696058511; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3O4QTvM01DLD9FnxdspgHKHv5P5axMjFaWVl6AzbEig=;
 b=HjdSVFIkahp4snQxXJJJoF/VB3iUaQ9KwmefFySnpOai6RkRML5xHD9Mi7w+UIjNtM
 j8Wio0Y4MXfKBXkJCg969gH67ZF1hBxvNNchHncq/WDKDV6eWMdvsndfwPyWSevYCfOK
 DdFjReXV3zU53pQQhaXbDUT8OmIGZpWHiAKkn1UklUy7dhgYwHbgzEPOuoXZn+f6lInt
 jlrlX6ylVhUuY59BoVJY/bBSHutsgkwg7+WHOOFpHe06Ql8crjYHxUtS3/FhvWCGMhZS
 jkTnahOwLjQIIvUSrnFpLvf55Ve+YswYVHq1zmPcbv1YUOdcXVaW1AtRIsUuoDq7Iwmy
 Pepg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HjdSVFIk
Subject: [Buildroot] [PATCH v2 04/12] package/perl-file-sharedir-install:
 bump to version 0.14
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

LICENSE: remove trailing spaces
see https://metacpan.org/release/ETHER/File-ShareDir-Install-0.14/diff/ETHER/File-ShareDir-Install-0.13#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-file-sharedir-install.hash                       | 8 ++++----
 .../perl-file-sharedir-install.mk                         | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-file-sharedir-install/perl-file-sharedir-install.hash b/package/perl-file-sharedir-install/perl-file-sharedir-install.hash
index b462d8e68..bfc06ab22 100644
--- a/package/perl-file-sharedir-install/perl-file-sharedir-install.hash
+++ b/package/perl-file-sharedir-install/perl-file-sharedir-install.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  5eabd44a5d7d84bf2e8e502491226287  File-ShareDir-Install-0.13.tar.gz
-sha256  45befdf0d95cbefe7c25a1daf293d85f780d6d2576146546e6828aad26e580f9  File-ShareDir-Install-0.13.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  bac4d924f3d863b00648ab56ec0dcbdc  File-ShareDir-Install-0.14.tar.gz
+sha256  8f9533b198f2d4a9a5288cbc7d224f7679ad05a7a8573745599789428bc5aea0  File-ShareDir-Install-0.14.tar.gz
 
 # computed by scancpan
-sha256  c207ca1c71c16a443d875a78d8aeccfbe550da502cd7fda24819548afb04fb5c  LICENSE
+sha256  6b5ade128fd47c452beec6dc31b3386482379fafb88f7f1962c7355db322d2ac  LICENSE
diff --git a/package/perl-file-sharedir-install/perl-file-sharedir-install.mk b/package/perl-file-sharedir-install/perl-file-sharedir-install.mk
index 3653a4bad..4f152e1b5 100644
--- a/package/perl-file-sharedir-install/perl-file-sharedir-install.mk
+++ b/package/perl-file-sharedir-install/perl-file-sharedir-install.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILE_SHAREDIR_INSTALL_VERSION = 0.13
+PERL_FILE_SHAREDIR_INSTALL_VERSION = 0.14
 PERL_FILE_SHAREDIR_INSTALL_SOURCE = File-ShareDir-Install-$(PERL_FILE_SHAREDIR_INSTALL_VERSION).tar.gz
 PERL_FILE_SHAREDIR_INSTALL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_FILE_SHAREDIR_INSTALL_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
