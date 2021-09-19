Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA988C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 06:21:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D49DC61050
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 06:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D49DC61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B20840457;
	Sun, 19 Sep 2021 06:21:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yT1U8oS-117e; Sun, 19 Sep 2021 06:21:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A07544046D;
	Sun, 19 Sep 2021 06:21:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A57B51BF341
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 06:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 936C140182
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 06:21:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mfX29U5unCr3 for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 06:21:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D679400D1
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 06:21:04 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 97-20020a9d006a000000b00545420bff9eso12065461ota.8
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 23:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ch81yGgziEtidyucxPkeBI+OYM6gE04YyOJOhQbAtW0=;
 b=JSBuOpJEzNT5HJicrH/ZC13FC6a8j5Dl8dIeFNf4Sxk5OzIQ+/ymc6mThknMJ5Hpj8
 0Ml9kR2kyUAbCT4Z8YqIeMleKSw9cVgnaxuMGoQf00ZJZRcUylTJsbIPeIP0h0BISQ8Y
 X/Ua5tjY7h83eh8cKnWxYPUxbA6/FNIcoVdOhhTqt2dncsPnrhKggAdX+5MbGtk4jsbN
 92WtR54FcMusEzFAeK27s80zA8apOulKo0E3+LibUKv9ZkqHcL2gxjuHjKc65LtAdwBP
 5mSnyGjK0U4NNuXjwJe9bZmS5lyrI4aZE5ld9srxv96wuIVw+bLaexj3XlQPjM1ggSPr
 ZcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ch81yGgziEtidyucxPkeBI+OYM6gE04YyOJOhQbAtW0=;
 b=Yd3eoXzWj8blFIedvu9QlPoGTJ5Np7/D04K8Ho4oNMEOBvH6pATCqVtukfuutwI5ty
 8cHDd4T/WCAbqwGS1Sh32CTlY7YHJJCi4E5OaQWFHKZr0Q/YUI+6rEq57CwhVZFJwijx
 sM3z3cLTk8xrg+lZ0MaTLIDHK4cdFvKDbwbeuRjQeedlSQGHXEgvfGba6qLegdI2Sbak
 TtUpYFQf+1nGGxaKz9Eei8P7xhKdoZZJNhwdGg8s6wmcZgYruwLIW1+7VkgIusi3mUi7
 cmOHyUYd10eapKAVMYIC7jSh0cfg25AW+cWUZKXjjmtzNTuSYWW9ljrwI53zm3H0gP82
 jp9w==
X-Gm-Message-State: AOAM532JCuMByVQNPiIH9D4cmEgqEHNPRRMGYPBPGqnIwbnvIi3xBhxI
 Tw2kZwmB/vT+xx+UFscUp4pCdmiDkoRVsw==
X-Google-Smtp-Source: ABdhPJxYMhT57ifcV+HrIj4dcMg9TeMNLrjNtIuvn8fzCc9A7YwgvLp+inCzOxm66QPuabhIdN0kEg==
X-Received: by 2002:a9d:7d90:: with SMTP id j16mr16357334otn.186.1632032463378; 
 Sat, 18 Sep 2021 23:21:03 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com.
 [209.85.167.173])
 by smtp.gmail.com with ESMTPSA id w1sm2804457ott.21.2021.09.18.23.21.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Sep 2021 23:21:02 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id n27so20305678oij.0
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 23:21:01 -0700 (PDT)
X-Received: by 2002:a05:6808:2022:: with SMTP id
 q34mr18409181oiw.153.1632032461772; 
 Sat, 18 Sep 2021 23:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201219153525.1361175-1-thomas.petazzoni@bootlin.com>
 <20201219153525.1361175-6-thomas.petazzoni@bootlin.com>
 <CA+h8R2r_kBmCAF_ZAvF4EWivhXxaU1OBh6N=eAZSB=ZMqtrdow@mail.gmail.com>
 <20210729225000.750b323e@windsurf>
 <CA+h8R2onPMjOuvC0U6iM8QbhuAQQ9=aQ-yB-rWQkCbhpxcdiHw@mail.gmail.com>
 <20210801070830.GP3189549@scaer>
 <CA+h8R2pLN_aYiQ1vp+rTMUsQAcGT88fsAiCC-i9uJpK1y0r4rw@mail.gmail.com>
 <20210801091416.GQ3189549@scaer>
In-Reply-To: <20210801091416.GQ3189549@scaer>
Date: Sat, 18 Sep 2021 23:20:50 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oK8w3ub2MRaQ8AsXpREWh6UZSMnF080d4hnd=4bE5TJw@mail.gmail.com>
Message-ID: <CA+h8R2oK8w3ub2MRaQ8AsXpREWh6UZSMnF080d4hnd=4bE5TJw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2 05/12] support/download/go-post-process:
 implement Go vendoring support
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@lists.buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Anisse Astier <anisse@astier.eu>, Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Yann, all,

Some users are still running into the issue that on their system the
"go mod vendor" process is producing different .tar.gz hashes than on
most other systems. Yann previously checked on this and found that the
access modes are wrong in the "bad" archive:

On Sun, Aug 1, 2021 at 2:14 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> So, what are the differences?
>
> First, looking at the compressed archive is useless. We really need to
> look at the uncompressed archives to see what is going on.
>
>     $ gunzip embiggen-disk-good.tar.gz embiggen-disk-bad.tar.gz

[snip]

> So, the first obvious delta: the access mode. In the 'good' archive, it
> is 0644 (rw-r--r--), while in the 'bad' archive, it is 0664 (rw-rw-r--).
>
> But Buildroot is supposed to enforce the mode, see Makefile:
>
>     70: REQ_UMASK = 0022
>     ...
>     77: ifneq ($(shell umask):$(CURDIR):$(O),$(REQ_UMASK):$(CANONICAL_CURDIR):$(CANONICAL_O))
>     ...
>     83: _all:
>     84:     @umask $(REQ_UMASK) && \
>     85:         $(MAKE) -C $(CANONICAL_CURDIR) --no-print-directory \
>     86:             $(MAKECMDGOALS) $(EXTRAMAKEARGS)

[snip]

> If we can find why the modes are different in your two cases, we can
> probably solve the issue.

Does anyone know a suitable fix for this? I recall there might also
have been some other places where this source of lack of determinism
when making .tar.gz was causing issues.

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
