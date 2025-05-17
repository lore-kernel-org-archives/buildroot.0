Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36338C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 19:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA5E960AD6;
	Sat, 17 May 2025 19:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZktpj2rhqGC; Sat, 17 May 2025 19:07:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 813E26068B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 813E26068B;
	Sat, 17 May 2025 19:07:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98287201
 for <buildroot@buildroot.org>; Sat, 17 May 2025 19:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89AC381087
 for <buildroot@buildroot.org>; Sat, 17 May 2025 19:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m93unHPMmkGN for <buildroot@buildroot.org>;
 Sat, 17 May 2025 19:07:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A98E81088
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A98E81088
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A98E81088
 for <buildroot@buildroot.org>; Sat, 17 May 2025 19:07:07 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-85dac9729c3so334516539f.2
 for <buildroot@buildroot.org>; Sat, 17 May 2025 12:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747508826; x=1748113626;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eWVGyQB8PRik+3Uz5wRSupVmloFOuPuhQxbq50IYEiY=;
 b=kDSxes5s8Mfusb9I3l8MhxpyYGnrXZDLdSIamqrihKLHWk2637XNLO5Zb/Zjr9l3V8
 RgzaaKUTEOMfSfaxFLeTukv+Q6oqNgkrbeJOo25FEXaizy+wB4N9bsAPai0G9ht9hyqb
 pqX9ZlkkWZRNkxgDOidmmIs8f/w86hwFFrgXYmOlQ1acYFLIzIwHlC2lmtlYWtBaDezP
 yOG8T7AqDB6nCKqJjDOE0Nw7s3ac3eL2ncdBRRWPq77ZZMhOsz8Ozyuv+nTDNLIgdqWs
 pvAkKiJCOvFumxuMY+UlpEceeUc7/UvNupYhwZlK03tpBZN3AljihsJcSdzp/HtkRHt/
 z97g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKjfOUF+ek9owtukg335hpbK7Tvti85v4YjaGBx9b1Za7QnYAxl3WxK5S/BbLAT+EboQkfuHzoQH0=@buildroot.org
X-Gm-Message-State: AOJu0YzIoXP+6S8Bg8OgKpuRk7lVdV6ar40ja85xCgrkjdij+PZjnMtu
 1au34J3lZFlkCAnRLGqQjXzaMyuiIDyuo4lqQy5TcnAhcDdfur50vRtt
X-Gm-Gg: ASbGncunEPNNVA7FEz7/tbE4i4MnfvDrJEkSM3M8k8lKeASpQDEpgFk8HWvhlyVnp04
 eX0yvZCEieShlHrmJS4qnlUPvdfEEi4JiytwzQCs0zVUeYukz9i+sMH8W/lQ71sGuz6PgEZ05/N
 0M1dyxtQmODgpbmzwCz9hcNPaxNDw2ACCwGQ1IWUm8K2KwzOxuklOEvKTcGA3i9cWgFq90bwQ8T
 YLX9rOXXGcDYNwoKDNP08sWVc9isQQNigAS/22Ic0fzkUVx2KJ0bymKeVbER21T3AUutehLpYgN
 i2D2rthTM6ECuhzVamkzB7dAOGlMrN4dUr2wG4FzOr1hNuZvfAnGhiPvR+HxapZXZCYXPrsJp4I
 qbOfk9g3nkaWnLv1wCtfOz0F8/Q==
X-Google-Smtp-Source: AGHT+IEWOasIsTeF5X91WOI2RZ4NoYbWgmeIormWQ1Mdpuc5e0UgRpC0njcDW4uLvqpDJA0dk2xdug==
X-Received: by 2002:a05:6602:398f:b0:85a:e279:1ed6 with SMTP id
 ca18e2360f4ac-86a2322e5f7mr1048226839f.11.1747508826389; 
 Sat, 17 May 2025 12:07:06 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4fbcc38a460sm1008390173.26.2025.05.17.12.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 May 2025 12:07:05 -0700 (PDT)
