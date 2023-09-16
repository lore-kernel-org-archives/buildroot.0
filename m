Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B506CD37BF
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5A0B40610;
	Sat, 16 Sep 2023 15:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5A0B40610
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YiZltlhUTPWj; Sat, 16 Sep 2023 15:44:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04534405FA;
	Sat, 16 Sep 2023 15:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04534405FA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FCD41BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 193FA81CE3
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 193FA81CE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j-o5j0_UX560 for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:44:13 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 104FF81CA3
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 15:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 104FF81CA3
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-404773f2501so24697625e9.0
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 08:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694879051; x=1695483851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qgTls0bWu3zvLHQJGnWqhqK5Y9/GuZ9iXKaKthc78ro=;
 b=IusSpbwkbVSkaH8NX5GdS3N/GixJxlMweC+KaoyIaggwHMG8ydfQbshP6bAnrtn8xM
 FsQm7gmvr+J/SCUEXyJHfaotmO5hA2ABCoHuxFzvp/3LXrITJqDWYa6vsT80K55GYXLd
 ZawfGEd7XhJxcAwV4b3XeL8pgUO3vzTUj5yka3VRx0C5rvckhYaO3BuzL7z4l4Fsjg37
 O2HACFbRCL3c3w6hnD9vZOT6C3niPfRlh9dgphGgMWxCNETf6ELNbsZggzSEn6OWWsVb
 aUQUSMVq9GAxugvHexKTcKIbx/UwEE89kURPeZ9LnUTlJ7VRYJSqXYaO1JegKb8ohsoc
 vONw==
X-Gm-Message-State: AOJu0YwVqy2fXqHbwOS4eP6mBnwkR671gwOoJeIxVgJkifv3yrynB0uL
 J8w3krXLcWHfoYe46LYdTTSE90y3ExA=
X-Google-Smtp-Source: AGHT+IHOxQZ865iZElTvNOvpgJPlw20tLFCKF9qDqEzqUPvx50Ioi98ysme6o/X9EqZQVO646ropgg==
X-Received: by 2002:a05:6000:5c7:b0:31f:f753:5897 with SMTP id
 bh7-20020a05600005c700b0031ff7535897mr5051419wrb.59.1694879050630; 
 Sat, 16 Sep 2023 08:44:10 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0031de43fe9bfsm7522010wrw.0.2023.09.16.08.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:44:10 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Sep 2023 17:43:38 +0200
Message-Id: <20230916154351.2747233-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230916154351.2747233-1-francois.perrad@gadz.org>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694879051; x=1695483851; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qgTls0bWu3zvLHQJGnWqhqK5Y9/GuZ9iXKaKthc78ro=;
 b=NpUUi6fFrhvUuN3vklkZtSggeQ0JxVcRqoBUinUu9GynjyUOzyGWEoe8yz9dbesCNA
 t1KmsNqvGtVHIjfzcKhtnUVT20GXCNfhD9zWucbk2d7VYwGeqe2VpoaIegg6G1aCQMx9
 ucczP3RMtIjUi63EJaFTtVYERUPfHCgOH6G1gIwyMieCTDw971c8hmu8hCG7Ypatvuqr
 ckJ1Q17v8usJJwA6sHFKaJCyDoedzxy+RTawbw+eEmqqxtuauHRXj7G3Q8Qv5YI1OBSC
 EyWBLPQXrBndGKBo/LAIjeMls0EwOH20eT3K7s8JV7vn+sz3yd0A8kq0yLOuD4OdevVy
 W8AQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NpUUi6fF
Subject: [Buildroot] [PATCH 03/16] package/perl-exporter-tiny: bump to
 version 1.006002
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

move homepage to https://exportertiny.github.io

LICENSE: update copyright dates & remove trailing spaces
see https://metacpan.org/release/TOBYINK/Exporter-Tiny-1.006000/diff/TOBYINK/Exporter-Tiny-1.006002#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-exporter-tiny/Config.in               | 2 +-
 package/perl-exporter-tiny/perl-exporter-tiny.hash | 8 ++++----
 package/perl-exporter-tiny/perl-exporter-tiny.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-exporter-tiny/Config.in b/package/perl-exporter-tiny/Config.in
index 04839ac15..c3ac89ba2 100644
--- a/package/perl-exporter-tiny/Config.in
+++ b/package/perl-exporter-tiny/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PERL_EXPORTER_TINY
 	  an exporter with the features of Sub::Exporter but only core
 	  dependencies.
 
-	  https://metacpan.org/release/Exporter-Tiny
+	  https://exportertiny.github.io/
diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.hash b/package/perl-exporter-tiny/perl-exporter-tiny.hash
index 0ecdf7848..0e16f92b1 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.hash
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  2d555e289eac6450052e8683c292cbf7  Exporter-Tiny-1.006000.tar.gz
-sha256  d95479ff085699d6422f7fc8306db085e34b626438deb82ec82d41df2295f400  Exporter-Tiny-1.006000.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  0545ee8f4edcb9dc5a87b21ed25edd74  Exporter-Tiny-1.006002.tar.gz
+sha256  6f295e2cbffb1dbc15bdb9dadc341671c1e0cd2bdf2d312b17526273c322638d  Exporter-Tiny-1.006002.tar.gz
 
 # computed by scancpan
-sha256  a4f85c6f4d6e8bdd37b7ab08013e3e3bee1fe8e910e20f8f54d5025ffe40f384  LICENSE
+sha256  1a2929dacaef239beca27a85f7f97b793628dfb22f07fdfb406cb6f3f0d22a6b  LICENSE
diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.mk b/package/perl-exporter-tiny/perl-exporter-tiny.mk
index 489ee54e1..715070623 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.mk
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_EXPORTER_TINY_VERSION = 1.006000
+PERL_EXPORTER_TINY_VERSION = 1.006002
 PERL_EXPORTER_TINY_SOURCE = Exporter-Tiny-$(PERL_EXPORTER_TINY_VERSION).tar.gz
 PERL_EXPORTER_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_EXPORTER_TINY_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
