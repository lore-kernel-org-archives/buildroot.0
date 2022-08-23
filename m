Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEF3C32789
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5551409B3;
	Tue, 23 Aug 2022 19:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5551409B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e9DpdWS2R26h; Tue, 23 Aug 2022 19:49:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77C394090C;
	Tue, 23 Aug 2022 19:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77C394090C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 767351BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5174860B15
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5174860B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mrFDwKs4NW94 for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:49:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C355605E0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C355605E0
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:49:43 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id d21so10166416eje.3
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 12:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=KSSVLKecTBrZDEXYaAXMr64LuUXkIKOkpC77clFJWT8=;
 b=bLV8atvaAICnqVZL2rsxcDxafkWs+0xYre0Fmnrje764m9zs3rTLr8ZUzfR8xBDDaS
 KUF2tj4WDNxoI58t45fOurQI8lNamCP6M+gRX+4FcLx8qae4G27B2rL8odZOvN58B3r4
 rXIzs4iImTrJPNLsq0mZl9kV4DcQmaP896fo9d4irik9Uxl78Mhj8wtohC2DUI1CIGkW
 oxSg/5qLr9A9UWIn2FLJ236VPgk5wQ1Suc22ZCvDN4uv3gFGdO3HvuR/y8OzMYJ8uqsX
 O9HseVCCefOCpvgzrBtKcchu/saxi4np15KC6m/FW4rbsfNF+8Pe7xrDUXh9h6yHToC+
 UoVg==
X-Gm-Message-State: ACgBeo364H2Rgy6lmE/ciLlaJaX9Uv05RFK6Ga1A7Yr9vqw1WwCA5+os
 Kz/ezUL4y8niUIX0fsBX4IbiLw==
X-Google-Smtp-Source: AA6agR6J+pUlsoLcV9l6mMehMlE5gsthNmSqe6IQuLqyqG4xclGNNhPAPjip9CknWVbUNP+eZgwf1A==
X-Received: by 2002:a17:907:2896:b0:730:983c:4621 with SMTP id
 em22-20020a170907289600b00730983c4621mr760495ejc.502.1661284181186; 
 Tue, 23 Aug 2022 12:49:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a50d0d5000000b0043d6ece495asm1857485edf.55.2022.08.23.12.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 12:49:40 -0700 (PDT)
Message-ID: <47db36a5-f706-0751-c7bc-dd164d8c0071@mind.be>
Date: Tue, 23 Aug 2022 21:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: "Frager, Neal" <neal.frager@amd.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220819063717.33591-1-neal.frager@xilinx.com>
 <20220820151243.GM2167049@scaer>
 <CH2PR12MB50042583296DCDC5716F5ACDF06F9@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20220820191736.GQ2167049@scaer>
 <CH2PR12MB5004EBBE77F6DB8E7661A9A1F0719@CH2PR12MB5004.namprd12.prod.outlook.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <CH2PR12MB5004EBBE77F6DB8E7661A9A1F0719@CH2PR12MB5004.namprd12.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=KSSVLKecTBrZDEXYaAXMr64LuUXkIKOkpC77clFJWT8=;
 b=UScfm8zYJ69JqLx+GMbb+c1xZLCYbJ3I1MaFrH0keF+1BAE8J+98rUpWUN8vduLl+3
 jCnSFuPwJxZRQ9hnUsVv9HPFCERYRY/YgmiRvchQ1QGC7aZH7cDXh2UlTP5wphZTlJXb
 W/Yw4royL3mkx5jaczJrJW1V7Ild1FI9OjP/dMw+V5YYZGrtnt5apgSfDR9FtFJDPtFF
 adg47OUR+oYbvjZeaj5QOqPN6BkPMy/EFr9Edwh4bXT5UzN9ioCQiY8pczkXi5YACnAC
 etLD7aMfa8bI+uVW21niqgxRtR2Sh5l9/uuzyNORQsU0zrtV0j1AaSeQg8ZkRarPnac/
 lvwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UScfm8zY
Subject: Re: [Buildroot] [PATCH v1 1/3] add package/versal-firmware
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/08/2022 12:01, Frager, Neal via buildroot wrote:
> Hi Yann,
> 
[snip]
>> The official default solution (aside from petalinux) is to clone the
>> embeddedsw github location and build the plm.elf and psmfw.elf from
>> that with a microblaze compiler.
>> And then use bootgen to generate a boot.bin.
>> While I can build u-boot and atf easily with buildroot, I do not have
>> a clean solution for building the plm and psmfw images and generating
>> the boot.bin.

  I don't know what the license is of embeddedsw, but if it allows 
redistribution of binaries, it's actually fine to host those binaries in your 
own repository. Just make sure that the repository contains a README explaining 
the situation (including the steps needed to rebuild the binaries), and the 
license files of all the sources that are used.


>> Yeah, I can see it being quite cumbersome. But it is not unheard of in Buildroot already. For example, we have package/arm-gnu-toolchain/ that provides a pre-built armv7 toolchain, that is used to buid the boot/arm-trusted-firmware/ in certain conditions.
> 
>> So, it would be technically possible to package a microblaze compiler like we've done for arm-gnu-toolchain, and use it to build the plm.elf and psmfw.elf from "the embeddedsw".
> 
>> But that is a bit of a stretch to go. Unless...
> 
>> This is why I am looking for a short term solution of just downloading
>> a prebuilt boot.bin.
>> At the moment, distribution of pre-built binaries requires the
>> click-wrap downloading procedure which does not lend itself well for
>> an automated buildroot download.
> 
>> Above, you seemed to imply you were looking internally to lift this click-wrap restriction. If that is not possible, and you can't have the pre-built blobs hosted in an official Xilinx location, then downloading the "embeddedsw" and building them would be a fallback.
> 
> I believe lifting the click-wrap restriction should be possible.  I am working on getting my github officially supported like the ubuntu-firmware github below.
> 
> https://github.com/Xilinx/ubuntu-firmware/
> 
> My goal is to create a github like the following including the LICENSE file with the release location:
> 
> https://github.com/Xilinx/buildroot-firmware/
> 
> There is zero difference in the firmware files I plan to release for buildroot and the ones AMD has released for ubuntu, so it should be possible.

  If there is no difference, why can't you just use the ones from ubuntu-firmware?

  Or does "zero difference" refer to how they are created, rather than the 
binaries themselves?


  Regards,
  Arnout


> 
> Stay tuned as I work on this...
> 
>>> Also, no need for a seaprate macro; just add this code to VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS.
>> Same comment as above.  I was working from other examples of firmware
>> downloading to create this patch set, and I appreciate your feedback
>> for making it simpler.
> 
>> Looking at other examples is a good refelex! :-) But other may install more than one file at a time, so they need this complexity of conditional append-assignments. In your case, it is my understanding that only one file will ever be copied.
> 
>>> In the end, I don't think we should apply this package, as it looks
>>> like it tries to circumvent the official distrobution restrictions
>>> on these firmware files.
>> I understand, and I hope to be able to come up with a solution.
> 
>> Great! In the meantime, as it is a WIP, I've marked the series as changes-requested in patchwork. Thanks for the feedback!
> 
>> If you have any ideas for how buildroot might be able to generate the
>> boot.bin, I am happy to receive any help.
> 
>> I hope the lead I pointed to above will be enough as a starting point for you. Do not hesitate to ask further if you have concerns.
> 
>> Thanks!
> 
>> Regards,
>> Yann E. MORIN.
> 
> Best regards,
> Neal Frager
> AMD
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
