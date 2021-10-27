Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5013AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 12:48:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56CC161052
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 12:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56CC161052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E454C80F3B;
	Wed, 27 Oct 2021 12:48:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qmLyBsP2qDpc; Wed, 27 Oct 2021 12:48:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42D6B80E38;
	Wed, 27 Oct 2021 12:48:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A7CB1BF368
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 12:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 173B880DAD
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 12:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IiQYc5tvblwW for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 12:48:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E95B880E38
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 12:48:11 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 x27-20020a9d459b000000b0055303520cc4so3349031ote.13
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vwiMDiueg2c89dVLr5FSyIoEUCC8Ym2FEOW9vHSFFWE=;
 b=Cym8cJCkGaBPb+wlCqkJHmw67uPOqj1Ta1vQfSBgftOEUTI5geSl2yNcaML6jNLn1U
 dT6A+BKtFbkbP14w4vxRDFfIxRK+23B7lbdBxNFa0aoLodvZnKj7DxX9kVsryU4PxQOI
 T5v8dh4HzNLw82w5qzcRfjMyYFF9K9Xba53DtQPBQ120AiXm7r3FbCnreiumVWNXH9Uk
 AMGLjjbhg6FUXQ1wW88gPxhwkx6f8YfnxepipItUg5EzZ4eSzaAtuemfpeiA8g5L1Vqa
 hN/kmafK3ljSLAwnLTcqo6f5GeoLzaUmwdfabZz2IMIkN3RaujnnutiOyS8Gtt6SW6Cc
 RYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vwiMDiueg2c89dVLr5FSyIoEUCC8Ym2FEOW9vHSFFWE=;
 b=lMQPKpnVdXVBtQa0HOmAKd09F6kNmvgEEvR1B4T3vRf2i+Q8XhjK9/uSNPKmEKyOH6
 2KtwdR4/GRFByGSwZ7Z3IIAoVCGRjPGWqklvTovDkL5i3smzaxY9qnaULz/Oa4UoPthA
 ONJoZsGvxatfZipgb2XfCprtfjpXOjHwyL6IxLp1iKCI6iWh0ovkqykj549PI6CIdwiX
 LzqFV1nSwkYsv+yjq3JsUdOJcI9Wf8Befke2ba3c+0NsPyhe1uHqOEkOBC78Dw+Ypiq+
 Pc+4C0ul1UkNB8osb8bJRiCVRa1o8uc/XWJbQZJcjT5PTa/koMcUsQ34Ho3oVHPOE3sX
 mBZw==
X-Gm-Message-State: AOAM531GaEGfx0yWiJv9Zl8m99x+17XqxbbjoV/DFQvdJKaFJMS93p9K
 4/o56fZwrJw8ABCPhnwdKiBTsKv59526U/0ljSU0DNDJ
X-Google-Smtp-Source: ABdhPJxWy8yPDgyxNpbpPAZOde8ABDsueznbRT9erUjQ0BbH7f7tBaKqHKcgKfH3sPih/EpJJAwJiHm8w+0sHcuel4Q=
X-Received: by 2002:a05:6830:410e:: with SMTP id
 w14mr24923216ott.256.1635338890568; 
 Wed, 27 Oct 2021 05:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kskfYMOL39tnF-WsTiFF=dTVSVCnV7MNX72c+ZMN=4_Fg@mail.gmail.com>
In-Reply-To: <CAGm1_kskfYMOL39tnF-WsTiFF=dTVSVCnV7MNX72c+ZMN=4_Fg@mail.gmail.com>
Date: Wed, 27 Oct 2021 14:47:58 +0200
Message-ID: <CAGm1_kscu8-gk-ga=YHU1uMrS+JGWscMh4+-LS=1JDoD=LC4ng@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] python-gobject: wrong module folder
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Oct 26, 2021 at 4:50 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> While trying to build the master brunch, I have encountered the
> following runtime error:
>
> # python sample_python_gobject.py
> Traceback (most recent call last):
>   File "/root/sample_python_gobject.py", line 3, in <module>
>     from gi.repository import GLib
> ModuleNotFoundError: No module named 'gi'
>
> This output comes from the runtime-test:
>
> support/testing/run-tests -d dl -o ci_tests -k
> tests.package.test_python_gobject.TestPythonPy3Gobject
>
> During the configuration stage there is the following meson warning:
>
> Program python3 found: YES (/home/user/br/output/host/bin/python3)
> WARNING: Broken python installation detected. Python files installed
> by Meson might not be found by python interpreter.
> Found pkg-config: /home/user/br/output/host/bin/pkgconf (1.6.3)
> Dependency python found: YES (pkgconfig-fallback)
>
> The problem is that the gobject modules will be installed to
> /usr/lib/python3/dist-packages instead of
> /usr/lib/python3.9/site-package and hence cannot be found by the
> python during the runtime.
>
> Any idea what's going wrong?

I've applied the meson bump patch [1] and this puts the files into
/usr/lib/python3.9/site-packages folder.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20211025064938.2279526-1-james.hilliard1@gmail.com/

Best regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
