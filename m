Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E67AC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 10:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93F4981E08;
	Wed, 15 Mar 2023 10:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93F4981E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qk3IE_cwFIkT; Wed, 15 Mar 2023 10:48:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE19181E02;
	Wed, 15 Mar 2023 10:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE19181E02
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9545D1BF5E0
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 10:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B7CE60B35
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 10:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B7CE60B35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rixBSupdHi5 for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 10:48:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44E4060B2A
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44E4060B2A
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 10:48:33 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id g18so542759wmk.0
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 03:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678877311;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N/HUclagUv8qPKnAFtstV/DxTOHbgG1YehTZ/MDp24E=;
 b=qW7FTQCy1UCY+7XHbGnd0jVYVBmQHBfcw/Xeby6ieqUwqVzozJstVWrx8A6FpgEmmq
 rJvl6cMzrGUP0ylqRwzJSZn2RsSLQXP/pajEYOiyIuMW/PBLVTniMMAYqclUMl7HAuDf
 NL2aIyUp/4eHnUAAZoYrKf2U4BAoU2XBu/kHB04hdK42J/rWVf3Wfx7r1Ovm97eT0Qm4
 bvlgiULEsgjf+n+w93c1zox+BBMsm4QjgMIw361+lY59TllMaeJylsGKEIwzwHBbR6wp
 NBY6PcgXE7B9VhqZvfX5kNfPWXnxfFMGJIeGh/kqyWWiNryh56hnIJJEmuP3IFr1vJFv
 28Sg==
X-Gm-Message-State: AO0yUKXJMoJL+XEq08IaRDi3FQCJqD5XGEBQ1A0bhZrwzPcDW0u5BSY1
 cBYrq3La5g8x9qm3KqveogYFHSDUFIUedQUAPkM=
X-Google-Smtp-Source: AK7set++uV+XwwRDOmR631660ZsMphmi6sygEAm50kJU8nXGS8PufkkRdqalSpq8jHlQub9PNlzqcQ==
X-Received: by 2002:a05:600c:5398:b0:3ed:2b49:5c77 with SMTP id
 hg24-20020a05600c539800b003ed2b495c77mr6294608wmb.6.1678877311382; 
 Wed, 15 Mar 2023 03:48:31 -0700 (PDT)
Received: from [10.5.2.223]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 bg5-20020a05600c3c8500b003e7f1086660sm1606298wmb.15.2023.03.15.03.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 03:48:31 -0700 (PDT)
Message-ID: <cf691a42-93a9-61f4-54b3-2725ee68abbe@smile.fr>
Date: Wed, 15 Mar 2023 11:48:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230314121507.2597723-1-sebastian.weyer@smile.fr>
 <20230314121507.2597723-3-sebastian.weyer@smile.fr>
 <20230314134710.5cb2c988@windsurf>
From: Sebastian WEYER <sebastian.weyer@smile.fr>
In-Reply-To: <20230314134710.5cb2c988@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678877311;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N/HUclagUv8qPKnAFtstV/DxTOHbgG1YehTZ/MDp24E=;
 b=kx8csXWIk8Vkioi0DTydr51Y2ZG79hz9s1VMdwW29mF8UD2+eSn1RA9FiR8juE1KqE
 r082qUuhWp5HCydZtP9Z/E2+G0assaCflWml6VlMrVFY1ygCrpzG796Ih5RgaOFE10Ed
 u6Tr2DVpn10vmDtz3JsKQCW1Rtsv8YIK25qUfcTj5quwjviz7JRwfE7h6UWmoHe28qqt
 MsUH6rswS2xK93rRaNab0tiP1EElzrcMxSXArRY1Hr0qCNqYtFK+63eMJJVlFUcFb8C9
 qf1q88nDUQsDM//cVIOyxLA6Wbt4/4Qddjwp/v4C52xNMesc8jjJaXl9AM9E4pTWMjvM
 uUVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=kx8csXWI
