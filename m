Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6390DC433F5
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 03:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFBB740396;
	Fri,  6 May 2022 03:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XH7ZChQQhEeE; Fri,  6 May 2022 03:22:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E29734014D;
	Fri,  6 May 2022 03:22:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79B361BF9C2
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 03:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 687F660615
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 03:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sv_JBpimnpHJ for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 03:21:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FB82605B5
 for <buildroot@buildroot.org>; Fri,  6 May 2022 03:21:58 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 6F296440836;
 Fri,  6 May 2022 06:21:00 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1651807260;
 bh=ofON3BxefTqqvEzX8oet0snkpiOjP7BMt39HEK0FJ3o=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=gqDdVv84TsamN3CuR5Q9Fv4rqfGyajJ8k3KaHvwkWOhBw9BtODFZoVPWDYvYJEdTS
 NwzA4vdz83+LtbQq6W2bCE3tc0AfHxWg7H6uL39Yhn3juXf+jJxV/sbCVmOC+Nfq2J
 P7LV3uUpslngsmNzjCxsMdFqFo1PcUUSaQECP3zp7tx8sUvqk0Nd6mYtnDK+E3rOo0
 z8eOny0aJS8HDc5ozL3aFK02Q+hAqJiJZoPLhsp6vfAFplEM5M0W66zyvteEUihVca
 4kndNAFe0a69ojoIvx8eV/5005RWY+ySAtpd+e96rTcPMBBaiT2Pva8xrNnBcVCjHW
 7r8Ym9vyrIvxA==
References: <CAJ+vNU2OM0n2gFGy4K04NjXSQWDeAd434zyVD2vSLXvk4Y6d-Q@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 06 May 2022 06:13:45 +0300
In-reply-to: <CAJ+vNU2OM0n2gFGy4K04NjXSQWDeAd434zyVD2vSLXvk4Y6d-Q@mail.gmail.com>
Message-ID: <878rrfibvx.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] how to get buildroot to update a git repo that has
 changes? (ie building HEAD vs a specific SHA)
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Tim,

On Thu, May 05 2022, Tim Harvey wrote:
> Greetings,
>
> I use buildroot to build a Linux kernel+ramdisk using:
> BR2_LINUX_KERNEL_CUSTOM_GIT=y
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL=<gitrepo>
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION=<gitbranch>
>
> When the upstream branch changes I would like to build that kernel but
> I find that buildroot caches the repo in dl/linux/.git and doesn't
> seem to know how to check to see if there are new commits.
>
> I realize that this is atypical as typically you want to configure
> buildroot for a specific package gitsha/tag.
>
> How would I go about getting buildroot to update the repo? I don't
> particularly want to rm dl/linux I want to instead somehow check to
> see if the repo needs a refresh then refresh it without a massive
> network download.

Using a branch name for _VERSION is not supported. See the rationale in
the manual section 18.6.2, note on LIBFOO_VERSION description.

  https://buildroot.org/downloads/manual/manual.html

You might want to consider using OVERRIDE_SRCDIR to make Buildroot build
your local kernel source tree. See section 8.14.6 in the manual.

Hope this helps,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
