Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E181C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22A394088A;
	Thu, 17 Jul 2025 20:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elIfkFUioWpB; Thu, 17 Jul 2025 20:21:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 624924087B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 624924087B;
	Thu, 17 Jul 2025 20:21:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DFB6C226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1BBD4076A
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEbF22Qg8AVu for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:21:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3452840876
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3452840876
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3452840876
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:21:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6D52FB977A8D; Thu, 17 Jul 2025 22:21:08 +0200 (CEST)
Message-ID: <19c42f1e-9432-44ad-9125-ca84e3a3ad21@rnout.be>
Date: Thu, 17 Jul 2025 22:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
Cc: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
References: <20250713125521.18543-1-fl@n621.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250713125521.18543-1-fl@n621.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752783670; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=SaoPuKPHhBVsSiL8uMDSOQ9Lvzlj+5wUXjdjbyqfTjE=;
 b=mYuapga1O/pyZLL4ej0mfIK7/eEJAvTJ+nyjJmERdfUczRptuhZS02t9dO4gUcVlszWHjS
 PRnF0DvD0XxOxb81xK3CmrKZzrEm4oAS3qcxn9qkyV77xKYoTSaOG6p2E81SZsuD+SAgRz
 jbdU34KB0H2zxNRnPgrqYw4Ty2/Lzck1PLAIJE40zGlyGSArvIa90dL/JneG5XxCHfkKm8
 lTfrXXyMrZu/rr429UAiWIoJjCiRx4o5X6lGRiXB0fsBijuBx0inBYtBsQ3zNr1YR/DsGl
 L65JuQkcnD3DtBz2Lg/Vgxa1vafZm4R34lbm8KrXO/Z7R0dnfzC3/G5JlKDj+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=mYuapga1
Subject: Re: [Buildroot] [PATCH 1/1] fs: erofs: reword "all-fragments"
 Kconfig text
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



On 13/07/2025 14:55, Florian Larysch wrote:
> Currently, both BR2_TARGET_ROOTFS_EROFS_ALL_FRAGMENTS and
> BR2_TARGET_ROOTFS_EROFS_FRAGMENTS have the same Kconfig prompt, making
> them hard to distinguish.
> 
> Reword the one for -Eall-fragments to be distinct.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

  Applied to 2025.02.x and 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   fs/erofs/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/erofs/Config.in b/fs/erofs/Config.in
> index 00f27faeeb..93c069f2c0 100644
> --- a/fs/erofs/Config.in
> +++ b/fs/erofs/Config.in
> @@ -109,7 +109,7 @@ config BR2_TARGET_ROOTFS_EROFS_FRAGMENTS
>   	  Introduced in Linux 6.1.
>   
>   config BR2_TARGET_ROOTFS_EROFS_ALL_FRAGMENTS
> -	bool "enable fragments packing"
> +	bool "enable all-fragments packing"
>   	help
>   	  Forcely record the whole files into a special inode for better
>   	  compression. Introduced in Linux 6.1.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
