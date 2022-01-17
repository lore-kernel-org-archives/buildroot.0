Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545C3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 13:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9702600CA;
	Mon, 17 Jan 2022 13:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k8OwCNEvs5yu; Mon, 17 Jan 2022 13:51:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0653360BA6;
	Mon, 17 Jan 2022 13:51:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D21E01BF3AA
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 13:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B255E80BD4
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 13:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iXteIxgOXgfX for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 13:51:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0289F80BAB
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 13:51:32 +0000 (UTC)
Received: from machine.localnet (lfbn-lyo-1-1484-111.w86-207.abo.wanadoo.fr
 [86.207.51.111])
 by linux.microsoft.com (Postfix) with ESMTPSA id 3752E20B9130;
 Mon, 17 Jan 2022 05:51:31 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3752E20B9130
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1642427491;
 bh=dNM07W+lifpk3tv1T3rcdRbPmzp5CqEPxIG+XeMjYzw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hkq4NuI7qRGls5ccbKoAXBVY2kMuz1B0NqlrPpMxnfjLq9CfxiieYcx7uWLF9UAVX
 jTX3RnV82iA48dsg3t6SW8WW7TlOxfO+Ps5NF/UYjpcb9LNMuniCclxu7cFfHG7b0x
 YZCaIY06I4PCA1XkozORL90lp5ZXHPo1HeJTBT/A=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jan 2022 14:51:28 +0100
Message-ID: <16263830.Pqoitud5sI@machine>
In-Reply-To: <20220113224126.6b0801dd@windsurf>
References: <20211222174905.71902-1-flaniel@linux.microsoft.com>
 <20211222174905.71902-3-flaniel@linux.microsoft.com>
 <20220113224126.6b0801dd@windsurf>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] linux: add
 BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.


Le jeudi 13 janvier 2022, 22:41:26 CET Thomas Petazzoni a =E9crit :
> Hello,
> =

> On Wed, 22 Dec 2021 18:49:05 +0100
> =

> Francis Laniel <flaniel@linux.microsoft.com> wrote:
> > CONFIG_DEBUG_BTF_INFO relies on pahole, so kernel DWARF are converted to
> > BTF. If CONFIG_DEBUG_BTF_INFO is set and
> > BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE not, an error message is shown and
> > .config is not written.
> > =

> > Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> =

> Thanks, applied, with one change.
> =

> > diff --git a/package/pahole/Config.in.host b/package/pahole/Config.in.h=
ost
> > index e427629632..521874961b 100644
> > --- a/package/pahole/Config.in.host
> > +++ b/package/pahole/Config.in.host
> > @@ -3,4 +3,6 @@ config BR2_PACKAGE_HOST_PAHOLE
> > =

> >  	help
> >  	=

> >  	  Pahole and other DWARF utils.
> > =

> > +	  Select this if you want to build a kernel with CONFIG_DEBUG_INFO_BTF
> > set. +
> =

> I've dropped this, because it's not really this option that should be
> enabled if the kernel is configured with CONFIG_DEBUG_INFO_BTF, but the
> BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE option.

Your modification made the thing clearer, thank you for it!

> Thanks for your contribution!

You are welcome! I thank you for the merge!

> Best regards,

Best regards.
 =

> Thomas




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
