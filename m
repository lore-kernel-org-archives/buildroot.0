Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF0BCA5FD4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 09:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D61F40CAC;
	Fri,  2 Oct 2026 09:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVGTKczopfbd; Fri,  2 Oct 2026 09:15:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 62CD840C00
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790932530;
	b=V+ESMhrAgMmYqc88tSlXQO7DlYb8Er8+Hd4gTDzVlB17wuMOcX2Ii+lqa8aRO8moAD0D
	 Et/JZpBU3UxMcVSd2Wzd8CUfmDCNbHuq9u4mZSbhFs91qfKmQmBCqxZT/cI6mSNp86LNz
	 SCeIRJXPQ+cC3Bq5dhVNKrn2XZ2/v2k4nfJ0VUN4eqS2YSuRe9VHuCgsbIBTgbLOPA/NU
	 /IVkz6wcpnCPS8l8kspTNSap76p073daJz1wbp3T5ithdJNF7dPwBVpSMHjdUf0FjdQ9h
	 gR6K5TZTxqPBX01oY6mmVwo0Xma0m6ucoRQbf5SJfBkdmoT8eO+FjCdhLnBSZCbZ/kA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790932530;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=3soawIxm/OSaZkI/GhDsZtgOJnFPPYjkK9Mtznh698g=;
	b=oPz9n7+f8V9GrKBPpHLPzXmZmL3gWnCp0LUr6CMbcJ8KTMQNm2enCPwJUprMgk/V4Kjs
	 tblSnIgH9X7zI38KvPKm/FUx0MpWoiGCfsTM23Gaw6ws6/S/JgD1kYaLWTS1T44nvpSNR
	 /Vy0dTYhSLl3sN/wZtDJVBuwdzNDJDOmK2saVsm9kgyE2onzTfxrGKUnLDNPR4Wxm84is
	 i9tKXZsZ0d+njMRYo+ASD3+RNdcm5Pf7Lu4APNOvgBHxtnE6DLLjm1wGpN8lrWwRl+qyQ
	 Vo/4wXnpQPDXDPp7bSYYA9AfFXwpBjXOTNrstWEJCBzEwGExas7zfj2IDar900XBZ2A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790932530;
	bh=3soawIxm/OSaZkI/GhDsZtgOJnFPPYjkK9Mtznh698g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DjaWz3eMSpA3+PHvrfWLNE5hxC0nyynepJRjDfS78bp21+ahuJIm/Hwt5VbtbU/Ca
	 a6ahvstR2Hoy7vXjdxlr0KBo0bTCn3tDSZXnQ2SIPy0BKBxTWY1N2YguRmRIUEiq26
	 tPwxav/dxhLCKo1LnkCDuVSV+Ir3zc4MYLzs5lynGkpu08JdEg57Rfkv/nZopb/G8i
	 BJJ9QQcMg1f51nruUkNgDy+allYU54R0ADGrqTwiwPTO6BwpXPN6enauhK3PCc6A0f
	 7xsT3x1cEmmAaDiQX1NRfWV5I+89bh/OPMLlI274EXFmFbWXLIHQxeKVgF/G9qPj7r
	 xAhl580Lv9oJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62CD840C00;
	Fri,  2 Oct 2026 09:15:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F0F93AC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 09:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C2AE8115D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 09:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-114AUkiaa3 for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 09:15:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6101681122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790932529;
 b=XgPUYlOnmIbUBthU//5w3/dSTfRw5Gl8pYz3PksUVkGIUiaVrtwvgJgz2K+YHrytO2HV
 /SLyE80KX5vf7dLQNnelogDRwkfju59SyJ69ffU8cwsw8BHj5BFjNIKnU2C0Y7uViIKkW
 cqPkGx8p2aALlyzd4H649fm6sEgurQ23+LWWG+3w6SUoDt7l3r/0f5f5lRnWflt2zEP7g
 8dTj18bzW2BSf5CIOaOGeJ5ujsOeUIwV9JKqqzuKQqDF0u3G6VpZXlCmcjh5u0QvIPmA1
 liGblApGD7OuFDgfj6xWQKljvWDptlXGryHh6OcyrQetGngTyHufc8xWNmof80ZUgAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790932529;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=gWwE6FhQPRlXwxcJg37NtRNkOhfTTawNeQdg9mz+XwQ=;
 b=Dy1FBwL5uonVbFLZsagXYiKgWRh2/mnd/D811OiLhVJtAEPJNYpB8a2bTEn7wMUZRd4N
 Y9hUz9Xb3cXhrmB8X128De9AUPtgOphLSJsM7r32UpUpANu7L9KOvqMUef3ERZajhyS1e
 5Z1x4WgZRK1CRYgkZShC5tmzCfgApUjqduYFqMShUjQRvKQ5zbKqRUQcY1IyeUQOkJe07
 qC+yCsFRJ68NcsaMXa37wyhEDdhBz1SP7ypu8u84csoLwXu6OzU8W67H6yxvT2ProoOJn
 FBvYpo/+fGboCLydICBg3lzvZXgCqZlANaS3m2lXm17FXyGTBXzQQsIXcakN7ggZn8Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b="Hj/z+dDy"; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6101681122
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 09:15:27 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6llE-1x4Ixp44PW-007Rde; Fri, 02
 Oct 2026 11:15:24 +0200
Message-ID: <c87b31ef-4263-4b71-94a9-4ee17d7bee5a@gmx.de>
Date: Fri, 2 Oct 2026 11:15:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20261002071943.2182234-1-peter@korsgaard.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261002071943.2182234-1-peter@korsgaard.com>
X-Provags-ID: V03:K1:m+NcvxXhZTSAvcIjq9viIq93AwjN4X5OJLeZTNAh26M4CJkcgFG
 V/lJ5VfSjTg+HNfgl6y6Dsl9xtC4yivlS6onGhpnkQPn7qSqr+EOmJMhwEVI2vdU+qqoqcM
 I/nnLcvFyFUxdj4vh7iXOuPg2tTgxZdKctwHUM2Wu6O3CwhEg603pnUONz7VefbEkN3LP/R
 LlMqdSjy+kLSJXUzDjjyg==
UI-OutboundReport: notjunk:1;M01:P0:9OVnysWAQo4=;8g8VkJrlScFyHssWlDtJ3IqSSMn
 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
 LSdQFCIngJcwcnv4g==
Subject: Re: [Buildroot] [PATCH] docs/manual/common-usage.adoc: correct
 generate-cyclonedx invocation
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 02.10.26 um 09:19 schrieb Peter Korsgaard:
> Commit e09bf9e9511 ("docs/manual: add information on CycloneDX")
> unfortunately introduced a typo.  The make target is 'make show-info', not
> just 'make show'.
> 
> Fix that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thank you!

> ---
>   docs/manual/common-usage.adoc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/manual/common-usage.adoc b/docs/manual/common-usage.adoc
> index 631c2f7788..67c3e06567 100644
> --- a/docs/manual/common-usage.adoc
> +++ b/docs/manual/common-usage.adoc
> @@ -214,7 +214,7 @@ Similarly to +pkg-stats+, CycloneDX SBOM's can be enriched with vulnerability
>   analysis from the NVD database.
>   
>   ----
> -make show | utils/generate-cyclonedx > sbom.cdx.json
> +make show-info | utils/generate-cyclonedx > sbom.cdx.json
>   cat sbom.cdx.json | support/scripts/cve-check --nvd-path dl/buildroot-nvd/
>   ----
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
