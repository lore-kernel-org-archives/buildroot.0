Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E714FC4707C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 20:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8954743FB4;
	Fri, 12 Jan 2024 20:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8954743FB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kqj04JAt4KWf; Fri, 12 Jan 2024 20:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 834A343FB8;
	Fri, 12 Jan 2024 20:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 834A343FB8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31C151BF2A7
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 20:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 003E584B68
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 20:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 003E584B68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wzHjej7ehfuY for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 20:11:49 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 586B784C2E
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 20:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 586B784C2E
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7bee8858a8aso128038339f.0
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 12:11:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705090303; x=1705695103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+m+8+sn/yrRpMNmoKuVGJnl0KXgHIO06YV19abnxPJI=;
 b=RmnOuipO7Ncwirr2fbjCzMZcEMr2AU+P5IpFXa0aSMLeRzZ/00CsWX6L3dwH5yOeA6
 kXLjnC+FC3LZH/9hC2KCzBO+6XrviorbmMLyZoKeHdHCKEAWJALQHciFTBwdXrt4omXi
 MyIfd3t6GNJ76mr3bAgxxEp9blm87rKjMCC/DTktJKRgJhakV9IDlrRNOAKdyi/kJ2DO
 LP2n6jZXUHt8mho/aEHXrcDjCsIROPS+G3eTXUy3BbpX12w9085NSEyYhQNDlHOHNAN4
 0L3L4o4C90Txmlz8ihF+/84zD96mZG+jOcEKYeBNdZ/+Ezu2oS0y6/SO9MaJI6PJ5dlE
 hRKA==
X-Gm-Message-State: AOJu0Yz8AdojkNph15Dy4a4bXyleaTn//iqySMIs6duLxpRokSe/VpbJ
 5gJH0rVDlU0fdUZNODhD9BPnk96uSMWqWg==
X-Google-Smtp-Source: AGHT+IHqoFIA5SsY0S6pP9E/YEdP51Pl+qXJMok2jHmvOWgujRF0EPJI7JOUqJM1HPAneMcc2A0bVw==
X-Received: by 2002:a05:6602:89b:b0:7ba:b9fd:a234 with SMTP id
 f27-20020a056602089b00b007bab9fda234mr1993100ioz.37.1705090303206; 
 Fri, 12 Jan 2024 12:11:43 -0800 (PST)
Received: from [172.16.32.83] ([198.232.126.202])
 by smtp.gmail.com with ESMTPSA id
 bt9-20020a056638430900b0046e25a7bb9esm1063767jab.176.2024.01.12.12.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 12:11:43 -0800 (PST)
Message-ID: <2ff803d9-748c-e168-3775-b05fb11868bb@landley.net>
Date: Fri, 12 Jan 2024 14:18:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Niklas Cassel <Niklas.Cassel@wdc.com>, Greg Ungerer <gerg@linux-m68k.org>
References: <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
 <20240105131135.GA1484621@pevik>
 <90c1ddc1-c608-30fc-d5aa-fdf63c90d055@landley.net>
 <20240108090338.GA1552643@pevik> <ZZvJXTshFUYSaMVH@yuki>
 <SA3PR13MB6372498CC6372F8B16237244FD6A2@SA3PR13MB6372.namprd13.prod.outlook.com>
 <20240110141455.GC1698252@pevik>
 <40996ea1-3417-1c2f-ddd2-e6ed45cb6f4b@landley.net>
 <ZZ8JbCPd3rq4u7iG@x1-carbon>
 <7e348eb3-bd34-4c66-9ed6-b5108da80486@linux-m68k.org>
 <ZZ+zB29hRhpjiOrh@x1-carbon>
From: Rob Landley <rob@landley.net>
In-Reply-To: <ZZ+zB29hRhpjiOrh@x1-carbon>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20230601.gappssmtp.com; s=20230601; t=1705090303; x=1705695103;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+m+8+sn/yrRpMNmoKuVGJnl0KXgHIO06YV19abnxPJI=;
 b=GMvV/dxiWxGTrZ7P49aBGHCcbq5rFgPmZlIkm7XGH0fYWD9MPrXa6dBSht5Y2f239x
 eX0KSkwSGNO6CoHGUOPQOgPkLIxA+5WaWxPwzK2FPKFCkwA7PlHxsGS3t/arIMrDDWZj
 F5+mBKXM5NmXiO5sZjDFM/KfjOZPBzR3/5rMTX6G48zZHF/pqs6b4W2ehwAzeiwkMqrY
 7ajMA7/BXi3HxDOZWdir0MisGC4d4x3GxjCCXEzlFskXbF/Lp42fAB3L9H77NbRIOGWa
 EOI4cB2CmDyfpf26kh2Mkp0Y0axLxKMkyO5/kgpGIovNak8iXQrnEXid+a4Nee2CzjQS
 3wag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=landley-net.20230601.gappssmtp.com
 header.i=@landley-net.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=GMvV/dxi
Subject: Re: [Buildroot] [Automated-testing] Call for nommu LTP maintainer
 [was: Re: [PATCH 00/36] Remove UCLINUX from LTP]
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
Cc: Andrea Cervesato <andrea.cervesato@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linux-sh list <linux-sh@vger.kernel.org>,
 Tim Bird <tim.bird@sony.com>, Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Li Wang <liwang@redhat.com>, Petr Vorel <pvorel@suse.cz>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Cyril Hrubis <chrubis@suse.cz>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>,
 "automated-testing@lists.yoctoproject.org"
 <automated-testing@lists.yoctoproject.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 1/11/24 03:21, Niklas Cassel wrote:
>> > s/Linaro/Lineo/
>> 
>> Lineo was not founded by Jeff Dionne, see https://en.wikipedia.org/wiki/Lineo
>> for its genisys. Maybe you are thinking of RT-Control.
> 
> Yes, Jeff cofounded Rt-Control which later merged with Lineo.
> 
> My main point is that Linaro is a completely different company,
> which did not "die in the dot-com crash", like stated above.

Sorry, I typo uclibc/uclinux all the time too. (In extreme cases I swap
busybox/toybox, which is personally embarassing...)

Rob
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
