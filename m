Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A031EC79F85
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6806760C14;
	Fri,  4 Sep 2026 12:18:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PAi03XGrxSD; Fri,  4 Sep 2026 12:18:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2B03360D66
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524311;
	b=k+2t0zma8fmGQaapWsHSxJGX1dO5hsve7lOvlp8bd/Bax+A0VnVb2wXHbKmJdl2JYhbV
	 EWvBgk6Z+Rpp7/aDoTam5jrzg9Q3nCSoMdueHIPJSfsrmoRl4opjc8zJTeF1zoSdmTyPW
	 I8NEkCLlrtVIs87Pl/idy93Qgrz3lCsxjpc7zXFugfZ0mtXIh6fF7f5DyCgWPAwjuuhCN
	 lCDik4H1Q4pe6Y0F9Tx4H98zYRfdo/3r+SArs9tBrKtjszbkb2a35KU6oUjmWifUyljWc
	 SAOj+rTeEG/hySPM0T9mADfmCLCSQzwUqRJNqwPW1CFNbvD7ip6lhkKf9how60I4sUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524311;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JSgZHAQyQc/Wuf/MfK/etecH2pA7qRfR/nmI0+4NLSA=;
	b=Lh1/V4SR3tQPoIj/6h8G6dYzG2+ZKtXGjjatKag7vJZEuNLLl+pNsw09BROdgnbvUri2
	 DtMF8kQCVEVCC6TAiZa6zvHkNt3EboiblG6QVaPgIZ7CPe0V/M933wsisXl5oE9MNB442
	 dp4dXW5TxYriQspLWJP8VbatUpx2jM9a0fHK42cSFBGUvUKsVTZUi3+xwrABM/Ql2JNMK
	 +CYyAzCUeNBc8exVcRhyFcTJdcKs/SvNQ0C30isto+gK8tqMD/j9xGq3ODLKa5bRTCT4E
	 lDWPZGRCUK6VkdemG61xScGC9t02hoyvlmjKrnCfBStvx8VeT6SCVweT9ZZRwJIJlNA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524311;
	bh=JSgZHAQyQc/Wuf/MfK/etecH2pA7qRfR/nmI0+4NLSA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i7VWKrZfUBXrByYnPgLDsJn3RGyc9HftBxAJSBApDiHZhWWJifSBQMS7WnOeHKLMc
	 EP/tgdYwRjUMYIxfhjHxaUWJnuECfwOUwADNfjzGf6KL35ukyUWAkhFPOeQNbXsPXT
	 J0ckIBPmV/NYeKUD1/KYOULrRItKVaTSF0BGjyYn2eMZgFYkNGvHhssbPrup2MougW
	 QLeUU70oYKz3LLxPTNzmGmNAm7Vz3gSq4a/GHgN5W7Ig0t5LLRSLgwMk9VcrZS2XYk
	 pEl4VojBQ8bBFo0I5MhTSIgzWPbXFYI833Ev0Nyx21e1uUCuIWogj2cZaJJgrkE/Zh
	 nGLUtf6+Gt8qQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B03360D66;
	Fri,  4 Sep 2026 12:18:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09A8310E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F023440B87
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PCrrwU71ggI6 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D216D40B7F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524306;
 b=SpmEEkCZTYZD+Llk0R5RqlZFGfzD41Iu88pXChpXHRDmkXX9jIC9th62hga9BUym78uP
 WZ/SegvA8zYpeG5A4gtVVqq/Svc851sCWSg9iRI/4/jYfiJSrxpjBWuzOJJr5us4+eBgo
 U6i/Dmpsc/LActBo3Y/MghWpCt+L46TQ/lomqFm1faCeuC+qeEiiaIygF3X0yEUzzmY4V
 6H1nMG3igf+tIpTVlfRYnnUHvyIvRb+GkpWUywHlF3bfILN4thdUdbyyLq6grR9dfDgaP
 guMffLh8QJqiawRtIffwplgtdUD2zdjX4W36uX4TmfotyKaDk7UPc76gjRQtLals2Vw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524306;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=2Sv9UBBrRO6J2gYysBPmqKtUD8H9isvYeb/WSpbv128=;
 b=ZzKyViCQy1FHr7HQNtIK+3LYXoBPf5QpPW0oDe6gsgK5Pgaeg6a44n3nNwYZdAfNW96r
 012qlBOlFONrryj825S/8N05NlNLRvmUc98s1Vg1K4dd6Atb01SvAJK1rbnlh+qNoVuSI
 BZ70SvL47KEeaiEKGp8qC0Bkl01/dF5hQgSWi145/qvDmPMEi4q5AupCnJiy8ZLYsfUCd
 AJl2l3sztB7QWMBZ1aMZ/n24FZ1zPldTlJ7e/X92Nmcrnm/IlrgX9rjEyzAdVau684ZQ/
 OI8a4s8/JbCire1Fpak9giS1WDslRgCDlm90Q3jQnMbgWCj04z2B6WCHU6OzYNF6apA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="EWg/xeFt"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D216D40B7F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:25 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-49b8ce9b733so7509475e9.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524303; x=1789129103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2Sv9UBBrRO6J2gYysBPmqKtUD8H9isvYeb/WSpbv128=;
 b=qWiQiYpKIiVuGZwcxR4z7/rIq2ugQFfsJaS4nwpVqNI1RHm/BcXNPz/p0+bnujjdXi
 OP7c4B2qE7wW2DdJfp7J6+oD5ojCA6JCUDK8g43muOphswSLBf8T80y20Z8QQt5ghYJw
 AsC6sx/gt3oTYUgMqt71khW00lkAAd8afh8YX8GdFDx9vvV4dl6i0dBrG7rnk9WvQn0K
 aSTNLivl90SGVQ6PIbqnrWkJrQKkV1I7m91wbQOwjMtKMKdmnqUH29geiOgebmbCrwHT
 o9dKdu+ZX5mQkbvoLToTEryK/+7o7yUKf/z74Iu0CWqASmPWOfYtz+BgAHMwYcX1JWk9
 vfyQ==
