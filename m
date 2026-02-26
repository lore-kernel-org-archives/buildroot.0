Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5044FD8FCA
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69960840CA;
	Thu, 26 Feb 2026 15:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLOihWaeutJT; Thu, 26 Feb 2026 15:38:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 704E4840A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772120329;
	bh=ikgSfGH7XR97Bd0ZevHK257SEKZ9g+/LL/BwQn84+eE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TVgAajWonBZZdDN0rOr5GMBvZyLlpFLrekLZxj/9i0nztgMJXPjIsBvCMHMA2rjtc
	 Wzaajk4Cn1GZDQ417Ha/aFcp2WEHML6MkaCzvaozw8bRgCP+2N47zLpexL4RvcYFs8
	 8NNfWqg/6GWwL2L8UmvbmCZ2NWtGDK5EDS6lj78P6Iz3Yit/u9drHJwYMKzLMeo++m
	 /PYruU2IOB9/IosTS44nQx5KP4+KiHgWM1UvKoc+P9lZ4ttRV411Tl/CKosePsSjHF
	 FaeXVeAohRvhs5nTLflAToBzdZdGdAX7PcyVPHrEVvc/pKS76JS2ck47ZZTdCZ0M0i
	 bX2wEerFvVBow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 704E4840A2;
	Thu, 26 Feb 2026 15:38:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7C5F204
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD71E840A2
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 41x_TbQf1zdf for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:38:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 66AB282443
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66AB282443
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66AB282443
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:38:46 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48069a48629so11078485e9.0
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 07:38:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772120324; x=1772725124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bNoG5rA1bdSfRnv5i2tzYDXLbF312+1KPRarNRqM15U=;
 b=LW1k5YxfBFhFgX6jmOffGP0x+THzrPdeXkQlyUUG65nEnDJPmoiLK9qZ3qfgipyKrP
 ha0ZZcUYUTT1ByNGklJp7bIgzVnIU+E7taDLVzPR8X5/9PVA+ylNo/M838pNrLPjkn7j
 htQhiyR9bm4pjaSGlUXyaDHtOk/OykEiYad0n5KJUgGQE74ONYrMXUCkL0dAJlgyUEaI
 Y90IC3L/Mr9EAys1wZ34YcvN8NHquTOqJP4v0M06qoAGoIgpqJVi3ykhRuu11K/sV4gN
 fUK5aTI1hDgBfl/DlmifbvF+AiR6Q4SB/QyPh5l4F+RTehk2bwVOHA30XWi9Js555LaK
 3tlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0dC/03k/0A9bIDTd1FyNOqu3aUNeONHQxNkhVlOb3OjpTSLKEF1v51epzDMWYQn48vsrEZhTyeIo=@buildroot.org
X-Gm-Message-State: AOJu0YzHJDjEjg75Lnh76f5J1hkgJ/uclJxt60EK2+PfltGBIzWUma+/
 x14fK/2nECuxc8CaVih8Uz3TfD6/MQ37OjJLi8PiDqT3Ttfw1miCYwRcfCoAU1CAjmw=
X-Gm-Gg: ATEYQzzZb1voCX5/Ide98DUiyDXU9G3+CQM9F2WoA6zadopGXjMcC5v2EDO/a0GRdgp
 tVyTdK8Twed+lMQk7j5Q98NJBWo7xOkyQPVBipojlTixizoiF6kuGpfbQHMphESO/A/Dq2qEGtz
 j9wiKoCoMSTsdqSyt67QE2d2DW5wEYO5Jo0kOrn5icrN2u8zprHlemmRK3zKmqvrLnd3oPwSDph
 qMMND819KWSAHPy8mGL52ml9TcE2PFJxwS5hmE+TKhhvoQZ+07OkZ/GTatlPdg3+kt4vQuG2W8J
 UhpGpoqCxKe+NXJV1G42Nj61efGBRL80sUhuBpMLZ7f9zZkVWFlM+ystQT8o/Dpsh+R7uoMdjAs
 pgC9nlselkrCb1z28MIlQhpKwDaAR8Fwrt4/B+5MNu2icISdWIx6wXZJup4gBZlIPZ/yEMKtx5i
 0wLHrMhahWOB20B9g=
X-Received: by 2002:a05:600c:3f14:b0:483:6fe1:c057 with SMTP id
 5b1f17b1804b1-483a95e1f15mr333153815e9.21.1772120324002; 
 Thu, 26 Feb 2026 07:38:44 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd70e692sm152872325e9.7.2026.02.26.07.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 07:38:43 -0800 (PST)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Feb 2026 16:38:43 +0100
