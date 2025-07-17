Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FB6C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C5AC81780;
	Thu, 17 Jul 2025 20:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKq-W1s-lsdi; Thu, 17 Jul 2025 20:10:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26E008145D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26E008145D;
	Thu, 17 Jul 2025 20:10:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6B2F226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DBBB40E75
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtyGs9Wq-Xsv for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:10:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 455C240A09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 455C240A09
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 455C240A09
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:10:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 92EFEB977A8D; Thu, 17 Jul 2025 22:10:02 +0200 (CEST)
Message-ID: <28b52e5d-417f-4559-9e19-fda72779ef9c@rnout.be>
Date: Thu, 17 Jul 2025 22:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250607170936.1502446-1-fiona.klute@gmx.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250607170936.1502446-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752783003; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=PpVBz8I+vXwSk/vYeErxs9Gw9LPmd0ROayUs991adK8=;
 b=CLyQXgXTcz4exrEV/NRe7o5aidkH9Oh82D0U47ZZ59xQikp0GZqO4xgiiro4K4fCjJ8v2k
 2JuevkOpQxVuE6BSgpVpSzyrs5IqSq94AAtPLMD1atRPizsaUTgvH4kORnXNVrjkPUCVqH
 xogfmlsZ6aRg9E5OJKwYTz+VRZunlk1gsCW7vhieaqb7mq4m5/aId2I6nd15YBHgaT3AZC
 TJ/4eFRUXvc8zfDNEwGUDim4e/HCpUHLoP3m+J30SJtflnICQ3dslFMqY8y+jhvjM0G1pA
 GJQDjbpW8vBwXY21Iu4NbEPbEp69j+rCcZ9WT04PXJriDYEAQdQrdnqcy794qA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=CLyQXgXT
Subject: Re: [Buildroot] [PATCH 1/3] package/eudev: remove obsolete
 --disable-introspection configure flag
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



On 07/06/2025 19:09, Fiona Klute via buildroot wrote:
> It was removed from eudev with version 1.5.1, when introspection
> became part of the gudev option [1]. This has in turn been removed and
> replaced by package/libgudev, yet somehow the flag stayed. Remove it
> to remove a warning during configure stage.
> 
> [1] https://github.com/eudev-project/eudev/commit/d5d6a7f3040992f853eb23eb1bafac3b77891c2d
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

  Applied to 2025.02.x and 2025.05.x, thanks. Nice that this was a separate 
patch because the other two aren't cherry picked.

  Regards,
  Arnout

> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>   package/eudev/eudev.mk | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index 8318bc1ed4..99c9f0dcab 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -14,7 +14,6 @@ EUDEV_CONF_OPTS = \
>   	--disable-manpages \
>   	--sbindir=/sbin \
>   	--libexecdir=/lib \
> -	--disable-introspection \
>   	--enable-kmod \
>   	--enable-blkid
>   
> @@ -71,7 +70,6 @@ HOST_EUDEV_CONF_OPTS = \
>   	--with-rootlibdir=/lib \
>   	--sysconfdir=/etc \
>   	--disable-blkid \
> -	--disable-introspection \
>   	--disable-kmod \
>   	--disable-manpages \
>   	--disable-rule-generator \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
