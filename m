Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A98C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:59:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 954A960F11
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 954A960F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2057440344;
	Sun, 26 Sep 2021 20:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3q8oC7nRR_5K; Sun, 26 Sep 2021 20:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DAF140241;
	Sun, 26 Sep 2021 20:59:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 178B11BF20B
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 20:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 141B36071A
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 20:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3WWJsOdEmK1J for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 20:59:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF38160711
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 20:59:33 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x7so45760609edd.6
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 13:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=lt8P1BVZeIDdqodAsBbgJrlRlRoXo0F+fgi/NKsvrpA=;
 b=iAoLrOpLk3gxkAZ3RHUC29LmMI2lCfeqOAPVhY1qmcHCj5menQXR+TFbVRvKFCbMcf
 vWpwoXbENlGcTg4F7Pqa4rcCFXzZurGdVf9OJ5ho0gsoAQOsWwsNzsT8v7/9WWyYLor5
 hnS5UaLIB8bhBWZJ+NR/8vc1rOL0tvSunF37ZyVG8KIBDEyzS7UnuyKtrLplb8Vh68L9
 9g4JaCE0dHNGK3RUWfk082DGGY2rRStz6nNVjooiFyPIwfJuSJWl6juJ1GcS2pmEWMQ0
 EHV1y4vf55etGax5Ba/4WmOPeow5Zo4Ik1Zyo2howD++yp3PLfyAMX7j6u+1hBNs3OrB
 QPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lt8P1BVZeIDdqodAsBbgJrlRlRoXo0F+fgi/NKsvrpA=;
 b=3V7+mERI6c03slaaJNQqFJes0A5iaowCd03gDeUniBG7d65SgjmmshTfGHoXKjy2ZO
 Qzg+K4fo9NYYOpWAIj4iBOYtoPVH+xE5+o4rTn9Gxdn4BiKnhUkTSWtyUi/cUWxoipS1
 lBISCsnvdnM0F7SCSw/VQy5KjhUhA4Rofgv7G+E1a5XLDs5vHVH2L6Qxf1x/ywcUv+Q2
 gPG97AnW2zv7tp8lL6rZgsXOxD9GCM78wvsOH4BVYd6Ww+dq7k5mRlzh7AEPHpNdccHN
 /1rtp4PMefvWPzVlVEpjpwQubWuvvZtFu03qsSJr3C8WDMDBVi083liMaDwULHeL/NpX
 sjXA==
X-Gm-Message-State: AOAM533RDfhQi3Y0vNVbU5EOJR1kVl2CW9ptX0f/MasLM+/hXOsIjzR9
 Cn8oLpTrfsqn58syey4g05Jo8A==
X-Google-Smtp-Source: ABdhPJyC2Jql2hesGrvAZNYZBzrN09L5IjhpT1NR6dsZ2g+4ycO3Xn8vMnazWMdYyQpgcIV9PUnu2g==
X-Received: by 2002:a17:906:a2d4:: with SMTP id
 by20mr23574545ejb.566.1632689971778; 
 Sun, 26 Sep 2021 13:59:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y4sm7703190ejr.101.2021.09.26.13.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 13:59:31 -0700 (PDT)
Message-ID: <c55c6439-1b99-ce07-9ce9-e9e88013b62f@mind.be>
Date: Sun, 26 Sep 2021 22:59:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
References: <20210922083114.545106-1-judge.packham@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210922083114.545106-1-judge.packham@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/micropython: Update LICENSE info
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



On 22/09/2021 10:31, Chris Packham wrote:
> The various micropython ports may include code licensed under different
> licenses compared to the core micropython. List these in MICROPYTHON_LICENSE.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>   package/micropython/micropython.mk | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> index fa28da9be3..7a752efd69 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -6,7 +6,10 @@
>   
>   MICROPYTHON_VERSION = 1.14
>   MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
> -MICROPYTHON_LICENSE = MIT
> +MICROPYTHON_LICENSE = MIT, Apache-2.0, BSD-1-clause, BSD-3-clause, BSD-4-clause, \
> +		      GPL-2.0 with FreeRTOS exception, GPL-2.0+, GPL-2.0, LGPL-3.0-only, \
> +		      MCD-ST Liberty SW License Agreement V2, MIT + BSD-3-clause, OFL-1.1, \
> +		      PJRC.COM, Zlib

  Actually, we don't use most of those in the Unix build. So I've checked 
everything and stripped it down the ones we really do use, which is just BSD-1c, 
BSD-3c and Zlib in addition to MIT.

  Applied both to master with that fixed.

  Regards,
  Arnout

>   MICROPYTHON_LICENSE_FILES = LICENSE
>   MICROPYTHON_DEPENDENCIES = host-pkgconf libffi $(BR2_PYTHON3_HOST_DEPENDENCY)
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
