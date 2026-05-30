Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D500CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3895F42DC0;
	Sat, 30 May 2026 13:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8rsv0Z_k7JG; Sat, 30 May 2026 13:54:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61B2142DC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780149246;
	bh=7NZ/irEnsb9GmAJxpxQPKeKrefC4A0Bbb+0ty5YDtGQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NOwG/bSJ/GiDwFMCV61o3cW5FDEcZtl52bSzldpOvJ1+1nCJlsKMDoILmRjswPPVV
	 jhkEB59QRP15eWfXTFLLeIQivDYtzoSHmOHFceNvHSrHWdynG2Mewkj8jfLRDbBbxp
	 4OLo5aPnzD5xtVHXQ4vcJMeyADOFrGMxO4KuOzPCWr8NiDsGFiwuUrk9HtqEVErvFD
	 iZ6id9rVgHcdc4LYET1uxhxLWZE7hURRr7gM6wgm33syIOACj3fYs74bwcO8QI4xfu
	 cXPukOcxo2I08OKWqP6loPUKhWIWLUvmlGuyqmOmFCiGZ+Si3SENTlY33frhfBFb0s
	 QnYpaUW069BMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61B2142DC7;
	Sat, 30 May 2026 13:54:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DF3A12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2399E42DC7
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZU4NW6xBT1j for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:54:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E87E42DC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E87E42DC0
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E87E42DC0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:54:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5B3BEB97C6E0; Sat, 30 May 2026 15:54:02 +0200 (CEST)
Message-ID: <6ff241cd-cf1a-492d-8f4e-f958215b270e@rnout.be>
Date: Sat, 30 May 2026 15:54:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Martin Willi <martin@strongswan.org>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20260409081401.2060709-1-martin@strongswan.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260409081401.2060709-1-martin@strongswan.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780149242; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Y79i2a4Fe/0c29jILjBicL3VcrWjQbK8UwlDhZpyU5o=;
 b=phqfLG8JuY3cAi3EXQdMVDglti0LeXv4Sl8yBmE+K6ORSPpJ+YJBIptPNU2gMW0DHS6A/o
 qOCSO2PtcIllj/a8Rctc1YP2kisEvH/QDB8wuFBfmFr+zKwIb8NVz69rTkc17D6ivX9Vbd
 nANtQPBmf31QKshJCfzt8BOhdqEGCT7OhUmMm6bKgPp14iFt2BJpAefRQ4h5oPxsAtCBm4
 S8MNjpJ2GghpYVsroIbbe9HzYtxy09hLLyyyqkkW0ppxczZcbcLzpXGpxZSqSUA88mCrpB
 EZPeq6ektq3N3mmXmk22l+14y57WuPhocmVUgelc/cE8kkBeuxHTpQxZBx4axQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=phqfLG8J
Subject: Re: [Buildroot] [PATCH v4 0/6] Extend CycloneDX metadata
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



On 09/04/2026 10:13, Martin Willi wrote:
> Adds SBOM component externalReferences with source-distribution URLs and
> hashes, basic unit-tests and a minor fix root component dependencies.
> 
> Changes v3 -> v4:
>    - Fix test data to properly model virtual package provides/dependencies
>    - Add docstring for root component filtering function in patch 2/6
>    - Refactor download URL extraction in patch 3/6, preparing vcs support
>    - New patch 6/6: add vcs externalReferences for packages sourced via git
> 
> Martin Willi (6):
>    support/testing/utils: add basic tests for utils/generate-cyclonedx
>    utils/generate-cyclonedx: remove indirect dependencies from root
>      component
>    utils/generate-cyclonedx: generate externalReferences with
>      source-distribution
>    package/pkg-utils: add 'hashes' to show-info
>    utils/generate-cyclonedx: add hashes from .hash files to
>      externalReferences
>    utils/generate-cyclonedx: generate vcs externalReferences for source
>      repos

  Applied series to master, thanks. Excellent work on adding the tests, and that 
you referenced some explanations about all of this stuff because it is sometimes 
hard to understand what is really intended by the standard.

  Are you interested in adding yourself to DEVELOPERS for generate-cyclonedx and 
for the test?

  Regards,
  Arnout

> 
>   package/pkg-utils.mk                          |   7 +
>   .../tests/utils/test_generate_cyclonedx.py    | 240 ++++++++++++++++++
>   .../cve_upstream.patch                        |  11 +
>   utils/generate-cyclonedx                      | 110 +++++++-
>   4 files changed, 367 insertions(+), 1 deletion(-)
>   create mode 100644 support/testing/tests/utils/test_generate_cyclonedx.py
>   create mode 100644 support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
