Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB04C5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B98780F45;
	Sat, 22 Aug 2026 12:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lGf-h-TEMXlp; Sat, 22 Aug 2026 12:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787402098;
	bh=DgXlDuE6eJSqSVO3j7K6ljdsP7XuuYfwDiJFk4FFZD0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AH4TLerJXK0vgoN1FvhPxDnlgwYkQ1TB9OtLgeyVKwRsGj5+4SFl3HAb8NFqW7vDk
	 ieVr58UxAp9WOat5bRyTNA9gTW9XmeCqLqQTB6wktKxVfFGbwELWODt0GNKLk64HqV
	 4EpiVGoUjJ9SwrBwjG3c+uXjy99rJcMcl51gyd1egCjAKnzMikvbyh69lb1W2QbESj
	 F/PWgZiTGmWhqg+AL+LXtGvXZsi09q90r7f935noSv2uqN/ddxPY1HSdeZS2Zxw73m
	 3KXSppDsiGzZhl3YmksWpbd3bLtNogRbfBQSry3/mWhN+DsMxV2ee+Z/HRcPq2yBkB
	 7ImUHaRLneAgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C30280F15;
	Sat, 22 Aug 2026 12:34:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B6C42B2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11E7840073
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CYGtRguWfR3 for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:34:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A93314005F
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:34:53 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c15ca7a7ca9so219512466b.0
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787402092; x=1788006892;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HzrJBhC+48SpA1rxUiUjvina5e0Z6hXxR966cDvKFek=;
 b=Vb2rtT0pKiO6qRtj3G8mhGz3Wkck//7Tj0cEg6ZJwMBl5/+PDg3iQXsO7fgVbkaSAh
 wPmQTuM/ceB+FwW0f0kB+b7UEdcRKLMxxbLoVm5Jn4IWd7oVyvAxLnKSieJcLilQ0qms
 ZYInF4qBTya0/q9ZmuqqoNqNS1e1sBxRBQOn39U10siolflphJ909a7MRLsaPya9xlVf
 d5m4St1wi0raWTzFAEGO4k0KjvFnX8b/3qkzzu2hrOJqlG4c08aV7M7BkF+GmarYgrlZ
 IVZfwMuVOpt/X+7nXrZvWho46NrjXzOx4vZL1sN1tApRko83YvIPvFFKaEsNttf4DmAu
 8d/g==
X-Forwarded-Encrypted: i=1;
 AHgh+RobwG9hrVG3wYt1rJvEK4HYLUeAtIgHlkwKuMUbr6Wsln5ZI113RrkZZ/Ypx0Z32w/SyP70tNurBO4=@buildroot.org
X-Gm-Message-State: AFuF++kb3Yie+/PdwNILalyZ5iHLmo/wHJO5siHYAP5CyzT7yDcPSzHi
 6/DgNSiCjxheO/M0wYmhSTqFGO2ATbJEoudUZhdkh1kuxLclNYQhjr6QlZeL8ZA9Q5w=
X-Gm-Gg: AR+sD11lnXixX1E9DOoo0Z2VBJhvRV8g9q8EuD85OfbGImMUM//MHV4EHM6VRuL38A7
 eiVUDj3XrPrpALZoDflwAY+I4y0Uqn9bWZDyGbvSsOksHzqp6QrS3tZG6BIj3YY8jzzR4o0vRyH
 skEy43gq40q4nzXfrZithWW7DP4LvtGUCEG0jUU033iSTPdMEnQ8XmOQv9p4BAuqTHgobVaSg7p
 ZKdwhksew2cC2Q0MliSVyRg1yqnlS42q78rdZT2G2Fe2Eq8bar5r9J+He8zKr9GUstgi8k0tDud
 RZXALore1GbSnRlAgtosWhwR5l8JQjYfvY0dzKMpDj9el4As8rQfF67xZgmnyGvzFg19Rm34n+6
 71zEAynvIxMx9DEsaPZ+7fm3olTEzDoveEmtxoce6I0LabSbjfYJB6XUazMbdcm32+wSJMg8man
 QhO1IijLPJswTIVCyYbwq6CkdHmh73mEmmZteGZ97uNpyCtASfbsFJnOobbFoKke/r4fJKOeA38
 TQx3V0/J248X7Kv9I9qDv0k+8sLM3WJDnYsRTUxNpjHKvwK
