Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1214CA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C36DE60733;
	Thu, 28 Aug 2025 13:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XfNo2XGwRizV; Thu, 28 Aug 2025 13:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07CC860DEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07CC860DEC;
	Thu, 28 Aug 2025 13:18:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF92FB8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D186B40CE8
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zv399gqE2AWi for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:18:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A91D40CC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A91D40CC3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A91D40CC3
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:18:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5E480B9783E0; Thu, 28 Aug 2025 15:18:03 +0200 (CEST)
Message-ID: <c5430128-a2da-413c-b871-028fb337abb1@rnout.be>
Date: Thu, 28 Aug 2025 15:18:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Pierre Crokaert <pct@crookies.net>
References: <20250819075241.3286980-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250819075241.3286980-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756387084; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=mipcjHFn8R5P+T6YFJXbwh0r+eYmFtSZTibS6CbNyGA=;
 b=jN9zOX/pJ4hqizxodoNbhtXVCmzewzxomm9t/Nou7z9R0jzXwo8ekaNP8S31/nAkqX4iMA
 BHXFk8oCPgc/SqATfp5SoSwYaC/CzRoaLsQsRCjC2fMqzhJXfb/9wWRh3wpyropSr//LWV
 tA2ZNiygZQ5tNRI1zltW+8AG/cOzQIvTsy8r2JxouHwtE6+bE70vbMvRV9JCwP8kOevfyg
 /oHaPY+eyEn8fFkzaw9hScZRoIeZrH392cqAG2cEjhMN3+rlWZgiyOlW3YQKIQeQLNNN52
 tf1+KGZyeVWUTlj2t77jVTAKd15lQ5tEWRJpYHBjVbf41eb4xmJg59zlUkY5TA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=jN9zOX/p
Subject: Re: [Buildroot] [PATCH] configs/odroidxu4: remove defconfig, broken
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



On 19/08/2025 09:52, Thomas Petazzoni via buildroot wrote:
> This defconfig no longer builds:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273936
> 
> It has been broken for over 2 months:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dodroidxu4&kind=BUILD
> 
> Most likely the U-Boot version used is no longer compatible with
> recent toolchains.
> 
> Unless a fix is provided, this defconfig will be removed.
> 
> Cc: Pierre Crokaert <pct@crookies.net>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