Message-ID: <20260226153843.194855-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226142700.1064999-8-martin@strongswan.org>
References: <20260226142700.1064999-8-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772120324; x=1772725124; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bNoG5rA1bdSfRnv5i2tzYDXLbF312+1KPRarNRqM15U=;
 b=ZBd7brD5iPKqwftQwlfeQUmjdNDDbXjEWJdfcNKo5ESla6vK8CGaGGo4IsXOxNINB/
 pphdO00wwzpml25OYomFLzJKN1XpOjtRMPr3S5gLITfaJJUpQQyM8Np6pzurcC3UGW4k
 0pZxZXbzg81oQ8zCf5l9NoLulawllwYKEqjOcJjqCP51p8iWVjM2b2FKOgO0Ml1bxbXh
 yEBBw+8MkQ4sAddY1uze0POcG/ybq8Fmbf3XbQhdvGz2yNisY5xyd45MkuUe6WU9Dme6
 sYhEFupl/kx+D/DoYTUxrDX6H+Uj/7RVe1j/f/BHplHkqBLfDA4tGtlwYiHHb0khCKb7
 yTqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZBd7brD5
Subject: Re: [Buildroot] [PATCH 7/9] utils/generate-cyclonedx: add generic
 purl for http(s) source URIs
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

Hi Martin,

How do you plan to use the 'generic' PURL name ? I don't think we can have a
proper unique package url based on the Buildroot package name. A simple example
for this is the 'libopenssl' package. In Buildroot it's prepended with 'lib'
but other build-system like Yocto use 'openssl' without the 'lib'. So with this
method it would generate two different PURL for the same software component.

I started last year some work to add PURL support to Buildroot [1]. I only
focussed on the 'ecosystems' since we don't have a solution for C packages yet.
If PURL support is added in Buildroot it should probably be part of 'show-info'
output as well.

The main outcome of discussion regarding this series is that right now we can't
be sure that the package name in Buildroot correspond to the one upstream.
A solution for this would be to generate the PURL for these packages when we
have access to the lockfiles.

What do you think ?

PERALE Thomas

[1] https://lore.kernel.org/r/<20250415195547.199428-1-thomas.perale@mind.be>

In reply of:
> Not all Buildroot packages provide a CPE identifier, so some components lack
> a strong identifier. In addition, some SBOM tooling prefers purl-based
> identification.
> 
> Add generic purl generation based on source tarball URLs. When a package has
> an http/https download URI, generate a CycloneDX generic purl with a
> download_url qualifier.
> 
> This generic form may not be recognized by all vulnerability databases, but it
> provides a useful fallback. More specific purl types (for example PyPI, CPAN,
> etc.) can be added later.
> 
> Signed-off-by: Martin Willi <martin@strongswan.org>

> ---
>  utils/generate-cyclonedx | 34 +++++++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index f551e3ffbd6a..0b38a0317cbe 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -15,8 +15,9 @@ import json
>  import os
>  from enum import Enum
>  from pathlib import Path
> -from typing import Any, Optional
> +from typing import Any, Iterator, Optional
>  import urllib.request
> +import urllib.parse
>  import subprocess
>  import sys
>  import re
> @@ -354,6 +355,36 @@ def cyclonedx_manufacturer(pkgname, pkgdir):
>      return {}
>  
>  
> +def generic_purl(uri: str, comp: dict[str, Any], source: str) -> dict[str, str]:
> +    """ Create a generic purl entry for a URI and source. """
> +    if name := comp.get("name"):
> +        if version := comp.get("version"):
> +            return {
> +                "purl": f"pkg:generic/{name}@{version}?download_url={uri}/{source}"
> +            }
> +    return {}
> +
> +
> +def usable_download_uris(uris: list[str]) -> Iterator[str]:
> +    """ Get usable normalized URIs from a list of buildroot URIs. """
> +    for u in uris:
> +        parts = u.split("+", 1)
> +        if len(parts) == 2 and {"http", "https"} & set(parts[0].split("|")):
> +            yield parts[1]
> +
> +
> +def cyclonedx_purl(comp: dict[str, Any]) -> dict[str, str]:
> +    """ Create CycloneDX purl entry for a component. """
> +    for download in comp.get("downloads", []):
> +        for uri in usable_download_uris(download.get("uris", [])):
> +            host = urllib.parse.urlparse(uri).hostname
> +            if host and host != "sources.buildroot.net":
> +                if source := download.get("source"):
> +                    if generic := generic_purl(uri, comp, source):
> +                        return generic
> +    return {}
> +
> +
>  def cyclonedx_component(name, comp, props, diff_mode: DiffMode):
>      """Translate a component from the show-info output, to a component entry in CycloneDX format.
>  
> @@ -375,6 +406,7 @@ def cyclonedx_component(name, comp, props, diff_mode: DiffMode):
>              "version": comp["version"],
>              **(cyclonedx_licenses(comp["licenses"]) if "licenses" in comp else {}),
>          } if not comp["virtual"] else {}),
> +        **cyclonedx_purl(comp),
>          **({
>              "cpe": comp["cpe-id"],
>          } if "cpe-id" in comp else {}),
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
