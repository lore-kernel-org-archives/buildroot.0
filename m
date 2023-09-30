Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3A9E77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A57874155E;
	Sat, 30 Sep 2023 13:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A57874155E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id trgCCcY6lmo0; Sat, 30 Sep 2023 13:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5AD040B0E;
	Sat, 30 Sep 2023 13:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5AD040B0E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF3A71BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2BD181FC9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2BD181FC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L7cv5Yif98JD for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:15:18 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A329F81FD7
 for <buildroot@busybox.net>; Sat, 30 Sep 2023 13:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A329F81FD7
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9a645e54806so1995740066b.0
 for <buildroot@busybox.net>; Sat, 30 Sep 2023 06:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696079717; x=1696684517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fx85lZY8AGXFhEp0fcluSxfIO7LvfXabCF6oAQUjh/U=;
 b=gp6+m+kV/u4/RS68m5tMZOy1wt00oT94IUzCroQI33toLJfAgAQa+cPc641WYaSGcO
 Cg8sehM55riklOcdLCw0dmylB8qSvNuZmC/4tW3RiPIvM+nlSgEB8w+RG3mx86xhoNwg
 U/xE+v7D+m92uYZOlJSQ00FQm49QGX8tRsZK/nFgtD9xaBxk2V4IreofDr/YVDx/Q25D
 04WlPqUo0lfnUpYWhk+dutEx1x16eRxUU5Y14gTKXL8RaQEqLn6ZQBK7nrlkNhn6If/K
 t9iN/uvgGR/A3yNB51wHb/b/5aQSsnnBa1ZypQBnGTfn2xdwCkNRs6tkPsAz5woE1G5D
 S9cA==
X-Gm-Message-State: AOJu0Yx3g6sA7cEyqjbo3Ftxvxs3sgb9w7oC0UCM0Pq5oE3mIaJPjDfS
 HjHjHYuqe/WQmjfo29KZhk3M5U+3NDE=
X-Google-Smtp-Source: AGHT+IH768EdBKsNlvdhGCx872SFni22Dxwd5/VLz0iaEkRavotx8D+VkWY6j/BicfM5VHCm4pAXzQ==
X-Received: by 2002:a17:906:3ca1:b0:9ae:1872:cf8a with SMTP id
 b1-20020a1709063ca100b009ae1872cf8amr6335051ejh.54.1696079716701; 
 Sat, 30 Sep 2023 06:15:16 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 j11-20020a170906278b00b00977eec7b7e8sm14084934ejc.68.2023.09.30.06.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 06:15:16 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 30 Sep 2023 15:15:04 +0200
Message-Id: <20230930131506.3320394-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230930131506.3320394-1-francois.perrad@gadz.org>
References: <20230930131506.3320394-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696079717; x=1696684517; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fx85lZY8AGXFhEp0fcluSxfIO7LvfXabCF6oAQUjh/U=;
 b=QJL93ymlfMKorp6KvxAhhdx9HbwvrIw3/KXRh7uZMGjpgh0yJG8lRJxIB0z9HWogH2
 Y0EhPcux2RlqohfYK1day8rnZY73zjdKQU5+KdFP/9uf31pAsvUCXM8RsILm0Q0lOYpe
 lvRWeM+aKt9lLFWIAI5hQjlTxGACIqd6igFs1PNQ4QH21lS+mlLfXk27oqg+P58ydpNs
 995iToHBBHQmxEy0Kz2+RlgvwFN9dRPPTbv8BPHb8TU/Ebj1mgXS3SsVXKatpqOtUk1O
 1dSFgmwYMYUB2sKBOMjyKir16cq7t8mhc+lKprk7vvEMzc3xhlExhMtQrDipQrDNfw/Q
 nzPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QJL93yml
Subject: [Buildroot] [PATCH 3/5] package/perl-http-message: bump to version
 6.45
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
see https://metacpan.org/release/OALDERS/HTTP-Message-6.45/diff/OALDERS/HTTP-Message-6.44#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-message/perl-http-message.hash | 8 ++++----
 package/perl-http-message/perl-http-message.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index 94b5c06a4..b33e00e33 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  926a077669a7828c5ca39b5cf7735625  HTTP-Message-6.44.tar.gz
-sha256  398b647bf45aa972f432ec0111f6617742ba32fc773c6612d21f64ab4eacbca1  HTTP-Message-6.44.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  86c386bcc85a63c8908e6ae9967b34ee  HTTP-Message-6.45.tar.gz
+sha256  01cb8406612a3f738842d1e97313ae4d874870d1b8d6d66331f16000943d4cbe  HTTP-Message-6.45.tar.gz
 
 # computed by scancpan
-sha256  f2f428b5f8a3bf4e6a71cd5ea92558a3d123d3d7c5075d34923e71e46dea94df  LICENSE
+sha256  553ecefc0ed6d4152809da8516960b9a12352c1c0d7d289ac4ab06d0bd0e67bb  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 67b68b0de..7fdba0b29 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.44
+PERL_HTTP_MESSAGE_VERSION = 6.45
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
-PERL_HTTP_MESSAGE_LICENSE = Artistic or GPL-1.0+
+PERL_HTTP_MESSAGE_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 PERL_HTTP_MESSAGE_LICENSE_FILES = LICENSE
 PERL_HTTP_MESSAGE_DISTNAME = HTTP-Message
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
