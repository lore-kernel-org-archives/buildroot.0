Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E93C8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACA7940E33;
	Thu, 28 Aug 2025 13:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M8kKYyLFOWyL; Thu, 28 Aug 2025 13:19:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD7B240E32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD7B240E32;
	Thu, 28 Aug 2025 13:19:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B57CB8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48BBD40E32
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id up69n3BGEnTw for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:19:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7370240CE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7370240CE8
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7370240CE8
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:19:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6D7DB9783E6; Thu, 28 Aug 2025 15:19:03 +0200 (CEST)
Message-ID: <fee05673-90e1-4c79-a7ca-92e6a0d8f2ec@rnout.be>
Date: Thu, 28 Aug 2025 15:19:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Meena Murthy <meena.murthy@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
References: <20250819100702.3316421-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250819100702.3316421-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756387144; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=iKzrv8fGwGcb4xt/vQfwwBL7zQN/XsbIKwAwOONTqdg=;
 b=aqqc1ISzxvIJ6JWinStgE7g/pQYlmtvTstL0xG1IIbA59aHCEgvll0zca5WN1C+RPC06VI
 +VFgP/bNWubKviJJBPnWpN9Pr31pgpe9AkP5j8zx/Ngqv29pi5yS0GEt84dmuFvpn1kvdW
 y8ur+wxUQcCIADs8fXfd4acza2nwqWoNfphPjScZlAfSDjddiU5H4Mc+xzecJgLU5vobdU
 4bSEojKeswIkmZJRlabeJOUTkYYiu8Ntjq4gjU9kSaUeyzv6zeqinsql4XupnJIewBsXc6
 UdfidD/QU/3iH5YAZ3nFN7MZS83ocylaponI0VANVdNgyIfLi+yTIkSS8WR0XA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=aqqc1ISz
Subject: Re: [Buildroot] [PATCH] configs/orangepi_one_plus: remove defconfig, broken
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



On 19/08/2025 12:07, Thomas Petazzoni via buildroot wrote:
> This defconfig no longer builds:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274055
> 
> It has been broken for at least 2 months:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dorangepi_one_plus&kind=BUILD
> 
> Unless a fix is provided, this defconfig will be removed.
> 
> Fixes:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274055
> 
> Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
> Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Meena Murthy <meena.murthy@amarulasolutions.com>
> Cc: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
