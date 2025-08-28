Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B01C8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40E6540E2D;
	Thu, 28 Aug 2025 13:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCfgDA3sfyUt; Thu, 28 Aug 2025 13:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74CED40E39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74CED40E39;
	Thu, 28 Aug 2025 13:19:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 232DF1B0
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 099B440CEF
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blunDzm0gYEt for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:19:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C61F40E2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C61F40E2D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C61F40E2D
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:19:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 399D0B9783E0; Thu, 28 Aug 2025 15:19:41 +0200 (CEST)
Message-ID: <53e2b08c-aa88-460c-be09-2e9a74a4c5c2@rnout.be>
Date: Thu, 28 Aug 2025 15:19:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Jagan Teki <jagan@amarulasolutions.com>
References: <20250819101128.3318447-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250819101128.3318447-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756387181; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=ePDu9+QUmngS5yR1xgAUpFUtPkB+qSxFGdxooJFvSy8=;
 b=XLbb4QuEQYgbBpoV4i/J8gC4woRXS3j8cUIYcu6zleg/QjfbCmd7s1APodIFKt+/KFQ8ev
 mHZP61We9plFOmgw2Mb3228dfEW4dxkqXqt55NfaqYXu0vuzeoP2El2bYYZg2KbA0P+tRI
 VSxJp1ny5ksv/SGaypNu8gx+UOy1r3DxzUi3HJ9ASvVYP2t4PwaodIJ1AQuM8corjSpdv2
 jVOGbTmZ/1QLVXFv9ShuPnp6acd6iUfOZpzZn8bOpWfenSx8PddF1aSYESDffW+yT2eTu9
 g4Tm7aTYZkkMy1gjC08+SQCt9DDBnTmA9Bc0QGZSO6MHwZhFCLwdv7HqhWIcKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XLbb4QuE
Subject: Re: [Buildroot] [PATCH] configs/pine64_sopine: remove defconfig,
 broken
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



On 19/08/2025 12:11, Thomas Petazzoni via buildroot wrote:
> This defconfig no longer builds:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274147
> 
> It has been broken for at least 2 months:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dpine64_sopine&kind=BUILD
> 
> Unless a fix is provided, this defconfig will be removed.
> 
> Fixes:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274147
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