X-Received: by 2002:a17:907:c243:b0:c24:47b8:ae5b with SMTP id
 a640c23a62f3a-c246a68418emr1571620466b.22.1787402092036; 
 Sat, 22 Aug 2026 05:34:52 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3ff0c327asm11727486a12.8.2026.08.22.05.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:34:51 -0700 (PDT)
Message-ID: <39cbffe8-5d9d-429c-a6e6-935b8b9ca8a7@mind.be>
Date: Sat, 22 Aug 2026 14:34:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
References: <20260815140041.100370-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260815140041.100370-1-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 18.6
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/08/26 16:00, Bernd Kuhls wrote:
> https://www.postgresql.org/about/news/postgresql-186-1711-1615-1519-1424-and-19-beta-3-released-3365/
> "This release skips PostgreSQL 18 versions from PostgreSQL 18.4 to 18.6.
>   18.5 was not shipped due to a regression."
>
> Fixes the following CVEs:
>
> CVE-2026-6464: psql COPY FROM STDIN early failure processes data lines as psql commands (CVSS v3.1: 8.1)
> CVE-2026-6469: ALTER TABLE ALTER TYPE resets extended statistics ownership (CVSS v3.1: 3.8)
> CVE-2026-6470: Fails to check type USAGE privilege (CVSS v3.1: 4.3)
> CVE-2026-6471: Logical decoding can dlopen arbitrary file (CVSS v3.1: 7.2)
> CVE-2026-14662: tsvector and tsquery undersize allocations, via integer wraparound (CVSS v3.1: 8.8)
> CVE-2026-14663: pgcrypto, for OpenSSL-disabled ciphers, silently encrypts to and decrypts from cleartext (CVSS v3.1: 6.5)
> CVE-2026-14664: Regexp heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-14666: Row security caching disregards role modifications (CVSS v3.1: 4.2)
> CVE-2026-14668: ctid type confusion in selectivity estimator discloses derivative of arbitrary read (CVSS v3.1: 8.1)
> CVE-2026-14669: to_char heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-14670: plperl tied object heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-14671: refint plan cache type confusion executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-14672: Observable response discrepancy with non-default scram_iterations provides user existence oracle (CVSS v3.1: 5.3)
> CVE-2026-14673: amcheck does not clear untrusted search path (CVSS v3.1: 3.8)
> CVE-2026-14676: pg_stat_statements heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-14677: 32-bit pltcl and plperl undersize allocations, via integer wraparound (CVSS v3.1: 8.8)
> CVE-2026-14678: pg_trgm picksplit reads past end of buffer (CVSS v3.1: 4.3)
> CVE-2026-14679: Stack buffer overflow in argument match writes 0x0 and 0x1 to server memory (CVSS v3.1: 8.2)
> CVE-2026-14680: Type confusion via "internal" arguments (CVSS v3.1: 8.8)
> CVE-2026-14681: Improper enforcement of GSSAPI encryption when coupled with SSL (CVSS v3.1: 4.2)
> CVE-2026-15741: Expression deparse allows SQL injection via EXTRACT argument (CVSS v3.1: 8.8)
> CVE-2026-15742: fuzzystrmatch writes effectively-arbitrary addresses, via integer wraparound (CVSS v3.1: 8.8)
> CVE-2026-16238: Type confusion in pg_restore_attribute_stats() executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-16239: Type confusion in cursor CLOSE + DECLARE executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-16241: ECPG integer underflow can crash the client (CVSS v3.1: 3.8)
> CVE-2026-18024: ascii() function reads past end of buffer (CVSS v3.1: 4.3)
> CVE-2026-18408: psql \unrestrict lets superuser of pg_dump origin server execute arbitrary code in psql client (CVSS v3.1: 8.8)
> CVE-2026-19385: pg_dump heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
Applied to 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
