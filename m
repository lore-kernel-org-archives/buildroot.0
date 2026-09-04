Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EEAC624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2426E60D5B;
	Fri,  4 Sep 2026 12:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymasqLk7LHcY; Fri,  4 Sep 2026 12:19:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 194ED60C27
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524343;
	b=pI8uumK6/EEpKMK8Pj+VcLOpibg8HJ6w5og9cpjjl5mwt5xqWTbayZiqa0fR7mjmqQmW
	 gNVOfsUSGThiOMhOCohHp6zNmSTFnKtoan9a0ilHPPJB5awx9IpPP4j4TbVQOA6QkzFN9
	 bdBKXYoa+mtEl4hp3lrr6h887sTUv39J2Pf+fzE0TaeTOdFVxxqKExePD0NIeIXwA2cXo
	 HxRP408DfwcRukLVUIqMHivBO/ooCyfVuBS+5qthu/n/5/9PNR88qEhSNKAoZT+/IH7LC
	 ol+s/pDqFG7zZ1gyeuJ8qV5NpcMEgIh1oAE5rhzD9oD7d25U5RyDxd7vNQOCs5Sgshg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524343;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=F5TaKZHS/8DibcbSps2jc4/OtL2/O7/P5q9NGDOu5yg=;
	b=pTD09+7nmfCGO/jZh4gMtlL1j8k9EmCOgPFzby6rmf7mFEAMCaGbhsCWe0pxOAurw49d
	 gYJbrwz8DYovx2twxPBclkTdVlFQdim9ngTBXCWrJAsxY6tA4eXQ6gz9zkpIniBgX7poY
	 J/iBwnbrY84jq/4b2xrdWkPMOdz00Wz5UhBv8rWKoE+ooB2vVfEppqJk0vtujPMSpKUJ/
	 7rtePThnvLY64swFcvubdTCNfCpY3VSLVbvoEE+ZnbH7xF8MkEcS+OlgV/4c78nezxQOB
	 t2vPspoft8PJg0Qb07njroqJayQO7xomz7uP1fp0gBxDqjVc+6lvmeMrcCHa+fQGDIg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524343;
	bh=F5TaKZHS/8DibcbSps2jc4/OtL2/O7/P5q9NGDOu5yg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cxpn6fM1a4GfaRIWCq/YgxvS3rLqOvbaaNkpo8qus7N8XNAZmgyr48W/RAmpOcX7p
	 PHNofa14CgT380z0yW3oPgywI9kDgZxNoRhJaar11Ow/45bNz9cx/ZKMETv7ZabJgx
	 qGgPV5MwMII1yaQI7p3otPVKel3gM3cd0QqAKRa5f0qpAXEy+PXCeGIc+xreSRoPp4
	 FFqp3sKCufz38fyZ5SmqhYEsWHW5p5CdxA2iIrIB7VTJYSLCulB6XgdQro8DVmmIkT
	 o0w0UMUX0y9MqNjR2CDdUXRNqp+Iokkj2JeV33hQyi+/exKsJpGxkodFJd4K/WAy8A
	 xHSDBEStUl9YA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 194ED60C27;
	Fri,  4 Sep 2026 12:19:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 614DB10E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 480FF40B8E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kD67LkcV-K0G for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1BF1840B7F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524338;
 b=S11/rpONg3Ykq6jibHkHxSw2uCnX3snwInFVYoykv+uEawdagKAaYrPGiKWBgXVSkBAp
 FiyWpUARN3X3yixhoCiPD1oASqEIzKhwgMKARI3NSEIkYVYQdATr2s+dWd2uxJ+h7m/fw
 kh6OxCfCWN0G7G5fZAnm9d11ot1cPMd5GzbeV7iiD7gg+NhDntMpEe+yh/iBJaNjc3FD4
 rDbA2/7Dntd9lImfe/stGetD58EIP1u+HgsmkyNZ4vh5Dnc4s4GgSZMAr3nSS6CzR646g
 qg4kkHIa2g4ca+b3eUr3L7GCvqsBtbl9ZvGdlsHopWtNOFEWx8ZnqPiVMsaSnp7Bq2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524338;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=TQHjMOAqlN1Bqh7h2ktl0sgtnCJWYXECiWPnP7BaKD4=;
 b=KTQpEisHuU/Sk5atkZ0uU8QZpSo82lpgPtKI9TMilLjoRXoj5DXHv0AkZu0SFKbd0Ytr
 C6unFqHblb61l9uGv9VJesbgDm3+Ii5H7tci3GQCQytM1trkjcFrKmBa9SySkalTC9Ivu
 LJ0p1P40rhRhlYRr4HJl2i89Bt7xNrRe9k/RnjwDxZlyDfAnTfM73Dw5tXIIm8Clm56p5
 FRhZGckDEdEcGY+MS5tYss+fPbvNHkYtLE9zCBrPQ4/yIGLUK5l/LFE1O7avNQAbIfh6D
 KaLIDAyLil9n3gqoSfHtRL9/Bg/B7eG6+4zffqWZaS/0zroqJ7IvMqmNTXMP+yKpM9A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BkY0ORDi; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BF1840B7F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:57 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-482e067e908so843101f8f.2
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524336; x=1789129136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TQHjMOAqlN1Bqh7h2ktl0sgtnCJWYXECiWPnP7BaKD4=;
 b=hM56eq0fdA5ciojbfDofFmIKyuo9gp1lHgsInWNV8a0tOa4MzQqkLZvWOL4bD2DOdV
 JPBUfVUm/7aFPI/OnovCJhXP0jF4s3gXZIa4MJOGUF031PPsINm7FpH/ipyvh0JChVxs
 qktX28pkLjiZ/USNj+NgnbwLbcc2OHSVNcMI8QtGLyljQV4rYJfiFfcEsiShdOyWY/De
 FeBeYWj4Q9JHq2NGnKE3Cljz3SrrUOXydI1Y73LCfOV9saclCwQtRaxQ9kASB81y7PmK
 MM7CIEObck4+sJLso8aa6DkbdfjN0uMyNmzbf8cvlXbbgpVoTJJS8y3z0i9thNI0ba2D
 qLYw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzycMDYgb+9JCt0CpRcIfNYvIf7lPOB3orHMh/1v2fUImxu48QIFAxRbKaSQc3jkcKGx1LKAo7Rjfw=@buildroot.org
