Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF0ED10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAEB781568;
	Sat, 26 Oct 2024 16:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocHgvVoSCF9J; Sat, 26 Oct 2024 16:08:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D036981FD4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D036981FD4;
	Sat, 26 Oct 2024 16:08:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D8D75C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E3C540254
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtJqvWAZBYMi for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:08:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2665C40207
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2665C40207
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2665C40207
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:08:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A89F20002;
 Sat, 26 Oct 2024 16:08:06 +0000 (UTC)
Date: Sat, 26 Oct 2024 18:08:05 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Marek Belisko
 <marek.belisko@open-nandra.com>
Message-ID: <20241026180805.41187e1b@windsurf>
In-Reply-To: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729958886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AH8OK2eq0VI2zo4h2rDrKJfncQQ7LBbcoO9bV0ddySE=;
 b=g/I1qSAomt0LcdJ5+xp1pEpe59MoVoJvp6HD7qe71KIX91BnYUcTPfgIcCNNzTpAhoA1ym
 eaLzbPLuIFOa1sA0quWXOlzoU/YZ2rKHhGaCsp8ZS+G3QP2+BnVhbYrh5njdpXXC0CmasU
 q1mKLWTTy7RNnsc6vAcUefwvXLcXGpWawArD++ubHGi0a1HwJNSU8UyI7NQKzJb0atCDY6
 yyGpRCuSAy6rMxZJU42xlmlyJmSEM3Z2JMvdeTm8ghWwNmT1KEZMGbDSZyusDN4mDsNf/8
 V61oYUpDvMq3em9O02xn9an6pfzQevaYDhoVtC6TEQmT0fbO4tAPAR/hFsZy3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g/I1qSAo
Subject: Re: [Buildroot] [PATCH 00/13] selinux-packages: bump to 3.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Mon, 16 Sep 2024 17:11:53 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> No large changes other than the following:
>   - setools 0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
>     needed to be refactored to work with 4.5.1
> 
>   - The audit package needed to be cleaned up and a new init.d service file
>     added.
> 
> Other than those two things, it's a very straight-forward patch series.
> 
> All SELinux unit tests pass.

Thanks for having run the unit tests, much appreciated!

> Adam Duskett (13):
>   package/libsepol: bump version to 3.7
>   package/libsemanage: bump version to 3.7
>   package/libselinux: bump version to 3.7
>   package/policycoreutils: bump version to 3.7
>   package/checkpolicy: bump version to 3.7
>   package/restorecond: bump version to 3.7
>   package/semodule-utils: bump to version 3.7
>   package/selinux-python: bump to version 3.7
>   package/setools: bump version to 4.5.1
>   package/refpolicy: bump version to 2.20240226
>   package/polkit: bump version to 125

All those patches applied up to here.

>   package/audit/S02auditd: fix shellcheck and check-package warnings
>   package/audit: bump version to 4.0.2

I'll reply on those two ones.

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
