Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DA3CD37BD
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 717DE40CB9;
	Sat, 16 Sep 2023 15:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 717DE40CB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBYwQSyyMfWR; Sat, 16 Sep 2023 15:46:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 405724114F;
	Sat, 16 Sep 2023 15:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 405724114F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 094C81BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5964881E1F
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5964881E1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YqhAvSKFf8Nc for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:44:17 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E9EB81CC3
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 15:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E9EB81CC3
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31ff985e292so1261918f8f.1
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 08:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694879055; x=1695483855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uykbMN3jFwU9bT/ypPMDcJmGLKY+sOqtEUfr6tHb1Zc=;
 b=rgMNSUVbLJcYKfeUj+AzFnPAjBQd9bGQiDq8Ka4jwb+rGb5InCG3d2++d+dZ+oEjzN
 1zIsSmOjheJndc2ZQzLVqBp1K0idE8hyAJaZHVOvuKiUC8Q+28dIrxzR3LNDLuaNK9R1
 PfJ5RVvC9OEikdk01qPKTaFLAL8ClxaMW+9+e+Y/RFNnlwXWEuiIuQKcrDqLFu5kQeTc
 pw5tvvz2ixJIpzyWbvx6pKTIVeipZDTKzV0n8779G/01nAy1Nc9nexZIprn5OkFhu+Jm
 IJhZrBrazFJwqv8Y1BVHhRitBnsvmFE7d8ilDibdrfZn7Qb678fkLjsKCmyNnBEWgf2/
 YkOA==
X-Gm-Message-State: AOJu0YwIPBuIoreOJ7AdVejWBKoXWRbwVN9oFBjO5EzZg/jSIpwqHbNF
 cThkgoPF+zY72zaDoDCrFvv03xwfylw=
X-Google-Smtp-Source: AGHT+IFjP1b3ce0aUUCxk53DJoeZQ7RBc/tkOxNMIEleJ5wwXVzXgxJcFk2NSEHuE7JFwNs7T0bm1Q==
X-Received: by 2002:a5d:5a86:0:b0:31f:fe07:fde7 with SMTP id
 bp6-20020a5d5a86000000b0031ffe07fde7mr2660728wrb.1.1694879055420; 
 Sat, 16 Sep 2023 08:44:15 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0031de43fe9bfsm7522010wrw.0.2023.09.16.08.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:44:15 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Sep 2023 17:43:45 +0200
Message-Id: <20230916154351.2747233-10-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230916154351.2747233-1-francois.perrad@gadz.org>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694879055; x=1695483855; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uykbMN3jFwU9bT/ypPMDcJmGLKY+sOqtEUfr6tHb1Zc=;
 b=PNqVDlFUdrlQlFdcdhtcwaub0Juu1RjY1wx7zvoDPZCeH5VBXPDLHiRiVnP1lQGGfi
 OtX2p5HGNMtJvE2zqmzXfkWYUfRlrGDnk9avr7x22a+e14IfiXQiH/KifKYtSkejJ7R7
 BIGvFvEaIJkAwK5CQoDc/WtXTQ1pae8zeg5JlJiiHqsfcAdo4RIq1exul5l3G/FCgzHt
 6/TSUCO+rxlgy43Js8/fn5/OoHRi2WIrAbuCroJAYPI7Hs6n2WFBsg27nlaGNrZBCOhD
 pOgYIaEwqpdFyhOL/3xqWXRxda//D5Bin7fWlmthesbFXFwhE2XoCIxNxN1KlYcWNC4V
 j9Kw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PNqVDlFU
Subject: [Buildroot] [PATCH 10/16] package/perl-moo: bump to version 2.005005
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
see https://metacpan.org/release/HAARG/Moo-2.005004/diff/HAARG/Moo-2.005005#LICENSEhttps://metacpan.org/release/HAARG/Moo-2.005004/diff/HAARG/Moo-2.005005#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-moo/perl-moo.hash | 8 ++++----
 package/perl-moo/perl-moo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-moo/perl-moo.hash b/package/perl-moo/perl-moo.hash
index 9b67e7a65..f70646dec 100644
--- a/package/perl-moo/perl-moo.hash
+++ b/package/perl-moo/perl-moo.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  49ecf491b49b9b200e8a5dfd1a42b480  Moo-2.005004.tar.gz
-sha256  e3030b80bd554a66f6b3c27fd53b1b5909d12af05c4c11ece9a58f8d1e478928  Moo-2.005004.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  259530e5ea37a1bf968f6cf18a25db86  Moo-2.005005.tar.gz
+sha256  fb5a2952649faed07373f220b78004a9c6aba387739133740c1770e9b1f4b108  Moo-2.005005.tar.gz
 
 # computed by scancpan
-sha256  a8a1595c2347f7d10e896809d4f3dea85ccc10ac5644b8073111233cd120b14a  LICENSE
+sha256  de7a14750e81d97e19e111df58a3b51e3f2c8ec2d2dd90f576f54243251972c6  LICENSE
diff --git a/package/perl-moo/perl-moo.mk b/package/perl-moo/perl-moo.mk
index 6c484ba9e..18e32688e 100644
--- a/package/perl-moo/perl-moo.mk
+++ b/package/perl-moo/perl-moo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOO_VERSION = 2.005004
+PERL_MOO_VERSION = 2.005005
 PERL_MOO_SOURCE = Moo-$(PERL_MOO_VERSION).tar.gz
 PERL_MOO_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_MOO_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
