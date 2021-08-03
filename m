Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3B1C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 10:04:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2C1D60F58
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 10:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2C1D60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88247402BA;
	Tue,  3 Aug 2021 10:04:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YOL15R7cP84w; Tue,  3 Aug 2021 10:04:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A72F6402BB;
	Tue,  3 Aug 2021 10:04:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76B8E1BF2B0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 10:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AA3160639
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 10:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7h-RsdMTTJIy for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 10:04:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7392860720
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 10:04:17 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id hw6so21616923ejc.10
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 03:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e41qLpe2vjzV7vp+o9kH+mcFfuCgPOFYeqqBpVFzcsM=;
 b=IrEJHftTxYmvsvbM9lXKj2ZkVyvrXfhwKB/GebfIDyveR1R92exRhMtuf24j0AefLD
 TWq+ZZclgEBe9yh5SrmdcuZyf928z9z55Gju29DFisFZc9KcHf3ttg8fNfbZzbthU2zi
 +vrK3FhsQC5QowUA+xJf5kowv/GzVwkXeJt3uTUkIRVjgVmhQs66Jrc1UmlYfopl+N03
 vT61tJwoPZKeGan9/PryZMcErWNT02EBlMqM5YZxNcytMzoVkwXK3ndZpgRgZhNFHWh/
 vOPvxJiV0RwxNziKvLOBKe1Gtpa1iCsQYj18YjsXp25TXOw8wsy0jKe5gMoHhYHgHLX/
 BaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=e41qLpe2vjzV7vp+o9kH+mcFfuCgPOFYeqqBpVFzcsM=;
 b=Ok5ruHkrfaSqklAxcqttqAGwhFFbybfrLxPlXfbDmA7JQ2+df/vbb87tja798TMFyn
 l/dg5SiHOMik9JuO4urjc9g/75O65h5ujjWsCIb52mi9A7Z8bRcm68Zlv1bnrtNIJuoq
 jOTWbuWdsSK2UzUH/uucp/TDByxl2YxRQ9Y/ZWywHWV0GtfrTgLbE0aktAxLVUPPUBOp
 lvAF9brEqOQTBC+2ztsJS6GI/Vx7jtZxGHNN2GkYay35ZyS+s6jNxbPHEVifOzmB8fW+
 /rhZrwZSTLpwpm4Q6N8qFr8zx/D/dPYjgEdGGy1/AgX18SxhjuAW5XUyNWx9erJZNMDf
 5KfA==
X-Gm-Message-State: AOAM533pTkzGpF/fQPsmR86nqJO/uuEDmmkDGNd5uF6D6yPasIHIpBpg
 zSHVPhTWe8wQfuPJ1QC8s4vhJsMevx8W67X9kyQ=
X-Google-Smtp-Source: ABdhPJyD8Pl9iPjYl33GgxvyWpon/KQW7qxsC5mvITNuYnXVkqzht4azkGSR3jIIEmLSHoO+KCapuA==
X-Received: by 2002:a17:906:b855:: with SMTP id
 ga21mr19245034ejb.262.1627985055588; 
 Tue, 03 Aug 2021 03:04:15 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id c21sm5996351ejz.69.2021.08.03.03.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 03:04:15 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20210802060946.C27006062D@smtp3.osuosl.org>
 <20210802234647.6f3df99d@windsurf>
 <0c80668e-d1c0-3516-4a9e-54e6eb32cfd8@benettiengineering.com>
 <20210803092835.0e4d2663@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <3430ac54-09ee-c25f-1dd3-82035c3d87a0@mind.be>
Date: Tue, 3 Aug 2021 12:04:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803092835.0e4d2663@windsurf>
Content-Language: en-GB
Subject: Re: [Buildroot] Some analysis of the major build failure reasons
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 03/08/2021 09:28, Thomas Petazzoni wrote:
[snip]
> Perhaps what I should do is cook a patch that keeps the full build log
> file for builds that use top-level parallel build, so that we have a
> chance to debug these. The problem is going to be the disk-space
> consumption on my server, but I guess I could do something that
> compresses the build log after X days or something like that.

 A simpler solution is to use 'make -Orecurse' or 'make -Otarget'. That keeps
the recursive output together.

 It may not fully help due to the "Waiting for unfinished jobs" bit - the line
with the failed package may appear just before that. But that can be solved by
first searching the "Waiting for unfinished jobs" line and cutting off
everything after it.

[snip]
>> PS: I've found my autobuilders stopped, I think I've forgotten to 
>> restart the daemon after updating the Distro. Now they're up and running.
> 
> OK, thanks. That being said, additional autobuilders at the moment are
> probably not that important: compared to the CPU power made available
> by James through its super high-performance 63 machines, additional
> "regular" machines added to the autobuilder pool are not going to help
> much.

 Additional autobuilders do help because they offer a different build
environment. If there's some autobuild failure that *doesn't* happen on James's
machines, you can be sure that it's due to the build environment.

 Regards,
 Arnout

> 
> However, they are going to definitely help when James will no longer
> have access to those machines.
> 
> Best regards,
> 
> Thomas
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
