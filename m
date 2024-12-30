Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BCFE77194
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 18:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89C4C40627;
	Mon, 30 Dec 2024 18:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phEbeKTW-Xc3; Mon, 30 Dec 2024 18:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66E7A406D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66E7A406D1;
	Mon, 30 Dec 2024 18:24:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7AF6968
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 968F740627
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJKXUzIgzkGB for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 18:24:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A1C84406D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1C84406D7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1C84406D7
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:24:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8275878050F;
 Mon, 30 Dec 2024 19:24:12 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:39866])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 30 Dec 2024 19:24:12 +0100
MIME-Version: 1.0
Date: Mon, 30 Dec 2024 19:24:12 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
In-Reply-To: <b58674e6-2aa1-4f27-831a-be9461070242@korsgaard.com>
References: <20241229093332.334759-1-thomas.petazzoni@bootlin.com>
 <4ec6a821a844d53ce68489983d4e4068@free.fr>
 <20241229210352.684be2d5@windsurf>
 <b58674e6-2aa1-4f27-831a-be9461070242@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <1ebf8adf851467fc9965ffdc5949688d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735583054;
 bh=3FkH8lzxh42DPqFHjeToaww/yrpCq9cWHBcu4aeO05Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=drvJyJcFO5HAcofanvFuN6R4r0MhTxGgTfCKUsmw8Hw0mI66guOTXtyOveEGhcU2V
 TvqqKI4DKOyirooEI7khc76EN8YKODDp4fD8K0ts2NDV5Z6MiMTgeclrqBj32wjZ0L
 rsgBqxkd6zw0NM/9sOVp4egPDobdRiHQsqf5Nf/XK3/ceX/TmG20D4Tq36A67EtlcB
 Y3MBglMEOJ0BEKvnxKMuU2hY+iv5pjV8ntaVZN9V8EvhPMf4zbwu2s4wRvoycrfpr1
 0KdSTl+8BzgqBHOz/cR9pKz+7MY1yHy+d/PZVfRlYH3KOiD9sgcEMOMY/dpdUXk7Hp
 KyQyr1P6Irvog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=drvJyJcF
Subject: Re: [Buildroot] [PATCH] linux: select
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL when needed
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter, Thomas,

On 30/12/2024 13:43, Peter Korsgaard wrote:
> On 12/29/24 21:03, Thomas Petazzoni wrote:
> 
>> I am not sure myself what is the right solution here. I'm trying to
>> avoid recurring autobuilder failures. I discussed this topic some time
>> ago with Peter. My idea was to do tweaks in utils/genrandconfig, but
>> Peter was on the opinion that we should deal with those issues 
>> directly
>> in the linux package, so that it doesn't just benefit the 
>> autobuilders,
>> but also our users.
>> 
>> Clearly, it's going to be a cat-and-mouse game: we discover issues in
>> the autobuilders and address them. This is for example the case for 
>> the
>> x86-64 situation you reported. But for example, I only took care of 
>> the
>> "latest kernel version" case, but we might have similar issues for the
>> CIP versions as well. My idea was to simply deal with those
>> progressively, improving the logic as we discover new cases.
>> 
>> Note that I am not 100% sure of what the best approach is. Maybe it's
>> one of those cases where we simply to try one approach, and decide
>> later if it was the right approach or not?
> 
> Yes, I think the complexity is more or less the same (+/- differences 
> in kconfig vs python) no matter where we put it, so having it in 
> kconfig and helping everyone rather than just the autobuilders IMHO 
> makes most sense.
> 
> But lets see how complicated it turns out over time.

Thanks for the clarifications.

I applied the patch to master.

In the future, if those conditions become too complex, we could still 
adopt
the same strategy as for  the _ARCH_SUPPORTS (i.e. moving the complex
conditions in hidden Kconfig symbols). This should keep the symbol
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG readable.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
