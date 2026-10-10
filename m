Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CE3CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F557407D1;
	Sat, 10 Oct 2026 15:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3aP7VD8quf9; Sat, 10 Oct 2026 15:11:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 74D6C407E2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645114;
	b=JbCzdG1sHr8dct942Vx7FhgjXlcq1q5sPIugrt/fpQ1aUOM04xgtAgNc2JxVQ1XXtN5Z
	 RZtZ/K3a3sD87JyN+lNsrXzPf0pNQaLXyI2XtgNMLeWFBTexCAv4B2G4GdQ6OhKwkE1Zf
	 xTun4wqYET9T5oo8olx4Mcflccs/0T/Ge9S1JzSea92z2tPT0qg5HKsiDAkf9Tghl6DlG
	 IaN6TcwfeN3/11vx/s75ZGHHQBE/1ju7iRnktXQ5ueuXF0Ufc1KhJb0D1YMYsTcDseMwj
	 jfWbz3B9HNA6Gb4llrS5ym9lWUq0EbhyAiLpMBObe0O4GOlKhgw/z29Py9bhVzWW1bw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645114;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=V7plWlF+QApsIgSuA2jknNRmn6+pmCtDeJ3ErZ+LVWw=;
	b=GIzFUoKNU067kjIwKxl3Y8NwldnnUucrkGJ3KnUSLSYS4Byw/g4tPmTEq8UE69Jty4PA
	 T0Yc8qT9ns7vfbYSJUjA16J1NAnyErJJu7GDGle03OIz4mdoo5iNPcrFmZU4JgKa3Vucr
	 EYWIoEPdBLa1Vc4Qf6zaoHbbCprNddQPx1eL3GggK85/6rjpJYLRDTe7M7/3hrOq3P7Zz
	 X8DSEfoxMewY6C3jX3GV0ZZ7yF2AZGbIYNoUS/fT4/D4il2NiH6RqMFa2FIhAdS5itkRs
	 l8e9RIjSoXtTEJtinzpigzBewv79eIA+H7pW0Hwg1/iTzqOI+dsprBINGjDdkqaFhIA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645114;
	bh=V7plWlF+QApsIgSuA2jknNRmn6+pmCtDeJ3ErZ+LVWw=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=gyXm17WquhZ/AGhunXZKSbY5z+03aYrj0YqhQDRnmhNe4gnlRV7FPuS04/p7pSrvW
	 DeBkFBDAM1EklGFBxL5dirZzZT432nUsD7Xq5IZj4UdShZAa72luq7mKZdoJXCgyDb
	 5WeGbBw/kuhtyzzBCpKMBR+FvAgj6XNpe3Gjkap73L+kG47lfCmnj4MZpw3nOFmF0e
	 96WsPH7cO08LJjTfrf6IgQxPt0bq/LmvCAia2uTAkeTkgCR6CfajNOc90k2LUeU6g+
	 CfCFbJ3fnCUFU06wOqbZFPy9ATQg7rQLu+m7gMdIk5aFsTsWCXViaN77vqBK37Zown
	 Vili2hO8VrIFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74D6C407E2;
	Sat, 10 Oct 2026 15:11:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79D5D105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 688FD40079
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYUlx7aAaeir for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:11:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8027240004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645111;
 b=DghPK7HPZUvEgH/QT1XCL0utnNdd4418qupfMLtXSWCU1ISOePMMphcT5+tcv4X+EjJC
 LJGhDpu6uBUjYG7PrBhJyNlsAd1zPIBLdKKd+3UnyIq4ucoVuUHl2+t/TNCMjjxn7SBrv
 opfnJiOj7YrZg8H2bns5XZg6LteHVVA6+2EMKc5+HwBI4PF7b26o9xvEoDzlNOYRjR/35
 FJg80fLQpOz1yoEZ/HY+s7ta32fbIUbJvzuXXrHIqw6vHnGQ2rFn4Cvz2sp7bGJdooidx
 mR5hvbifEE923D32nWj2b8FXqHJhGmKUyBR0dQ4G9bCnXpK3loMx7XUUH5uRHDJeI6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645111;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=jLO5rZhiQaCLfRvaYeXIpMnFqmh6rYicO7blSR8qQW4=;
 b=DlsAajbRDuodkigkeOL+YcjcJUtG2HKfgh6FoQV0D/DaGNtgQHOuGpY9GJiTsnK7vwo3
 kqEhZzm4UWPdREDLdLv/HqLGhyoELafuoOvbxEMRfhc+TuYKmUZ5EzR433ElO0N0nAcrU
 nc8bdu7HZzD59QsEzZQiXrIFmChdhOdNXhQ3NzQB/4dIyas5VSRninNjCAN/M9Pgpsxuw
 2ol8EYriF2DMuE/IiquMtTeqNm0LZqJVhIJWSclNRD6YiM+Q52owMe7Mh7OTLoCFDNxf7
 AwLOC2ycMp3GhMKTz+80s38XPfWVbQJObsS4hzZ/eEeAaKGxodUgbZNneBIPZ7JpTEg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eSCKMnGn; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8027240004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:49 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso8806945e9.0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791645108; x=1792249908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jLO5rZhiQaCLfRvaYeXIpMnFqmh6rYicO7blSR8qQW4=;
 b=tWvWYUSJM0p54JYM3iJ5B9+VaKhTbnuivl9cNA3ZDOnbnxyI17OAEHj4DFsgi62d2y
 hBLk5t1jLwpzV+ciuySsy9P+0/LOvllAjvInVSwQZWmuM+onzV6PXk2D+qQEo9swRY/2
 vMmB5yRZSYgMJoZQ/cZ9gGbaEuj63ageX8DfFNWg5ToGEul9jEYqJ/YG597+ifxYeC6r
 gxRdDMuq0yzMSTJbkuVkbqcGretSIovqg2nhFAiChwQbBUKP0zpD0g/lPV4kWgaH5Vdg
 kR+k1SafENnLaDVccdGanQMPYd4dWxNaS6pKbhfH/3CV5qKniwDM5bDcbGtHV8xMkBZL
 ZYyw==
