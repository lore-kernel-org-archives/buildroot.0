Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D60C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 09:23:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E16C86112D
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 09:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E16C86112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A263403AD;
	Tue,  9 Nov 2021 09:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EmIFHEJR_3sG; Tue,  9 Nov 2021 09:23:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D865C40399;
	Tue,  9 Nov 2021 09:23:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE2991BF2B0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 09:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5CF34033E
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 09:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wgLgF1EKcDZi for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 09:23:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C67114032F
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 09:23:30 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id f8so74156379edy.4
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 01:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8YMjE/UWBeIN3eiP/TEtyu9wCPmTmN0o4zPqZszfLmQ=;
 b=T5PP7OYyMGe/kVQLaY+3tvP2IZDV/VnjjLj9/RktCPafmyL8YGtaR5BiGgClCvZa87
 //ISWKGwvczUzUYhXllKQXJ1qOqWRzbgbfSUFfI3l5/lthFd4aBVeweB8LiCoEbEmJet
 IquCIHFR1uCtQesaRMBLSNBs3XVzQLblvoIDUbmqDqakS/2BZieCJPuTAbs0rX2fsb6q
 iclxozuEBXcLnK0hrELuSiDYoVBsIvbz55fO8tPFscVtoWcjagpF/n/LYFL+nh3IjczO
 l/Su44mg2HJnWwCUQ0+xfKtKkfFSswxwICDExgZTtUwAQTfDJ8pIega5ocZM84xxcwAk
 f18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8YMjE/UWBeIN3eiP/TEtyu9wCPmTmN0o4zPqZszfLmQ=;
 b=ciCsNKa+AvQlvQJ/X1aJP0HS+A2XK3o4vK1KgGx2gQ+KAQdEMNO7mnvAutAG+1Oc9W
 DKRkmlBRU3IzYKSKxVur9n6IlBKEU93OKSjRq5lCFQwuk+nJJxF2E3ArRXNbgyxJ0XFn
 AozRliMEfz5sziJZujBq/CbA8c93U6O/kIltskjEE8YJ+4vd1h4DZW33ZdYeeT0E4KLF
 HrKB9NwwmCtB4GudrfxN+WQS5lGyGMUQA29YgM6rVmX1W7ktD3C6Q84q9L56G/T/haS7
 aJ0+DXXv8xNdYOTTCcXzj4lBlMCUmW2w8SRMF3zMsp5vNttOcspiLPG4jovKH8SCwNSK
 ne5Q==
X-Gm-Message-State: AOAM530Nhd22xvbtn0gN868tbVGZb53jjlLmlwO8Llo+taFHo/pgliFJ
 0zYPY0sCK5Ke4Lw8FRZsgqCvaw==
X-Google-Smtp-Source: ABdhPJzbXqkRYIbr//qH3eCsZQJPihTr4gINsnC3QWcKWia5DgfWk28Dg1RPw2wuygC/b3T0LKbb6Q==
X-Received: by 2002:a17:907:1b0a:: with SMTP id
 mp10mr7670835ejc.29.1636449808606; 
 Tue, 09 Nov 2021 01:23:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s12sm10640584edc.48.2021.11.09.01.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 01:23:27 -0800 (PST)
Message-ID: <37a68082-d058-73d4-6b15-9a3129a672d7@mind.be>
Date: Tue, 9 Nov 2021 10:23:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Michael Walle <michael@walle.cc>
References: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
 <20211108230520.4007148-8-giulio.benetti@benettiengineering.com>
 <eea83befc9a6f40dad4efa7a4ae019de@walle.cc> <20211109085032.GF680793@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211109085032.GF680793@scaer>
Subject: Re: [Buildroot] [PATCH 7/7] board/kontron/smarc-sal28/genimage.cfg:
 fix option suffix
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>,
 buildroot@buildroot.org, Luca Ceresoli <luca@lucaceresoli.net>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/11/2021 09:50, Yann E. MORIN wrote:
> Michael, All,
> 
> On 2021-11-09 09:04 +0100, Michael Walle spake thusly:
>> Am 2021-11-09 00:05, schrieb Giulio Benetti:
>>> Option 'offset = 4k' must be 'option = 4K'.
>> Why is this is a 'must'? Apparently it works, no? So if anything
>> it is for unifying; but even then it's moving in the wrong
>> direction. There is no "K" prefix in si units. Stictly speaking
>> there is no "KB"; there is a "kB" or a "KiB".
> 
> This SI reference was also my comment on the preceding series, but
> unfortunately, that ship has sailed now that the series has been
> applied...

  What has been applied is uppercase K everywhere. Lowercase k looks like a SI 
unit, i.e. 1000, so I think uppercase is a little better. To be fully correct, 
we should use KiB instead (which apparently works since genimage apparently 
ignores everything after the first letter). But as you say, that ship has sailed...

  Anyway, this stuff is never going to be fully accurate, so anything is OK in 
my book, as long as it's consistent.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
