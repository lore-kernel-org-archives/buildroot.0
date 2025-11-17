Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C93CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 165D04059F;
	Mon, 17 Nov 2025 19:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 693-KxdAjb0M; Mon, 17 Nov 2025 19:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 373EA403C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 373EA403C3;
	Mon, 17 Nov 2025 19:54:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA478158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B78760ECB
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0RgwINV5eKtX for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:54:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72E9760EB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72E9760EB2
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72E9760EB2
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:54:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3A5ADB9796C0; Mon, 17 Nov 2025 20:54:20 +0100 (CET)
Message-ID: <b74f6de3-558d-485e-803d-65c2806896e6@rnout.be>
Date: Mon, 17 Nov 2025 20:54:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20251027210710.15290-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251027210710.15290-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409260; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=hDpsloeCc/rvf4XPYc3sOHh4y4cb0jEkvSpvNhQx90k=;
 b=IJckIM674h55YwhEdYgoI19FD537QNyE7aDWn+qYmmYprAN7pDyebUI5tLm1MIffS8Tyl7
 +raWTZYp64it6xfpftFKna51f3u7Gq1dIFAXDUFnGMom7MjsrY9ZRQxdecs4dgbBe7iB7r
 BNsxYThcfLvNDotqVPmkm2e0GRKg4piC46W14VF1EkP3cn4bsyilhuWMyXXJ5e+JmrfIWO
 HWA+YD1M2Stxxmiwwv9y4bu6hFW/kWLX5WK30X5e6eMHhL758iagWJeJs8bU1jIx2bRnJJ
 zrBkTpsf0sZKs5Pb3utuApbLTOwIxE+f7+c7dfT6L/cxbB4PjGT4KuoLoPPUog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=IJckIM67
Subject: Re: [Buildroot] [PATCH] package/mbedtls: security bump to v3.6.5
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



On 27/10/2025 22:07, Thomas Perale via buildroot wrote:
> For more details on the version bump, see:
>   - https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.5
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2025-54764
> 
>      Mbed TLS before 3.6.5 allows a local timing attack against certain
>      RSA operations, and direct calls to mbedtls_mpi_mod_inv or
>      mbedtls_mpi_gcd.
> 
> For more information, see:
>    - https://nvd.nist.gov/vuln/detail/CVE-2025-54764
>    - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2025-10-ssbleed-mstep/
> 
> - CVE-2025-59438
> 
>      Mbed TLS through 3.6.4 has an Observable Timing Discrepancy.
> 
> For more information, see:
>    - https://nvd.nist.gov/vuln/detail/CVE-2025-59438
>    - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2025-10-invalid-padding-error/
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/mbedtls/mbedtls.hash | 4 ++--
>   package/mbedtls/mbedtls.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
> index 8b82313c07..b86c66af3e 100644
> --- a/package/mbedtls/mbedtls.hash
> +++ b/package/mbedtls/mbedtls.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.4:
> -sha256  ec35b18a6c593cf98c3e30db8b98ff93e8940a8c4e690e66b41dfc011d678110  mbedtls-3.6.4.tar.bz2
> +# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.5:
> +sha256  4a11f1777bb95bf4ad96721cac945a26e04bf19f57d905f241fe77ebeddf46d8  mbedtls-3.6.5.tar.bz2
>   # Locally calculated
>   sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
> diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> index b46bbe888a..c1aa9f0850 100644
> --- a/package/mbedtls/mbedtls.mk
> +++ b/package/mbedtls/mbedtls.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MBEDTLS_VERSION = 3.6.4
> +MBEDTLS_VERSION = 3.6.5
>   MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$(MBEDTLS_VERSION)
>   MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
>   MBEDTLS_CONF_OPTS = \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
