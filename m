Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C997ACEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A410F40926;
	Mon, 17 Nov 2025 20:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ht_tYYCA55c2; Mon, 17 Nov 2025 20:06:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF76B4092A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF76B4092A;
	Mon, 17 Nov 2025 20:06:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68AEE158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A5A24091F
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-1mqdwv40YH for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:06:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A6204090E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A6204090E
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A6204090E
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:06:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 78780B979430; Mon, 17 Nov 2025 21:06:46 +0100 (CET)
Message-ID: <1fa2c2f4-bee3-4117-9694-91a6fdd93064@rnout.be>
Date: Mon, 17 Nov 2025 21:06:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20251112210641.161073-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251112210641.161073-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763410006; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=XvZKx1I7gNM0+SqYFX/8RGLYLx2hLyewTnDjKf8KyBs=;
 b=B1P5vCVjcQNRrQdH+DH74TI0MVgtxaRkTFbamNgWI/YEU9uY9Fx1j9fcDM0vHTN8imiiv/
 OpfBNaPq3tot7VzrKvTZ6GGVP85GbDsfdY42Bsv1Kanf+XJoJ/Wg2iPI9swwl3PNzcp3a9
 eeau0EnCstYZeNuFj3RuXJsT40WiCcS+hmu/0Kj/B9GX85JmPS/tGuXpxsKKI1Rm0IY+3y
 1kWhiQrR2zYQiB9vt8Lx/YEbqANa7Y+k7DdATRqJqJ3RS0hFngEfcwL+OjWc8E/jvT8ClJ
 EbWP/z6c6PDVWJSXvjCgEWCFMGtYVZP7zbHNBOYDlkrH1E7IoKKIzvvOknsEGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=B1P5vCVj
Subject: Re: [Buildroot] [PATCH] package/tpm2-tss: security bump to v3.2.3
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



On 12/11/2025 22:06, Thomas Perale via buildroot wrote:
> For more information about the release, see:
>   - https://github.com/tpm2-software/tpm2-tss/releases/tag/3.2.3
> 
> Fixes the following vulnerability:
> 
> - CVE-2024-29040
> 
> The JSON Quote Info returned by Fapi_Quote has to be deserialized by
> Fapi_VerifyQuote to the TPM Structure `TPMS_ATTEST`. For the field
> `TPM2_GENERATED magic` of this structure any number can be used in the
> JSON structure. The verifier can receive a state which does not
> represent the actual, possibly malicious state of the device under test.
> The malicious device might get access to data it shouldn't, or can use
> services it shouldn't be able to.
> 
> For more information, see:
>    - https://nvd.nist.gov/vuln/detail/cve-2024-29040
>    - https://github.com/tpm2-software/tpm2-tss/security/advisories/GHSA-837m-jw3m-h9p6
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/tpm2-tss/tpm2-tss.hash | 2 +-
>   package/tpm2-tss/tpm2-tss.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
> index c9fa4e6ae0..d8730ba0e1 100644
> --- a/package/tpm2-tss/tpm2-tss.hash
> +++ b/package/tpm2-tss/tpm2-tss.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  ba9e52117f254f357ff502e7d60fce652b3bfb26327d236bbf5ab634235e40f1  tpm2-tss-3.2.2.tar.gz
> +sha256  6279a9a1983ea6ffe41925067b7f0de3a6ed95020a30e7c97d80fa2754259534  tpm2-tss-3.2.3.tar.gz
>   sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
> diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
> index 81a1a0e59b..095b57baea 100644
> --- a/package/tpm2-tss/tpm2-tss.mk
> +++ b/package/tpm2-tss/tpm2-tss.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TPM2_TSS_VERSION = 3.2.2
> +TPM2_TSS_VERSION = 3.2.3
>   TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
>   TPM2_TSS_LICENSE = BSD-2-Clause
>   TPM2_TSS_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
