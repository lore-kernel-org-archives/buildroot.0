Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD77C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 17:17:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F94760F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 17:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F94760F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E4048398E;
	Tue,  3 Aug 2021 17:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5dJr_RSAnABN; Tue,  3 Aug 2021 17:17:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E9A98397F;
	Tue,  3 Aug 2021 17:17:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E41511BF831
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 17:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D35D08397F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 17:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Js4zwCH-pHI for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 17:17:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C407383976
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 17:17:33 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso2198853wmg.4
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 10:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=IZhTL/M5S5f8ntFsj4nonEgPoUXQOO1pGeo2RdxlAuk=;
 b=jpM+LebaM3HR/uMo3f4nzBj95U50gBQg2I+LjpUZ/iILsqBcK/RHT1CViusLh5Ex/K
 40uIJj2T5d4WbTSsQz6WCpA1itJlZ4bwt9v7mXFgOxnQFDxmGfVDs0CkySIDYD4qID8k
 vpptpWRVBgY0mczhihUdmive1NnqEXVQarlpZC9a4NqI3W2u2CE4nZsb7K5wNehLjivD
 1+aHQ80g0fqw9+7nLyNdaKtZ0VGZgf1TOuDcp18hINZS6P/ZkbCSTuk8hPcCWDOfSBo6
 2Cwzsq0ZcoVL1MfccQuhT6IIMlQJsoEKZ0TCMfSoIzh+Qxk6wrdVz+CuU4AOiq1JKz3k
 ZrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=IZhTL/M5S5f8ntFsj4nonEgPoUXQOO1pGeo2RdxlAuk=;
 b=rl2KNjtjJeZMaeQ2Yi6SGrFO28Elczxwmi4KuJb0k0KobOaU3IBAN++vAVzvsOgxEg
 B9g1NTWe7V7zh4L/Ua1rw97KoDSN2sIc1BheUj923Ec3NfiNqKrZnsDYCstoUultDzCJ
 EiPbg7ZLdsv14UHM9h/TiMyRNoBBRTBv9g9IrPXhZ+ZqWsYp7vLW9oGhqZlbs3vo2lsm
 l8xjxseQlDj7nLwVRNH5WntrabVQk7zwl7ze3BJlaQ+Lq/JO3IFc2X6i7eyBTyWWIVPX
 Cc5g04Qh2tBNivaEnpqMVWOr6aZR72+ZeLvCUDvpJc71iIvcsxsRhoHesHI5eQpcLJan
 C6mw==
X-Gm-Message-State: AOAM532q+b0ht+HWPswn0YwuNVdB6AIGyPGbVNpt+KvmHY+QIK9cnDtC
 BzcagMlDH3HIvk+zxRpon5G9WsJr3r1qkur4
X-Google-Smtp-Source: ABdhPJzoKn9P4ezCE52zFRuPVAWDs+TVSGPYKL3l42ulZMEcVmjS+/FliGvV/wZPrGekgEViullfcQ==
X-Received: by 2002:a1c:a543:: with SMTP id o64mr22637804wme.103.1628011051926; 
 Tue, 03 Aug 2021 10:17:31 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id 104sm15684151wrc.4.2021.08.03.10.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 10:17:31 -0700 (PDT)
Date: Tue, 3 Aug 2021 19:17:28 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YQl6KMAf4XfXnfrG@pevik>
References: <20210802172116.10073-1-petr.vorel@gmail.com>
 <2A61C2B3-401F-459C-9DD1-727E041D1A20@benettiengineering.com>
 <YQhEuH0okQM/3P03@pevik> <20210802221341.760ffbf0@windsurf>
 <YQhsdkzd/vbHXA94@pevik> <20210803085745.6c7e4ce2@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803085745.6c7e4ce2@windsurf>
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: Backport yet another
 printf fix
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Thomas,

> On Tue, 3 Aug 2021 00:06:46 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > I believe all 3 patches (2 already merged + this one) should fix the problem.
> > But I was not able to verify it, because ./utils/test-pkg didn't catch even
> > this error (I tested all available toolchains), IMHO -Werror=format=2 and other
> > -Werror are probably only on http://autobuild.buildroot.net/ (not in Buildroot
> > config for users). It'd be great if ./utils/test-pkg had the same CFLAGS.
> > Or have I (again) overlooked something?

> No, the autobuilders don't do anything specific with -Werror CFLAGS.
> The configurations tested by the autobuilders are generated by
> utils/genrandconfig in the Buildroot tree. Besides the obvious package
> randomization, there is some randomization of "global" options:

>     # Per-package folder
>     if randint(0, 15) == 0:
>         configlines.append("BR2_PER_PACKAGE_DIRECTORIES=y\n")

>     # Amend the configuration with a few things.
>     if randint(0, 20) == 0:
>         configlines.append("BR2_ENABLE_DEBUG=y\n")
>     if randint(0, 20) == 0:
>         configlines.append("BR2_ENABLE_RUNTIME_DEBUG=y\n")
>     if randint(0, 1) == 0:
>         configlines.append("BR2_INIT_BUSYBOX=y\n")
>     elif randint(0, 15) == 0:
>         configlines.append("BR2_INIT_SYSTEMD=y\n")
>     elif randint(0, 10) == 0:
>         configlines.append("BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y\n")
>     if randint(0, 20) == 0:
>         configlines.append("BR2_STATIC_LIBS=y\n")
>     if randint(0, 20) == 0:
>         configlines.append("BR2_PACKAGE_PYTHON_PY_ONLY=y\n")
>     if randint(0, 5) == 0:
>         configlines.append("BR2_OPTIMIZE_2=y\n")
>     if randint(0, 4) == 0:
>         configlines.append("BR2_SYSTEM_ENABLE_NLS=y\n")
>     if randint(0, 4) == 0:
>         configlines.append("BR2_FORTIFY_SOURCE_2=y\n")
Thanks for valuable info!
I need to have look into https://git.busybox.net/buildroot-test/.

> For example, did you test with BR2_FORTIFY_SOURCE_2=y ?

> Could you point me to the autobuilder failure that you had, but was not
> able to reproduce with test-pkg ? We should be able to point out the
> difference.
Actually, I thought I submitted 0ce30de72f ("package/nfs-utils: bump to version
2.5.4"), but I didn't thus I did not run the verifies.

I now tested b2857786f1 ("package/nfs-utils: needs uuid") (which I also didn't
submit thus didn't tested and all verifiers are OK. I believe that was the first
build which failed due warning on printf format. And now:

grep ^BR2_FORTIFY_SOURCE_2 ~/br-test-pkg/*/.config
# nothing

I'll try to test next time with snippet with BR2_FORTIFY_SOURCE_2=y.
Anything else it's worth of enabling? E.g. BR2_STATIC_LIBS have at least some of
them, also BR2_FORTIFY_SOURCE_1 (but that's not enough)

> The thing is that test-pkg cannot test all possibilities, it would take
> way too much time.
Understand. I just didn't know about the randomizer on autobuilders. I did
noticed that sometimes error was reported even I was not able to spot it during
test-pkg testing :).

Kind regards,
Petr

> Thomas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
