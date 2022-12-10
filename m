Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A58C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 04:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D1C960A84;
	Sat, 10 Dec 2022 04:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D1C960A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vOcNfMwrdPiS; Sat, 10 Dec 2022 04:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BCEC60A79;
	Sat, 10 Dec 2022 04:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BCEC60A79
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1FB01BF291
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 04:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 816AD4109F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 04:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 816AD4109F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EtGsr8OCxcl7 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 04:38:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F9D04094E
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F9D04094E
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 04:38:05 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 u15-20020a17090a3fcf00b002191825cf02so7014263pjm.2
 for <buildroot@buildroot.org>; Fri, 09 Dec 2022 20:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Wi+aq1vNQAOy+E+7n4fBHYEwAPGMlT6tySQD+8tMl4=;
 b=dEFfAXjJcNFfyxBuznwFiZ7hEExFHttTlXuKxzllEjEADeB4GyEJMThwbPSYU+2uLb
 4DqdxbF47I2ftYOxM7qSn1o67tW5cwGOJeHWa7YZZm0cVNMjmfWy374fn15LkyQQN6cW
 A8v92NtvE82DohL62u39XPSbaHv9UCS0y4Sml++Dy2vhpvZ9/jcgtRaW81rpc0yGmOBY
 hzmOMvY37ccJCd66AVI6co1u6W1JFGFgI8VZN/34ef01eM0Yc/gosCON3D5l26giifHi
 i5NM/tMxHz57i1yd2P+1LIbDWQ8Xnv4UDr9ZSQqtELJ3P3z/4vMvHDQnaxOBJ/enS5f/
 SRlw==
X-Gm-Message-State: ANoB5pku+Dkcp2NUr/c4e6CnVFHedbbWJS+HTms+05QCoMDzvBE12SdT
 AMeYnberW8J82rpuM+yoIIhkGxvGXyg=
X-Google-Smtp-Source: AA0mqf41o7klR+ujo0/5XZIJ/XJkmnFS6hWREO/8M8eo86I42TES9Srai/tVJrZrnwptdvmMgRPtFg==
X-Received: by 2002:a17:903:48c:b0:189:5e37:2a2b with SMTP id
 jj12-20020a170903048c00b001895e372a2bmr8285338plb.61.1670647084434; 
 Fri, 09 Dec 2022 20:38:04 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-18.three.co.id.
 [180.214.232.18]) by smtp.gmail.com with ESMTPSA id
 f12-20020a170902684c00b00189ed861791sm2052584pln.266.2022.12.09.20.38.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 20:38:03 -0800 (PST)
Message-ID: <765692ff-7709-8b22-59a9-0280d2a62f8b@gmail.com>
Date: Sat, 10 Dec 2022 11:38:01 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: buildroot@buildroot.org
References: <1670597027-3905-1-git-send-email-gwenj@trabucayre.com>
 <20221209162708.30993bed@windsurf>
 <20221209163250.0a47324b@x230_1.trabucayre.com>
 <20221209163756.118bd1d5@x230_1.trabucayre.com>
 <20221209171025.0ed53d0b@windsurf>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20221209171025.0ed53d0b@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Wi+aq1vNQAOy+E+7n4fBHYEwAPGMlT6tySQD+8tMl4=;
 b=EOxM8I4VBWXPqLsVW8qWS8PTnP11N0MGwvhbxqurew4WYPzDqW9m0/lLSbyJp8sR4X
 /8U4CAMBEK6+1gKVW7tFGlKLxyoTq9k/fTbvp7r+yLTPJTG/np8UQr7JMUv/FDm6TTMQ
 HItFYR76VZadKVecW6otvuiCTIWYA7Ro2CyQXkfuuXeltRDvzYKQQyN21g23RAuOVO9k
 zeFkit2Kd8KNxti8xJ8UG25asISqYZqOxaNI7SRqP3dEhMZVOAZbr+7cjM3KjtjnblSJ
 yUWV2JkUKOaNRN+VuL2NcIX2zDDhJTSMlZcPaqkjrs3wWfGD8nEWRuhEX/5ONJWxlW6o
 aI4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EOxM8I4V
Subject: Re: [Buildroot] [PATCH v2] package/gnuradio: restrict gcc to >=
 9.3.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/9/22 23:10, Thomas Petazzoni via buildroot wrote:
> On Fri, 9 Dec 2022 16:37:56 +0100
> Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com> wrote:
> 
>>> gnuradio ask for 9.3.0 but it's true one may wish to use gcc >= 9.0.0 but < 9.3.0.
>>> I assume a BR2_TOOLCHAIN_HEADERS_AT_LEAST_9_3 must be added to strictly respect this
>>> requirement?  
>> BR2_TOOLCHAIN_GCC_AT_LEAST_9_3 instead of BR2_TOOLCHAIN_HEADERS_AT_LEAST_9_3 ...
> 
> BR2_TOOLCHAIN_GCC_AT_LEAST_9_3 does not exist. We only have options for
> 5.x, 6.x, 7.x, 8.x, 9.x, etc.
> 

Thus the minimum version is GCC 10 (BR2_TOOLCHAIN_GCC_AT_LEAST_10), right?

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
