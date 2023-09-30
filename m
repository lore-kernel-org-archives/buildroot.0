Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60827E77373
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 179AA41D50;
	Sat, 30 Sep 2023 13:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 179AA41D50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CpO2FBpNSg1k; Sat, 30 Sep 2023 13:16:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D4B040B0E;
	Sat, 30 Sep 2023 13:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D4B040B0E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C292D1BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97ABC81FD8
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97ABC81FD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q0uwEDu56TTf for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:15:19 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BB8B81FCE
 for <buildroot@busybox.net>; Sat, 30 Sep 2023 13:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BB8B81FCE
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so1949861766b.3
 for <buildroot@busybox.net>; Sat, 30 Sep 2023 06:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696079717; x=1696684517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2dKaPV4VqN4mIRPcgvhcrzSo/9HpnVle65INePodo/Y=;
 b=mptUfqtoCsOqbv+LNFzlsrwxxHT9FAlT3DV7RQ+LSu2ujxyL4o2hyyH+a3fjHjNh54
 Yh8243iJ/zVwrvocXvPaX8js/u7ZstymNIzJ2g1Tlfkk1o63fdWDDCnvHPyuKfYEmC+w
 IgoBu7enBeQhhbUxLuNIs00zVh249ViJCm79ENAGK7dX+7y5zIXS4Avx8fTGqWseAR3V
 uZ+YV1rIeaJHbNveJeYaw//SpQb/RpxEdEInPjFHaa+3u5MUavxpx2KpqSFXQ0khjLhL
 Tm7dVbEeHW/CYi2mv8Njm8tFukQKcAr3r65J1BQe7XSP2Mqi4zaJ4X0vvBtPPbD4yd97
 wpMw==
X-Gm-Message-State: AOJu0YzXP/QqeMXreUE0aLEbew4E3Yl3s4aVx2V88z2xwAzQ9cAqW/tp
 VZFmxhT81YlpOEfYtErzl65xiuEVkvI=
X-Google-Smtp-Source: AGHT+IHsNlF0ITvUqwb8VAHxGFzC6PAQj50YU6R4idHBljSjxjvNDuINk31Isb3FuHXcbOQvuG1WBg==
X-Received: by 2002:a17:906:3cb1:b0:9a5:852f:10bd with SMTP id
 b17-20020a1709063cb100b009a5852f10bdmr5378388ejh.62.1696079717383; 
 Sat, 30 Sep 2023 06:15:17 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 j11-20020a170906278b00b00977eec7b7e8sm14084934ejc.68.2023.09.30.06.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 06:15:17 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 30 Sep 2023 15:15:05 +0200
Message-Id: <20230930131506.3320394-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230930131506.3320394-1-francois.perrad@gadz.org>
References: <20230930131506.3320394-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696079717; x=1696684517; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2dKaPV4VqN4mIRPcgvhcrzSo/9HpnVle65INePodo/Y=;
 b=CoJOS4md3TpD8enG5MRP2q7sGssizT671U5ca4hNkdi/NRw5f1RPFqZSHmKDIgBUu6
 wlfa1nAOhvWxzy4N09Ci0noh0CV7P6yXj8RSWYthWWFiDeqMSNJ6NiR+osg0MYgwbMeE
 Giy6Z3wizCxDCUlRKwnflqz77FN1N18t5RZuIGVe28N/9mDOrfsuXGjLQ3aVArKDnm/P
 AHcjeSPrqvavjhgIz5kQ0051j5UpVwq9EfnicTe1uZq38nqz6IofJC5OYu86Nd/AUftk
 rmYJdxuum5AST0ag4eNoElC7xuq7iop6KLoLXAXf7O2zM1zEpw0ykT2yjheXlYc8U0pi
 gWDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CoJOS4md
Subject: [Buildroot] [PATCH 4/5] package/perl-lwp-protocol-https: bump to
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

LICENSE: switch to Perl Artistic
see https://metacpan.org/release/OALDERS/LWP-Protocol-https-6.11/diff/OALDERS/LWP-Protocol-https-6.10#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-lwp-protocol-https/Config.in                 | 1 -
 .../perl-lwp-protocol-https/perl-lwp-protocol-https.hash  | 8 ++++----
 .../perl-lwp-protocol-https/perl-lwp-protocol-https.mk    | 4 ++--
 3 files changed, 6 insertions(+), 7 deletions(-)

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
index 0663820b2..960de52f0 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.10
+PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.11
 PERL_LWP_PROTOCOL_HTTPS_SOURCE = LWP-Protocol-https-$(PERL_LWP_PROTOCOL_HTTPS_VERSION).tar.gz
 PERL_LWP_PROTOCOL_HTTPS_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
-PERL_LWP_PROTOCOL_HTTPS_LICENSE = Artistic or GPL-1.0+
+PERL_LWP_PROTOCOL_HTTPS_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 PERL_LWP_PROTOCOL_HTTPS_LICENSE_FILES = LICENSE
 PERL_LWP_PROTOCOL_HTTPS_DISTNAME = LWP-Protocol-https
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
