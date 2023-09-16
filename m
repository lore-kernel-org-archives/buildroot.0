Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F52CD37BF
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDB17411A1;
	Sat, 16 Sep 2023 15:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDB17411A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZcpEPJMKnvJn; Sat, 16 Sep 2023 15:47:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32B1240C6C;
	Sat, 16 Sep 2023 15:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32B1240C6C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27A121BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B982A81E1F
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B982A81E1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yG32bAuQLR3i for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:44:21 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B377881CA3
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 15:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B377881CA3
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31ad9155414so2885301f8f.3
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 08:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694879059; x=1695483859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nIHvxsjDu43L8GgCuG01KuoGqaxRgYmmkJldyBN2f8U=;
 b=J7pZZKgDJM9aw0VrO8WBeOmlW2+FhNhAQkSu1a/YBf7aS2EjZYSudQ//o4c4dFfmBL
 5vsZlPJi7j5k+VNP8wJ3nLfLNQUQJwBkq7YS5rUD9lgHsF8dXv5VY1Pz4cL12+QK285E
 Q8aAUz9rO6RDBG0go+OqKfTBPJ7N/gNely0CdkU/HZYNsmX6L15ClANr9Yj+e2AHeKW9
 oFwu3kxqdXpdTZPtCh6nz4CwVVhsOTvHOQ1ErKWeh4n4MR5mzH+yNeGXBsyctfomrqxx
 pZBMPdU0J8p+rXIzB3nWefHNifDwF+iyqj1Ve2RjQu1evoJ4JgtThjghPVFUsmn7oZ+E
 K9pg==
X-Gm-Message-State: AOJu0Ywmtb+LbYxpquMvUVSONKmkAef/6qzBe71D+F+G8q+cFAhyNzVO
 aRVWqyjfU4Z1Ww3Dh9vArd7unI8ebbY=
X-Google-Smtp-Source: AGHT+IE0b4jIQ0OoDrAFczz4gw19cNv3Kjlx/0TAxM/bZaENQ6UQX3Fc3F4zRdjjm0EMK7nzHRttew==
X-Received: by 2002:a5d:62cd:0:b0:319:7134:a3cf with SMTP id
 o13-20020a5d62cd000000b003197134a3cfmr3612393wrv.31.1694879058826; 
 Sat, 16 Sep 2023 08:44:18 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0031de43fe9bfsm7522010wrw.0.2023.09.16.08.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:44:18 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Sep 2023 17:43:50 +0200
Message-Id: <20230916154351.2747233-15-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230916154351.2747233-1-francois.perrad@gadz.org>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694879059; x=1695483859; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nIHvxsjDu43L8GgCuG01KuoGqaxRgYmmkJldyBN2f8U=;
 b=ixFDqvSieAK/TLS83tp01jvRQ6Xou+KmEjM+RL5gyeI2esGGvjV5HYpzbQD6F7B9dk
 1P1gsG/616Mx3hl8ncw1QbGdXQTJEwdiFgVM9Ww4faPil63GsHPF3y78biJ5Lc/2GbhB
 Xy06sJaoDzaJc+cpyWQjd+8paz7x4n3r/PTISY54LfAMU2/0geTitxwsStKRnX7jK1m8
 1TCLIS97JLNOIxK9n/8He8l69yfj1lxNT9RkpGBsWojmOuMqxJ1mfd330n7vg0ZxBKze
 hTHEXy6y1OFe635eowtkl4tsEQI2n7jBfp31aVmrz4zWAxHZMlL68CyPZ4vUI1YeQN6y
 L0/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ixFDqvSi
Subject: [Buildroot] [PATCH 15/16] package/perl-tiny-type: bump to version
 2.004000
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
see https://metacpan.org/release/TOBYINK/Type-Tiny-1.012004/diff/TOBYINK/Type-Tiny-2.004000#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-type-tiny/perl-type-tiny.hash | 8 ++++----
 package/perl-type-tiny/perl-type-tiny.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-type-tiny/perl-type-tiny.hash b/package/perl-type-tiny/perl-type-tiny.hash
index 9e5924abb..bca5153a0 100644
--- a/package/perl-type-tiny/perl-type-tiny.hash
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  7a1688c4de07a0ed481a1811e5e82e63  Type-Tiny-1.012004.tar.gz
-sha256  75cd06b612d1830ae9f4b22298b506b3ff04518fa7453f487c248cd62a906a2b  Type-Tiny-1.012004.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  08bb43feabaab97dac7a3e59b5c77ff3  Type-Tiny-2.004000.tar.gz
+sha256  697e7f775edfc85f4cf07792d04fd19b09c25285f98f5938e8efc4f74507a128  Type-Tiny-2.004000.tar.gz
 
 # computed by scancpan
-sha256  34427749499bd6d6e5d206089bc03d76c647a1350f8b5f95ea628d2b6ff56e4c  LICENSE
+sha256  1a2929dacaef239beca27a85f7f97b793628dfb22f07fdfb406cb6f3f0d22a6b  LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index 5efa78f16..31c84a263 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TYPE_TINY_VERSION = 1.012004
+PERL_TYPE_TINY_VERSION = 2.004000
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
