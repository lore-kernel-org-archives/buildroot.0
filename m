Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1697C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A3E683CF8;
	Fri, 16 May 2025 10:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Z4gy5rS8ImR; Fri, 16 May 2025 10:41:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AE4683CE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AE4683CE1;
	Fri, 16 May 2025 10:41:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 43CA813D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27203417E8
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QLK8aOQcGYiX for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:41:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 347CA407E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 347CA407E6
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 347CA407E6
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:41:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C68201C10FD; Fri, 16 May 2025 12:41:27 +0200 (CEST)
Message-ID: <1e53f695-653e-4506-82fe-3ed97d468b46@rnout.be>
Date: Fri, 16 May 2025 12:41:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lance Fredrickson <lancethepants@gmail.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250415141711.1940219-1-lancethepants@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250415141711.1940219-1-lancethepants@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392088; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GvNq/ulFXPPf40xeeR9cem00XF503BThFB0hw1oaafA=;
 b=E1VVko3uFOwtli4FtxhZ00rl3vmijQtvHOSrq5pkPTh34pkTViZK7xyUwj5oFflg9BlZXt
 Fff10DlWVfJplQll7QR9yVxivxvID9F4fRqK6GDzJGeuSLkiF64MLW/RqM262Sq/DNg8Z0
 vNLYHtTz6KVTLYuz9fcoZgko8bVChvjHn5vFyTLX1lyjj7cR/hsu8f5aLN3eQV5rpaR/8A
 J9kyd/otOFhtqi77cn9DLZnzMn+/76ajNHNjoN/5chKALFbxZdnMxwyf7Yhkae+nCzsUTj
 FWc58QIm8fAEVl8Mw7Vm+FuO+a6MYP0GvVO0/dJ8fH2DgGlCfSpxr5Gqyo9Byg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=E1VVko3u
Subject: Re: [Buildroot] [PATCH] package/dnsmasq: bump version to 2.91
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



On 15/04/2025 16:17, Lance Fredrickson wrote:
> From: Lance Fredrickson <lancethepants@gmail.com>
> 
> Changelog: https://thekelleys.org.uk/dnsmasq/CHANGELOG
> 
> Release notes:
> https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2025q1/018079.html
> 
> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/dnsmasq/dnsmasq.hash | 4 ++--
>   package/dnsmasq/dnsmasq.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
> index d11e8af590..212774cd10 100644
> --- a/package/dnsmasq/dnsmasq.hash
> +++ b/package/dnsmasq/dnsmasq.hash
> @@ -1,6 +1,6 @@
>   # Locally calculated after checking pgp signature
> -# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.90.tar.xz.asc
> -sha256  8e50309bd837bfec9649a812e066c09b6988b73d749b7d293c06c57d46a109e4  dnsmasq-2.90.tar.xz
> +# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.91.tar.xz.asc
> +sha256  f622682848b33677adb2b6ad08264618a2ae0a01da486a93fd8cd91186b3d153  dnsmasq-2.91.tar.xz
>   # Locally calculated
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
> diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
> index 5dd7ed5c21..abeee36ce4 100644
> --- a/package/dnsmasq/dnsmasq.mk
> +++ b/package/dnsmasq/dnsmasq.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DNSMASQ_VERSION = 2.90
> +DNSMASQ_VERSION = 2.91
>   DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
>   DNSMASQ_SITE = https://thekelleys.org.uk/dnsmasq
>   DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
