Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D145C43334
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 03:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BDF140734;
	Thu, 21 Jul 2022 03:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BDF140734
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IWk2OttEaUNL; Thu, 21 Jul 2022 03:27:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EDB440447;
	Thu, 21 Jul 2022 03:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EDB440447
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D418B1BF37A
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 03:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB72F41B93
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 03:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB72F41B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vJyOiswtICYd for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 03:27:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B812141B91
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B812141B91
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 03:27:27 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id c139so592169pfc.2
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 20:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l3abVeX13ZK90VxvtaBTNYEetc6LSE27MUDM9SFHlOs=;
 b=UGey+IHwePoZ3T4FIIZKgMtmTk+bxUn+CAaAr/L5iZ4J1ApcmHTuml4KfnmeYQ+gRF
 7KVuM058JIHVebFKGn0uoBINf2gE99f1JT+zRrQUth9AtS+W+77BQE7JzB7Qf6+bkuQd
 wJJYF5k/CSBTDvALfhYDZfeXFjszcoCSpg88pUTc1FmCACo7iZTJaSlrybBmwudFI1mW
 DACf+rKvDQ2IE6DEwlnjeNJc4VYVlxMbPHjBIwyd4RM2omLAvylh76H/0UHHnjBeTK/p
 6QZKYTNymmzNwu+KHRdawxFj5Orv6QFn30NsE4yWVCkumnYadO4mpmj3Rqm/E8p5ZS9J
 Cc/Q==
X-Gm-Message-State: AJIora8O4HhVlNU9uVtX0gPQwBUzOmYTVnBwM5G8cCmxyGC5H1IQBE+Y
 5KEMfB0Pme0Wz3NtVkKIbKqYdUfhQ80=
X-Google-Smtp-Source: AGRyM1t34w/XYyszDw5JUiFN4O5scJSUOTBkliu4eQSu4WlLJCto5MQPa9573M6UYA0ExkqQVxl51w==
X-Received: by 2002:a63:8743:0:b0:41a:6f6b:db7b with SMTP id
 i64-20020a638743000000b0041a6f6bdb7bmr4201999pge.594.1658374046555; 
 Wed, 20 Jul 2022 20:27:26 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 6-20020a620606000000b005255489187fsm395708pfg.135.2022.07.20.20.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 20:27:26 -0700 (PDT)
Message-ID: <f7f93cd8-a062-19a6-0707-fe847f0fad0b@gmail.com>
Date: Wed, 20 Jul 2022 20:27:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220720205915.2346283-1-f.fainelli@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220720205915.2346283-1-f.fainelli@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=l3abVeX13ZK90VxvtaBTNYEetc6LSE27MUDM9SFHlOs=;
 b=grJsbqAJL8tAwcb2HhkqcsOJ7RhjsQZIUkFCSJ8cBV8DVIFfkW0Syj2F1jTh8E7VUK
 wtZ0yPH5CnyQtd6Gt+vJu4GfpJRY5vzHO3auz8CX+YjcqLKFpIGQi0sk1svXUVwd/o1i
 IJpOmUEC8w/s+XST/GeCFM3FJb+Pu+T5Uu14B/Nz+XxcbiYwrDdk6qNRw/UabagiRsd7
 tPK/jaXT0to16rojf+mGiZKxXUs4GesAq9i+qHLIfmkitDRjt/mgUNhiq7ddzzXj7z5P
 ixi/9Zsjb+dsNpQGyhqXBxMsgbZFM47/Jx+Z+o0JGVPSvVY2IfdyTC+L1JCt82edfYrr
 kKJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=grJsbqAJ
Subject: Re: [Buildroot] [PATCH] package/xfsprogs: Fix builds for
 architectures without MAP_SYNC
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
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com, fontaine.fabrice@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 7/20/2022 1:59 PM, Florian Fainelli wrote:
> Include a patch that was submitted to the linux-xfs mailing list to
> address build failures for io/mmap.c:
> 
> https://lore.kernel.org/linux-xfs/20220720205307.2345230-1-f.fainelli@gmail.com/
> 
> Fixes:
> autobuild.buildroot.net/results/407131b767fc8241e8f5f5001c0b5d4e2c488dea
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Looks like we got the attention of a few XFS developers, and sorry 
Fabrice for not having seen your earlier attempt. Assuming Darrick's 
patch get accepted I will provide a backport shortly after:

https://lore.kernel.org/all/YtiPgDT3imEyU2aF@magnolia/

Please do not apply this patch.
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