Subject: Re: [Buildroot] [PATCH 3/4] package/coreutils: rename package
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> As it is proposed, this patch will break existing configurations that
> have BR2_PACKAGE_COREUTILS=y enabled, as the option is being renamed.
>
> A solution to that would be to substitute package/coreutils by a
> virtual package *and* rename package/coreutils into
> package/gnu-coreutils in the same patch.

It's actually what I did initially and then I pulled the two apart because the
commit was very cluttered. I then didn't think about the possible breaking of
existing configurations.

> So I really don't think a virtual package is needed. We can handle the
> two coreutils implementation manually in the very few places where it
> is needed, and perhaps where it does matter for people.

I agree that it is not necessarily needed and considering the few places where
it appears it is manageable manualy. I just thought it could be a nice way to
implement it. If it's not wanted for whatever reason I'll change it, no problem :).

> Virtual packages are not "free" in terms of complexity and code churn.
> In addition, I am almost sure that uutils-coreutils is not a 100%
> drop-in replacement for coreutils. Most likely there are a few tools
> that are missing, or a few options that are not supported, or differ in
> behavior. And virtual packages for which the different implementations
> are not strictly compatible generally cause quite a lot of pain (see
> the mess around libopenssl vs. libressl for example).

I did think about the problem of it not being a drop-in replacement that's why
for now I changed the dependencies of the concerned packages to the new name for
coreutils instead of depending on the virtual package.

Considering what you mentioned earlier, I guess the renaming of
BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES to
BR2_PACKAGE_GNU_COREUTILS_INDIVIDUAL_BINARIES would bring the same kind of
potential breaking of existing configurations so this will need to be handled too.

Best regards,
Sebastian


On 14/03/2023 13:47, Thomas Petazzoni wrote:
> Hello Sebastian,
> 
> On Tue, 14 Mar 2023 13:15:05 +0100
> Sebastian Weyer <sebastian.weyer@smile.fr> wrote:
> 
>> In preparation for the addition of a virtual package providing the
>> coreutils functionality, the package package/coreutils has been renamed
>> to package/coreutils.
>>
>> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> 
> As it is proposed, this patch will break existing configurations that
> have BR2_PACKAGE_COREUTILS=y enabled, as the option is being renamed.
> 
> A solution to that would be to substitute package/coreutils by a
> virtual package *and* rename package/coreutils into
> package/gnu-coreutils in the same patch.
> 
> However, I'd like to challenge the need of turning package/coreutils
> into a virtual package in the first place. Virtual packages are very
> useful for libraries that have multiple implementations, but also a
> large number of users: OpenGL libraries, zlib, openssl, jpeg, etc.
> 
> Coreutils has almost no reverse dependencies in Buildroot:
> 
> package/e2fsprogs/Config.in:    depends on BR2_PACKAGE_COREUTILS  # runtime
> package/e2fsprogs/Config.in:    depends on !BR2_PACKAGE_BASH || !BR2_PACKAGE_COREUTILS \
> package/glslsandbox-player/Config.in:   select BR2_PACKAGE_COREUTILS # runtime (timeout)
> package/opkg-utils/Config.in:   select BR2_PACKAGE_COREUTILS if !BR2_PACKAGE_BUSYBOX # runt
> 
> So I really don't think a virtual package is needed. We can handle the
> two coreutils implementation manually in the very few places where it
> is needed, and perhaps where it does matter for people.
> 
> Virtual packages are not "free" in terms of complexity and code churn.
> In addition, I am almost sure that uutils-coreutils is not a 100%
> drop-in replacement for coreutils. Most likely there are a few tools
> that are missing, or a few options that are not supported, or differ in
> behavior. And virtual packages for which the different implementations
> are not strictly compatible generally cause quite a lot of pain (see
> the mess around libopenssl vs. libressl for example).
> 
> What do you think?
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
