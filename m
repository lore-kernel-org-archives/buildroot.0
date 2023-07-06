Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499C3EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 19:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF92641596;
	Thu,  6 Jul 2023 19:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF92641596
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XwQTEvVoRGMe; Thu,  6 Jul 2023 19:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E694740476;
	Thu,  6 Jul 2023 19:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E694740476
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5541F1BF4E6
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 19:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E68782210
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 19:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E68782210
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UrsdKDbib5nc for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 19:10:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ADE382204
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8ADE382204
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 19:10:07 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9741caaf9d4so127348466b.0
 for <buildroot@buildroot.org>; Thu, 06 Jul 2023 12:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688670605; x=1691262605;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VGD/MF/ZQ4PqSVicR2zfkvxMN50JRZsjAjmd2jnY1bw=;
 b=c98dGYpoYbnGfcgq/Ny0C0bN+7vGjMkJPsnblyiaQKGpSNQtZ9GUvwFsE/gbTdpy71
 WlcXMhi3e9snfDPQ4+m9IZDJNcHjvNe87UPIN5QQuqGU8s12/lo8LDLgNOwtFUCnK5N0
 1xaDyWNk8i6BereU5h3mPhtteynDPw7EM8QUPvHwwWGRl0hOpbEEIN2ziOIT4aruHWRI
 ThFoa/fbbyywhTYl3u8B7nQ67YcKYe2jIZOmzua3Zidu6iYn0+PNketNERLBX1U3KwnZ
 va2btq4J9LqD432AWR4xIY6Iqrr8Yxh8kwh+D1Y1CASNnBVnwhwSuN1AXINeyMMtzQi/
 5bHg==
X-Gm-Message-State: ABy/qLYBvEtOFynplRZwPnyDmpP5gx1f9c7esy+VdQy/ETen7Xn6/1qa
 Ow1OIe7PS/Jr58n/QzitSoexQeehNM7yrT5sxkU=
X-Google-Smtp-Source: APBJJlHjT+GUmHm7tna+qYXpOIK3QGhNwzYKRx7KUXrBfmLNX3Doan/GeQ/qdTH9oUpKwIAatx28BQ==
X-Received: by 2002:a17:906:7a1d:b0:96f:7b4a:2904 with SMTP id
 d29-20020a1709067a1d00b0096f7b4a2904mr2791775ejo.3.1688670605420; 
 Thu, 06 Jul 2023 12:10:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 le26-20020a170907171a00b00987e2f84768sm1163484ejc.0.2023.07.06.12.10.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 12:10:04 -0700 (PDT)
Message-ID: <401f56d4-3694-35ba-0f08-935bdec2b665@mind.be>
Date: Thu, 6 Jul 2023 21:10:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Guillermo G <ggalan3@gmail.com>, buildroot@buildroot.org
References: <CAMMZEfypg2ibkon3n34gRqqZzfL7Y0JMGvKU2WJx_ko4LigU9g@mail.gmail.com>
In-Reply-To: <CAMMZEfypg2ibkon3n34gRqqZzfL7Y0JMGvKU2WJx_ko4LigU9g@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1688670605; x=1691262605;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VGD/MF/ZQ4PqSVicR2zfkvxMN50JRZsjAjmd2jnY1bw=;
 b=do3lU2YdPr8TEG5jnTp9HlRkIUwgb+E2y812+oUQnBH3PfnIQT7Oj1MKGgumZB6g5j
 3A4Cei29N8HQIEpkEAQAkmyG439ygZNuXFagPzzwj6RfCK/LyrqsDZexXUoo9SnD3Ecx
 qMsXAcX6DfUoakbYIY0XJlxYNCsOWl+BI6g/Q/XFFAHTkLB58eLgIsq0ul7QpC0JaeFh
 eNs4NtzByY05EATOjNVmWtgC2fc2KpRE4s8vRKS1wVNz2k7VgaX5wzFnZ0Xkh7sdIkEA
 dEuJ7BTiJL6CrEozW4WqJGp0esZyHgzCaZszfjhaFzpyTCa8WiREi/UW6i055no+hjtl
 ZmBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=do3lU2Yd
Subject: Re: [Buildroot] ffmpeg: disable mmal in 64bit arm
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



On 05/07/2023 10:58, Guillermo G wrote:
> Hello! This is my first time writing to the buildroot mailing list, so first 
> thanks everyone for all the work that goes into this project, it's really great.
> 
> I have found a possible error in the ffmpeg configuration (present in 2023.02.1 
> but also in master). Specifically in package/ffmpeg/ffmpeg.mk - Line 284 
> <https://github.com/buildroot/buildroot/blob/11aa7ac8fa3a21dc2476dd09539ea3cf3e48f03d/package/ffmpeg/ffmpeg.mk#L284>.
> 
> I am building for a 64bit ARM target, and mmal is not available for 64bit ARM 
> <https://github.com/raspberrypi/userland/issues/688>, therefore my build crashes 
> because it automatically sets the option --enable-mmal.
> I modified line 285 manually to --disable-mmal which results in a working build 
> and a working ffmpeg buildroot (tested), but I was wondering if it could be 
> fixed for other users.
> 
> @fhunleth <https://github.com/fhunleth> from the Nerves project helped me out to 
> come up with a patch proposal 
> <https://gist.github.com/guillego/6e6c47c93f845d4477c0307dc4c1c772> so that it 
> gets disabled for 64 bit arm targets.

  Bernd sent a patch [1] that does more or less that.

  Applied to master, thanks.

  Regards,
  Arnout

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20230705161042.700055-1-bernd@kuhls.net/


> 
> I've never submitted a patch so I thought it would be best to first search in 
> the mailing list and since I didn't find anything, send an email to see what you 
> think.
> 
> Additional details:
> 
>   * Host: Mac OS. Apple Silicon M1.
>   * Buildroot version: 23.02.1
>   * Target: Raspberry Pi 3A+/Zero 2W
>   * Package for which the build fails: ffmpeg 4.4.4
>   * Error message (simplified):
> 
> -----
>  >>> ffmpeg 4.4.4 Patching libtool
>  >>> ffmpeg 4.4.4 Configuring
> [...ommited verbose...]
> ERROR: mmal not found
> 
> make[1]: *** [package/pkg-generic.mk:283 <http://pkg-generic.mk:283>: 
> /nerves/build/build/ffmpeg-4.4.4/.stamp_configured] Error 1
> make: *** [Makefile:23: _all] Error 2
> -----
> 
> Thanks a lot!
> 
> Best,
> 
> Guillermo
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
