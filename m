Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE65C4450A
	for <buildroot@archiver.kernel.org>; Thu, 16 Jul 2026 13:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6398F4091C;
	Thu, 16 Jul 2026 13:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YS1V250GFAIy; Thu, 16 Jul 2026 13:30:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13F3540622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784208609;
	bh=KdVoX17qkC6szQMpx8o+aWOM4LtGOYx3jNCONTfMuXU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oOdiw/j93TFWrXVfNPaZ3FpA4LaLEceGrMRZJ+ncLmfmixB+A/Yf8Abf7DJ1h2DzQ
	 iUiBlHgwxodpYWnKyvQZtt63wYEEdVPlzlaGFI/pWQIwzGpNqcIZocydlIfmGdd1p0
	 XgBeFnxiwQBCG3IIjNKeqYd+z6GysE0CW14C/QhzXN48V+RhCd6oHsC7kwqDlq3xES
	 lnb+E4fUZnb2ntaWnAUWp40+KvvqO5HkPHt9o0dUCtVcajosiT2xtUkX4VWRea2OGN
	 yYyMfS4rPJI88uVbWa4kEabim2xxTYyGISOEw+or3aNAFU1nkPijw6XC+XI0MNxIr1
	 ITDb0db+B6krg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13F3540622;
	Thu, 16 Jul 2026 13:30:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 41CFE320
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 13:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F54340622
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 13:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjcmyqbrPkE3 for <buildroot@buildroot.org>;
 Thu, 16 Jul 2026 13:30:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com;
 envelope-from=aford173@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B31F405FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B31F405FA
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B31F405FA
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 13:30:07 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-51c4436d02cso18215311cf.1
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 06:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784208606; x=1784813406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/ljl+p61XsLSBjxT/ltTDnUkeDzJpGLxrC+6HuiXnWc=;
 b=corAU6iu1DDU+5uNE+HhdHxNIbpUg/njcQIfXX1Ag/tx82QZMpTXY+nlfFLJd9Vgo4
 tyrloBryquvIiP8XcoB5+yVJT/WFxvJR3HVQyhBjiDRNhnx3PmkdEPehP7g8ahTL9tbI
 COxMFefEXtB04X6D40NFHKKyVblzTUt89eJLlHr6e/TVg7+1+NH0gG9bg5sAlXgsLcPg
 OqDNJwIiaX1x6uyeWEti0Q81rbENQA40dwW201o2B4Og48FWD4tS5iMm+7EfzmpJCpbA
 RHLqzSgIXawVdnQ9w8RrUSNeSbQnfe+O9KIgWUYrAu9jZo4WAUFT7PvqN6t79vlSzL5n
 9SSg==
X-Gm-Message-State: AOJu0YzFytWU/qfZLs8/M/TWRBC1gB7AUfYaBrg5BMJ8+JYoh/1VN2nD
 pa7cYLCDtHYxwCeN5SkansuLOWCeze08ogypJTEXRjdF3PYJFou9HwjRI1TF98dRxeg=
X-Gm-Gg: AfdE7clIFGOfZ8wslnfUG0GIZKJFnGUAC+7/l5QL6Laa7og+uvk9UdHy7UGGfIhCS3u
 X5iiEnxbrmMVG7TFZSIs5mSoXvusYQd85Ll8Z4KFNVk4JoSiTs26XyhZtxhpgVDVCuGCHFTwudl
 OClaSTMXFJISA5TrGPnADDCswCYWIpAKz9kfgp+PfUb9qOiycMVbtEThUvIbKqjw5GFBHT1dG3l
 Fzj8OsxGgyJvBHcHEzWtulLPED4IyZjPnOcSNTRgxrwi0HtR1cni1UX47Sb34MVRRFCGawvjUAA
 qwU9ekZgOCgX/oSNEqF0kTlvpBYwLG060Cp3hBy35xyPrOY2MwuYZ3Mqyo4Lo/B7noRyCNWQGvi
 Cl6XXhvlow7F4lZNrBdjl3LZeXjXYvUFrYk3MR94oLd/VeJ1HwdOwkiqiSOwwGVryJdiHztVsYh
 28htLQNa/PMT+uSsJVsgFBl3QFOAzCwTEn9hFq1gliigKNnaDyTPgDvzk=
X-Received: by 2002:a05:622a:2287:b0:51c:1811:6eaf with SMTP id
 d75a77b69052e-51cbf27f480mr212397971cf.65.1784208605876; 
 Thu, 16 Jul 2026 06:30:05 -0700 (PDT)
Received: from aford-System-Version.lan (c-73-94-212-116.hsd1.mn.comcast.net.
 [73.94.212.116]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ffd80fd82csm217630386d6.35.2026.07.16.06.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 06:30:04 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adam Ford <aford173@gmail.com>
Date: Thu, 16 Jul 2026 08:30:01 -0500
Message-ID: <20260716133001.2147463-1-aford173@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784208606; x=1784813406; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/ljl+p61XsLSBjxT/ltTDnUkeDzJpGLxrC+6HuiXnWc=;
 b=gV/Z1hv3snxYLw3lVTsfsOK/9cBY3Cw1XEx3suTFRVcbj8DFm9IN7F0ze80ZDPemUj
 cspCKndhGWlix8WhLFDTKQjod+9DlLqf05tPHpyC5eR4o6BTW0t1GUzR08eP8VJfdEP4
 OpgBbSRiTyA5L3PiLkwWg/IoY4u+D23RsOo9Ltu+RgDKjvrlBahxiIPzGgsg8Knpebjf
 vHnsaRcVW0RAXt5UsvzXxciCTVH7ZfaPDfSBFaSaN/0xXAiZu/0Nyvh4305+i9R3rrfi
 GYh0mRdb0WEq2q3ysCsxv2X3IXRHe/UdBQTpvFjBe30/ZeCt41KImqso2WbT8AvSkhGy
 XY3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=gV/Z1hv3
Subject: [Buildroot] [PATCH] package/libxml-parser-perl: add host-libxcrypt
 dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

host-libxml-parser-perl compiles XS modules against the system perl
headers, which #include <crypt.h>. On build hosts without libcrypt-dev
installed, the build fails:

    .../CORE/reentr.h:126:16: fatal error: crypt.h: No such file or directory

Declaring host-libxcrypt ensures crypt.h is present in the per-package
host sysroot before the build.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 06bbd3b1ad..7cc60774bd 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -7,7 +7,7 @@
 LIBXML_PARSER_PERL_VERSION = 2.47
 LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
 LIBXML_PARSER_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
-HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
+HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat host-libxcrypt
 LIBXML_PARSER_PERL_LICENSE = Artistic or GPL-1.0+
 LIBXML_PARSER_PERL_LICENSE_FILES = README
 LIBXML_PARSER_PERL_RUN_PERL = `which perl`
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
