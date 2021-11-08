Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4A1C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 18:14:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C92661359
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 18:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C92661359
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E571980CED;
	Mon,  8 Nov 2021 18:14:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hIoPIkTyChyP; Mon,  8 Nov 2021 18:14:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49B1480CF3;
	Mon,  8 Nov 2021 18:14:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F41A51BF3F3
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 18:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3C4880CF3
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 18:14:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GTzHaBbeEGnZ for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 18:14:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C970480CED
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 18:14:49 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z21so20841825edb.5
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 10:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rAvulUivXe3clU3f639FzkSbMoFnuRhyX3E6VFcvCRA=;
 b=CHfPcTwN8PEzJQ0AEpxx/GPK5y3ncobSbJzkTPRLdniAcl5pYF7RzAtq3p3JSsQa+U
 vI2Qb6GiiR2JJcUfITlv6Ik+/NybxsWCBuTppZKf6JElpljI0rn9PC856u1oOQpK3T8p
 u4tCI/H1Jy0hWR+xfMmMDk5uVcmhjCHjKzO5NeHhVQTt6YblSzJILO8bXH/WK0KYyA5c
 DezjpinFe6IPUcWQg1oFp+O6RxvI5qL+KnC148S+OtWDrajCn7n/zpLoDkMM8cdvfWQE
 oDbpKQeK4F6Y766XHLWAJW+UsbjSNY9Vvgno5+5XJ+zgxd5sPkk4invucBjocOt07tsk
 eiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rAvulUivXe3clU3f639FzkSbMoFnuRhyX3E6VFcvCRA=;
 b=Ob8fpmKye2th7muNsqULQITJfc6hMF7DIVucen1CaDuNBKcPnPlod0NqhbW1yCp0fL
 z2LeoBdjx4IxDQk0F7qm2rKBwLAquF4zXFxHrB5iHVmisjvMZIxoFaG6vXVkVmvDDfnb
 79RVqvcdhBk5QjqMN/d8TFxNryDi0buIY2YXZ5DyCz0TMDNdPSZR1B5HJafwNw/Q15HX
 sF1qd0Psu+QVmiRvjO7wtPGhZ8rwbBPhRtwC5A+A7I6dtIrfNszbdcQ+R5G+/6Zb4t+C
 8ESJr91HQSVFR2IE88hAqo2ghi33zwSjyx97zHxfUSAYfc/1v+pmML+DC6FoMW2g0un4
 pvHg==
X-Gm-Message-State: AOAM530Xz1pz6APWnHHSi9m5ZB/1OpJ+Xor+GOd/HXvCGCcYYWDoIztY
 Z27q69Mdd7xZTTVem7z7AP70Ns2SZ2SiGg==
X-Google-Smtp-Source: ABdhPJxngQPRCdfA2R5mSwpQr2Td3//WIlWuo5azb7phEFe5xTvqmwLDpz8hFiGBO9HgJyVZIM1KYQ==
X-Received: by 2002:a17:906:dc90:: with SMTP id
 cs16mr1468305ejc.432.1636395287757; 
 Mon, 08 Nov 2021 10:14:47 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hb10sm8481653ejc.9.2021.11.08.10.14.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 10:14:47 -0800 (PST)
Message-ID: <196cef07-f91d-28e3-d24a-fb6f9a5184af@mind.be>
Date: Mon, 8 Nov 2021 19:14:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211026163222.3912644-1-fontaine.fabrice@gmail.com>
 <20211104211749.6b28a3cc@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211104211749.6b28a3cc@windsurf>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/python-cryptography: add host-python-six dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/11/2021 21:17, Thomas Petazzoni wrote:
> On Tue, 26 Oct 2021 18:32:22 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>>   - Use host-python-six instead of host-python3-six
> 
> I *think* this was incorrect from Arnout. Indeed,
> host-python-cryptography is a dependency of ca-certificates, and it is
> perfectly possible to have this with a Python 2.x enabled for the
> target (which would mean host-python-six installs for Python 2.x on the
> host).


commit 0c7e30b43a5e98abfc8db521a6415b5a5c1c267f
Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date:   Sat Jul 10 23:55:32 2021

     package/python-idna: bump to version 3.2

     - Python 2 is not supported since version 3.0 so update all reverse
       dependencies and remove python-coherence

  Since python-cryptography has a (runtime) dependency on python-idna, I had 
assumed that host-python-cryptography would have the same dependency, and 
therefore be python3-only as well. This seems to be a mistake, however. I guess 
ca-certificates only uses host-python-cryptography to a very limited extent that 
doesn't actually trigger all those runtime dependencies.

  Anyway, we need to get f**g rid of python2!

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
