Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5237DC71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C470408E8;
	Thu, 12 Jun 2025 20:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecaUsZYkoy1N; Thu, 12 Jun 2025 20:27:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EBE3408E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EBE3408E5;
	Thu, 12 Jun 2025 20:27:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 26A0B183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D5B183ABE
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bEEzjgo7e2D for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:27:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4021183A9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4021183A9F
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4021183A9F
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:27:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E653F1C0D69; Thu, 12 Jun 2025 22:26:56 +0200 (CEST)
Message-ID: <256bdd8f-7748-4313-a4a7-d4b99e9fdcce@rnout.be>
Date: Thu, 12 Jun 2025 22:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20250607190703.2408025-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250607190703.2408025-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749760017; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wSyXJAZgdAyEj7fIetQw3ldyQHsdnp+e/v2C9vpwI+0=;
 b=FdMfsFpLmCB0nepLeNkXzvaC1UKA9SoaAzESQ2IYiqEvoqhBMwh9bWcfNdorgEcw+KczIS
 3pPzOypMrYS7TuLLGRxVUTnN8oGAKsKHxqfVW2u5WB07MkuhQTQt0mxPZzfZqGpOAuZhKZ
 4yKJkXDt4SnqvXuTCpbY81cIbJBXq0gBAMbwKRet+CHymlgnu120lqnfJ5o14jCi8YgaR0
 +NUxgPldpG25T2xZnKAPmhozI7dUcELWmO824HS1AYxv3TrW7HKririjbhJkuh3oxA1FD3
 i7wMZkGf1snbuOEVeBkuJy3AgXV2QsaI5ruZDPNiA3E0kAD5NixvphYuWB7tdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=FdMfsFpL
Subject: Re: [Buildroot] [PATCH] package/libcurl: fix build w/ threads +
 c-ares
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



On 07/06/2025 21:07, Peter Korsgaard via buildroot wrote:
> Fixes:
> https://autobuild.buildroot.net/results/680b825b93989e6aef247593c198094a6ed916f7/
> 
> Since curl 8.14.0 with commit d364f1347f05 ("configure: catch asking for
> double resolver without https-rr"), configure errors out when
> --enabled-threaded-resolver is used together with --enable-ares (unless the
> experimental HTTPS-RR support is enabled), so disable the threaded resolver
> when c-ares is enabled.
> 
> https://github.com/curl/curl/commit/d364f1347f05c53eea5d25a15b4ad8a62ecc85b8
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/libcurl/libcurl.mk | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 8501910ac5..5a3a668f06 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -36,7 +36,9 @@ LIBCURL_CONF_OPTS = \
>   # https://nvd.nist.gov/vuln/detail/CVE-2024-32928
>   LIBCURL_IGNORE_CVES += CVE-2024-32928
>   
> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +# threaded resolver cannot be used with c-ares
> +# https://github.com/curl/curl/commit/d364f1347f05c53eea5d25a15b4ad8a62ecc85b8
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES)),yx)
>   LIBCURL_CONF_OPTS += --enable-threaded-resolver
>   else
>   LIBCURL_CONF_OPTS += --disable-threaded-resolver

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
