Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE759C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 11:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CD0282282;
	Wed,  7 Feb 2024 11:27:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1V-pGLUBFe9Y; Wed,  7 Feb 2024 11:27:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A93078374F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A93078374F;
	Wed,  7 Feb 2024 11:27:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9623E1BF2C4
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 824D4402C3
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6dA8b4sX2MDw for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 11:27:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D40FF40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D40FF40025
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D40FF40025
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 11:27:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A147D40005;
 Wed,  7 Feb 2024 11:27:27 +0000 (UTC)
Date: Wed, 7 Feb 2024 12:27:26 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240207122726.2aa4be3c@windsurf>
In-Reply-To: <0fab83c33d4c5d4afe807e78169f68d539bcf5af.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
 <0fab83c33d4c5d4afe807e78169f68d539bcf5af.1706448055.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707305247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15zXiyz684NwBALHY++FpfXv58mdz1kRoNInGjvcN74=;
 b=UPOydmP5URewQuarAZIhbzLEenivZAC0KWj86svxx40jltL0O8iBUGuD3FMFhvarwFoyBw
 sQpLGIcOUk5xWqGTRZ2R3yuJdLRdl0ZxMBIPTieE4YMkXbppVv5rUtcExjXOn/DEhCuPEq
 kFk4sI4oQTKKnlA8KiGvSX0B7BdBxHMqOjkJc3B6c+YFXagJl8rGfCRgTNENyFxn2E/S7n
 X/iNabyqf0i7WQhA+IgjPSKoWIcBsVzgcY4iAVbZolJ4QJSAIM8JWtYDL73PEdVlu7kINn
 hU0FmT/MKf3ULr/uw3CIpVgz34kwaHkPJCIyR7Wb0TCp/Erv0s5+ST/R2UstKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UPOydmP5
Subject: Re: [Buildroot] [PATCH 03/10] package/openssh: fix dependencies
 with refpolicy
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 28 Jan 2024 14:20:52 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit 2c5a82a29ceb(package/openssh: select linux-pam if refpolicy
> upstream is selected) did not account for the linux-pam dependencies
> before selecting it, causing unmet dependencies warnings (unfortunately,
> not errors), such as:
> 
>     $ KCONFIG_SEED=0x8D55903B make randconfig
>     WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBABSEIL_CPP
>       Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n] && BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS [=n]
>       Selected by [y]:
>       - BR2_PACKAGE_RE2 [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]

Seems like this was copy/pasted from the wrong error :-)

Also, as we discussed during the meeting, it seems like we want to:

- Move this select to the refpolicy package

- Handle it as a "soft select" that selects linux-pam if possible, to
  not have some crazy dependencies for a quite corner case (using
  SELinux non a non-glibc system, with a toolchain missing
  locale/wchar, etc.)

Could you rework according to our discussion?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
