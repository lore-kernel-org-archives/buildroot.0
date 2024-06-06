Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6B9C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 12:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA7B183396;
	Thu,  6 Jun 2024 12:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hdeuBPMluGCu; Thu,  6 Jun 2024 12:17:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACB0D82F9E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACB0D82F9E;
	Thu,  6 Jun 2024 12:17:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13B911BF955
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 12:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A74F4064D
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 12:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hyIkRgaxveB for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 12:17:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F80440347
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F80440347
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F80440347
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 12:17:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 707CE61D4E;
 Thu,  6 Jun 2024 12:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07364C4AF09;
 Thu,  6 Jun 2024 12:17:02 +0000 (UTC)
Mime-Version: 1.0
Date: Thu, 06 Jun 2024 15:17:00 +0300
Message-Id: <D1SXEIDURGPI.291FLGDWJEF5Q@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: aerc 0.17.0
References: <20240606104813.1514-1-jarkko@kernel.org>
 <20240606104813.1514-3-jarkko@kernel.org> <ZmGY9TM0vZez-rCf@landeda>
In-Reply-To: <ZmGY9TM0vZez-rCf@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1717676224;
 bh=ma1p9WNDCrEAakhdk6m3eykqhubJ6dn0dhuKi1bT2Po=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=RupmcBvQMyQ1xXcliKrptz4BcWKM6SHRQVdFoG+0FWfUovyiblXT9XgX8Pb+Gi1IC
 nGUnXZfHPmLsNjqP2RWaaiTYYV3TsvtkK3fKx0xL77PlQENnrpXKX1jjHLh8dvbYS/
 v9tTdMSc/axLBIpCGEPEYQiunbmWuKA2uJ3v9hichpUDKEpZ961k+utadIQx7bxIR8
 SlBzKP/Aim6MYG9D55+0uup1i26bGxFykans1tQ2lieoOo26+SLGBlbs1AY7XBB4Q7
 Cpvr48NW4TqP0NdnRyXYkNvNa2eL4ALif/cCp8iPjFoDIx7AimyK8iItWtqKI+HISt
 gMGS3E/JUclKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=RupmcBvQ
Subject: Re: [Buildroot] [PATCH v2 2/3] package/systemd: bump to version 255
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
Cc: Stefan Berger <stefanb@linux.ibm.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu Jun 6, 2024 at 2:09 PM EEST, Yann E. MORIN wrote:
> Karkko, All,
>
> On 2024-06-06 13:48 +0300, Jarkko Sakkinen spake thusly:
> > The last version with System V init scripts
>
> As far as I know, in Buildroot we do not use that compatibility layer,
> as we do pass the followign option at build: -Dsysvinit-path=

Good to know.

>
> So we should not be impacted by that removal, correct?

Yes.

>
> > and cgroups v1 support.
>
> It's not entirely clear to me how dropping cgroups v1 suport will be
> impactful... AFAIK, the kernel has long had cgroups v2, so virtually all
> systems where we would deply systemd 256+ would have a recent-enough
> kernel.

Yes.

And aforementioned *pcrlock is not crucially important.

BR, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
