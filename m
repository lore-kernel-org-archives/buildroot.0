Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017CECD37BD
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 710A540CC0;
	Sat, 16 Sep 2023 15:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 710A540CC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdPg5_-2h4HN; Sat, 16 Sep 2023 15:44:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A644840610;
	Sat, 16 Sep 2023 15:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A644840610
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 488B81BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FB2681CC3
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FB2681CC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hWJOvT7T18R2 for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:44:12 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19AC781CAD
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 15:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19AC781CAD
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-31ff1f3cde5so1632712f8f.2
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 08:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694879050; x=1695483850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L0inB73QCxecI6MwjDHPqS8QDgWenzwovlqLCDEbt9c=;
 b=jmXiEYmG1BUok50vUjiwrubMI6cnfNcKlxphIH+oIARcbz6/6lJuRgrB/xJ1FnoJ71
 pt7GtPoq/MPcFNRPVwcpF4fPKzH2KAx8uCLrAmh88JQ+JebPbY/iQTx6Obr+3peDdicV
 f5bf3Ntj5ItqRw4YMFnD0hl3s2OmVcfy4gnkqE/mVbAl6jCCJeOMnPqWuQsf4PlQElPt
 t91xI4NIUmWlxFp7/kpv9F4Y4epSnoTS+v28Y1/KIcVTELY2tssc5Bspg8W7JywhXBQS
 eYy7ZU+c9AJfCrjvXBiboUHoNx2Dnw4/t8YW9zz5e3JdgGOCuec63I4A7KiNeHfO+wZu
 JYpg==
X-Gm-Message-State: AOJu0Yylnv7akuj2WwtwLILdwKiC+HImQsepL6GMU2uUEwJjIx01eKIv
 V5j4wB16PWxh/5hy+6GnG04hisy4TTE=
X-Google-Smtp-Source: AGHT+IEw/2J2mhoxF7ct3Zzx9KFYpMMSX3W00rL62J9+cQhdY/keQIKZ/Dmu0+8UJC9WbUmJl7gxCw==
X-Received: by 2002:adf:f20f:0:b0:319:67ac:4191 with SMTP id
 p15-20020adff20f000000b0031967ac4191mr4111762wro.37.1694879049913; 
 Sat, 16 Sep 2023 08:44:09 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0031de43fe9bfsm7522010wrw.0.2023.09.16.08.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:44:09 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Sep 2023 17:43:37 +0200
Message-Id: <20230916154351.2747233-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230916154351.2747233-1-francois.perrad@gadz.org>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694879050; x=1695483850; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0inB73QCxecI6MwjDHPqS8QDgWenzwovlqLCDEbt9c=;
 b=nDjeEE8nNWehJcsNCq6N6XrNM5bOeKAqvYcyroxcVZwHDs9JTRZV5Eo7jO4R1QWhIF
 5+edE1T5wWN8JFWAmqh8DqQXOHRKY/EPjWSSU6YJBqi31zC2LlOsvHA3gioM9+9AapO1
 1uVBmoV3xQqEJipCrItpa+PivzpVwzw5cL7g07ITUjl4zR/3Z9gg3UwPav1nemRU35/5
 SclynP70ZXcRHQr4HcHp86qDj9MULJZfkrBUNupTj3fdv24iPG44zInNTJwc5n4+h+BO
 Oh0nkYmqrU+4XAVVaVh/cIWWAneB+tw2dvEBHJ9GfIrippz3sK7gq/JwfXyQEHMw4y7J
 FB6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nDjeEE8n
Subject: [Buildroot] [PATCH 02/16] package/perl-convert-asn1: bump to
 version 0.34
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

LICENSE: update copyright years & reformated Artistic Licence part
see https://metacpan.org/release/TIMLEGGE/Convert-ASN1-0.33/diff/TIMLEGGE/Convert-ASN1-0.34#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-convert-asn1/perl-convert-asn1.hash | 8 ++++----
 package/perl-convert-asn1/perl-convert-asn1.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-convert-asn1/perl-convert-asn1.hash b/package/perl-convert-asn1/perl-convert-asn1.hash
index 644517af5..2d1b1faa3 100644
--- a/package/perl-convert-asn1/perl-convert-asn1.hash
+++ b/package/perl-convert-asn1/perl-convert-asn1.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  80425835020da77c48c05a40e25bbf7e  Convert-ASN1-0.33.tar.gz
-sha256  1fdf004520c79e3a244cf9688616293516c11793d746c761f367496eb3d06076  Convert-ASN1-0.33.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  cca63088fdd5c3665a2119ee29133f6a  Convert-ASN1-0.34.tar.gz
+sha256  a628d7c9d390568fb76359975fa03f626ce57f10dc17980e8e3587d7713e4ee7  Convert-ASN1-0.34.tar.gz
 
 # computed by scancpan
-sha256  70884b19a3537bf179538c3b7d7896a56ade509dafe6b8d545c5999a9c05f8a9  LICENSE
+sha256  aa8ae28898a3e164ed5273c3e4fd4bd45b42f7958f282318df06773340e2c9d4  LICENSE
diff --git a/package/perl-convert-asn1/perl-convert-asn1.mk b/package/perl-convert-asn1/perl-convert-asn1.mk
index affe775ac..d8c4b65e2 100644
--- a/package/perl-convert-asn1/perl-convert-asn1.mk
+++ b/package/perl-convert-asn1/perl-convert-asn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CONVERT_ASN1_VERSION = 0.33
+PERL_CONVERT_ASN1_VERSION = 0.34
 PERL_CONVERT_ASN1_SOURCE = Convert-ASN1-$(PERL_CONVERT_ASN1_VERSION).tar.gz
 PERL_CONVERT_ASN1_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TI/TIMLEGGE
 PERL_CONVERT_ASN1_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
