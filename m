Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A144CD1296
	for <buildroot@archiver.kernel.org>; Fri,  5 Apr 2024 21:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F0A083495;
	Fri,  5 Apr 2024 21:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EGP0RjoJcPrt; Fri,  5 Apr 2024 21:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9158C834AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9158C834AE;
	Fri,  5 Apr 2024 21:31:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34E391BF5B3
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 21:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22D5B40118
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 21:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1QQmgWsT8md for <buildroot@lists.busybox.net>;
 Fri,  5 Apr 2024 21:31:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 50095403FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50095403FC
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50095403FC
 for <buildroot@buildroot.org>; Fri,  5 Apr 2024 21:31:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4155819f710so19952445e9.2
 for <buildroot@buildroot.org>; Fri, 05 Apr 2024 14:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712352686; x=1712957486;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QBqA/fdPq9Ipnt8jpgJPEetPZQqUh06keOElTQ4zey8=;
 b=pveoqrR6UeKwkFBUh9xva/6abJYS97+mEtKcWoCvSOzs/awnp58j1tBzSTuwr68yS/
 E3/q6driMx97Se9fVcYkg2K9taYPlWGzboA3bXdgXQDZZyEnlns4VsGnG10zbOQv1l4k
 SmYCCf36tNQXbQ9xfDy4+Pk92lcuWd+oEGQg2MCOrvHKzThdYv4M3/20fX2HgNQzUG2u
 jwpGN12qwV8pOQ/8h/BrE07T6fGE9fUQJK2rx/9hUceWNbqmZqcN5w6gt/kpD4OX+xBC
 x38rz49L6YO4PJs4tPdcLFNeo734Yw4fZEII9N4xSyPEqgbIUpBdcbRV7ha6FyrA3UZ9
 bCuw==
X-Gm-Message-State: AOJu0YwZUt9qxHorW8EVUPsQS67m52lI29B/xklJ6Z2307VA5Pl0Jy3R
 iacr6QHgkWHmTpXaoi/AIJV0k9ZfMmZRLMj9h7c5t9GM9hpy4GLBnpDzyy+J/tqyuRDTkWn2pLz
 x
X-Google-Smtp-Source: AGHT+IEoCig01Uz3ym295MtwrVoWudvCpMy0fpIlhLE8e1gpST5cThIlp6ITOX4eKa/rwJO1DPi+iQ==
X-Received: by 2002:adf:e7cc:0:b0:343:74da:bc7a with SMTP id
 e12-20020adfe7cc000000b0034374dabc7amr1869123wrn.47.1712352685535; 
 Fri, 05 Apr 2024 14:31:25 -0700 (PDT)
Received: from [192.168.1.11] ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 s26-20020adfa29a000000b00341b9737fc5sm2875325wra.96.2024.04.05.14.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 14:31:25 -0700 (PDT)
Message-ID: <d0e43e98-cb34-4c9d-8166-425e16e04a5c@essensium.com>
Date: Fri, 5 Apr 2024 23:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nosthoff <buildroot@heine.tech>
References: <20240404124329.768546-1-thomas.perale@mind.be>
 <21d09-660fc280-5-914bd10@117861333>
Content-Language: en-US
In-Reply-To: <21d09-660fc280-5-914bd10@117861333>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1712352686; x=1712957486; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QBqA/fdPq9Ipnt8jpgJPEetPZQqUh06keOElTQ4zey8=;
 b=Ag32z8vIQO8HwkQeO/VqdCIgHitjzljs/pzcbALq9G+ia1uP1Pcs7M8tItFQDRiR16
 WW8d3HbqJVG7F+/AbPitqjAaAjo5ozHZSslJoc+d9HTfXAR/Gu06kYIsF30iRJPqo3Oq
 e54Zkr33wT4W7icOYxKZdnf3Hk6WPafaw/n/BR09F89u4pWsiEbwugTMjiV9BB5h8LeR
 s5vpPeSJ9u+kUtXBJdoQvN+iw6ZNZKlrwhnKjVKcXsBQo0CYo83+iWBftF35f09j2ynB
 hUmFCq79s7gVonzUfga4j6kXqXTtcAMrOqNVpSKAm89ZfxLmekxp4nz5kRISLc6/ngSe
 SRKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=Ag32z8vI
Subject: Re: [Buildroot] [RFC PATCH 0/5] Support SBOM in CycloneDX format
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Robert Smigielski <ptdropper@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael,

Thank you for taking the time checking my changes.

> Did you see the work of Robert (i added him in CC)? He submitted a script to the list some time ago which can run on the manifest.csv [0].
> Maybe there are some synergies.

I saw the work of Robert and used it as a reference to write the first 
iterations of this patch series but started working on a change for 
different reasons:

- Provide a solution that doesn't rely on python and external library to 
generate the SBOM. And a Makefile implementation just make sense to 
access all the package variable.
- Generating something based on `show-info` and `legal-info` just add 
more commands to run.

I would highly appreciate any contribution/reviews from Robert.

> One thing that I noticed:
> when running `make cyclonedx` I first get the output of wget which retrieves the cyclonedx schema.
> So I have to cut it from the output to have proper json. Maybe you want to silence this in some way.

Did you mean the `cyclondx-spdx` file from the 
`support/misc/cyclonedx-spdx.mk` rule ? It should not be ran by default 
and don't see why it's run ..

Regards,
PERALE Thomas

On 4/5/24 11:21 AM, Michael Nosthoff wrote:
> Hi Thomas,
>
> Great that you're taking up this topic. I'm highly interested because I'm currently generating my sbom "by hand" using a small python script which
> converts the output of show-info. But yours is already better as it adds the dependency info and also fills the purl field (to the best of its knowledge).
>
> Did you see the work of Robert (i added him in CC)? He submitted a script to the list some time ago which can run on the manifest.csv [0].
> Maybe there are some synergies.
>
> First feedback:
> I created my SBOM using your patchset and put it into our dependency track instance. Looks promising.
>
> One thing that I noticed:
> when running `make cyclonedx` I first get the output of wget which retrieves the cyclonedx schema.
> So I have to cut it from the output to have proper json. Maybe you want to silence this in some way.
>
> I'll keep playing around and will give you further feedback if I'm noticing things.
>
> Regards,
> Michael
>
> [0] https://github.com/CycloneDX/cyclonedx-buildroot
>
> On Thursday, April 04, 2024 14:43 CEST, Thomas Perale via buildroot <buildroot@buildroot.org> wrote:
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
