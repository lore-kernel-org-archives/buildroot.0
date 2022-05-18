Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1DEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5E636124A;
	Wed, 18 May 2022 19:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhq1k2W6YKV0; Wed, 18 May 2022 19:17:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E70E6122A;
	Wed, 18 May 2022 19:17:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8309F1BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7253182BF4
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k9d3p1_vewRk for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:17:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E3A482A0B
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:17:24 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id s3so4222538edr.9
 for <buildroot@buildroot.org>; Wed, 18 May 2022 12:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aachMjRzaWRI9GhtMo1sgzZ8s80hUx1v6YS9sfvSPnY=;
 b=L+wkuCqLdoWYd/9WrHujiIHvidZul2BeEK1qpGtMTgmOTThRJpomdM6B+OTN8syd/t
 9uZbj/yhNc+ZZeEwECREniQSVMZrkhaMoF8YEEkFxqX4KjgRLvvNEILWkmCLyxgaB47E
 MfmdCRK+eAbfA2kSUAaYGOfzUGQRud2NijSzjbLHHNITSFBk9hFdlyR1RJhh7BnxJFOH
 dtwnifQ6MXKOLPeEmHZFlTi5kr/KsiLw2dA9s0W2RceMNP5SAfwjEwi1irUy05Pxo7Yw
 QafFZjumdrgENA+FS5Xnbls5t3tvgSUCdbOufalfrI39ZRgJ09nqLjrBIk6Thz9VRKLx
 0GNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aachMjRzaWRI9GhtMo1sgzZ8s80hUx1v6YS9sfvSPnY=;
 b=jQWcVHof2l25eXLq5CjVBU2WJYUANiPZLh90z1UzEoN5MwGSwZhbEXj1Vt/vEySRSE
 IQRh87rTwmqPa8bhEWCnjM/dKxfVEJtbzvI2ra89B4W6JcIb755rQNy1AJlv+57p+l7U
 fdDnx49V2Dez1lvw3pE05CTHUGfIZxMmGW/ysqLVd8AJkgp6oK+sxH/MJjyxIBlZL72m
 p6f261mMiIoYTAtwDe5zR2zRoH76L97Bc3BHoOFv1WrQxCY8QYupMSJMVxilIW+Xz0+J
 GhikeQIxsof2hTQIN1xow2qp5FVngSVWwDt0rwm0VmTxMteeazNaoZdxOJ16VESrO3vi
 kpAA==
X-Gm-Message-State: AOAM533vLWexKSvZJH76SpUI7yM9yPSzQzDZOXgAOmO2QkPGBSfrG4/1
 uWV6cIBybI+PHMcHJkulYqQSgQ==
X-Google-Smtp-Source: ABdhPJz0A0pUPbnHiWB5tmrzKheHETtbkTpjFApdLOUn646/mYnVDEOYTeGsFOH3pP8J5dpxlKgvMQ==
X-Received: by 2002:a05:6402:518c:b0:428:434e:a5be with SMTP id
 q12-20020a056402518c00b00428434ea5bemr1368765edd.177.1652901442338; 
 Wed, 18 May 2022 12:17:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a170907272200b006fe3b954db8sm1236166ejl.199.2022.05.18.12.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 12:17:21 -0700 (PDT)
Message-ID: <f210edc8-09f9-c668-cf1f-19992e5243a2@mind.be>
Date: Wed, 18 May 2022 21:17:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
 <20220514175612.2510884-2-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220514175612.2510884-2-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 02/19]
 package/x11r7/xdriver_xf86-video-amdgpu: fix glamor support
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/05/2022 19:55, Bernd Kuhls wrote:
> Add configure options for glamor support following the logic of the
> xserver_xorg-server package:
> https://git.busybox.net/buildroot/tree/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk#n141
> 
> Fixes:
> http://autobuild.buildroot.net/results/e78/e786118db87f65bdcb913656a7b6d9b3187a212c/
> http://autobuild.buildroot.net/results/a00/a0089ed3abdb0a3712524ae77fc613a4982054ed/
> http://autobuild.buildroot.net/results/541/54193d198efe371bdb19ac4981d631ff1e279717/
> http://autobuild.buildroot.net/results/298/298198c036931b10f7e1046176bd48310ae7455f/
> http://autobuild.buildroot.net/results/4da/4da87d30e6f5a10aafae60abce1b89ed92204a4e/
> http://autobuild.buildroot.net/results/74c/74ceb71bd48ea3a2bf6ff68aec0af76a11662f1f/
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  The rest of the series is for next I think?

  Regards,
  Arnout

> ---
>   .../xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk  | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
> index e7196956a3..6423c03f5f 100644
> --- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
> +++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
> @@ -15,6 +15,12 @@ XDRIVER_XF86_VIDEO_AMDGPU_DEPENDENCIES = \
>   	xorgproto \
>   	xserver_xorg-server
>   
> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yyy)
> +XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS += --enable-glamor
> +else
> +XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS += --disable-glamor
> +endif
> +
>   # xdriver_xf86-video-amdgpu requires O_CLOEXEC
>   XDRIVER_XF86_VIDEO_AMDGPU_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