X-Gm-Message-State: AFuF++lS0vAgSODTv7XUK430qZPRLfdV9oQNa1TNWDYCSmBU3jzCur8y
 Xn7CgPTgoxpBKg8LqA+jlq0FyQkhav5Bia4Xu5nrjLLfq3U4w3FfD8SX4uRWnBv0vwY=
X-Gm-Gg: AYBFou32UYyEdp3rhDrVe08In6gkRPEubXyeBeIIlRUCs02ycHH1bBbe0HufC7Lrcjp
 3WjGUOf5PoyCofjqyDbhkd9YaAOK+0Hr+dRXCPCe3Vi5gW/c4dnr3AfHq7nUebu/Zp7D44jyDlT
 DEpfqtPfLc8RqHOuaNomMqRyXpRmNK/qd0mwBcsvT9sZL2hsOzDkiJf/UY1kKIX6C0f2R0BdNI+
 HVwKFt3Ijozf2pXXPJCclq77Me1/jfWE93P2/kLy59XSfwZcBBXsUPVMRD5P2m1hZ8ka3Z6rQYR
 v4lb6xILUn69pzncA1SluI/jicKNo0x8XHyzRDp4oVsznwylTDajqnlxplulAPAMXN3DwbiNv6Z
 oYKfF+NJAQbqeR1vSeXpQUY83I/v1QxgCAWcIiK7laYXvPTGqJRs4QPgZW4xNJ/WhXbmOxKM+tm
 47qlBqfFnv0BUIpVTxCtC8UmhCDojf8zLKprDYRlgmuVAfkw0nRzPxQw==
X-Received: by 2002:a05:6000:470c:b0:485:8a46:705c with SMTP id
 ffacd0b85a97d-4858a4671b8mr3830160f8f.46.1788524335882; 
 Fri, 04 Sep 2026 05:18:55 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858e239862sm857851f8f.9.2026.09.04.05.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:55 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:54 +0200
