Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BCBEB64D0
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 13:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 289DC61148;
	Tue, 13 Jun 2023 13:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 289DC61148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBFzfjyqSxwu; Tue, 13 Jun 2023 13:33:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B33461126;
	Tue, 13 Jun 2023 13:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B33461126
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26BC01BF2FA
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 13:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F305540952
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 13:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F305540952
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ezmqk2z7YyV2 for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 13:33:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C1B140993
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C1B140993
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 13:33:53 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-30fcda210cfso405162f8f.3
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 06:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686663231; x=1689255231;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JJpcd0Jfjp5a+8TJWBKhiaQTikxTlvqqEHkzYCHhbEk=;
 b=VmxJhVWsZCKbXPaCr9DahKK9YmW/V+ySuT0MQbLrsO4ZdNeEouXGe7NnGCrr4hfLEO
 EzKCAU9N5wg2bfyP8VX34J0nUkzK2tiwMeJY+rWpH90/4ZlhyjkZYGsa1CxDEnCt/Ctg
 ahqYUwSjG7FFHWUc573Pse4gng0LMevm/qOaxDO89rcF53FUVPcDMKTphDwzE9AOlVAr
 g/QKBEODwXtjZrjUErstQprwCc3uwL72wL+jefZSDdZpuH4SJ1dYc3g4UZhZPgKXyj2w
 rWQ4//jqJpYX6TnHHbcueG1u6yHVhSP0RF13md0x4ZSFLSNAGwltDdlGFncVM8naIv16
 zkQA==
X-Gm-Message-State: AC+VfDwZr+R92oP98dZ+hT+wKBSJ5PMoMCEHmLV2efJ1tq2J68etxzE+
 HTjBLb2Lz3fYvdBroSgwYYJv0MMH3V7+gw==
X-Google-Smtp-Source: ACHHUZ7oAaAflVxdjuYE98mgHVPs9LufMK0puOghXtHF7oH7Y7OR9PwCbSAPuroARXmDb/Dd/NSqGA==
X-Received: by 2002:a05:6000:6:b0:30f:bb0c:d19d with SMTP id
 h6-20020a056000000600b0030fbb0cd19dmr5504517wrx.64.1686663231083; 
 Tue, 13 Jun 2023 06:33:51 -0700 (PDT)
Received: from [10.0.0.120] (static-90-255-244-241.vodafonexdsl.co.uk.
 [90.255.244.241]) by smtp.gmail.com with ESMTPSA id
 m4-20020a056000180400b0030633152664sm15357864wrh.87.2023.06.13.06.33.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 06:33:50 -0700 (PDT)
Message-ID: <c2a04c94-d9fd-0d34-68bf-c34c140102c1@gmail.com>
Date: Tue, 13 Jun 2023 14:33:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
From: Nick Betteridge <lists.nick.betteridge@gmail.com>
To: buildroot@buildroot.org
References: <e928ab82-fa17-3168-59c0-0a298b049115@gmail.com>
In-Reply-To: <e928ab82-fa17-3168-59c0-0a298b049115@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686663231; x=1689255231;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JJpcd0Jfjp5a+8TJWBKhiaQTikxTlvqqEHkzYCHhbEk=;
 b=p+DmStKttVuXD3uka7/v7IdlssrnrEhvxWdp2gXo7x4waguS0qE330B6TPzeeUUAJP
 UBz2FlvLuT6v+nBbuRX6h2nvMT8dzV0/bzMDRRDutiRVnQ4EQJN63db4xdUJN3u/2Epb
 X82bww4h8BKlOKXfjvd9xiRvBGePnqukqdHnyWolfQYv3XDnrUySYOmwtpEWd+gy62xI
 IfUtjGofEyvoeH/SbKszK1WPEZO8vJ2Z22qZiFFouGqn/q1XWIsgJISFasWTGvlgVkNm
 uV4b+0C008JdYV0O05CDGOTwFjWiKRz/JEbOnJS37uvBLOxsZG8ZfN5BKANq17pbvffj
 Fh6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=p+DmStKt
Subject: Re: [Buildroot] rpi4 - building but 'Firmware not found' error
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sincere apologies - duff sd card

On 13/06/2023 12:11, Nick Betteridge wrote:
> Hello!
>
> I have a problem using buildroot for rpi4b - using buildroot 2023.05 
> and raspberrypi4_64_defconfig - I manage to complete the build and 
> generate the image but when booting the device it complains of 
> 'Firmware not found'.
>
> I left all of the options in menuconfig as default - could anyone 
> possibly tell me if I need to alter anything to get the device to boot.
>
> Thanks in advance,
>
> Nick
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
