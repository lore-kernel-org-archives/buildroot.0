Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16051CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD49C61702;
	Thu, 27 Nov 2025 20:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ni-aPIiqSoWz; Thu, 27 Nov 2025 20:05:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B35160DBB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B35160DBB;
	Thu, 27 Nov 2025 20:05:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25AC8708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16FCB60DBB
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D98c6xc_GQlz for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:05:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 02BFD60D97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02BFD60D97
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02BFD60D97
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:05:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 16127B979CE7; Thu, 27 Nov 2025 21:05:22 +0100 (CET)
Message-ID: <60ff6b4f-9b69-4d72-aba0-a9ce7550c6a7@rnout.be>
Date: Thu, 27 Nov 2025 21:05:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>
References: <20251119213420.7480-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251119213420.7480-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273922; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=g2DG0vB2F4K5TC9F10hi6ujGjesSoOrGAPt/1pKhg3o=;
 b=gNMWI7Hooxs4QWhRIId2e1exkz8wiZNZIjj0qbSi5Hgc13+5n1GxTKPCE3VMb1cCuopVxE
 6yvf/dy8hOgRQXB5TvX4s5iC3bGJFgvqEgcIeThuSt8GaLU0wksylJ3LCga8FBGUp2SMqP
 ++bDZ1gKO46y3TpPYVlHyEjJSt21WRorOZasJG0nTezZpqc0lc6DayKN/fXGkZjjf+wPXD
 yhjnLEjPjpmQN1ZXCamDZdjAHeaqJf+PDq2wjeiSZPgAvLmxGFBNGvAAbfH26iRNhS1ria
 SQgGBfDXOax6/6rJVvqxUvpVFJlFfoy7Ok/+sNAjhKvz3KCN7XQGCWB48AS3pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=gNMWI7Ho
Subject: Re: [Buildroot] [PATCH v2 0/4] add cve-check script
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



On 19/11/2025 22:34, Thomas Perale via buildroot wrote:
> Enriches the input CycloneDX SBOM with vulnerability information and
> analysis from the NVD database.
> 
> The NVD database is cloned using a mirror of it and the content is compared
> locally. By default the path 'dl/buildroot-nvd' is used.
> 
> Example usage to analyse vulnerabilities of an input CycloneDX SBOM:
> 
> $ make show-info | utils/generate-cyclonedx | support/script/cve-check
> 
> The 'cve-check' can also be used to only enrich the vulnerabilities
> present on the input SBOM with a set metadata (description, cvss,
> references, ...) without applying an analysis.
> 
> With the following command the vulnerabilities ignored by Buildroot
> present in the CycloneDX SBOM are enriched with description, cvss, etc
> ...
> 
> $ make show-info | utils/generate-cyclonedx | support/script/cve-check --enrich-only
> 
> v1 --> v2:
>      - Add support for only enriching the current content of the SBOM
>        without analysis.
>      - Improve the CVE to CycloneDX matching of metadata.
> 
> Thomas Perale (4):
>    support/scripts/cve.py: don't call download_nvd
>    support/scripts/cve-check: add cve-check script
>    DEVELOPERS: add Thomas Perale to cve-check & cve.py
>    docs/manual: add information on CycloneDX

  Applied series to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> 
>   DEVELOPERS                    |   2 +
>   docs/manual/common-usage.adoc |  27 +++
>   support/scripts/cve-check     | 323 ++++++++++++++++++++++++++++++++++
>   support/scripts/cve.py        |  29 ++-
>   support/scripts/pkg-stats     |   2 +
>   5 files changed, 381 insertions(+), 2 deletions(-)
>   create mode 100755 support/scripts/cve-check
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
