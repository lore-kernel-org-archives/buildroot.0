Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D4EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 11:54:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D03560E96
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 11:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D03560E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D64F460C1C;
	Wed, 20 Oct 2021 11:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id npDbDSWQ7CN5; Wed, 20 Oct 2021 11:54:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34FE26076D;
	Wed, 20 Oct 2021 11:54:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AAD31BF955
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 11:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A73880ED2
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 11:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3x2SdUaMaYPU for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 11:54:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80C0080ECC
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 11:54:18 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z20so25506218edc.13
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 04:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=63DWY4g7oINCBfBSjWYMBN/47vKtP46lAUBqjYNBW6A=;
 b=NiiISkZge3gLb7aCGhD7QvxsUQMZ9sCaDBXpFl2dJtB8CPiRCn2OuWXU+WZ3bCa6S5
 Ww4EdQXttrAHPy+dReqAQtyLtlzPktLbeDnbNgAnqarIQevhuHvZd+lUGY1TZiyTG6tj
 /xMgAUgm1dND04cX7pDjKvVB5vXKpfOXeS3uyNx8D4NiHuDvlJr1i56JbifHsxwB94uI
 5zAwY2//1Ue9jvJsYkyTo4l5Yu3zzImE2MmVeMZlbtqfJODzotbuIYgiMg8V3Xz2z1S3
 EY+ql0dAIJdLPGBkLp54fY3YuDyGjvElbEIKpuK1eC7M/dpdmqKfdUSHl3sBXkguotmj
 0ycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=63DWY4g7oINCBfBSjWYMBN/47vKtP46lAUBqjYNBW6A=;
 b=VhfFE9yiC2ZthOUnp+Z3RqUT/YgLBQfxH4+UveIQsdYdSypcc2hqdCJUkWZSzYRYlq
 LZcL0XkorqnAD9LXZlVGAj0LPGS0GlI9ClbBqP1YW/0EMVWfUZaKbJ+c2t8wBJY4C7tb
 s8tEcFuHp5ObniGS0OmoMJrj7gso+i/a1zUQbzS8cM2/0r1PL0CZUoLG1r+XByf9BRAd
 J6jou8IuEX9RQJSbqhddtF4EiU7yDTiqU94mHaSk9bxdgq7FqBXjyPz8rV3sAQoaPdjJ
 9k66eP8hEGs9DfVX8ac2f2/PFkJMkOAv66Ez/LNgmD4D2Kf2ffqcvmuXf8g5//9Vnv99
 vMpg==
X-Gm-Message-State: AOAM531kvgnFG3ofZP/rjBxruxp6ZrOxu9/N2Q6JXtmiQ7agdYkr10BL
 w1PSLeu6yWupB8ocjmCYs7r/Olm0RR9iBXRl
X-Google-Smtp-Source: ABdhPJzf79Fx5WvXL3giKnDpT4DcpWnnYHcaBMFo0+QKyHN4rQb4v/fSqaMkppcDgQ+rHN8NmbiJwg==
X-Received: by 2002:a17:906:a1da:: with SMTP id
 bx26mr45871032ejb.558.1634730856560; 
 Wed, 20 Oct 2021 04:54:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b2sm945761ejz.119.2021.10.20.04.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 04:54:15 -0700 (PDT)
Message-ID: <107f4e64-9a30-0b86-48fc-769cf12976b8@mind.be>
Date: Wed, 20 Oct 2021 13:54:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Steve <sleepy_dog@gmx.de>, buildroot@buildroot.org
References: <trinity-072a3cc2-e02b-45ac-9f17-5037678caabf-1634728973216@3c-app-gmx-bap28>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <trinity-072a3cc2-e02b-45ac-9f17-5037678caabf-1634728973216@3c-app-gmx-bap28>
Subject: Re: [Buildroot] htop - "No btime in /proc/stat: Success"
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



On 20/10/2021 13:22, Steve wrote:
> Hello,
> a Linux image built with a recently downloaded buildroot, starting with the 
> defconfig for RaspberryPi3 and adding some things (htop if it wasn't already, 
> nano, openssh, openvpn; also the linux-menuconfig was altered, concerning USB 
> driver stuff).
> 
> When, in menuconfig, I search with / for htop, it shows that htop and all 
> dependencies are met (all positive dependencies are [=y] and the one negative 
> (static libs) is [=n].
> But when I call htop on the running system, I only get the line given in the topic.
> What could be the problem?

  This is squarely in the "this shouldn't happen" domain...

  Is /proc mounted?

  What is the contents of /proc/stat?


  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
