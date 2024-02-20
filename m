Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21713C48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 13:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF64F4014E;
	Tue, 20 Feb 2024 13:20:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yeJ2lj0op4wp; Tue, 20 Feb 2024 13:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECC8841560
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECC8841560;
	Tue, 20 Feb 2024 13:20:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E59D1BF2FD
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 13:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48670407BB
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 13:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tAJ36GyUq-TT for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 13:20:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1016140784
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1016140784
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1016140784
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 13:20:31 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id DCFBC2C80043;
 Tue, 20 Feb 2024 14:20:28 +0100 (CET)
Message-ID: <eca996e7-dda2-4dfb-9cc2-0f2ea90daafa@bubu1.eu>
Date: Tue, 20 Feb 2024 14:20:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Andreas Naumann <anaumann@ultratronik.de>
References: <20240219095155.2758428-1-anaumann@ultratronik.de>
 <ZdPG1PGaE3RfoWHk@landeda>
In-Reply-To: <ZdPG1PGaE3RfoWHk@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1708435229; bh=yciS0bVS5pZdxx5jX5K5XRVGji95I+QKEsyzla67/As=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RidusVp2VFpDsGWkeZhrhuQ2jMnXkCiV6vVEJJT5fUx72YrE41TcQGgVWfLbsejeO
 NG/KYhCVuZjjy9OMsmxjj1E3/nCZAOjIwyXy2AU99M1QCY5xui9074XLKo7xRajk3s
 SegdAu7omLItTnngYvLSG9shQAW9nnGIH5UXU+GtO43oM9imHSiv8Yd5V9zZk1Ta2i
 FeTcZqQ/A0d9yQALMk9itOFCamL//r6rApybaYrFTH7KsxFQXKv6E2G+yjaLtK5v54
 KxwBmsIrMd+Y9yHhrUOdXyWFnMNlGgG2i1Xi9pXXn9mpmNic+Jim9CjgTz7K9Oj28J
 sjiMZS8sme/aA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=RidusVp2
Subject: Re: [Buildroot] [PATCH 0/2] Fix flutter build failure
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andreas, Yann, all

On 19.02.24 22:23, Yann E. MORIN wrote:
> Andreas, All,
> 
> On 2024-02-19 10:51 +0100, Andreas Naumann spake thusly:
>> Hello Adam, all,
>> I was motivated to give flutter a spin after your talk at FOSDEM,
>> however the recent bump to Python 3.12.1 broke some script during
>> the flutter-engine configure step.
>> Fortunately now a new major stable version has been released 3.19.0,
>> which contains a patch for this.
>>
>> After bumping engine and sdk they successfully build again, as does
>> creating the flutter bundles which you provided in
>> https://github.com/aduskett/buildroot-fosdem2024-flutter-demos
>>
>> I have not yet been able to run them using ivi-homescreen, but that's
>> probably due to my target display/wayland setup.
>>
>> However, the flutter-gallery no longer builds with 3.19, even after
>> bumping to the main HEAD. Their github README says
>> "NOTE: The Flutter Gallery is now deprecated, and no longer being active
>> maintained."
>> I thought about including a patch for removal of the gallery package,
>> but that would leave us with no example for how to create a flutter
>> bundle.
> 
> The upstream repository has also been "archived", which means it is
> frozen and will never get fixed, ever.
> 
> That's a bit unfortunate indeed, but we don't have much choice going
> forward: we'll have to drop that package in the near future, but not
> now: we're still considering reverting the python 3.12 version bump for
> 2024.02, as it still causes issues in the target==build case, which
> means we'd be able to keep the current flutter stack for 2024.02 LTS.
> 
> Then, we can reintroduce python3, the flutter-engine bumps in this
> series, and drop flutter-gfallery, hopefully introducing another package
> as an example on how to build flutter packages...

The archived repo page links to 
https://github.com/gskinnerTeam/flutter-wonderous-app and 
https://github.com/flutter/samples/tree/main/material_3_demo as 
replacement showcases.

I wonder how long these will last... :-/.

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
