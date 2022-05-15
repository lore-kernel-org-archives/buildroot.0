Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F189C433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 02:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4FE7410C8;
	Sun, 15 May 2022 02:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wi-0oyPc3-io; Sun, 15 May 2022 02:14:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62C424092B;
	Sun, 15 May 2022 02:14:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A4CC1BF5EA
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 02:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3515960E74
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 02:14:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YBfBJKBd4iAs for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 02:14:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CC5760D74
 for <buildroot@buildroot.org>; Sun, 15 May 2022 02:14:24 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so11167971pjm.1
 for <buildroot@buildroot.org>; Sat, 14 May 2022 19:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Fp7Q6Dr0uu/ocpH9/ScmlEh197kfAJpZ3AxLv8ZYEYM=;
 b=hYGnKUyCk6zeKkvf91VQ5jQz+J4lgRZt9SMnvH4dK+SXPB1kLSUbDP0lM4Sccjvc7F
 wF9vjArm96DCnoJx06fkPcTXfHK7sOlbN5fw1BjZdaUCXBNXXczUVlu5Bo/f74OHfhR1
 szsz81mMO/bOO6GsI9NXln5teqp9xCronrmywwnSA0k4jgu9W9nuEtRZJIWwUiW0ccYR
 FqiEtLtinYtjKYnvuyUyo+E9+iGm04GR09GFnaBIf2NEJ851xet1Jaly38ICBebud6B6
 EtlqIrc7OAFWi1AMh++V1emsejt1Z91xVk1Y1PRs1Zoy+nm2n3094Q3jb0qPNW0DmsnE
 xBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fp7Q6Dr0uu/ocpH9/ScmlEh197kfAJpZ3AxLv8ZYEYM=;
 b=BUNP6DFkJglQvmeKPLoQa+UNQMuyT/N2cvTRnyErAYiPrYcZsEqHjPqgtWLr0rOoOl
 rmdtdWkmktJ61Yn70y/N3RfZvjb8V5Hc8Th15IByKHfewNezD355tDN5KBWMPGnJHs77
 hHOJD3/yLSOnucA/87TZSJnHj3XbQH099a3J+TPWnKkgmaLXG2viEHzBUpw/UZd+yDaa
 UuG9pCAZ0RD7WqNoXItoo6J3YA2eHD6GjmzBhOWk0AOy3W+vohzSguGVpzwCqEpZ7SFV
 6izCkc4yAqt2AkzKKeMeOqjm4bUfbpXaS+V6LgDwspUFVnwphxRPecrlz/LEQTfaXeIc
 A2Xw==
X-Gm-Message-State: AOAM530MhyY6dXxWdzzS00NGbbgIkezUz8tIRZ9nM+Xe3A0AUiU8pGGs
 FKx7zmFV4Rm+8E6VuEuf4qA=
X-Google-Smtp-Source: ABdhPJy16WIahfOZybqJt3eRSXr6+CeeKwpn73XeGICVxu/IA6APXOM420+tc9ENqBeT3PLf7D6RFw==
X-Received: by 2002:a17:902:a70d:b0:15e:da68:b1b1 with SMTP id
 w13-20020a170902a70d00b0015eda68b1b1mr11735576plq.53.1652580863463; 
 Sat, 14 May 2022 19:14:23 -0700 (PDT)
Received: from ?IPV6:2600:8802:b00:4a48:a874:f2e2:e388:1893?
 ([2600:8802:b00:4a48:a874:f2e2:e388:1893])
 by smtp.gmail.com with ESMTPSA id
 204-20020a6302d5000000b003c6a37b1628sm4033360pgc.13.2022.05.14.19.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 19:14:22 -0700 (PDT)
Message-ID: <14506c30-bf1c-71b3-bda5-b9105adf85b4@gmail.com>
Date: Sat, 14 May 2022 19:14:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>
References: <20220511001947.2112747-1-f.fainelli@gmail.com>
 <YoBg1aDzr7cEYB/l@antec>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <YoBg1aDzr7cEYB/l@antec>
Subject: Re: [Buildroot] [PATCH] package/cpulimit: Disable build on OpenRISC
 with musl-libc
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
Cc: yann.morin.1998@free.fr, mmayer@broadcom.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 5/14/2022 7:09 PM, Stafford Horne wrote:
> On Tue, May 10, 2022 at 05:19:47PM -0700, Florian Fainelli wrote:
>> As reported in the following autobuild report:
>>
>> http://autobuild.buildroot.net/results/2a9cf20949beac46d1c689df2c5b7ab0d59c08b5/
>>
>> cpulimit does not build due to a lack of definition for elf_gregset_t
>> which is not currently provided in the or1k musl-libc port. While this
>> is being worked on, disable the build for or1k and musl-libc.
> 
> Hello,
> 
> You mention this is being worked on.  I am curious who is working on this?
> 
> I try to look over OpenRISC stuff, do you need me to do anything on musl for
> this?

I posted this:

https://www.openwall.com/lists/musl/2022/05/10/1

if you don't mind reviewing, thanks!
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
