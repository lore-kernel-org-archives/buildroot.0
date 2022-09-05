Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B44FC6FA89
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 07:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 817B280F2C;
	Mon,  5 Sep 2022 07:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 817B280F2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kaLGfKRPdtD0; Mon,  5 Sep 2022 07:08:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FB2680DA8;
	Mon,  5 Sep 2022 07:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FB2680DA8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E013D1BF2A4
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 07:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3AA580DA8
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 07:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3AA580DA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ser7S6zBNin for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 07:08:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86D9380D80
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86D9380D80
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 07:08:02 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id qh18so15117198ejb.7
 for <buildroot@buildroot.org>; Mon, 05 Sep 2022 00:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=p9n8sHHPzDKIwiLllCTSt/axmYxRhBGQERGcxyjKroU=;
 b=Jw76hlYZArljt5itcj1MGByuaZs+/tBzNinXkKW2cVus5w7hOSjOajx8/urljz/e5z
 3FY67d0QmuCPfFC98hktQeXSzzH8twuBck5Yf9BKlMW7cKXTA7h9WJR8T8lNuUmjhzDi
 RNRLesKaGUKYJ9o3vyqaqByQAzFSYp+TVUgycm7rjKjgJRsSHN2VUNH8AsskRR4Oa61u
 CTlg1GPQWcc+gwucIz3sUvVgvztj7eAnZq2CHkAievmBNZdZQI+QjQJHN1Y4xkPsiWHD
 STpba0LMEmsFCwWtRUWWVEkjg/yJ4kelwfVcwXFZLKS5YpL62ejq3Stqv4tesiWBQi+X
 9LJQ==
X-Gm-Message-State: ACgBeo3Y5/FaARixIfdE79GdZcVs9KaaB5mqE784kXwuJGjTwi6UkfWJ
 HBiWoxH8eKfWfubcOJb3YYToNu/5yavPmr8a
X-Google-Smtp-Source: AA6agR78vSI03itRu+8431/TKGccNGnfT7d7oj5wg9kF5AYh+//hqnpy6c/iBReav6bEn3jU96m9ow==
X-Received: by 2002:a17:907:a057:b0:730:a2d8:d5ac with SMTP id
 gz23-20020a170907a05700b00730a2d8d5acmr34056299ejc.764.1662361680558; 
 Mon, 05 Sep 2022 00:08:00 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 b7-20020a05640202c700b0044e91d8ccd2sm1003834edx.50.2022.09.05.00.08.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 00:08:00 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id u6so10039735eda.12
 for <buildroot@buildroot.org>; Mon, 05 Sep 2022 00:08:00 -0700 (PDT)
X-Received: by 2002:a05:6402:4407:b0:447:1026:7537 with SMTP id
 y7-20020a056402440700b0044710267537mr41112752eda.312.1662361680075; Mon, 05
 Sep 2022 00:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220904190218.198854-1-christian@paral.in>
 <20220905090550.23a2a3ff@windsurf>
In-Reply-To: <20220905090550.23a2a3ff@windsurf>
Date: Mon, 5 Sep 2022 00:07:48 -0700
X-Gmail-Original-Message-ID: <CA+h8R2q6uRfYh4JX2e-Z-UJEAcf6zfLEuvOWJ_bSuYS+jkgxWQ@mail.gmail.com>
Message-ID: <CA+h8R2q6uRfYh4JX2e-Z-UJEAcf6zfLEuvOWJ_bSuYS+jkgxWQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=p9n8sHHPzDKIwiLllCTSt/axmYxRhBGQERGcxyjKroU=;
 b=hQQP8xQWiby40Kl6VjdADv3Q9bzmbCP1jQsHbv3jP9kRAqDGHcGrStByI3QoBcOPud
 MmqgvYAWfz0j0DC4J86gaIJ/p41pf6UkB1NTYBtjey6mDgtE0de9+kdKfuY7xsjxMGR9
 seG5OKk5UoyPGWUTeJBp57qjfUfmU1NbWED1yzNVYhhmYHEyCBHIJcQ7llEPoR8q1mch
 Qtz9f/uSYiCbjlW4lODVzMv8DD1fGsFsuMMqEiA6qhq+S0reqIf6yeKJxyvUW/eZfqr1
 EO0pyW5whkDfYUbTINvFuri5xIxAS4wAo1KClU4zPZxFLrRami2BX7pIxNBVcihydBCD
 vPaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=hQQP8xQW
Subject: Re: [Buildroot] [PATCH v1 1/2] package/libyaml: add host package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Mon, Sep 5, 2022 at 12:05 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Sun,  4 Sep 2022 12:02:17 -0700
> Christian Stewart <christian@paral.in> wrote:
>
> > Add a Config.in.host to enable the host-libyaml package.
> >
> > Signed-off-by: Christian Stewart <christian@paral.in>
>
> Why? What is the motivation for enabling host-libyaml through
> menuconfig?

The Jetson AGX Orin flash.sh requires libyaml and enabling it as a
host package in the Buildroot config is the way to add it to the host
dir during the build.

Thanks,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
