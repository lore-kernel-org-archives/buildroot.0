Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EF5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:13:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D91A360F50
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D91A360F50
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FE4B606CF;
	Sun, 19 Sep 2021 07:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HLdXNvQIFeWd; Sun, 19 Sep 2021 07:13:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D05B960684;
	Sun, 19 Sep 2021 07:13:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3FBB81BF314
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DF80403EB
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ju_u1zqfskrn for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 07:13:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55C314036B
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:13:23 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 v20-20020a4a2554000000b0028f8cc17378so4741397ooe.0
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 00:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZtDQ1y5h9FJFHrDN72K8Dic8pk5TrDSH1YdUz+3ogLY=;
 b=hE9IQ9XL/488H1O/cuonRTcjMdSIP/0SoAq51EV/T/WcSGnQvgYoL2o+rf5IMdgN36
 q9Vtfqz6XqfkMPAz4aytHB7bmDt7GE6Ld44kzU83L6ispmXdgztJCex8DmBKOCx4ZxKo
 d1/daTfZOj1mFRsIuKtrO2fND7SnLFmQxqziiRaiNuvI26Xx8vpIdDzxu8TVfwDHtIOP
 uFkovhB94XLjAp4T4xmBxZxPYZ7KLA9l5dtRSPsGemfcZugLygIIe/c6i9wWNqvlf4We
 cvcDaFe5c83SZgIg27k5hl2u5RK34CRKnP5XvI9+sNLrrLhFBwuavXXRoU5ABhQqI9FJ
 rZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZtDQ1y5h9FJFHrDN72K8Dic8pk5TrDSH1YdUz+3ogLY=;
 b=IT8vVWpJUWN0kNcRHbTSm3C61lmE3KSjMx1cQ6BsVyeLaqOaubXf5KeqlOHF9lYEhv
 NfWtRnMcgKJs+UISt+PZD6NhSVmnCGen+s7kBiUCqaV15CXoC5h+VThOiY9/NplLuD3z
 xDRefNp2tLezAkH2UhfAvQl+dHkW4RbyB71i+FuT/YvztwphNtz+ZmzvvW4ZG8x2tgi6
 EH0mUzpY6r2vL3sjR7I47NUyV7986ejhz9djftSbg7KUpZBG9KwuyzICGqy5e9Blny+x
 Liw3swt0avxykczLycuPHXQR4FV/aMg5/KVM4EDBkgQjHuGt5Pfyx2LoJHgpMwndno7+
 O5mA==
X-Gm-Message-State: AOAM533uRGNMfvsRp1oJvBPInkKrrS9Is5a2Y86ka1X6HL4qJLP0rTbC
 JyKv7ujw7hYPqRxrejM0lv1wRs1WqovZCA==
X-Google-Smtp-Source: ABdhPJxOMNuU8f6Oi9c5wtF7GUOXEJc5vATf8GNsxBYNLbo6yc8p2bszLT1XBe3ViklZH2Ggnnc/1A==
X-Received: by 2002:a4a:d185:: with SMTP id j5mr169431oor.16.1632035602258;
 Sun, 19 Sep 2021 00:13:22 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com.
 [209.85.210.51])
 by smtp.gmail.com with ESMTPSA id e28sm1647384otj.51.2021.09.19.00.13.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 00:13:22 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id
 j11-20020a9d190b000000b00546fac94456so2658972ota.6
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 00:13:21 -0700 (PDT)
X-Received: by 2002:a9d:60d5:: with SMTP id b21mr9123285otk.306.1632035601728; 
 Sun, 19 Sep 2021 00:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210919071016.3339939-1-christian@paral.in>
 <20210919071016.3339939-4-christian@paral.in>
In-Reply-To: <20210919071016.3339939-4-christian@paral.in>
Date: Sun, 19 Sep 2021 00:13:10 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oMNTH9U61KBfCkqK=VEZTfwt57NAX_USNqu5t96PKsYQ@mail.gmail.com>
Message-ID: <CA+h8R2oMNTH9U61KBfCkqK=VEZTfwt57NAX_USNqu5t96PKsYQ@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
Subject: Re: [Buildroot] [PATCH-NEXT v2 4/5]
 support/download/go-post-process: implement Go vendoring support
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anisse Astier <anisse@astier.eu>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

All,

Re-submitted this series to fix determinism issues mentioned here:

 - https://github.com/skiffos/SkiffOS/issues/164
 - https://yhbt.net/lore/all/20210801070830.GP3189549@scaer/t/#r2e8e5fab88a021fa81f6d22e44bd6d06ea740c67

On Sun, Sep 19, 2021 at 12:10 AM Christian Stewart <christian@paral.in> wrote:

> +# Helpers for the post-process step to re-pack vendored archives.
> +
> +. "${0%/*}/helpers"
>
>  unpack() {
> -        dest="$1"
> -        tarball="$2"
> +    dest="$1"
> +    tarball="$2"
>
> -        mkdir ${dest}
> -        tar -C ${dest} --strip-components=1 -xf ${tarball}
> +    mkdir ${dest}
> +    tar -C ${dest} --strip-components=1 -xf ${tarball}
>  }

... probably these changes should be in the commit just before this
one, where the file is introduced.

my mistake.

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
