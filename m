Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B885C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 21:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E302F608DD;
	Wed,  7 Aug 2024 21:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kCglFOtUzr0; Wed,  7 Aug 2024 21:23:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42FA8608E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42FA8608E9;
	Wed,  7 Aug 2024 21:23:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AC901BF2CA
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 21:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 330F24064F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 21:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EbiFCAg1gVZd for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 21:23:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B13B140632
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B13B140632
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B13B140632
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 21:23:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 975D3240003;
 Wed,  7 Aug 2024 21:22:59 +0000 (UTC)
Date: Wed, 7 Aug 2024 23:22:59 +0200
To: <nick.whitlock@eizo.com>
Message-ID: <20240807232259.6536f3c9@windsurf>
In-Reply-To: <OSAPR01MB4561B7C6E4EB47DADDCDF9E084B82@OSAPR01MB4561.jpnprd01.prod.outlook.com>
References: <20240513155907.104270-1-nick.whitlock@eizo.com>
 <PH1P110MB1603A56A788CF657472E9F8C9FE2A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <OSAPR01MB45613F3A13D852BB4C96256D84E22@OSAPR01MB4561.jpnprd01.prod.outlook.com>
 <20240806233322.679a8d3a@windsurf>
 <OSAPR01MB4561B7C6E4EB47DADDCDF9E084B82@OSAPR01MB4561.jpnprd01.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723065781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLEtUA6/A2XEXawu4cGnHWrnBKAMN1Oe2yTU/KoBfc8=;
 b=fKAltwiXkytE3SfprqJ4F0djZfD+tb6jHxXoyH9awNvvghCd75jFgnTLYm0xGyDyz4iKpN
 LqrZ4Zob7js8oj6x40bFNNIjVwK5tNCkC/0OXjLOiUJDjYi/hrNfhfbr/UhITTzQqkytH5
 pd5OUSy7cP6ExoK2aNmUnv0RbTr9P9O9gyvhq5BxbRHUX5W+nGuFkR+nqWsz4oF/QOinjU
 9KpVBkKtk1denC5U2eSUeN8Dm/aYE0KoB+WauWbxTDhGamWPcni3jZLZQh6vSTCQbUOsBs
 InX8rdsUPA3QA4KsIYJWET3JhP2oSuq9W97G5p7xCR3bYrsfCOYeWLi26YW7tg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fKAltwiX
Subject: Re: [Buildroot] [External] - [PATCH] package/nvidia-driver: bump
 version to 550.78
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
Cc: vfazio@xes-inc.com, yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nick,

On Wed, 7 Aug 2024 17:16:38 +0000
<nick.whitlock@eizo.com> wrote:

> I can look into adding a version selection mechanism.

Awesome, thanks!

> About the GTK acceleration. The library (from my understanding)
> provides GPU hardware acceleration support for GTK so it renders on
> the GPU instead of on the CPU.

But how does it hook up into Gtk to accelerate it?

> Side note:
> Originally when I wrote this patch, I wrote it with the proprietary
> NVIDIA driver in mind. However, I'm now aware of the
> open-kernel-modules package of NVIDIA and I may submit a different
> patch to add support for this (bearing in mind that the open kernel
> modules only supports Ampere and up).

I'd say it's up to you which version(s) you want to add support for, as
long as support for already supported HW is preserved (by using a
version selection). So if you add support for the open kernel modules,
which means only support for Ampere platforms is added, that's fine by
me.

BTW, instead of a version selection, we could also decide to introduce
a separate package. Maybe rename nvidia-driver to nvidia-driver-legacy,
or something similar, and add a new nvidia-driver package. This would
be sensible if the packages are radically different in their "build"
process for example.

I prefer two separate and simple packages than a single convoluted
package that supports two versions, but with in fact nothing shared
between the two versions supported.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
