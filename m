Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256A8C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B688E60D4D;
	Sat,  4 Nov 2023 21:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B688E60D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XWFZiStHmys1; Sat,  4 Nov 2023 21:20:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0601060BCF;
	Sat,  4 Nov 2023 21:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0601060BCF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 741C31BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46C864038B
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46C864038B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00ovkJS-cKFP for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:20:05 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D6E840273
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D6E840273
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-543923af573so5528354a12.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 14:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699132803; x=1699737603;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xfseq0TqW+unqlZtRESGd6NZP01V9n/F4agCaBMjLow=;
 b=wQH5t2H4RDR1MKrbhIcY+3epAroRe35Otzo+6e8nlCg5MrUEUVtQvD1oV74FWVygc1
 4U0uclaoodPksKridxkW4bXhe8Bni1/AELuB/tWoWtEfpC8iR1efkb1mii0Q3jnIeFTd
 /LLtwG2R/KhpffXUly4dRrYnAx7Bjr0QEeKwu4B10kKsZscoAq+bhM15vq7g1fH9oKzp
 uc7RwmNxD1wmmbrTFfRUpqhKuwjFec7ywT+ncsMUGmXh5qIN43PkbzpwSxq3HbcNZ2ol
 4ln9BHAVrnQTWM/wW+Xlb/s8Z9ufNI5In76SRprEi0sD3KJXL3pi3GJ2DHU82AOqqRIl
 9KwA==
X-Gm-Message-State: AOJu0YzgqoMh1b5Or3FJ4jge0V3BxSOiYEt04vKD9gdWmmscWZb0+383
 qzqiwzp+5WiXjASlleIp2DoMvQ==
X-Google-Smtp-Source: AGHT+IEZh4uUFTc1icIPnFEsa2RzlGi1++LHJL0hBDiM8YY1MBdQzXvGmLL4SWicc3dQe+NYzolXPA==
X-Received: by 2002:a17:907:25c6:b0:9b2:82d2:a2db with SMTP id
 ae6-20020a17090725c600b009b282d2a2dbmr9311256ejc.28.1699132802455; 
 Sat, 04 Nov 2023 14:20:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 md4-20020a170906ae8400b009930c80b87csm2364602ejb.142.2023.11.04.14.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 14:20:01 -0700 (PDT)
Message-ID: <08804b6b-3cc5-4c0c-a2b5-90ab1b6db326@mind.be>
Date: Sat, 4 Nov 2023 22:20:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
 <20231026092701.12345-21-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231026092701.12345-21-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699132803; x=1699737603; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xfseq0TqW+unqlZtRESGd6NZP01V9n/F4agCaBMjLow=;
 b=C3OUn4lTMzfUjO+/OeJAawd0QGHebQ/AoHwBEEvWh1YihXBQRnOuCUWs9J4Wdyrwup
 HTWP/u9PA5/lmVInECGQ3KZQmImqDTct3KjIeAhkgcslQuv7wLGyJNABJgJK+BeqcM7E
 TVfQXzzo1qmC9/F0kcIzBG0NrQFdaA+6wHeVVLKnk255k8c1aE65hLoDcK9BhJYXN9Mr
 ADVaWt2vQkGr72fSNNeIdra5GS+EPqLH8PNkDtPrj2w6ZEpF2M4RQkGU7Orjfoom0/E6
 ma0qq9lhyD1NrMGiQ0HyRJ2BLJJawFAdZvnecW/GbNn+7tSP60NJjW3O0Vu1+QbQfz8g
 kgAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=C3OUn4lT
Subject: Re: [Buildroot] [PATCH 20/30] package/python-constantly: update
 versioneer to 0.29
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/10/2023 11:26, Adam Duskett wrote:
> Versioneer < 0.21 is incompatible with Python 3.12.0. Use the latest version
> which is 0.29 as of this commit.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

  Upstream instead changed the infra to use versioneer as a dependency instead 
of bundling it [1]. Care to adapt accordingly?

  Regards,
  Arnout

[1] https://github.com/twisted/constantly/pull/35

> ---
>   .../0001-Update-versioneer-to-0.29.patch      | 2619 +++++++++++++++++
>   1 file changed, 2619 insertions(+)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
