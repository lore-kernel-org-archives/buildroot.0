Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8A7E77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 672A740C03;
	Sat, 30 Sep 2023 13:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 672A740C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id unkqd9IlYOkV; Sat, 30 Sep 2023 13:15:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70BF34155E;
	Sat, 30 Sep 2023 13:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70BF34155E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C5651BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14B3181FC1
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14B3181FC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VXBNCHcr9huB for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:15:18 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EF8981FC9
 for <buildroot@busybox.net>; Sat, 30 Sep 2023 13:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EF8981FC9
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9b275afb6abso352878066b.1
 for <buildroot@busybox.net>; Sat, 30 Sep 2023 06:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696079716; x=1696684516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nfx2jHY/vv95mMCS2EeRqss7jlIfXHJgtlVZ8rsg3wo=;
 b=HRnciTB8vW3ri/NEoOqmIOKkeyrY8SNyRx43USdL++vNE3aDcsj/tI+moPMtSWmCsD
 snQHjGbpkf3ilLWpWoYf3yjDkL9GErFZmlDhFi7XYuxyk4a0iy1xkL4T3qwV07wPnlAB
 F3WLLZl4hX/OuLSHQfvpkZdFq4pV/Yi3dJUgHJit179wgg1G2ym88DlRTPl5Xf0hfLXq
 SfxEWTPoyvg0qwc6Ank0yUliWPIJHnCCc9c7bwLMpPhvvWw5g49sJMEsUEyTxfy5MiRB
 k8iE2tKGuCZjOVlVMX+8Ub0EaiwyRYvNm9RBHI6BATnO7uFL5zJKMfFKVwpXHfrkdcWu
 0kEQ==
X-Gm-Message-State: AOJu0YyB8rKHvTq8l7a4wfH+EtFXpj91/eZRIbFEkbeIjz1F3DbmXg6N
 AjpD2D5ZMJsW6zOAkhjpI++29e1wY0Q=
X-Google-Smtp-Source: AGHT+IEuwo27/ZIlaqf7OT7LIdYC7C7/KVNz3Cy9P2hCT7rhnXKEqNhLppVyTCgKVxHUQESmaO+n3A==
X-Received: by 2002:a17:907:b1a:b0:9a1:b85d:c952 with SMTP id
 h26-20020a1709070b1a00b009a1b85dc952mr6430476ejl.12.1696079715820; 
 Sat, 30 Sep 2023 06:15:15 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 j11-20020a170906278b00b00977eec7b7e8sm14084934ejc.68.2023.09.30.06.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 06:15:15 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 30 Sep 2023 15:15:03 +0200
Message-Id: <20230930131506.3320394-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230930131506.3320394-1-francois.perrad@gadz.org>
References: <20230930131506.3320394-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696079716; x=1696684516; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nfx2jHY/vv95mMCS2EeRqss7jlIfXHJgtlVZ8rsg3wo=;
 b=OmluQeJkvP+EYvhVjFkv5COQFN4QGHXaavLXZLsjSVrmNUTkvywCM6Blb24+lScb9I
 tmpKIVhgcdHSALIXR3oLes++oOCpnipg2B/RGOGwGzm3mssntVTgr5AB5yYM/QpzBvhi
 UM7YLv1NaacZh0g+Dr8bJZ4yda7bu4h7aWW/sMVmy7Vm4e8bBEuC2HT0+jv1LQi5Q3vk
 Tg7ERj3MtQXP/g82nhF1qswbioN7kewYVSXFLZs2+7ub/CUS5qDha81rhlFlOcp9nFyf
 Td6pOlfYlAxeefVnb0izM0c3lE2NHeXrt2Xm5Z/xORkavIuxqlkHtsWJYVSEQPypT0qz
 sifQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OmluQeJk
Subject: [Buildroot] [PATCH 2/5] package/perl-http-date: bump to version 6.06
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

LICENSE: update copyright dates & switch to Perl Artistic
see https://metacpan.org/release/TIMLEGGE/Convert-ASN1-0.34/diff/TIMLEGGE/Convert-ASN1-0.33#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-date/perl-http-date.hash | 8 ++++----
 package/perl-http-date/perl-http-date.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-http-date/perl-http-date.hash b/package/perl-http-date/perl-http-date.hash
index b27842300..a6f770182 100644
--- a/package/perl-http-date/perl-http-date.hash
+++ b/package/perl-http-date/perl-http-date.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  2ecbb3aedf6aef062605191813ca3027  HTTP-Date-6.05.tar.gz
-sha256  365d6294dfbd37ebc51def8b65b81eb79b3934ecbc95a2ec2d4d827efe6a922b  HTTP-Date-6.05.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  60462359bfeb1e6d14602508cfd07885  HTTP-Date-6.06.tar.gz
+sha256  7b685191c6acc3e773d1fc02c95ee1f9fae94f77783175f5e78c181cc92d2b52  HTTP-Date-6.06.tar.gz
 
 # computed by scancpan
-sha256  305b71c4d2fd6380585689c5f1c620737a36a318ce0f9c772badce0fe293a44e  LICENSE
+sha256  6186a79a305a0e62c5087f9737b4f66fa5793fa1b396da0126e3c8722c460245  LICENSE
diff --git a/package/perl-http-date/perl-http-date.mk b/package/perl-http-date/perl-http-date.mk
index 43583be30..2f1aeb7da 100644
--- a/package/perl-http-date/perl-http-date.mk
+++ b/package/perl-http-date/perl-http-date.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PERL_HTTP_DATE_VERSION = 6.05
+PERL_HTTP_DATE_VERSION = 6.06
 PERL_HTTP_DATE_SOURCE = HTTP-Date-$(PERL_HTTP_DATE_VERSION).tar.gz
 PERL_HTTP_DATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
-PERL_HTTP_DATE_LICENSE = Artistic or GPL-1.0+
+PERL_HTTP_DATE_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 PERL_HTTP_DATE_LICENSE_FILES = LICENSE
 PERL_HTTP_DATE_DISTNAME = HTTP-Date
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