X-Gm-Message-State: AFuF++lm65g9u4M9lo9acPOeCkrZiWexe9iIXEADGhbfTMDYW7I5fSUc
 8oPyFpTx7olnrstptvHcJvBAPZ8sEf9VHaPGYMaqycblOndhPs8eWR3KS7MmzFp3RtZA1JXjVWk
 hafB0
X-Gm-Gg: AYBFou2xYVcFJjuynRsVGEOqsx5HNxhvqUS4qoSrnkcyYEM+wHILigJGLi1hO8EhqYB
 1a9M9xoMeMdrV/IXrAMMsYmoP8Mhhllb8Icje9b69yIQW7zRNIKPN+MWs8TUlnQVab8Vjb93Dsd
 IAxqJ982ofLznb+pJ3B0jco2IQ2ifsUZ5UAqmvKGJC1VZAKui+lTtcMbcAaU49pfECzK4/4BkSw
 k57gezXnn3OXR9JOchdGrm2ECSOLNCDMl30B3kUSD0E1/SbIacgWqp+1E0+dwz4EjJyagcCcJV9
 kORwh5STZgk0kFJzeDFmS8Gemh1eQc0deoJ4FfKFVTQtbGFzGYAPq/adbg9yzn2Hi4EGS6AYHNT
 /Y066dGGktvOtnV3oPlnvS2xvTin8Z0x6xrHvYiEw6JwURB/Xs+og49+uMQCULO5OlqO8tyDsCP
 bFoo/KthfzP/IzQmyOMcigILui5SRvjIBaEmieFklQcPNDpRoafPqiN97tYBv4Xl13Wcc=
X-Received: by 2002:a05:600c:6095:b0:493:f5bf:4dc6 with SMTP id
 5b1f17b1804b1-49cf81ff697mr46611955e9.7.1788524303085; 
 Fri, 04 Sep 2026 05:18:23 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce5941cb4sm88671395e9.4.2026.09.04.05.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:22 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:22 +0200
Message-ID: <20260904121822.405041-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811120530.130487-1-thomas.perale@mind.be>
References: <20260811120530.130487-1-thomas.perale@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] docs/manual: update 'releases' to
 reflect LTS changes
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
> With the release of 2025.02, LTS releases are now made every two years
> with a 3-year support.
> 
> This reflect the table showed at https://lts.buildroot.org/#releases.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> v1 --> v2: Took the suggestion from https://lore.kernel.org/r/<a00e615b-c2b2-42d9-b525-8852fc0d74a4@grenoble.cnrs.fr>
> v2 --> v3: Took the suggestion from https://lore.kernel.org/r/<393511ee-1b43-4e3c-bc64-e71c1d900c0a@gmx.de> . All the releases are stable and divided in two categories: LTS & non-LTS. Also updated the lts website page to reflect those changes.
> ---
>  docs/manual/release-engineering.adoc | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/docs/manual/release-engineering.adoc b/docs/manual/release-engineering.adoc
> index 0cf38183f9..cbd310d682 100644
> --- a/docs/manual/release-engineering.adoc
> +++ b/docs/manual/release-engineering.adoc
> @@ -5,19 +5,21 @@
>  == Release Engineering
>  === Releases
>  
> -The Buildroot project makes quarterly releases with monthly bugfix
> -releases.  The first release of each year is a long term support
> -release, LTS.
> +The Buildroot project makes quarterly stable releases with monthly bugfix
> +releases. Starting with 2025.02, the first release of every odd-numbered year
> +is a long-term support (LTS) release supported for three years.
>  
> - - Quarterly releases: 2020.02, 2020.05, 2020.08, and 2020.11
> - - Bugfix releases: 2020.02.1, 2020.02.2, ...
> - - LTS releases: 2020.02, 2021.02, ...
> + - LTS releases: 2025.02, 2027.02, 2029.02 ...
> + - Non-LTS releases: 2025.05, 2025.08, 2025.11, 2026.02, ...
> + - Bugfix releases: 2025.02.1, 2025.02.2, ...
>  
> -Releases are supported until the first bugfix release of the next
> -release, e.g., 2020.05.x is EOL when 2020.08.1 is released.
> +LTS releases are supported for three years, with a one-year overlap with the
> +next LTS release, e.g., 2025.02.x is EOL when 2028.02 is released.
>  
> -LTS releases are supported until the first bugfix release of the next
> -LTS, e.g., 2020.02.x is supported until 2021.02.1 is released.
> +Non-LTS releases are supported until the next release, e.g., 2025.05.x is EOL
> +when 2025.08 is released.
> +
> +See the table at https://lts.buildroot.org/#releases[lts.buildroot.org].
>  
>  === Development
>  
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
