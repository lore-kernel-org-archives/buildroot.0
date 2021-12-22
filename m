Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5192CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 17:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E018282B94;
	Wed, 22 Dec 2021 17:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KKEck4U8a4pp; Wed, 22 Dec 2021 17:33:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38F9182AED;
	Wed, 22 Dec 2021 17:33:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E31F91BF27E
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCC7B40AC6
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:33:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vAiauyjhBjFv for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 17:33:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBEEA40AC4
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 17:33:39 +0000 (UTC)
Received: from machine.localnet (lfbn-lyo-1-1484-111.w86-207.abo.wanadoo.fr
 [86.207.51.111])
 by linux.microsoft.com (Postfix) with ESMTPSA id A62FE20B7179;
 Wed, 22 Dec 2021 09:33:38 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A62FE20B7179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1640194419;
 bh=ZeMfeTedx2urbHtEPEGPcRRRa67+Q40I6eR/hhDfhDo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mMAM05MFtIW/lQhrAJ8thXp/kF7QY55IQV5oPdn+Orj5Q7xQHhm03L0MQI0mBCNEb
 M4yP2Z4PTN8vY+sVqA4aF+6QhvVreGEW6yHGJ4HA0yocq+gRpLJNCvFm4KjLwSRzpA
 kLbBPJxunPGfTucdVjEhWrjQ832eQeXEUrlrQ0Fc=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 18:33:36 +0100
Message-ID: <2626485.smBdOIXTmD@machine>
In-Reply-To: <4646c759-075f-e103-c690-6a6a576b8887@mind.be>
References: <20211221145428.43829-1-flaniel@linux.microsoft.com>
 <20211221145428.43829-3-flaniel@linux.microsoft.com>
 <4646c759-075f-e103-c690-6a6a576b8887@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH v1 2/2] linux: Add host-pahole as linux
 dependencies if selected by user.
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Le mardi 21 d=E9cembre 2021, 22:58:29 CET Arnout Vandecappelle a =E9crit :
> On 21/12/2021 15:54, Francis Laniel wrote:
> > If user set BR2_PACKAGE_HOST_PAHOLE, we add host-pahole to linux
> > dependencies in case the user also wants to compile the kernel with
> > CONFIG_DEBUG_BTF_INFO which relies on pahole to generate BTF information
> > used by CO-RE BPF tools.
> > =

> > Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> > ---
> > =

> >   linux/linux.mk                | 6 ++++++
> >   package/pahole/Config.in.host | 2 ++
> >   2 files changed, 8 insertions(+)
> > =

> > diff --git a/linux/linux.mk b/linux/linux.mk
> > index 61fdc0c76c..057d898c86 100644
> > --- a/linux/linux.mk
> > +++ b/linux/linux.mk
> > @@ -120,6 +120,12 @@ ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS),y)
> > =

> >   LINUX_DEPENDENCIES +=3D host-uboot-tools
> >   endif
> > =

> > +# If host-pahole is selected by the user, assume it is needed to creat=
e a
> > custom +# kernel with CONFIG_DEBUG_INFO_BTF.
> > +ifeq ($(BR2_PACKAGE_HOST_PAHOLE),y)
> > +LINUX_DEPENDENCIES +=3D host-pahole
> =

>   This is not a super user-friendly way to do it, but it's hard to do
> better.
> =

>   One way would be to make an explicit Config.in option for it (similar to
> openssl). Or an option that also sets CONFIG_DEBUG_INFO_BTF. But I think
> that adds too much complexity to Buildroot for relatively little gain.
> =

>   Perhaps a better improvement would be to add a check if the config opti=
on
> is set and print a warning if not.
> =

> else
> define LINUX_FIXUP_CONFIG_PAHOLE_CHECK
> 	if grep -q "^CONFIG_DEBUG_INFO_BTF=3Dy" $(KCONFIG_DOT_CONFIG); then \
> 		echo "To use CONFIG_DEBUG_INFO_BTF, enable host-pahole
> (BR2_PACKAGE_HOST_PAHOLE)" 1>&2; \
> 		return 1; \
> 	fi
> endef
> =

> (and add LINUX_FIXUP_CONFIG_PAHOLE_CHECK to the end of
> LINUX_KCONFIG_FIXUP_CMDS).
> =

>   It's still pretty clunky though, so maybe not that much of an
> improvement...
> =

>   Anyway, I'd merge this patch without that change (but no time today).

When I first wrote this patch, I was looking for a solution to add dependen=
cies =

conditionally to Linux kernel CONFIG_ but I did not find it.
Your solution is cool, so I added as well as an option (like one used for =

OpenSSL and libelf).
I will send v2 within 10 minutes.

>   Regards,
>   Arnout
> =

> > +endif
> > +
> > =

> >   ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
> >   define LINUX_XTENSA_OVERLAY_EXTRACT
> >   =

> >   	$(call arch-xtensa-overlay-extract,$(@D),linux)
> > =

> > diff --git a/package/pahole/Config.in.host b/package/pahole/Config.in.h=
ost
> > index e427629632..521874961b 100644
> > --- a/package/pahole/Config.in.host
> > +++ b/package/pahole/Config.in.host
> > @@ -3,4 +3,6 @@ config BR2_PACKAGE_HOST_PAHOLE
> > =

> >   	help
> >   	=

> >   	  Pahole and other DWARF utils.
> > =

> > +	  Select this if you want to build a kernel with CONFIG_DEBUG_INFO_BTF
> > set. +
> > =

> >   	  https://git.kernel.org/pub/scm/devel/pahole/pahole.git
> =

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
