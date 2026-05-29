Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F46CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 17:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D696884469;
	Fri, 29 May 2026 17:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7nLgy2ghbYMd; Fri, 29 May 2026 17:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 060458446A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780076910;
	bh=d7jonhMW7YUrAG8lw7UKplx4PjtxlH0AaLsVXYoS2Vo=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=HS/bftd4S8M8xfMXsIVsrKFhcAqat7VERRCZzP9kiH5/9nkSOeQULGR1VUbGs1msF
	 fIUjPfCUzrqqRgr5pq6KZhtEP4xl5ekmPa8ZANBZ0QZqG4+bEvKGJbIhYePAdJygge
	 rr7s4+ym7ZOCJhwkeEnMl7C4js+5PcETBW9U2diXsvV5Yo8TyoUkLulSMHTgU60tDr
	 9FFpCyNl1nJYofv6Xqv60jBM/L22xDHX3j2ZvQmkK824lIuqPJPirCVo0TH314lJM2
	 6k6NWd0NRnO5z7HWWCnUFfKejreXCM9+z0/Y5MEvyBN4sjUsc1APQ87nCu2gy+gck9
	 40GQQBybSUlhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 060458446A;
	Fri, 29 May 2026 17:48:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96BDCD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8572D8446B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCJGLKIEb3Jq for <buildroot@buildroot.org>;
 Fri, 29 May 2026 17:48:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7079C84469
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7079C84469
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7079C84469
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:48:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 13731B97C44C; Fri, 29 May 2026 19:48:22 +0200 (CEST)
Message-ID: <194ccb18-9d29-4851-9aeb-55b0cb6eb213@rnout.be>
Date: Fri, 29 May 2026 19:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20260519065710.324849-1-neal.frager@amd.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260519065710.324849-1-neal.frager@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780076905; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=neH5iqk7MkrURPN9DZsEBsWIsSYZs4tyAEs/HRo8pjM=;
 b=A1/jv4nRd6PGZTHiqZnrB7tjav02jnSH5avHsPTSrEPykWDY+zrRfUjcHYEX5J7k+cLFtz
 VnyqloqbCWDNUGa1auZjjnhc5aqEksGpE4viTD3XhYBK2u4SFHbe/Otd5MSulqGbT+j4lC
 llhYN2SHC/pH1nWKBhqfX7pfKvEWlYajK/jzW65GOSKShhuMBDcc2KjPBPy+O714jwKgX7
 5CQbaj7HzbSI95G++7wwKrbJ0xMVLkwDqRPYHIoH8eU1uC7dbwiE74jhI9JLLIfGiZXOO8
 oIIzyeIkI4bK1+FSMV77iWAQ8rhzyKhP2m2qey1G6dgiR1ZTKApMMeSDPFK4Fg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=A1/jv4nR
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc-bare-metal: bump to gcc
 16.1.0
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/05/2026 08:57, Neal Frager wrote:
> Bump gcc-bare-metal to gcc 16.1.0.
> 
> See here for changes:
> https://gcc.gnu.org/gcc-16/changes.html
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

  We'll have to take care with applying this, because I just applied a commit 
that introduces a patch [1] that has to be reverted. And I can't apply this 
commit to master because it should go to next.

  Regards,
  Arnout

[1] 
https://gitlab.com/buildroot.org/buildroot/-/commit/4234bc46d0d955691cab27e925706c42c10ac590


> ---
>   package/gcc-bare-metal/gcc-bare-metal.hash | 2 +-
>   package/gcc-bare-metal/gcc-bare-metal.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-metal/gcc-bare-metal.hash
> index 19678dec30..6104962a22 100644
> --- a/package/gcc-bare-metal/gcc-bare-metal.hash
> +++ b/package/gcc-bare-metal/gcc-bare-metal.hash
> @@ -1,5 +1,5 @@
>   # From https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum
> -sha512  89047a2e07bd9da265b507b516ed3635adb17491c7f4f67cf090f0bd5b3fc7f2ee6e4cc4008beef7ca884b6b71dffe2bb652b21f01a702e17b468cca2d10b2de  gcc-15.2.0.tar.xz
> +sha512  b3454958891ab47e1e5b6cb9396c0ad3b04f32fe2a7bf1153a143f21013fdb6b295ca94c98964698a688e4c1d7555ffd8ffbc20187507cce6b1c32cbcc09897a  gcc-16.1.0.tar.xz
>   
>   # Locally calculated
>   sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
> diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
> index 6c2c8a5e26..d4f011c2fa 100644
> --- a/package/gcc-bare-metal/gcc-bare-metal.mk
> +++ b/package/gcc-bare-metal/gcc-bare-metal.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GCC_BARE_METAL_VERSION = 15.2.0
> +GCC_BARE_METAL_VERSION = 16.1.0
>   GCC_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BARE_METAL_VERSION)
>   GCC_BARE_METAL_SOURCE = gcc-$(GCC_BARE_METAL_VERSION).tar.xz
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
