Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEC7C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F73060BCE;
	Fri,  4 Sep 2026 12:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEC8U76d3AuN; Fri,  4 Sep 2026 12:18:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4B3DF60BD6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524287;
	b=QkmMGrB2ttlC14uKriS34NGrMsheAiIa5viVy6oql2WhOgEqEZjni5uAMjfdUsGKbKcn
	 FfXmtBHPD4EzvbjVooamwUikL799s2nka+MI2sUhWBWrmsiMcLO1/DqVtx6H4e5OtBGEI
	 Jx/MYf1h4nN7sQPsZUFIZBDDeoQ2Yo55uP2/Tnd0UDubkf3x8QDF2BbSeG4M5VkHxaKZE
	 QAOAprNdZtq0aQPSmDzUyCKJuHAEI78XX+K8wYthrNp1xGHcHR8kwOWO96NvsHoeli90R
	 AN1wZlzSDuRJz5v8H6BL3Qrl69RGFoX56/d0x2cWeVelNB+BBDFgzjvw5j6B/+MWPlw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524287;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vbHVc7G0YfOzkgh1Atj7jfkHNSKj9h+U65GsYPqEhN0=;
	b=guh/apH+Gx3EenU76zSK6hz3y01XQDZ4TwiICux4U+SiwlfOSd8adhd7eEjBVWO0C83x
	 AOOiy4vgBVqqky3wYQzUWJNhB8gaeltnTdnc8VAuvNg/VR4qjLAQJXC64OPPlmZgzzdW7
	 bBTnpa63DOqJ7l/VuyZkBdi9W/EP0JvgPuvUW6KJYZeio2Yu8STiHIjRUP0RDiWENTG3V
	 t6U3R3LlcoHKnzPO2jnNULgFLbnixTy0ALJSHNkMePQjz8r+cnmRLa1fDrOndNU59BbBV
	 gCrBW7VXr1fwZFwqcHpQ4Kxmis4/A883hJNGgtT/8SNL+NTGq9EmuMmM2MJ9S6uQlEQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524287;
	bh=vbHVc7G0YfOzkgh1Atj7jfkHNSKj9h+U65GsYPqEhN0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qTiPylmY8LmH8tz8/TzMKs/VzJleBN9PGj6QcVmhZ+y+hP9DS1HGXus4GtN3mxej4
	 wJIoIM53Rfd0ZHl22TXW+z3S90iGIbpP8yQ62pplMkR8uU4KOIJ5dy5bsEr0wOmCQZ
	 fe6jzxJgxWczADTQKeF4ziEnCDWdW5L8izD3e2hCFsVckL971B3+hk3TWLKQSGiFhr
	 0d4DcJrhDAOije6JN4N/e/OOOsvXO4AH6q/rKUj4fatohwDgCZdpnsOck2++/bW/C4
	 LDk5YyZoP3Ed+WiV7dn4ZvY95zsvY12+spLIm0DgXzExiS+In9RgA9MwresjNjAuIR
	 +hE/SUEGPex0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B3DF60BD6;
	Fri,  4 Sep 2026 12:18:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 66883F14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63F3C4031A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5sk6dhVCECh for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 278E440080
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524284;
 b=rAhXwrE74oz5F2pAFeg/+5Aqp4/AQOvOb42C1N6U9wgrj+hE+7tMPsF84R5WTRYSY/SU
 iB2C8LoBitcCS541v/hr7K9dFTKl6G+rEwBMqY84JF4bJY6I8I6JVw0mbRnTyY+rldSPn
 ZGvssZpMu+NkLuQp/RmrrbTWeUa85FNW89a4V+lSQIsCyYa0/gevbwi2NIY906JB6nnj/
 nJ4LmbyqABfFfqpnUv7yaU+gGQ2cEIGdQrTjvxuQILQ1K3J5fqmvxnaZtVXD9tpeXdEsz
 afG+cswEPU5v5kOGRcjO4AzjSevSOPf9KgDbP9qstwO6n7QBNVnzovToEw/RNGAJ5Tg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524284;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=Jrkn9GQVoue2yRPJLSNm8E8FlU6NNjFerLq+8s6suPQ=;
 b=mtHVIer+vY+IoEtz/5xnlA+ITJZmz4yjBZSVK2D4CIhWj+oKyNyJCMUIAJBPIw22Pud8
 PBVKkk0klAssotoPP1s7TAswTjBK/l0QdPFvdJuQtfcP7M3fom38ggRBTdbpWn8sXYq5/
 /ujhlnaLcFv2VZytkSlkHqzUgZli198Lo/YHj7R+/lKuri3jSI6C+kfcdlBikgAqQ05Ii
 XB0tC8HL9EASphV+5buA9EgNmySZtaa7/XZ/f/oC507iMC79it64Dos4K6Bj9qPzU8dHc
 7whDulYsoi9dyZ/rXdcI/MmthFvTOg5G2qJtsnxpmOrhFTHuf0uHVmSTSC+mochqOyA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AsVuBxNh; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 278E440080
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:03 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-482dbe4d247so548213f8f.2
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524282; x=1789129082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Jrkn9GQVoue2yRPJLSNm8E8FlU6NNjFerLq+8s6suPQ=;
 b=Coezko7CktaVjeJ8uiG+uQoartLNst8sIN41ENnuJVZ+bzQ6d1i07FBJX5u1wwaJvh
 NCUlpiR5b64Qi8BqGPNy00Kz8FU5DuPCsOZvaYd5sqEfhIX1k2xN9M3NayyFpfJgKAQu
 1MFhf1gHMcRBl4zqaoCxDU+z1M6em5bik5UsnBfkhDvOajhMZ7mLlPEugEhMjNuyuf+E
 aHw/GPr0WRO3QOKY6v2Jsn1EmDRmNYJHh0ap+jy5H7CFRc2mYVkVELBamJkURnA0pnub
 UemUzQmDJFLHp+WO50fNxGgLitMCeGHVe9DrAk7CgbMfzBgkEWNhzaR0Zg4UWYudujVq
 ALDQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwLUa9tyxXrRYRRniP/G8czp8v4pJqqjhWVD5OXFw6w/gyo5vVWWPBziqWtZ9h2d/dryeLOu2JtSvg=@buildroot.org
