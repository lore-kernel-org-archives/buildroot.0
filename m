Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5B3CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61CB240830;
	Mon,  1 Jun 2026 20:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjK2jqgQKaGB; Mon,  1 Jun 2026 20:14:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91BCD40832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780344861;
	bh=uLDnLf4cCaZ0u0yIj3zBi/OTgH1Vw9UeHC6jnZazTu8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Cv+b5AIGXDx7fD+QPo8vpd/RXpxeMnnVk0D+X7I4PIWsGDuCjN4hSipojcWOtTXnE
	 VPGlToyJcYSldlNEJOtAI5X2SbxM/29PcXoz8s3MU7DJfwo3MDRa1raEoAhnV1JYcO
	 CAtYxJ609dKzXfgKjo6FcHFF6iWCehIVMvhnPKOK+cLdbjU82E3CJ17wyFNzoulqI9
	 INEpXDG9hrA+NRchirtg8wPj7cJdv+xXPY2xUzILAcq1iACFsPuF0PClIQQKrcdz9w
	 S1D6pK5Fs8iHXgP313g09Mdxb7HOYJ46FX5/Kcny+qmNX6eG0WJ3XPm8frQgo70z/6
	 UzKyRQ8IcEVjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91BCD40832;
	Mon,  1 Jun 2026 20:14:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE3EE223
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFF1B400E3
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGJmy640lesv for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:14:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D13C84015A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D13C84015A
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D13C84015A
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:14:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BA4DAB97C77D; Mon,  1 Jun 2026 22:14:16 +0200 (CEST)
Message-ID: <9ea745ce-e911-4bef-b37b-c7b6585091e6@rnout.be>
Date: Mon, 1 Jun 2026 22:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Guillaume Chaye <guillaume.chaye@zeetim.com>
References: <20260531143820.2967481-1-bernd@kuhls.net>
 <20260531143820.2967481-3-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260531143820.2967481-3-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780344857; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=/X78hVMpZPai2Ke+J5+iCeqHTYryoOUgw7FwqXl48KY=;
 b=pCU6l2eU6Z0+69cD9Mjz/P3PuoS6CEQgkCPfWbUDS0JISrrnsSHJIGNYD1mFU2DZqaS7X8
 nQg6IUOWujaNbSBDRhTX5MGa1uBH7+pD5KRRCPK2XtUC3eXxXaMuVSW8j03R4IdtMfhZzZ
 o7hQZh5bw4UBmnPIe2ycNV5CjaKWrexh35koZHQY8JeFWHLfgM3TOSdMVb3MYtRjDVxWtk
 l1cB5moP6pwLX2cC6moq1rVKE0nuFkcwGKy8ceu/00vFXnJAJhFQuBJZYECS7vPCB4Dmfg
 nIpGNYYgIhh44ArFTg98/iiORczI3WKEMJ5VzwI6gC3o3Rj8lo4nuETzfE1/6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=pCU6l2eU
Subject: Re: [Buildroot] [PATCH/next 3/3] package/sane-airscan: bump version
 to 0.99.37
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



On 31/05/2026 16:38, Bernd Kuhls wrote:
> https://github.com/alexpevzner/sane-airscan/compare/0.99.36...0.99.37
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/b9ecba89b8b149586c1033c8fab1244fa14c747a
> 
>   package/sane-airscan/sane-airscan.hash | 2 +-
>   package/sane-airscan/sane-airscan.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sane-airscan/sane-airscan.hash b/package/sane-airscan/sane-airscan.hash
> index affd7031d5..e1faa08195 100644
> --- a/package/sane-airscan/sane-airscan.hash
> +++ b/package/sane-airscan/sane-airscan.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  43d3436c0199496ee18aca4f875fe3926a40a0fae781bc280cdb96f7b5068ac0  sane-airscan-0.99.36.tar.gz
> +sha256  b012d4ca8b526e28b0baf1e0dcc1504a1f67118914ee9362201d04a37dbf7e5f  sane-airscan-0.99.37.tar.gz
>   sha256  a2631c1b81992bd6f66db6be8b009ed7e3e998d1e2db4de497fa82d65011d373  LICENSE
> diff --git a/package/sane-airscan/sane-airscan.mk b/package/sane-airscan/sane-airscan.mk
> index 46948ab547..911761317e 100644
> --- a/package/sane-airscan/sane-airscan.mk
> +++ b/package/sane-airscan/sane-airscan.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SANE_AIRSCAN_VERSION = 0.99.36
> +SANE_AIRSCAN_VERSION = 0.99.37
>   SANE_AIRSCAN_SITE = $(call github,alexpevzner,sane-airscan,$(SANE_AIRSCAN_VERSION))
>   SANE_AIRSCAN_DEPENDENCIES = avahi gnutls jpeg libpng libxml2 sane-backends tiff
>   SANE_AIRSCAN_LICENSE = GPL-2.0+-with-exception

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
