Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E920CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D5A5817A3;
	Sun, 13 Feb 2022 15:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLItz0eJ1-Rz; Sun, 13 Feb 2022 15:07:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB093814AB;
	Sun, 13 Feb 2022 15:07:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AED8A1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A96AF40360
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1W1C81kCQk7u for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:07:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6808540116
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:07:01 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id k25so32561222ejp.5
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YVe+7EVsDfCzpAOYpYl5nT37wHfanjsTvICk76O9UeI=;
 b=d/gh4468MDnDzyjuZHPnEh71OvGxSS3HAmxsNM1KatvC8WRAeSZ3GRghAYRpEkCOgL
 xGc3vpbGwwNX57IZ7cqUnouw+wTQaLNRcggzgTm/U6N+b/5/1e1hwrCoavS458Iwq4uU
 xKTzjol7i2drCb8T9RbW+OD8jEvpCWnlMmIjSxJzh4EPrMkdjaQZaOkFgxmZTRJ4ezKI
 ataaDAC3etsBxJJLB4QiURC7wOfC5W/VZc7GOeQYurjBf+KuswWsoJcKg1GLAzeiD7XP
 VKhsawYl4OxeOGl/+GX7ZiirNyGNpn8ccc/U82qrNAtFrPfhb48ZX5aR3ZMIRIZxg315
 zo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YVe+7EVsDfCzpAOYpYl5nT37wHfanjsTvICk76O9UeI=;
 b=c+FVZ1RwxXJImSsKFr+rFEM3xYfuue/9Iwsma2W3CDvlrMmq9GPilBGNBZ6rySfJRw
 bO4oiviVd9TKpBoepnFImsqfsz5UvIrCf8Ml6yPBiM0VkfpdFnKzsWoK+7Cqakrh7TTz
 tqWo6Af42HjZGO0H8pi5+RGQcXTuD0oDBkUlC19UKwjacfOWot6ZRVg5zHDxYAabbtc6
 Jb2Im99B2QaRqNxtunzN3q2TOslnEwnhNLhWMK576yNMXLQ4LvkHBQKe0ZBb0xExjZaw
 TbQ3Xq1w5SQnpAmfJLaxx6v+/y+pqXMLCyiTfWChMk6yaXHsHJ/hP3iAxCSgu2eunPMJ
 5dcw==
X-Gm-Message-State: AOAM533iKgKWA5a5fjheEahJ4tPL5r4S7rfuMcAD4hLQZ8IubwdZ7jHf
 UeUyZxa9ChYMeh1vqZP79jbXAg==
X-Google-Smtp-Source: ABdhPJzoUTO2Cox8O+f8PVyWcMnNVedwkjmIaB0AmOuC/jKRIkjhi8YdJL+c3flaCkpAfoB8KmmQ/Q==
X-Received: by 2002:a17:907:9815:: with SMTP id
 ji21mr8192401ejc.700.1644764819596; 
 Sun, 13 Feb 2022 07:06:59 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id a8sm7259201edy.94.2022.02.13.07.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:06:59 -0800 (PST)
Message-ID: <ad5fd860-5dca-f04c-3f1d-e64842c0b8f4@mind.be>
Date: Sun, 13 Feb 2022 16:06:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
 <20220206200532.2758493-2-giulio.benetti@benettiengineering.com>
 <20220206213657.GA457876@scaer> <20220207085517.5c13c097@windsurf>
 <20220207173751.GA2249818@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220207173751.GA2249818@scaer>
Subject: Re: [Buildroot] [PATCH 01/16] board/aarch64-efi/genimage-efi:
 convert partition-type-uuid to single letter notation
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/02/2022 18:37, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2022-02-07 08:55 +0100, Thomas Petazzoni spake thusly:
>> On Sun, 6 Feb 2022 22:36:57 +0100
>> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>>>>   	partition root {
>>>> -		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
>>>> +		partition-type-uuid = L
>>> As we discussed on IRC, this is not the same thing. genimage will extend
>>> the 'L' shorthand to the full UUID 0fc63daf-8483-4772-8e79-3d69d8477de4,
>>> which is different.
>> And? Is that really important?
>>> So I don't think uaing the shorthands are correct.
>> Why?
> 
> I think that it is important that we do adhere to the expected values;
> see below...
> 
>>> The UUID assignments are available on Wikipedia:
>>>      https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs
>>> But the systemd docuemntation has extra UUID definitions:
>>>      https://man.archlinux.org/man/systemd-gpt-auto-generator.8
>> Yes, but how useful are they?
> 
> Why would we diverge from the specs?
> 
>> Unless these systemd-defined UUID are really relevant, I would prefer
>> that we use the shortcuts provided by genimage wherever possible, and
>> only rely on using the full UUID for special cases, such as the
>> board/sifive/hifive-unleashed/genimage_sdcard.cfg (PATCH 15/16).
> 
> There are tools that expect those values, to autodetect partitions. This
> is the case, of course, of systemd-gpt-auto-generator, which will lookup
> the partition UUIDs, but other tools may expect these UUIDs too.

  At least for systemd-gpt-auto-generator, the UUID for rootfs is only relevant 
in case systemd is the one mounting the rootfs, i.e. in case of it running from 
initramfs and pivoting into a mounted root.

  That is not a scenario that we support in Buildroot, by a long shot. 
Therefore, my suggestion would be to use the default Linux partition type for 
the rootfs, i.e. L. Since this is actually the default for genimage, I would 
even leave it out completely.

  Giulio, that would mean rewriting this series and removing everywhere L is 
specified. Do you agree with that?


> I am not saying that we would cause trouble by changing our board
> descriptions, but if we want to allow people to just copy them as the
> base for their own development, then diverging from expected behaviour
> is not nice.

  I think the cases where a non-standard (where "standard" means the actual GPT 
standard, not the additional stuff that systemd invented) partition type is 
relevant are going to be so unusual that the default we put in our genimage.cfg 
is going to be of no relevance whatsoever.

  Regards,
  Arnout


> 
>> This way, it would be pretty clear that we have the "common cases" (boot
>> partition, rootfs partition) and the "odd/special cases".
> 
> I think the "common case" would be "adhere to spec, use specified
> values", while the exceptions are "the spec says nothing, use something
> else and comment it".
> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