X-Gm-Message-State: AFuF++nhsVX+WL3mlsBzdUWaAqouXZzsYmf+2GrfuggXGnPc/mIfxGMS
 SJxuXNDoW405ClWYCSvmfxgz+WGVFLxoETk9ZXzDzl337RIctpvd7Lfvc0OhrxETfmQV2xaBHD4
 Nsrek
X-Gm-Gg: AYBFou1VhP6TYivP9Y5slZLLG+tkfPpoFTQJ2OfFqfPIUw/wif67QzBtGTVf41Nfes9
 HkkbaqrLErj/QAdx4OHkrTYi6aOKCGe8Z/Be7jumQOJb8ISCnvYxpsINmVK7PByoTJdWp17SW3V
 KHLI7NECS5y9/8DtZ7evew2b5W3E3skaPPRFKkYcqwY4Q0keqs8KFfvKuKrhAD0URa01r5Fp43z
 HfaQDGU6W1eVQVuksLPPdR0KRzovan522E4ZVRurs80e8w71JdbvYfCtt0ecZ+Py0vyyiowFDYo
 Z/Dj1q7Y4iLIDNewNP8bd4C8zzyQwZuQnlD3Nx10j3rHyLW0Xzcj2wYmWzpUeMpkUwVNb3UkysU
 +wQYNRYWxIT/9Yg69d3qLipO5SUBrQ2898VY3b/4QRVt5BOodwtmYHXkQECFPsuKmBr1J4cF0sd
 tv6bgTQ2JQ+t8tGzF7enuiBVSKSnFf/AmvkRXj/swYAZtbF3Rnm8Yg5Q==
X-Received: by 2002:a05:6000:41cb:b0:482:f61c:7cdd with SMTP id
 ffacd0b85a97d-48586e4a6bbmr11723845f8f.4.1788524281321; 
 Fri, 04 Sep 2026 05:18:01 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885bf3f0sm7006881f8f.33.2026.09.04.05.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:01 -0700 (PDT)
To: Adam Ford <aford173@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:00 +0200
Message-ID: <20260904121800.404519-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716133001.2147463-1-aford173@gmail.com>
References: <20260716133001.2147463-1-aford173@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libxml-parser-perl: add
 host-libxcrypt dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> host-libxml-parser-perl compiles XS modules against the system perl
> headers, which #include <crypt.h>. On build hosts without libcrypt-dev
> installed, the build fails:
> 
>     .../CORE/reentr.h:126:16: fatal error: crypt.h: No such file or directory
> 
> Declaring host-libxcrypt ensures crypt.h is present in the per-package
> host sysroot before the build.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 

Applied to 2025.02.x & 2026.05.x. Thanks

> diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
> index 06bbd3b1ad..7cc60774bd 100644
> --- a/package/libxml-parser-perl/libxml-parser-perl.mk
> +++ b/package/libxml-parser-perl/libxml-parser-perl.mk
> @@ -7,7 +7,7 @@
>  LIBXML_PARSER_PERL_VERSION = 2.47
>  LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
>  LIBXML_PARSER_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
> -HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
> +HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat host-libxcrypt
>  LIBXML_PARSER_PERL_LICENSE = Artistic or GPL-1.0+
>  LIBXML_PARSER_PERL_LICENSE_FILES = README
>  LIBXML_PARSER_PERL_RUN_PERL = `which perl`
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