X-Gm-Message-State: AFq9FYItbk2S8waFxvHrLxV2Jo5K/T0+Fqmz6eiFuG7R/x4iMpES01Ql
 WeyJ7euUc/HmeTX63mIm+J7mwWDaZFhvVPBJeqkuhEGUfMdv0Z1wS434xqjHQZkkwmpnLoUohI2
 ZqaoFtl0=
X-Gm-Gg: AYBFou1tk8w47TV5aL2uwE23TO36dhn57zBH6fQZO3weDtXjMx+4QdtqsNs7mBCxYND
 RLDGRnWPeu+EIsy5/FlcanrHQ85+81qqG8+J979bXAdawbjv5vepV+H6JHdBD+A23ugyMLVOqd2
 NzPqFFOwjC1GlJFlPbbI/xiuCpVV9qwItO6V5YCWVtzkIaIHrqLnuki8of5jrvgpggS42Wf4CnN
 qF7A4/4IEFHq6roIrlZ9WiRXjviHsx9YKohtxJqMaL38P5jYgEXGPa5G/wd5qdckU/6Y21USfLX
 8zr5kmliENphB2AqpcxfNapd7IsgnXtsgpCYaJYuUXIj0QnLHUG0KW2fGidTVVwXupqsNMCBikT
 +nW9caRHn+Va1ZcsY8NjAugOwe9Zhn3y0ZoQhAVO1+RuZycO3qgjwNhb9OfyFDaC4Fa76wRW1E1
 MKRpb6fTbZzFb6NP7u/ZApt0CTZrnssx0iCjZxuBqeDaLLpCUXJBXsZX23A9Md9V8VZWuWRx0kd
 ngXUPHn4Lh+xjSyyzXJLBdWXV+lh9aABO9jBGXlZZaSOKoO/0bW9S9TniDlMAAb96xuAt8juw==
X-Received: by 2002:a05:600c:3512:b0:49f:c5aa:9ef4 with SMTP id
 5b1f17b1804b1-4a18e4913c3mr87483075e9.8.1791645107717; 
 Sat, 10 Oct 2026 08:11:47 -0700 (PDT)
Received: from dragon.telekom.ip
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bb6b3cbsm115104125e9.0.2026.10.10.08.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 08:11:47 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:11:13 +0200
Message-ID: <20261010151121.876133-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010151121.876133-1-titouan.christophe@mind.be>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/7] Makefile: always use a base config file for
 defconfig
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: petr.vorel@gmail.com, ps.report@gmx.net, yann.morin@orange.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, our bundled kconfig copy does not require that a base
configuration file, with some non-default set in there, be specified
for defconfig, and we only pass one if specified by the user.

Future kconfig versions will require a base config file be always
specified, so prepare for that: if the user did not specify a base
config file, use /dev/null, an empty file, to specify there is no
preset value.

Reported-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 490f1d419d..7fa3ce4890 100644
--- a/Makefile
+++ b/Makefile
@@ -1044,7 +1044,7 @@ oldconfig syncconfig olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmake
 	@$(COMMON_CONFIG_ENV) $< --$@ $(CONFIG_CONFIG_IN)
 
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --defconfig=$(or $(DEFCONFIG),/dev/null) $(CONFIG_CONFIG_IN)
 
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf  outputmakefile
 	@defconfig=$(or \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
