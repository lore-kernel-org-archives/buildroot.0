Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF29C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 13:57:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A101E60F24
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 13:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A101E60F24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 419EC60751;
	Sun, 10 Oct 2021 13:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jBSsQES15Mda; Sun, 10 Oct 2021 13:57:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B14E0606A0;
	Sun, 10 Oct 2021 13:57:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 618F01BF403
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 13:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51ADA82BC4
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 13:57:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_WJ7XEChyHk for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 13:57:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4697782BBC
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 13:57:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E024A20003;
 Sun, 10 Oct 2021 13:57:33 +0000 (UTC)
Date: Sun, 10 Oct 2021 15:57:33 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211010155733.09c1367c@windsurf>
In-Reply-To: <20211010091059.GK2081069@scaer>
References: <20211009191646.1076266-1-thomas.petazzoni@bootlin.com>
 <20211009191646.1076266-3-thomas.petazzoni@bootlin.com>
 <20211010091059.GK2081069@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/5] package/gdb: add support for gdb 11.x
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
Cc: Michael Fischer <mf@go-sys.de>, Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 10 Oct 2021 11:10:59 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> This one looks a bit dubious...
> 
> If the host gdb is enabled, then the target gdb is the same version as
> the host version. So, this configuration:
> 
>     BR2_PACKAGE_HOST_GDB=y
>     BR2_PACKAGE_GDB=y
>     BR2_GDB_VERSION_10=y
> 
> will yield a configuration that will force the target gmp, even though
> the target gdb will not use it.
> 
> Or did I miss something?
> 
> I can fix that when applying:
> 
>     select BR2_PACKAGE_GMP if BR2_GDB_VERSION_11

Gah, of course, you're completely right. I thought about this when
starting this work, but then go drowned into all the implications
(adding test cases, changing generate-gitlab-ci-yml, etc.) and forgot
to get back to this.

Do you want me to resend, or will you fix this up when applying?

Thanks for the careful review!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
