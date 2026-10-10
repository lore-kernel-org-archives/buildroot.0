Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159BDCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7D7C810E3;
	Sat, 10 Oct 2026 20:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbyudLpT87tb; Sat, 10 Oct 2026 20:48:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DD11B810E0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791665339;
	b=Sd0+QJzsGNlc/ohovXSgML/uJFNUMH1sUE4sp1mMVM5ChP2R3GQ1h1ZM96Wh6BmwF+wS
	 7j9juMyZg+DGddqpP7F1ljfGr3mqLpb7hatMDsluxsHVyLTODtkdAzf0bZE+WQjlAjHc2
	 xjVNaYjzUoW8R3Yil5KFnT5va023fTf4CKR0HfMCpewQiZSQXYjuZqeDg39ATXJZauoRt
	 CIzA+WDIFcrbeyBQctVutISghP5rS9/RCsGpi8WHopjX0BHxyEWyHPjt3g9DlQWzJyS0J
	 8ncFig8dtKZedSuZm08hb9CCeBfE25k68z//jNLVYMutJ+FXyhARhF/BWmoAYgh4s0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791665339;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=YE3pU/OmYdsECD1FVXqf91bMz9VFcgH1IxE2fq9pPRU=;
	b=nKsVAQ5v307tC/ro9eVIfQD+A6l7yaUBM7KKPskUOUOjVczM5Tnv4+WOUQxTIIPO3I1/
	 +kGNe0/xfoD69VcNA5vfBahU8Y3QLPt9/uXyrnX+pZfMoHK3XoOoeeWJ8xrN+jZy588w5
	 bWwlH7c9LSwHn6sJQCeqGapDN2TgQMewjwHk1N3Zm7CfLN9hVnklG1GJdbNt/iSmiO8/T
	 vOpOsYU4j6hxUmlv7BjjvObwKzM/hijyUfQh46GEbMagriEFjqUo1Il8dTwNJ9GR930T3
	 Cj0iFx2WRLdcMa8UvmhrZErobhuUvnI8uenKECrmaXlvHJeRRD1XehDb6vJ1SZ1/ttw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791665339;
	bh=YE3pU/OmYdsECD1FVXqf91bMz9VFcgH1IxE2fq9pPRU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R54B1cs/epzxstkfWCyrHlvDJYg2OkZM8SFSJfFwFMiAwGv7f0O8vy4dvhcLxHSvU
	 L4gL7v1k4sCtUFYB3YTR1wmkMyM0rTFAYGSKDMHLigyf5TcaYiQu33vMH/EOMvUHwA
	 cT6d0vRc8d74FqomEwMmYdchj3PtYurdHFlu4anG+MdrgW1lyplenYeekMnkZ0WmKB
	 pfbZV0qe7e7GhhCT+aCyEsOZX7ZhcOt3EQrQzNyavvGbvJnRM+Of3fc5ilOo24viup
	 AETQ8yHORh8pbKyssI2eKL9mflj7JOYwxs0OrX2L0kjAfonCP7Gbu5p3YRCg6Qaua2
	 EHgtM+qgAX+0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD11B810E0;
	Sat, 10 Oct 2026 20:48:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FC49235
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7373F606DA
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJWLE12sNFCR for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:48:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8ABED60677
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791665336;
 b=DH8HPMgWyeGY8IKFpG/B4VZzO+KcQukafLVMe1eEyrSv/KE+Ms4NV1hT8Rm0txhusQZc
 WzWY738hFWnxTMOkjdpqfm1TzoyroAoGfhCM9TdT1kHR0WQ8ODT4s6raQ3TzSVU12A1S7
 LqguTF46BC8yi94xD4A0Icrghin4kWq1JH8IFaMoNm/ptc9uRYxl59504GvTuXCfs496o
 3MRwapNp+zB9OXA2pzX0/QsAg+xZNs3Hz9neSBi6nD24sNRec8ckuCGswb/tTy9bAX3lV
 Wn7sIze08WmU5xsqxa266lvJYmeRF4TKMnfjR60/fyubuVeZuCtHFawX/6VVsY09Q9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791665336;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=THCS6LBf+GkrGypur8IFxrpdLmGI/XjL9Qh3++2M4Ck=;
 b=PETedy+wBR+eW/T6f0VcOM7qjZG572K1CkLpbvkKU5m+VM5nYbrzxYQE89+S+Pb/3Hvd
 JL1MGGqGFfqmDeupE+WJIBnX8kUOTbS6YrukluJFxVHoAsSX3WKoUBMu245JH3Fix/IGf
 d98gRrvEUr8wdTed0V5f5ng94n7Aryq6oa2PO026fs0Xdpn3I51YFU27breY6UynMgpac
 xNoPBwwwsytwioGzfSU1PN0p95l4r648bKwaicTAc94nD1hZ5vg0dqfR0WO6MomAkyOXI
 I1jUzHOG8FuOUxQI5GBHknxTgYNkH65IvIRQeKLf7lmhj51GlNPDKPxupZRunZH61/g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=kXShyVKC; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8ABED60677
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:48:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0779FB979FC1; Sat, 10 Oct 2026 22:48:52 +0200 (CEST)
Message-ID: <0650bb08-e03a-47e4-a05b-bee0ce525e25@rnout.be>
Date: Sat, 10 Oct 2026 22:48:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
References: <20260624101340.80670-1-thomas.perale@mind.be>
 <20260624101340.80670-9-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260624101340.80670-9-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 9/9]
 testing/tests/utils/test_generate_cyclonedx.py: test vuln with different
 analysis
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/06/2026 12:13, Thomas Perale via buildroot wrote:
> Add test for CycloneDX vulnerability generation.
> 
> If multiple packages ignore the same vulnerability but provide different
> analyses, the generator must produce multiple vulnerability entries with
> the same vulnerability ID but different analysis information.
> 
> This situation can occur when generating a CycloneDX SBOM from the
> output of 'make show-info-all'. The resulting SBOM includes packages
> that exist in multiple versions within Buildroot (gnupg for instance).
> 
> In such a case, one package version may ignore a vulnerability because
> it is not affected, while another package version may address it through
> a patch.
> 
> Therefore, multiple vulnerability entries must be generated, each with
> its own analysis and reference information.
> 
> This add test case for such scenario.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   .../tests/utils/test_generate_cyclonedx.py    | 69 ++++++++++++++++++-
>   1 file changed, 66 insertions(+), 3 deletions(-)
> 
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> index b91add2349..2f1109b178 100644
> --- a/support/testing/tests/utils/test_generate_cyclonedx.py
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -6,6 +6,7 @@ import subprocess
>   import tempfile
>   import unittest
>   from pathlib import Path
> +from collections import defaultdict

  Darn, I missed this one.

>   
>   import infra
>   

[snip]> +
> +        result = self._run_script(show_info=info)
> +        self.assertEqual(len(result["vulnerabilities"]), 2)
> +
> +        vulnerabilities = self._map_vulnerabilities(result)
> +
> +        self.assertEqual(len(vulnerabilities["CVE-2025-0001"]), 2)
> +
> +        ignored = next(v for v in vulnerabilities["CVE-2025-0001"] if v["analysis"]["state"] == "in_triage")

  The next() doesn't return None if the set is empty, it raises StopIteration. 
That does make the test fail, but it makes the assertion below  useless.
next() can take a second argument for the default, so I added that.
  > +        self.assertTrue(ignored is not None)

  This should be assertIsNotNone().


  Regards,
  Arnout

> +        self.assertEqual(len(ignored["affects"]), 1)
> +        self.assertEqual(ignored["affects"][0]["ref"], "gnupg")
> +
> +        resolved = next(v for v in vulnerabilities["CVE-2025-0001"] if v["analysis"]["state"] == "resolved_with_pedigree")
> +        self.assertTrue(resolved is not None)
> +        self.assertEqual(len(resolved["affects"]), 1)
> +        self.assertEqual(resolved["affects"][0]["ref"], "gnupg2")

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