Message-ID: <20260904121854.406207-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826203304.387458-1-thomas.petazzoni@bootlin.com>
References: <20260826203304.387458-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/perl: fix build issue with musl
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
> perl does not build with musl due to memrchr() being unavailable. This
> is caused by a perl-cross bug, which does function availability
> detection with _GNU_SOURCE defined, but then does the build without
> _GNU_SOURCE defined. At least OpenEmbedded and NixOS have faced the
> same issue, and worked it around in slightly different ways.
> 
> On our side, we create a patch, which was submitted upstream, to solve
> the issue.
> 
> This issue has been introduced in perl-cross commit b40c560f5d5e,
> which was first merged in perl-cross release 1.4.1. From a Buildroot
> perspective, we bumped from perl-cross 1.4 to 1.4.1 in commit
> 8a289667f5dba6fffb3a21faa14517e9b49726a4, which was merged
> 2023.05. And indeed the build failure can be reproduced even on our
> LTS 2025.02.x, so the fix needs to be backported there.
> 
> It should be noted that even if the patch is against perl-cross, we
> add it to package/perl/ directly, as patches in perl are applied after
> perl has been extracted *and* perl-cross has been extracted on top.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/3e47ade0963642988fd8e1be9a6e8042700619ec/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  ...gure-keep-_GNU_SOURCE-in-build-flags.patch | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
> 
> diff --git a/package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch b/package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
> new file mode 100644
> index 0000000000..497e58c502
> --- /dev/null
> +++ b/package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
> @@ -0,0 +1,55 @@
> +From 6bdfdff24f4a7d17d3b7d9d02bca3eac11c235a4 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Wed, 26 Aug 2026 19:34:39 +0200
> +Subject: [PATCH] configure: keep _GNU_SOURCE in build flags
> +
> +The checkfunc() function probes available libc functions with _GNU_SOURCE
> +defined. The generated config.sh did not retain that define in ccflags, so
> +the actual cross build could use functions whose prototypes remain hidden by
> +feature-test macros. This breaks musl builds, where memrchr is declared only
> +with _GNU_SOURCE.
> +
> +To fix this, append _GNU_SOURCE to explicit -Dccflags values while parsing
> +configure arguments. Such values are locked before configure_tool.sh can
> +append flags. This keeps the function-availability checks and subsequent
> +compilation in the same feature set, including when flags are supplied
> +through CFLAGS.
> +
> +This fixes the regression introduced by b40c560f5d5e (configure_func.sh: Add
> +_GNU_SOURCE define and function signatures).
> +
> +It fixes the following build issue with musl:
> +
> +    In file included from op.c:163:
> +    op.c: In function 'Perl_newATTRSUB_x':
> +    perl.h:2385:25: error: implicit declaration of function 'memrchr'; did
> +    you mean 'memchr'? [-Wimplicit-function-declaration]
> +     2385 | #    define my_memrchr  memrchr
> +          |                         ^~~~~~~
> +
> +This issue is worked around in several build systems:
> +
> +- In OpenEmbedded:
> +  https://github.com/openembedded/openembedded-core/commit/6422e62
> +
> +- In NixOS:
> +  https://github.com/NixOS/nixpkgs/pull/441527
> +
> +Fixes: https://github.com/arsv/perl-cross/issues/158
> +Upstream: https://github.com/arsv/perl-cross/pull/180
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +
> +diff --git a/cnf/configure_args.sh b/cnf/configure_args.sh
> +index 5bc4c6b..65ffc96 100644
> +--- a/cnf/configure_args.sh
> ++++ b/cnf/configure_args.sh
> +@@ -225,6 +225,9 @@ while [ $i -le $# -o -n "$n" ]; do
> + 		host|target|build) ;;
> + 		# original Configure options
> + 		D)
> ++			if [ "$k" = 'ccflags' ]; then
> ++				v="$v -D_GNU_SOURCE"
> ++			fi
> + 			setordefine "$k" "$x" "$v" 'define' 'true'
> + 			;;
> + 		U)
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
