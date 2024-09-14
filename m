Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAE4C02180
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 07:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 904928452B;
	Sat, 14 Sep 2024 07:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbzAjkpemhdT; Sat, 14 Sep 2024 07:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80BC184534
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80BC184534;
	Sat, 14 Sep 2024 07:48:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2CDA1BF2EC
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91E5340243
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nL3RKyRTtFwL for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 07:48:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EC2C64023E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC2C64023E
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC2C64023E
 for <buildroot@uclibc.org>; Sat, 14 Sep 2024 07:48:43 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 183EDC13B1
 for <buildroot@uclibc.org>; Sat, 14 Sep 2024 07:43:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92498E0002;
 Sat, 14 Sep 2024 07:43:36 +0000 (UTC)
Date: Sat, 14 Sep 2024 09:43:34 +0200
To: Grant Edwards <grant.b.edwards@gmail.com>
Message-ID: <20240914094334.1228db8e@windsurf>
In-Reply-To: <vc23rg$llm$1@ciao.gmane.io>
References: <vc23rg$llm$1@ciao.gmane.io>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726299817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DA5kZPJdvWPXoWtJJP1Ri2+OyQeUs0PqXSLZFdyYRFs=;
 b=T9zp476A7XprbaeoMoS0/IKQVMlqnPcPCNfbFj9VaeFSgclKZeRy4ScFregZ61nEas8jw3
 LhVaYfA0Xh0Hkncf2tnH4qXln4muWHS4UwsTLx/rbH8MY6eXxSIKh3it7cfqXK2NEGt0op
 R886BJ45Mt9Z/H4QhRWcEbX9ErmS2H485PEdazEipW4kxKguokKrmBAioS14LCsSmclcf3
 zCFp0z3TxUXR0ryY0XsUD+LfNBAGr+iZPug16TGbAYs1PhYPGHCdfmdduY7X/meomCwHk2
 e0RPuRSdWXZSWLjr76TlWgkAtXicPX85NPyL+5JChH+Fpx8kTkKTWLOnPTJDhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T9zp476A
Subject: Re: [Buildroot] Upgrading buildroot and rootfs/kernel compatibility
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Grant,

On Fri, 13 Sep 2024 19:29:52 -0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> I started with a buildroot 2020.02.7 configuration provided by a
> silicon vendor that used a linaro-6.3.1-2017.02 toolchain.  That
> worked OK after I manually upgraded a couple packages that were too
> old to build using my host system's gcc 13.3.
> 
> Now I'm trying to upgrade buildroot to 2024.02.6.  First I tried using
> the same toolchain as above.  That failed. AFAICT, it was because
> Fortran support was enabled in the toolchain, and BF 2024 can't
> tolerate that unless Fortran support is also enabled somewhere else
> (it wasn't clear where).

Do you have more details on what happened? Your explanation "BF 2024
can't tolerate that unless Fortran support is also enabled somewhere
else" is very vague, and I believe using your old toolchain should
normally still work, so I would consider the fact that BR 2024.02
doesn't work with your older toolchain to potentially be a bug.

> Then I tried the "standard" external toolchains listed in the
> 2024.02.6 menuconfig.
> 
> ARM
> 
>    With arm-gnu-toolchain-13.2.rel1 the rootfs built cleanly, but the
>    target panicked as soon as the init process was started. I assume
>    that's some sort of Linux system-call incompatibility between the
>    glibc included in the ARM toolchain and my 4.19.142 kernel (which I
>    think was built using buildroot 2020 -- probably using the Linaro
>    6.3.1-2017.02 toolchain).

This toolchain is using 4.20.x kernel headers, so technically it's a
bit too new for your kernel, even though glibc has some compatibility
stuff. But I believe the problem is probably not here. Maybe the issue
is that your toolchain is an EABI toolchain, while the new one is
definitely EABIhf, and maybe you don't have CONFIG_VFP=y in your
kernel, or something like this? Could you provide your kernel
configuration?

> Linaro
> 
>    With the linaro-7.3.1-2018.05 toolchain, the rootfs builds cleanly
>    and the resulting image appears to work, though it's about 20%
>    larger than before with the same set of packages selected.  Is that
>    sort of size increase typical? (I know, it depends on the
>    packages.)

A 20% increase obviously seems like a lot. Is this only with this
toolchain, or also with the ARM 13.2 toolchain above?

Please note that Buildroot switched from -Os by default to -O2 by
default, so images are generally slightly bigger now, but offer better
performance. However, a 20% increase seems like a lot, and I wouldn't
expect the switch from -Os to -O2 to have caused such a significant
increase in the image size. Is this 20% increase all over the place
(like all binaries are bigger), or can you track it down to some
specific package? Maybe a specific package is now installing a lot more
stuff than it used to. You can track this after doing a full build, by
running "make graph-size", which will collect some nice statistics
information about how much stuff has been installed by each package.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
