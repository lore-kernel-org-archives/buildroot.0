Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAA1C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8199541E2D;
	Tue,  6 Feb 2024 10:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8199541E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 502XquAHrRFb; Tue,  6 Feb 2024 10:47:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE29641DC6;
	Tue,  6 Feb 2024 10:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE29641DC6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4AC91BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FF8C8216D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:47:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8OU-8jw6M0Uq for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:47:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B31982167
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B31982167
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B31982167
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:47:32 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40fe00cb134so7803095e9.3
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 02:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707216451; x=1707821251;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wOikKsGKLuyAj3npxPM1r+Eoaj0rTIwH7O/uF3PKV8Q=;
 b=V0/r4Ow/5zONGEUb1QrEMR5V/aEAIV4IyTLM672ToT6LPydqDpFKKERMFJrxfTlwkL
 fOuc2vG1rrza5xncUfyzM7B7XTg68T8knvtP/vhcJjaCKGzktz1lorsmpAJ0gZ3D7ruu
 A1p93REASvmM3lFgQ7+R7j06mnXhI9N4jRVhCR/x/y8h1/O//E+1Gq/urMnw1I3n8D8/
 w7la79J40ZeRI3bfBbm9IAC+dPqzaOklr+muPzULLtjmL1h5ns/8JPfc3h8W88Sc5eEY
 82dNjNax2EaIyReLseX301BUkfDqpY2HNmuJzdDMdKhktw01k4qY/Psr4pkNJoP78ps3
 GSvA==
X-Gm-Message-State: AOJu0YzN4wuJhEFih9Gkqq9VlpABozP01ltFDCvtgCCzK6+090IRwEgK
 Y7299I6Wy82jGCcGUsueje28L5HzPX0tOQdey/w9NqMFs7v2x3lQ6hmfmJnFG9kb7FxrZJUMpcI
 t
X-Google-Smtp-Source: AGHT+IHvL2bsXvngPP0P1migJ5p178+goC5vWZCEHzkPY8BXTDYkz4sFlaH3EvwQSFjCVNRtmR+kZQ==
X-Received: by 2002:a05:600c:4fcc:b0:40f:b0c9:dbc with SMTP id
 o12-20020a05600c4fcc00b0040fb0c90dbcmr1679747wmq.37.1707216450940; 
 Tue, 06 Feb 2024 02:47:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV2A/VoAeyOC/ga7MccBKhzmQCnUI/3YSNNqDmMf4onZuqvn1nZw+3MVR6hcQwtqHITcaaosHxy66ZwHNluyGkOL7S591LGvQ==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b0040fdd7cbc8dsm1563971wmq.47.2024.02.06.02.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 02:47:30 -0800 (PST)
Message-ID: <f61266bb-7f7e-4b05-82a8-175627ba39f6@mind.be>
Date: Tue, 6 Feb 2024 11:47:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Yegor Yefremov <yegorslists@googlemail.com>,
 buildroot <buildroot@buildroot.org>
References: <CAGm1_kv4kcNXwz4J2cNBje3VhbMX1xcwteAX1=j7QtsdAveQCg@mail.gmail.com>
In-Reply-To: <CAGm1_kv4kcNXwz4J2cNBje3VhbMX1xcwteAX1=j7QtsdAveQCg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707216451; x=1707821251; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wOikKsGKLuyAj3npxPM1r+Eoaj0rTIwH7O/uF3PKV8Q=;
 b=Dp8YmT1V8RG1forqtZsfs4O36MWfDAbUqtjMiyQRz5ZU38vlZYmjPk+tKKonPq3m88
 w9U6xLaGGO3Zpw20aJCdYAhPfc0uVipAAkJkgn+h/2W1MB2xF/NDQhAa71VyMqnEJ6Hc
 BiwNHBzA9as+27saJMOqvb6so52i8hwab6/aj4pvN3Y+3ZqJZNCtw8xohAp+aQcIw4BI
 if8MGja7jdU3ho1NFM8fbKjFI9oPfMgNbHhxH1DX5v9LTL0NEG34+1yl5lGEmbr1/6U3
 jHHHXdrc+6s7Phz0fhZjDmAMMRZqnCjEP3ZUhmzpOB79IDTlabf1MyEMUlO6VQKEz0D4
 zD8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Dp8YmT1V
Subject: Re: [Buildroot] Ignore build directories created via make O=dir or
 the default one
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2024 11:22, Yegor Yefremov via buildroot wrote:
> Hi all,
> 
> what about adding a .gitignore file with an "*" everytime we create an
> output directory? Does anything speak against such an approach?

  I like that idea!

  And then we can remove output/ from .gitignore as well. I always found that a 
bit annoying.

  Regards,
  Arnout

> 
> Regards,
> Yegor
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
