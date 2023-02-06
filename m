Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594B9C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 13:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C705F60AE8;
	Mon,  6 Feb 2023 13:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C705F60AE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZkwOvfHEe4F; Mon,  6 Feb 2023 13:49:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C9C3605D6;
	Mon,  6 Feb 2023 13:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C9C3605D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5382D1BF2A7
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D17C81271
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D17C81271
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n06uSoIA0iU1 for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 13:49:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B7CC80F59
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B7CC80F59
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 13:49:42 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-15fe106c7c7so15117962fac.8
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 05:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6iA7AB3mRP1w2qz1ZbjPzJDeyBaArnAaQhCLPBh1duM=;
 b=Avrsu5vIXbFowTyEHtbcYBII8o7FScyMcJ7NoX60RDyrmeHEoA58yhxrc3g1aWENth
 WO52VRBr1yTa1dmMZ2+kz2h+Q3tinoUyFLW1IuP72my/ARRZ8uH1c1I06CltJg4dqJkS
 IIVjMIqrADyOxBfd2Lmt1aZxMPbioxL9ZB2psy8K4CggG+ha/pX7lZ+R9Lj0yBHzYPHt
 ckoktpC5EP0YWeKA7KSiynsGMoco8/QkhJahRHtmV7OjQhYedNumZWu94zU8f7PcxfS4
 7fRbUE+fLEUaEmFhPWNANxpRl1Dfd5bWX+a3qqAcyTQibGJkccw5+tVrpSdVXPvHNown
 KRJQ==
X-Gm-Message-State: AO0yUKXFZhnscP9oysYJXX43cj6Btu3pDhX6dD4n8mFNjQ9Bt03kw0Sr
 pQ6x9V7jIWl7zWmh0UKQpLT8VW63V5Qg6keiGitE0Xk23rjO7Q==
X-Google-Smtp-Source: AK7set+j95WJ2a52yhcEdXFw1qdEq6JlDnLl7CfoRFhXhMm3nDln2y8a9tXv3DTY0X0hyCRXwYZWdNeeGhgxOHtKEwM=
X-Received: by 2002:a05:6870:a44f:b0:169:fd7c:d154 with SMTP id
 n15-20020a056870a44f00b00169fd7cd154mr793161oal.93.1675691381204; Mon, 06 Feb
 2023 05:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20230129035232.2480871-1-james.hilliard1@gmail.com>
 <20230129035232.2480871-5-james.hilliard1@gmail.com>
 <87wn4u9atb.fsf@dell.be.48ers.dk>
In-Reply-To: <87wn4u9atb.fsf@dell.be.48ers.dk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 6 Feb 2023 06:49:29 -0700
Message-ID: <CADvTj4q9z1Fo_wNDN4rQejbwWU-AoGov1COfR9YrFV8ymp3T=Q@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6iA7AB3mRP1w2qz1ZbjPzJDeyBaArnAaQhCLPBh1duM=;
 b=M7hQ+G62xpVwcgR7hMJmT2M3y27mcaospIXsvqfL5xfClIFXcZwfRGD2yHF89rwzp8
 j10C0dYkm10rDRKerl1k02/CjDJiYbQJwjDHdwCo7D932s+w0iq3qtT3uA8/QQA3Ky+k
 i/YhUz5m/49a++L1c4m2mCAMcQTFie4vtHUTpZfUo7WLNDNWevUuCjCDmhDyd2Y+ozhh
 oFxnQAIrq3Cev/hPpEKSCWgeMB+jyeFrq+1WugBw8KDOISup9xoeFcAMpZDa/+HlX4yC
 loetmSXqdwi3c4APYkb3YWB0/F+O9dTqGvkvPJhGoG3dnXg3sVpeBiLUh8yOpGNRpgZ8
 sNLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M7hQ+G62
Subject: Re: [Buildroot] [PATCH v2 5/7] package/python-wsproto: new package
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
Cc: yann.morin.1998@free.fr, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Feb 6, 2023 at 6:34 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
>
> Hi,
>
>  > +++ b/package/python-wsproto/Config.in
>  > @@ -0,0 +1,7 @@
>  > +config BR2_PACKAGE_PYTHON_WSPROTO
>  > +    bool "python-wsproto"
>  > +    select BR2_PACKAGE_PYTHON_H11 # runtime
>
> Something missing - We do not have a python-h11 package?

Hmm, yeah, not sure why that didn't get sent before:
https://patchwork.ozlabs.org/project/buildroot/patch/20230206134838.3397457-1-james.hilliard1@gmail.com/

>
> --
> Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
