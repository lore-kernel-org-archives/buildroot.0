Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820D8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 07:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ACBB40281;
	Mon, 22 Nov 2021 07:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8bEtanIjhIsx; Mon, 22 Nov 2021 07:51:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0DBD40192;
	Mon, 22 Nov 2021 07:51:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 531921BF398
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 07:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4000380F69
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 07:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=boundarydevices.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j_VxOMEFflMK for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 07:51:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86E8080EF9
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 07:51:38 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id r130so15341747pfc.1
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 23:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=I0jiFoS4Ha4FlTAhG6T9TuHfo57gLE8V69Uvc8itnqE=;
 b=bB0fZNHYZwhqrgRyuKd4kK2SwVZRXjDbQP3FXAnR9TmlRMOhirAZETT/tRZSkv5J5S
 kL1AhaM6XkbuUeTzu6DfyjTDI4I+H6Ix1rFEoaWCOLXCuP6qNdanKCM++3S4fwkiZw3+
 26CvSNwwvSar1DeuLyUafonfAn0iSvTBVLFbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I0jiFoS4Ha4FlTAhG6T9TuHfo57gLE8V69Uvc8itnqE=;
 b=vaqIF2gnHamXS+g4Tg5huOHJPZPenk0BVM6F+c9VKwE/stT/Plcfy3PRQKUWYZOEZ7
 oXMjPXAyNE2RZjsretS9ryboT7c0KMBEGtlm8hcVF4qYw9XCWp0WvMb7xDniLQQHNevn
 p70yk4aVlrT9RPXUNTFvQ3LaKwZsLj0R4s7SRCTzpmXp891jKqlEEJW2UqNucMDTSvG4
 Z41hbByXRYbw6qxwE8YR2yMPaN9V7SaKQiEggyx4/d7d1q+jJpkoi9ZY4LhqaJNc2ELz
 NyCaUT9oyMBBXjcS+fWBFlPJnzvEvtbq5ysHSnrGQ6woc9Hun3mXb9czHjqu9hXu7HYk
 /u/g==
X-Gm-Message-State: AOAM533/eWNdcl406/U/XMvRbQ9aXfwR6GPw1hExgy2ObYFMP9+OW+BE
 tIyjpIx2ORKmBlmnrEQCeHnLSA==
X-Google-Smtp-Source: ABdhPJzFbrSLuNHupbre86lPVecdrmVPzoPqx+x+C7ayCGI9E9bJiugabseiKTwnW/3Pl0kVjfnkaw==
X-Received: by 2002:a65:4548:: with SMTP id x8mr25005440pgr.469.1637567497906; 
 Sun, 21 Nov 2021 23:51:37 -0800 (PST)
Received: from p1g2 (2a01cb000f5a8200e371e4a5048c8b22.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f5a:8200:e371:e4a5:48c:8b22])
 by smtp.gmail.com with ESMTPSA id a11sm7605323pfh.108.2021.11.21.23.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 23:51:37 -0800 (PST)
Date: Mon, 22 Nov 2021 08:51:33 +0100
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YZtMBbJdQR2k33Qr@p1g2>
References: <20211119143632.2565197-1-gary.bisson@boundarydevices.com>
 <20211121215846.64208e7d@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211121215846.64208e7d@windsurf>
Subject: Re: [Buildroot] [PATCH] configs/nitrogen8mp: update device trees
 list
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
Cc: chris.dimich@boundarydevices.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Sun, Nov 21, 2021 at 09:58:46PM +0100, Thomas Petazzoni wrote:
> Hello Gary,
> 
> On Fri, 19 Nov 2021 15:36:32 +0100
> Gary Bisson <gary.bisson@boundarydevices.com> wrote:
> 
> > - remove the A0 device tree as this (pre-prod) version of the CPU isn't
> > supported any longer
> > - add '-m4' variant to enable remoteproc api to Cortex-M core
> > - add ENC variants for our ENC carrier [1] (+ 1 with tc358743 support)
> > 
> > [1]
> > https://boundarydevices.com/product/nitrogen8m-plus-enc-carrier-board/
> > 
> > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> 
> Applied to master, thanks!
> 
> > This fixes the build of the kernel for this board as the a0 dtb doesn't
> > exist any more. But I couldn't find any report of the defconfig failing,
> > are those still built regularly?
> 
> It definitely failed recently, see
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045913

I saw this right after sending my email ;) Thanks for merging this fix
quickly!

Thanks,
Gary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
