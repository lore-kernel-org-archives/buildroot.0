Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638C0C19F2A
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 14:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E181082A26;
	Thu,  4 Aug 2022 14:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E181082A26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x19Zynh63KDD; Thu,  4 Aug 2022 14:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19CF7829B6;
	Thu,  4 Aug 2022 14:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19CF7829B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29CAF1BF32E
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 14:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12963404D8
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 14:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12963404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bFlaGlEsHoOV for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 14:05:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 983AC401B7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 983AC401B7
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 14:05:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9FEC41C0003;
 Thu,  4 Aug 2022 14:05:19 +0000 (UTC)
Date: Thu, 4 Aug 2022 16:05:18 +0200
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20220804160518.75e7a753@windsurf>
In-Reply-To: <26aed3ae6ff8f346b8269669817df0ef@agner.ch>
References: <32cdca079efa80b745bb60af23ad9e99f3cabbf4.1659613508.git.stefan@agner.ch>
 <20220804151207.3ad0fbe1@windsurf>
 <26aed3ae6ff8f346b8269669817df0ef@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659621920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BI45U99DFCe1JPMcil7kh41qrknSSfeWiKEqTLxJ1FE=;
 b=DNnoOy15+KdahcfJNontBon4gdAkb+fxKHo3qcR7ctIJ1fvpqcLXFq1b27NXpiCYxw95ej
 vVCpN/aZf9chAda0GdxcQKK6yHxH068ww9IkzpHl10adonCaVfdZuDg8a0rj1O0NQ+9A4T
 r7VmAoLH5YZ5xbGwEb6wmAn2fx5WfrNc5pRUtgmaFql5V+9zvps5MrADXzF1uubzm0ZTJM
 D1km01CYK+NJ9AkvgEc1yGVT3UCSROSDmgdAfwfTBOGeHo/PIjfcxEwTbb8nJTUJXsycnA
 6Re+mUVkUaQPWf7q9NCejLO23cxn2LwqaF0qYuJgClvan3I9mqUmO/W9bj+aew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DNnoOy15
Subject: Re: [Buildroot] [PATCH] [master] boot/grub2: fix build race
 condition
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
Cc: yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 04 Aug 2022 15:38:28 +0200
Stefan Agner <stefan@agner.ch> wrote:

> > We require all patches to have a proper commit log, with commit title +
> > description, and a Signed-off-by line. Also, we need to have the
> > upstream status of the patch, i.e where it has been submitted (or taken
> > from).  
> 
> The problem is, this patch is not generated from a source repository but
> simply using patch from the release tarball. The source repository does
> not contain Makefile.in, which needs to be patched...
> 
> So a "proper commit log" as such is not possible. I can of course fake
> it and make it look like the patch got generated from a commit, but not
> sure if that is sensible?

Regardless of how the patch is generated, we want it to have a commit
log + description as well as an upstream status.

A basic way:

	tar xf grub-2.06.tar.xz
	cd grub-2.06
	git init
	git add .
	git commit -s -m "Initial import"
	and now do your changes

Of course, it's not going to be a patch that we can apply to the
upstream Git repository, but at least you will have the proper tooling to
create a patch that a commit title, description, SoB and contains an
indicate of its upstream status.

Alternatively, I see you're avoiding autoreconf. Any reason to do so?
Autoreconf doesn't work? (I know with some older grub versions,
autoreconf was problematic, so perhaps it is still the case).

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
