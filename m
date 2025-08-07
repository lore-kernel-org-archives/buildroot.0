Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70DBC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A64CC40525;
	Thu,  7 Aug 2025 18:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KT6OgvLe7NOz; Thu,  7 Aug 2025 18:23:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA99D40546
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA99D40546;
	Thu,  7 Aug 2025 18:23:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D1A04C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1155180C44
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7BWJ4w73hwp for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:23:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2FFC80C32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2FFC80C32
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2FFC80C32
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:50 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b794a013bcso983459f8f.2
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591029; x=1755195829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=42ZcPZVnCSNqZibpWQZJmamusT4NeZN3IkUdrPdF2F8=;
 b=i21q3faHCOdAv/0u0sN1DVCdXSOg+tE6jk4j8ehOUDkafNVdySpnaKZCtZAAcZBQ2D
 9d9+XhXm1gI+CVGS9aoGv23uAQY+xSUToM28eBaI3rTIn91DoY7chpNp2YsA8wKFqbrx
 tJEG5+gzQ6gFC0B5ghRbiAMyRpMpVZwnjr3Kj96QfTQlR7C42BSWP7/EyehgpEB7EF6y
 DmLIbBmmiXMQsKYVPtCHsdR13eHsNgChbyOe1souePRjG5HeZL1eaW09TrzPD3PBQOPc
 IDF1vS+wW22FcCY5CiSHuGYJEy4IpVvHkck3aUzITeEOm3hH02/WceVLvyrn44La/LuA
 wfgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9ljx5i6CrcPRcZKW8lTSN67hcYPQmY2BlGbrufXzrZgNvdlEA4SCb0lmty0FCNGobju1KBFZ+Kq4=@buildroot.org
X-Gm-Message-State: AOJu0YyJjmtwaCEVWcRtIBmy7r42Yat1riByZP4K/6m1ec8yKZp3IxAT
 /LFMZ9VpOsz5BjJpQrrJ1+xf4v+1nEkUCn4ReFwxrBHozhc7mG7tO0P9y4WdFMX0dCo=
X-Gm-Gg: ASbGncsXaIeQmgoEZp9zfyX+1XFTqjiRwBsUZ6pK8648v0iypySqiVxV3l0fVO5OT00
 PdD7rqXQ0zOmUxEsXe4o6wEkhrTLvnqtTYAxcmXsfXERxV/9C4zz9NjWMs0Jc0BAzbiJ0ge1qsY
 6oVBaHqE/KQ04V1LKAXSLEslNAx+o7McqY6FlxZmKtA3ZFYQs00K4LXlWqTA8wG+He8WRdwnP90
 TPldP9UHdQJyePs20iJxdBxvl3XKy9rEg3DYJ0pMn1WKcXp6Rwd7rDy5un4+var6KmMdzKhQCvY
 /HCDVHdr2X82nWRbXX7fmjVFuIp8AxDhyxtMm6LWmi9cF9AjEbESb+U/uERyUcpXEAF69XNdGb0
 M2fZUY7SVyAMWv7angZYX106U
X-Google-Smtp-Source: AGHT+IHmh9FDf2teekDmQ6a0R5XwXXWQ8kEBA9PaTZbUV9BjQLvobQ2vf7bMxzUrQBXTSdMkpg4A1Q==
X-Received: by 2002:a5d:5f47:0:b0:3b7:7c18:c72d with SMTP id
 ffacd0b85a97d-3b900b472efmr197496f8f.4.1754591028777; 
 Thu, 07 Aug 2025 11:23:48 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abed3sm27416866f8f.10.2025.08.07.11.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:23:48 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:23:48 +0200
Message-ID: <20250807182348.723466-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250518124949.4159568-1-peter@korsgaard.com>
References: <20250518124949.4159568-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591029; x=1755195829; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=42ZcPZVnCSNqZibpWQZJmamusT4NeZN3IkUdrPdF2F8=;
 b=BmhdLw2G1wsoGmYDzHhDJMU2D0mL2UVdKD2j5GVIZ7YlAV7elJYWe0u/mj2eocZdpZ
 v4Jhw6Eb0c1kHXSfra+aJct2Pqqt4O5d/a1JfemlaH49WQbKfDTkexgtj8s2b8otaRjw
 PMm11D8YNnHIpx2kDvZoIboS9ubSdZ6Pgi18inoLHD3eJ1wmo77bP9ZhYXJ6i+6vvc3w
 r7m6E4LvB5SUA05pa3oj9lJCD+qM5gwnfdI5BCoJp8fmtr58WP7eZFK8GlsGz5FKgOT4
 IXFTXZj4+Wt+mnPLqHkmKtaF7XmJUvnLwW+BmVa/aaEyeIyCZNoE9vDXTcIRCxZKaojE
 jorg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BmhdLw2G
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/toolchain-wrapper.c: slightly
 simplify cmdline copying
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
> C99 section 5.1.2.2.1p2 mandates that:
> 
> - argv[argc] shall be a null pointer.
> 
> https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf
> 
> So we might as well copy the null pointer along in the memcpy() rather than
> copy everything up to the null pointer and then add one afterwards for
> simplicity.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  toolchain/toolchain-wrapper.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index e644c1e7bb..d6ce74fc94 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -497,12 +497,8 @@ int main(int argc, char **argv)
>  #endif
>  	}
>  
> -	/* append forward args */
> -	memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
> -	cur += argc - 1;
> -
> -	/* finish with NULL termination */
> -	*cur = NULL;
> +	/* append forward args and terminating NULL */
> +	memcpy(cur, &argv[1], sizeof(char *) * argc);
>  
>  	exec_args = args;
>  #ifdef BR_CCACHE
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
