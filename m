Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B58C433EF
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 08:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BDF260AA6;
	Fri, 31 Dec 2021 08:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iL6b3Q_BikMj; Fri, 31 Dec 2021 08:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8A8D60C29;
	Fri, 31 Dec 2021 08:26:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9565A1BF297
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 08:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F32582695
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 08:26:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H3L61KiSt1HQ for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 08:26:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7762081A5F
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 08:26:13 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id by39so44238528ljb.2
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 00:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mBnMzzEmO98Xi9VVe8WVOLPcazJH6tfyAfZz30zasGU=;
 b=RqEwX7rqrvcV3D2pezqnpBLwtS91JkdxsH58ntn9qT02JaS3tYfpKv3Bj0aHBspl43
 3ddvLC0/A9i/aUGgfT+cmuSmhH9VKhk862s68pLF+ukkU5YHAQJ29+K81zidoRX5FOy+
 gUzp0lYtFgGoI+88cUdweNBm5hkW32xCX9RKVeWimnqqq5rK9jwsNEVu1TclcF+LNAu/
 R8DuVhyZaSOHSLhMLSr0Z1D68EPj/ZVqo31luD5Ode4r+FAQq60QnzHT7KnRqir4Y41F
 pdXo7demgkyQHD6ewaQdY3I4HagZtzP7jcbB9k6MTlvGwIuhQBpCPWzzKbNgNN7+pL9W
 saOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mBnMzzEmO98Xi9VVe8WVOLPcazJH6tfyAfZz30zasGU=;
 b=FShWZIWbhQ9zlgRrmGFenlS3Ow/Zo5+eqOdhsefNrN7dVvO70+cYrSh5iVhP/73kAR
 tjFyFNG2o5YjbaIirXtoGatZwnuELEkN3mWdyQkR2ErQjSMTun29t+X2ugY9AuGkG9IJ
 KtvhZ3X9JoJJm939cYKAVwwfoTkAY6dpT0zP7tZ5Ms0R+g5rhQSf538qeF1rhE2OiRUq
 clcASoVYohKCv5Uy4IrRzrZjJdG0DstS74v00sIwmbhwwNBFHJ3EyFIi07JzDgXMMUUF
 flTYEnBCLpFX9c0heZ235D5bC/YLqVCtdUV3VRVS086NwDnIDXoq/HnOyquzUE388OI3
 sYHg==
X-Gm-Message-State: AOAM533vMkD27FnaW4DN/X1gl8FyfWJkiJv4aXeH6C1OntGHtHQjzFMb
 BUR2w52DFJrP0VIqPDDBz6sZuAg/cxY=
X-Google-Smtp-Source: ABdhPJyKUWWiNIhfqoi+GrSKyngP7FIw+2qEHQePXSgRffBFzpgB+TsWvVaGN7YEa1EmbGMZh9nY9w==
X-Received: by 2002:a05:651c:2106:: with SMTP id
 a6mr22037289ljq.285.1640939170850; 
 Fri, 31 Dec 2021 00:26:10 -0800 (PST)
Received: from [10.0.196.136] ([176.10.248.201])
 by smtp.googlemail.com with ESMTPSA id u6sm1786685ljl.55.2021.12.31.00.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 00:26:10 -0800 (PST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211228153345.4087026-1-fontaine.fabrice@gmail.com>
 <20211228164916.2beec0d6@windsurf>
 <CAPi7W80OfGF3AhM2h6mjtsUjLEnYEV4gteJ12GFq4edNysEV5A@mail.gmail.com>
 <20211228181447.2a42dc86@windsurf>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <ed10db1b-6b39-344d-8c4b-aa0a6d085d40@gmail.com>
Date: Fri, 31 Dec 2021 09:26:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211228181447.2a42dc86@windsurf>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/2] package/mbedtls3: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone!

On 12/28/21 6:14 PM, Thomas Petazzoni wrote:
> On Tue, 28 Dec 2021 18:07:03 +0100 Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>>> An important (and unfortunate point) is that apparently mbedtls3 cannot
>>> be installed side-by-side with mbedtls. At least that's what your
>>> "depends on !BR2_PACKAGE_MBEDTLS" seems to hint.  
>> Indeed, both versions install their headers in include/mbedtls.
>>> This is a major annoyance, and I'm not sure how Linux distributions
>>> will handle this migration if they cannot have mbedtls 2.x and mbedtls
>>> 3.x installed side by side.  
>> 3.0 was released in July.
>> To my knowledge, hiawatha is one of the first package that uses this
>> new API and buildroot will probably be one of the first build system
>> that will provide mbedts3.
>> IMHO, being unable to install both versions side by side is pretty
>> common: we had the same issue with libupnp 1.6.x and libupnp 1.8.x.
>> Concerning libupnp, we even had to revert the possibility to install
>> both versions side by side because it was a "burden to programs
>> linking against libupnp":
>> https://github.com/pupnp/pupnp/commit/07f504c61bd9e4d93eb3d373ffc8527cafe0b9af
> I'm not sure to follow you here. The fact that it's pretty common
> doesn't make it a good solution. It makes the transition period
> absolutely awful.
> With the currently proposed approach, someone who today has a working
> configuration that has hiawatha and belle-sip can conveniently build
> both in the same image. With your patch applied, this is no longer
> possible, due to hiawatha now using mbedtls3, which cannot be installed
> side-by-side with mbedtls.
> This doesn't seem very acceptable for us, and probably is even less
> acceptable for major Linux distributions.

I looked into this, ever so briefly, and without checking with any of
the packages that select BR2_PACKAGE_MBEDTLS.

However, seeing as it is only Hiawatha that requires a version >= 3.0,
for a transition period, we could change it to -DUSE_SYSTEM_MBEDTLS=OFF
and let Hiawatha use its bundled mbedtls instead.


Best regards
 /Joachim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
