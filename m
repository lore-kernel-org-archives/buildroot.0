Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D2EC4321E
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 22:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0530F415FA;
	Tue, 29 Nov 2022 22:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0530F415FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6kLzrI3u8Zwt; Tue, 29 Nov 2022 22:27:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D886741675;
	Tue, 29 Nov 2022 22:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D886741675
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D28141BF5AD
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 22:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD45B400DD
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 22:27:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD45B400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d1K4cRypSJTa for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 22:27:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F8B5400EF
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F8B5400EF
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 22:27:04 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d1so24355624wrs.12
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 14:27:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=66bkbgBuMwfNZVb0mh/vjbULhOYZwUfAJE0BiLuQsZU=;
 b=ZwHXMtxA7HSpwEQ6gFf7dzs8/IU9OictXwARa1S81JWBukpKr3/l0Ctpx7sAptZdAl
 NN3rz3h045zllk6g3PDlelGuvBSBNCcfbjyycmKgoyDubTP1v7q1dIBFCDZwiwcZgxek
 2v44i0U28fZeglJVenrW6Nnj2eOTQMjtdnrOxI5nJebUQxgWDnhNJ43eW/KLDi98tg1a
 fyBtDuaSSwoPH4+b4BodsDoY4I7I1lKXv8wyQBR2lolvhsRV5JoWoelD/orQaOUMAFuk
 sduPXhfbDBvwsvjWELwhQgeoGCUh7y1rR6a4DSxXIZ0puS4e2GNi6Fa6Pjvi7EIBxSN6
 W1/Q==
X-Gm-Message-State: ANoB5plbNiW+kq2dqotIeaUWmo1fzuKfuOomjTRmqXB2FNHYu94HR0uv
 2YaYW+3dGvZg+TPssPxyaYQzlzBc9b24Rg==
X-Google-Smtp-Source: AA0mqf7n5hhrTKgVllIr176RNODXk+3rqL6z6cQe5HomP1+q8fY1XBkQ30jx8Fo/DjAtuh/G/gwZRw==
X-Received: by 2002:a05:6000:1702:b0:241:ffc4:dd1c with SMTP id
 n2-20020a056000170200b00241ffc4dd1cmr17697617wrc.538.1669760822398; 
 Tue, 29 Nov 2022 14:27:02 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c4fc200b003cf78aafdd7sm3843400wmq.39.2022.11.29.14.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 14:27:01 -0800 (PST)
Message-ID: <6f429bf8-bbc3-dbe7-4605-d1c8a766631a@mind.be>
Date: Tue, 29 Nov 2022 23:27:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20221128094125.3183141-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20221128094125.3183141-1-buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=66bkbgBuMwfNZVb0mh/vjbULhOYZwUfAJE0BiLuQsZU=;
 b=gYLX5Alw890gO2YEb1TP1zEhcF9Rqzr7LkreGHusrs9NR0QDG8fIYfH5me2VlMRi0h
 kHkH8CFyKsudFJO0EaS4e98VcBchFEyjr60A8qKZIso/Rq/7xNDnj04+Y4h76xjLJTCk
 cCnzr44qYlhOZqVmbeLTk3UJzEkxq6eAgTcgCxydsVs6iLhXekOuHzZPrOloC/Y74iuA
 vPy26Uq5fQ/fvvb/dq+t3FVKcb+SY1g19ehTNZQ9AOt/CPENkS++x14DDH8rn2J4YZ/3
 8kB1IUh0xoLrtYSE4Ljyq+S3wjeYp/4V8hzV5+GsGORAjc6BUPL/MfS97U+DrGDcxR1/
 X7PQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gYLX5Alw
Subject: Re: [Buildroot] [PATCH] package/usbmount: select util-linux logger
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



On 28/11/2022 10:41, Michael Nosthoff via buildroot wrote:
> usbmount has a runtime dependency on "logger" from util-linux.
> Else it will just fail when it tries to log.

  If it is just /bin/logger, that is usually provided by busybox (if 
CONFIG_LOGGER=y). We don't normally add things for stuff provided by busybox, at 
least if it is enabled by our default configuration.

  So, do you maybe have a custom busybox config?

  I've marked the patch as Rejected, feel free to revert if you think this is 
needed after all.

> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 
> ---
> 
> I wasn't sure if it is neccessary to also add
> select BR2_PACKAGE_UTIL_LINUX
> or if this is done automatically.

  No it's not done automatically, you indeed have to add it.

  Regards,
  Arnout

> 
> So please adjust if neccessary.
> ---
>   package/usbmount/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/usbmount/Config.in b/package/usbmount/Config.in
> index 7760356b7c..5145587b7c 100644
> --- a/package/usbmount/Config.in
> +++ b/package/usbmount/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_USBMOUNT
>   	depends on BR2_USE_MMU # lockfile-progs -> liblockfile
>   	depends on BR2_PACKAGE_HAS_UDEV
>   	select BR2_PACKAGE_LOCKFILE_PROGS
> +	select BR2_PACKAGE_UTIL_LINUX_LOGGER
>   	help
>   	  The usbmount package automatically mounts USB mass storage
>   	  devices when they are plugged in, and unmounts them when
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
