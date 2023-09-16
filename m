Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4346CD37BD
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D56B40CB9;
	Sat, 16 Sep 2023 15:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D56B40CB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yn6m74Bi1cbd; Sat, 16 Sep 2023 15:45:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ABCA410AC;
	Sat, 16 Sep 2023 15:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ABCA410AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 104F51BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1638C81CE3
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1638C81CE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eUjOEoxff_Us for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:44:16 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDEEF81E0B
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 15:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDEEF81E0B
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31c8321c48fso2700099f8f.1
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 08:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694879054; x=1695483854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ttfr/+U24nlpUyJwhEr90NzsCyuTuFw4hGjsjq62Kok=;
 b=b9dvGEQiyVFkmdbpCxOOmTcnYALwxIitV1xdrnZySOfHOTSrte2YBclpD53SrhpqaZ
 44TDaSojv1ZR6AjkewZmfzff4H5mYyLs2QW/kjrIXV/PBrFFmclt2UZcMnNWc0J7EZ3O
 P+NZ2w0XZIrbFq8549K1VCmuFN3op8/RyIo/pl0EG4UYNizZbWOT9AHkHSYFtPoc3mMW
 +/q1thTYR9PLBWPwkGCTppxwPvcmPggJb9OdrZXlZF1yCgGLDHUo4V6mROdd6VLPm/Iy
 2gCVGs8+q3zFWGnsgawa9SV1BWjywkYghGFsKvnUdN3bW+m7Bq/MNJ+VaCM0hSaNFTah
 wzpw==
X-Gm-Message-State: AOJu0YyXtZmxeGOGbUA4kv0XFy3ZfzuXgo51ux59k712vwX4KlvWoadN
 IXQkN7x1bd9bEp7z1MOMGE14O5IC+8k=
X-Google-Smtp-Source: AGHT+IHKVL2B3RATDagPFZH1MUOsXlGbRwnqvbhmR7xuyXLLm+UJ2dC47gv+Iea0ta/kcK6I5d6VbA==
X-Received: by 2002:adf:a49a:0:b0:31f:ebfa:54eb with SMTP id
 g26-20020adfa49a000000b0031febfa54ebmr4123005wrb.3.1694879054099; 
 Sat, 16 Sep 2023 08:44:14 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0031de43fe9bfsm7522010wrw.0.2023.09.16.08.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:44:13 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Sep 2023 17:43:43 +0200
Message-Id: <20230916154351.2747233-8-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230916154351.2747233-1-francois.perrad@gadz.org>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694879054; x=1695483854; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ttfr/+U24nlpUyJwhEr90NzsCyuTuFw4hGjsjq62Kok=;
 b=WvRWbti6y+4eyTtlJMc+vXMM/V1yHrktdkm1mdEZyqt3KDWO0tXG8dQaDHg6Hg092k
 vAK+b5Myu2Nfrq27fAUptAjTtfsLu5VoCdejF7SJ2H3NtwBdf4WBpAr9mlLkAKR1A2kS
 YJOOhe/zyy5p5cGQ+jTox+Vq4vo7DCKq8UB/8xn0PUiXbqBj+3/qEcpIOXwPkY8Rui/u
 Cs7IG1Zyc4GIZg/80/CBFVetsFEjQjQUcmaY45FnImU7+c5Uojs8WYgv/ZbblKj4kD9T
 LacfzycXvWk1u+EV/35QsJU1mBM/B8Xe0KoE7qVNkf5W9gen6RmpbdwcLYb29jDybtIY
 DExg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WvRWbti6
Subject: [Buildroot] [PATCH 08/16] package/perl-lwp-protocol-https: bump to
 version 6.11
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
see https://metacpan.org/release/OALDERS/LWP-Protocol-https-6.10/diff/OALDERS/LWP-Protocol-https-6.11#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-lwp-protocol-https/Config.in                 | 1 -
 .../perl-lwp-protocol-https/perl-lwp-protocol-https.hash  | 8 ++++----
 .../perl-lwp-protocol-https/perl-lwp-protocol-https.mk    | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/perl-lwp-protocol-https/Config.in b/package/perl-lwp-protocol-https/Config.in
index 9793b6f5d..fa429a2ce 100644
--- a/package/perl-lwp-protocol-https/Config.in
+++ b/package/perl-lwp-protocol-https/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PERL_LWP_PROTOCOL_HTTPS
 	bool "perl-lwp-protocol-https"
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PERL_IO_SOCKET_SSL # runtime
-	select BR2_PACKAGE_PERL_MOZILLA_CA # runtime
 	select BR2_PACKAGE_PERL_NET_HTTP # runtime
 	select BR2_PACKAGE_PERL_LIBWWW_PERL # runtime
 	help
diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
index a3c011fe8..7304a4cb3 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  cf64e4bc57a9266ac4343cdf0808c5c8  LWP-Protocol-https-6.10.tar.gz
-sha256  cecfc31fe2d4fc854cac47fce13d3a502e8fdfe60c5bc1c09535743185f2a86c  LWP-Protocol-https-6.10.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  6615a250c8963a2333ea6d0fbbec306b  LWP-Protocol-https-6.11.tar.gz
+sha256  0132ddbf03661565ca85050f2a5094fb9263cbbc3ccb1a4d9c41ac9bb083b917  LWP-Protocol-https-6.11.tar.gz
 
 # computed by scancpan
-sha256  294e73f9bd40ea600e9478cd57489a7da72558a83c6a66f37a82e4e0d5a706d9  LICENSE
+sha256  e4def55436b2bd99fe2cdbf546a72ad5958327e28831db9b5adb497c6bd580ba  LICENSE
diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
index 0663820b2..6c86ce5cb 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.10
+PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.11
 PERL_LWP_PROTOCOL_HTTPS_SOURCE = LWP-Protocol-https-$(PERL_LWP_PROTOCOL_HTTPS_VERSION).tar.gz
 PERL_LWP_PROTOCOL_HTTPS_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LWP_PROTOCOL_HTTPS_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
