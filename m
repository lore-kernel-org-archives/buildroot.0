Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32713C8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06F5E60D9C;
	Thu, 28 Aug 2025 13:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wbx-Mg6CeJ4W; Thu, 28 Aug 2025 13:19:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D71560E07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D71560E07;
	Thu, 28 Aug 2025 13:19:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 792011B0
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68E1080C44
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5CJ3r4VqFs7 for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:19:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D5B880BD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D5B880BD7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D5B880BD7
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:19:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1D44DB978315; Thu, 28 Aug 2025 15:19:22 +0200 (CEST)
Message-ID: <f92012bf-e8f8-44c1-a0df-7cd0ba0fcb8c@rnout.be>
Date: Thu, 28 Aug 2025 15:19:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Danilo Bargen <mail@dbrgn.ch>
References: <20250819100858.3317240-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250819100858.3317240-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756387162; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=qmT3EMgMenqOvu0mHHUrbFtJwGaM1jA/yFKoMvjb7cM=;
 b=lWAdqaM8GI9D15o6Yxl6CQqNAEOPsTMu8bvMhvfZpx8WuUTxBq+W+nPr1yn8PsVLB0wHnz
 XZttKPQ/6Xyn/M6tfRQ/2UrEzTdhPjEfLMYcDggrpJc+ja06z/PWwi4zagdppDKefi77Id
 xUvmVyj0NV5gIe1yAVcpxqEo0plhu43Uto127nABDMdbzyrnWb+CiWAG7rKtZCeHvsrpZ3
 n3kLh4lTpxqfN6Ax3TWX/tK+IxhTJQGeAAR2pR+27YoAOmD2/uNutYPvNMSdv3hLwPx2kf
 y3DtCkQDggmSK8C4+jyu8IOx0PhPvf2QcJgwK0mfdCavLSCbX9A6JcfEVv6puQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=lWAdqaM8
Subject: Re: [Buildroot] [PATCH] configs/pcengines_apu2: remove defconfig,
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



On 19/08/2025 12:08, Thomas Petazzoni via buildroot wrote:
> This defconfig no longer builds:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274139
> 
> It is using the unmaintained, not even LTS 5.16 kernel, which no
> longer builds with recent toolchains.
> 
> It has been broken for at least 2 months:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dpcengines_apu2&kind=BUILD
> 
> Unless a fix is provided, this defconfig will be removed.
> 
> Fixes:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274139
> 
> Cc: Danilo Bargen <mail@dbrgn.ch>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
