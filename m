Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C7DCCF2D4
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B57B60D68;
	Mon, 19 Jan 2026 09:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bnfF591phDE; Mon, 19 Jan 2026 09:51:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70EF360D6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816310;
	bh=lJC9KyzoBjU/y5Q/wRl7eIaaYNfbO8vcbCZXq5/bDjs=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ZkrpivJd9F6u9VO1vIsRNxecBavXOGuNsbI7H0O7jBG0Fk0q/qqEDD4iwPshw4zyO
	 0NHsAiKhrpnPVyoh54d8HLDCwAA9OjkAjFga1GYQc/kVtuPmfzQSVMtCg6wc/UDQTv
	 HqmYUOSlmMYp4IqcT67ZhWA1RNes/UdXgPx1V7lQkAcIWXHPdKkhiAZPsgsKsouwmT
	 NHtrPZgNKkC0+byLFJFvVpBO1VwQuAZkhguoDe8eEVwGzmEsPmE9uuemt802jEjtAl
	 oeMMYz4+324y+BbOKgmtBpDQbKCsGBQqdPzJ03S441qogSEU7Vu67NG9fuxa/alI+/
	 Zsk5U7umK+Blg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70EF360D6C;
	Mon, 19 Jan 2026 09:51:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E32E2CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BFB081B01
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kDz0XXRDNHNh for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:51:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E39281AF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E39281AF5
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E39281AF5
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:51:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB4ECB97A291; Mon, 19 Jan 2026 10:51:44 +0100 (CET)
Message-ID: <04a93c7c-e86d-444d-9f6f-f7d946113d61@rnout.be>
Date: Mon, 19 Jan 2026 10:51:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20260103200229.246015-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260103200229.246015-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768816305; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=1rWUbGJyktZRaiwi1jwwSfeYp7mhKsMZeOH0ppuWuCc=;
 b=euR9BGtioYi72QotYtabGmuZpnYjeaAdYEv/rJ2m+U0xPOcVm9/npWhQOZ9GPz8i1kjgQn
 OaXWnuuaiJ1DbaiED4icVWdLA8xc5mTlIvKUD1oPaG5f3JAAZGmHOgm1pfnCS4ec+9UQSX
 wEHxIuLcClYy1TtJ+891O5+RJngmk9dmP9I6qT9Mow5f4WiB5BCgPghIM9rn04ln05ovlN
 V2LnJa9QjiJJpWhT7hDAFog3OBMtWYYDzF/1pWcH11/Dxbsmp6aAgV8r4OoCwX6zz7R80X
 Y1RoDhnQZ9y1d6ODz0YTAKkgMLo3/uUaWXtSc/soqznIlu8kOyxkRmE4+BbCQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=euR9BGti
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: bump to version 2.4.9
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



On 03/01/2026 21:02, Julien Olivain via buildroot wrote:
> For release note, see:
> https://dev.gnupg.org/T8001
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  As noted by Thomas Petazzoni, it's this one that got applied to 2025.02.x and 
2025.11.x, not the 2.5.16 bump. Sorry for the noise.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/12595598071
> ---
>   package/gnupg2/gnupg2.hash | 4 ++--
>   package/gnupg2/gnupg2.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
> index 01060f897b..ee37e6a3af 100644
> --- a/package/gnupg2/gnupg2.hash
> +++ b/package/gnupg2/gnupg2.hash
> @@ -1,5 +1,5 @@
>   # From https://www.gnupg.org/download/integrity_check.html
> -sha1  c704085aa7cc131a67edd0b7c0c90e5c35ee4adb  gnupg-2.4.8.tar.bz2
> -sha256  b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616  gnupg-2.4.8.tar.bz2
> +sha1  d4b76a8de78631b64b8c6f3725ed28dede40bdb4  gnupg-2.4.9.tar.bz2
> +sha256  dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb4176fd8b302964  gnupg-2.4.9.tar.bz2
>   # Locally calculated
>   sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index debf15ef63..d083ea850a 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GNUPG2_VERSION = 2.4.8
> +GNUPG2_VERSION = 2.4.9
>   GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
>   GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
>   GNUPG2_LICENSE = GPL-3.0+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
