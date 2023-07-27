Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E018C001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1287A4025D;
	Thu, 27 Jul 2023 10:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1287A4025D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L36j60lvXKjA; Thu, 27 Jul 2023 10:24:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 437A64014B;
	Thu, 27 Jul 2023 10:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 437A64014B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90A861BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F0264014B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F0264014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cJzrtpfeh8Sv for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:24:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EBA24000B
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EBA24000B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B566240007;
 Thu, 27 Jul 2023 10:24:50 +0000 (UTC)
Date: Thu, 27 Jul 2023 12:24:49 +0200
To: Antoine Tenart <atenart@kernel.org>
Message-ID: <20230727122449.3b7993c6@windsurf>
In-Reply-To: <169045318850.6100.416444363161517133@kwain>
References: <20230726212009.221147-1-thomas.petazzoni@bootlin.com>
 <169044563315.6100.13848963115642161448@kwain>
 <20230727104821.496f8f0b@windsurf>
 <169045318850.6100.416444363161517133@kwain>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690453492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rFILiMboBkURm4ghM/4c2EazvPefVG9YgSKdiGha7N4=;
 b=BQGpuwbVioqaDATGNmeBUcn8TLYaMJcpMAcI8pduxqHkNNKsXeEdXgRJe/j9oUoVPKrOPI
 bEChsyPN95+nqSrrpSYxNFzKJKiZ3XHa+PiXfcz30diqTbkpR6CoLAfzEaOGd/nRyrCR0z
 CEKZ4wkzpAKI+TEfaRPoNdgkD9TPII6X9998dze4gKL6EtBG0Rp021Uc2Yn0eZ1wmtIVO4
 tDDizdZy+G6CV7UnubZovjryiJDDZAV3rnLyEqSolTaZiBern0LGjNBHt4e7At3AoUmycD
 4lOb93Dh5RrNx4n/ig5DsgqW8PxAZ3zDkIagF8P2HL2ylNDLDwznZLikTgabwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BQGpuwbV
Subject: Re: [Buildroot] [PATCH RFC 1/2] utils/docker-run: make it
 compatible with SELinux
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
Cc: Christian Stewart <christian@paral.in>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 27 Jul 2023 12:19:48 +0200
Antoine Tenart <atenart@kernel.org> wrote:

> IIRC --mount was introduced for better consistency in the docker args
> and supporting names parameters (I don't know the full reasoning but
> it's probably linked to supporting APIs -like yaml definitions- in a
> better way?). While doing so they tried to fix issues in --volume and
> labeling files on mount was one of them.
> 
> The issue is both logical and practical: files should be labeled when
> being created (not when being mounted) and relabeling files "magically"
> can cause issues (eg. don't `-v /home:/home:z` !). The reasoning with
> the new --mount option is a directory should be created and configured
> on the host and then only mounted by containers (hence the directory is
> not anymore created if not present when using --mount).
> 
> So here, idk, not a docker expert :) I'd say using relabeling of a
> directory that is under Buildroot's control is probably OK. While
> replying, had a quick look at this and it seems the preferred solution
> would be instead to use the `--security-opt label=disable` option:
> labels would be kept in sync with the host and I guess the goal of using
> Docker here is not for isolating the build but to have a known
> environment. I never played with that option so please investigate
> before switching to it.

Thanks for the hint!

I tried --security-opt label=disable, and it works, at least it fixes
my permission issue, without having to do the z/Z thing. Probably it's
a better option than using z/Z that has the side effect of adding
SELinux labels on all files being mounted? To be honest, I'm not clear
on the consequences of --security-opt label=disable.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
