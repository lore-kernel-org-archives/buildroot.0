Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD9CD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6AE5822D4;
	Wed,  7 Jan 2026 17:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 09W2EsXBoPh8; Wed,  7 Jan 2026 17:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB95F81DFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808757;
	bh=FGXw+IFKdZgvfmjy8yNl07dHC8/xWLQ4u/joov0jdlU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ptrnubtbADCQRtpARc25ymlPnR30uVAxy4AEFEd1bH+oHrqA4ooNRHQCk2jvirFHE
	 OkkBDgUab66WHMJB1F4Ff4IG73K8zUsoyww79p4ygZly+rxmdfDIDdLa2zo6Z0G1KP
	 MPJANn9a3ORwUnygiJAOS2B1f3uDKMuzvL+eXpGuXXQ35SNXlrEbcubpNsy6Fk6oBA
	 NqJAtI/mLwhWr6JcJP9BI9kzHUZ50B/fermM5Xkh86ZB2HyXbP8eju+3CQLsouieTg
	 pll0r+g78MWZhDbOmWpa5YP/rhaHv5uf/vV5nfj4rRFJm/8URxayI13WYMJ8KYQ7X/
	 7K79T23ifLrBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB95F81DFF;
	Wed,  7 Jan 2026 17:59:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 97B749ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A03A40160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsYCPW6wFphn for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:59:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 839AA40128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 839AA40128
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 839AA40128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:59:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 90784B97A596; Wed,  7 Jan 2026 18:59:13 +0100 (CET)
Message-ID: <fd020170-5706-4507-b96c-10a0d419975d@rnout.be>
Date: Wed, 7 Jan 2026 18:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20250825215924.480927-1-giulio.benetti@benettiengineering.com>
 <20250825215924.480927-2-giulio.benetti@benettiengineering.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250825215924.480927-2-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808753; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=eJOq9CxBDyG41VJ7LdG0+lM1IBZ3ZNC+5nsh40HmgVQ=;
 b=GTy/GjM9RDa8wJZ9AuNK8Wrc9MSnQTYUmvC10yfDb+jBrn+9k9tNyxFOnNCndevgnyaAKS
 bHTx4Yx3iprhocs6zMqc+8ifhAhyLgTDUGZBQVKQBwEQdkCTze4c+LZLQ/TBUgxxW4zS4Z
 GSxqbfR119hdOvBla5Vaf0FxB7wcVo3MXHG6vVGYEf/eeDC7cJqQ99JttH+uBj2d4QF4ae
 atX24nWy0qExL3qI185jbz41+BVHI+v4BflmwDYxLaB/7rGeOhKNeR0zBikqyro0y2e582
 ZyfOP6msl6/n9jV9/LoucDNXS7+35uq5qMlzszMWOh7iSm0+pXRrmwoQjxtmZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=GTy/GjM9
Subject: Re: [Buildroot] [for-next] package/cryptsetup: bump version to 2.8.1
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



On 25/08/2025 23:59, Giulio Benetti wrote:
> For release note, see:
> https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.1/docs/v2.8.1-ReleaseNotes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x. Thanks

> ---
>   package/cryptsetup/cryptsetup.hash | 2 +-
>   package/cryptsetup/cryptsetup.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
> index f456451765..bd165f2356 100644
> --- a/package/cryptsetup/cryptsetup.hash
> +++ b/package/cryptsetup/cryptsetup.hash
> @@ -1,5 +1,5 @@
>   # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
> -sha256  cc9e2d37c25a871cea37520b28d532207b0c1670fb10fc54d68071f63f5243a2  cryptsetup-2.8.0.tar.xz
> +sha256  2c3379eb76597dcab50911449b013e2697c4bffcc716dbbf0d9b0e8fbbb46fb4  cryptsetup-2.8.1.tar.xz
>   sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
>   sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 6d2536957d..ebe9c865b3 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   CRYPTSETUP_VERSION_MAJOR = 2.8
> -CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).0
> +CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).1
>   CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
>   CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
>   CRYPTSETUP_DEPENDENCIES = \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