Mime-Version: 1.0
Date: Sat, 17 May 2025 14:07:04 -0500
Message-Id: <D9YO6FEL97S3.I5F8GAPKM4YC@gmail.com>
From: "Brandon Maier" <brandon.maier@gmail.com>
To: "James Hilliard" <james.hilliard1@gmail.com>, <buildroot@buildroot.org>
Cc: "Brandon Maier" <brandon.maier@collins.com>
X-Mailer: aerc 0.20.1
References: <20250514190529.680618-1-james.hilliard1@gmail.com>
In-Reply-To: <20250514190529.680618-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747508826; x=1748113626; darn=buildroot.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eWVGyQB8PRik+3Uz5wRSupVmloFOuPuhQxbq50IYEiY=;
 b=B5m0N5sQukmRHa1zRsqxa+5z0GAe3MgP7nhikpVTA5ODhhMywNrjN2bdere20wfo3t
 EfIpWGGpZns/2BRR9/5v+yR4NKXi55nvJcjuk2rpl1QRtLyWTPZCr56+UiCrW5PqLoZ9
 IyNbn5A5CaxCDyrHpwMMmUA+oJxzPKzliC1bydzGrBLXksHPle+Phkb+rzLwAVYYWrFq
 XtlAGn1PHM1WW1tEOjv5zT0Q6us3qTuOHDKjc97RV7inhQM3ZP8/baOVVmLnvJ0q84Ji
 Z7CzyncasmNHYyUtyBFYoH7X/c6KhfIjH3G4GjTrVzZs2DCOxwTHjtlobHQIcAPRjoS1
 w6IQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=B5m0N5sQ
Subject: Re: [Buildroot] [PATCH 1/1] package/unifdef: fix build with gcc 15
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

On Wed May 14, 2025 at 2:05 PM CDT, James Hilliard wrote:
> Add a patch fixing compilation on hosts with gcc 15.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Brandon Maier <brandon.maier@gmail.com>

Thanks!

> ---
>  ...0002-Don-t-use-C23-constexpr-keyword.patch | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 package/unifdef/0002-Don-t-use-C23-constexpr-keyword.patch
>
> diff --git a/package/unifdef/0002-Don-t-use-C23-constexpr-keyword.patch b/package/unifdef/0002-Don-t-use-C23-constexpr-keyword.patch
> new file mode 100644
> index 0000000000..5b5c9690da
> --- /dev/null
> +++ b/package/unifdef/0002-Don-t-use-C23-constexpr-keyword.patch
> @@ -0,0 +1,60 @@
> +From d616741e6b0d5b57b66447e85ad32b283b28adde Mon Sep 17 00:00:00 2001
> +From: Sam James <sam@gentoo.org>
> +Date: Sun, 17 Nov 2024 01:26:27 +0000
> +Subject: [PATCH] Don't use C23 constexpr keyword
> +
> +This fixes building with upcoming GCC 15 which defaults to -std=gnu23.
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +Upstream: https://github.com/fanf2/unifdef/pull/19
> +---
> + unifdef.c | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/unifdef.c b/unifdef.c
> +index dc145a2..4bd3bda 100644
> +--- a/unifdef.c
> ++++ b/unifdef.c
> +@@ -202,7 +202,7 @@ static int              depth;			/* current #if nesting */
> + static int              delcount;		/* count of deleted lines */
> + static unsigned         blankcount;		/* count of blank lines */
> + static unsigned         blankmax;		/* maximum recent blankcount */
> +-static bool             constexpr;		/* constant #if expression */
> ++static bool             is_constexpr;		/* constant #if expression */
> + static bool             zerosyms;		/* to format symdepth output */
> + static bool             firstsym;		/* ditto */
> +
> +@@ -1086,7 +1086,7 @@ eval_unary(const struct ops *ops, long *valp, const char **cpp)
> + 			*valp = (value[sym] != NULL);
> + 			lt = *valp ? LT_TRUE : LT_FALSE;
> + 		}
> +-		constexpr = false;
> ++		is_constexpr = false;
> + 	} else if (!endsym(*cp)) {
> + 		debug("eval%d symbol", prec(ops));
> + 		sym = findsym(&cp);
> +@@ -1103,7 +1103,7 @@ eval_unary(const struct ops *ops, long *valp, const char **cpp)
> + 			lt = *valp ? LT_TRUE : LT_FALSE;
> + 			cp = skipargs(cp);
> + 		}
> +-		constexpr = false;
> ++		is_constexpr = false;
> + 	} else {
> + 		debug("eval%d bad expr", prec(ops));
> + 		return (LT_ERROR);
> +@@ -1170,10 +1170,10 @@ ifeval(const char **cpp)
> + 	long val = 0;
> +
> + 	debug("eval %s", *cpp);
> +-	constexpr = killconsts ? false : true;
> ++	is_constexpr = killconsts ? false : true;
> + 	ret = eval_table(eval_ops, &val, cpp);
> + 	debug("eval = %d", val);
> +-	return (constexpr ? LT_IF : ret == LT_ERROR ? LT_IF : ret);
> ++	return (is_constexpr ? LT_IF : ret == LT_ERROR ? LT_IF : ret);
> + }
> +
> + /*
> +--
> +2.34.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
