Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B07C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5502B80D98;
	Mon, 12 Aug 2024 20:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3bHR6WkyEEL2; Mon, 12 Aug 2024 20:30:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 383DA80DAC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 383DA80DAC;
	Mon, 12 Aug 2024 20:30:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B00A11BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA7F2400B8
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAGIGDczUKhD for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:30:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 15CE9400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15CE9400B5
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15CE9400B5
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:30:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 481DE40005;
 Mon, 12 Aug 2024 20:30:20 +0000 (UTC)
Date: Mon, 12 Aug 2024 22:30:19 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240812223019.48ea512a@windsurf>
In-Reply-To: <20240811141356.1201929-1-ju.o@free.fr>
References: <20240811141356.1201929-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723494620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Faazw+nGKsciGIUffqdpp3MoMgQZ2roHf5wbPzh3Msc=;
 b=m9E8cvsRR1ZgOZocTHRfNdw8c7c9BOfB2fo5MnAtv/mNqQql2xLkm6rcQREpvFgMIu/UnK
 c+jg2SIRJtXCGBS8PBqRa/vtfguCKuFzkNpeHhevyGDB4q+iKgsiF11X0HxsTsfMO9jkcr
 SMah9EYQdCEg0aJrTSSuJeivbJ/ULsvj74Bm82gssHkm9y1hxLlXKnPi0P7nYMn71yb7I3
 a9hqJ/WF/AwgnAxwv0+vLck/epISOiGuq/uSmAIK9+OqyKwSxm4sD1E4Z84kSHAS4qFH24
 natSljIL6dv3JjNmvDDQWI6N7eUoLrpBCl5JP2VHggDHpYIoA808tbjFpIDoDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m9E8cvsR
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpg-error: needs MMU
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Aug 2024 16:13:56 +0200
Julien Olivain <ju.o@free.fr> wrote:

> libgpg-error imported code using fork() in commit [1] and enabled it
> soon after in [2]. Those commits were first included in libgpg-error
> version 1.28.
> 
> For reference, the libgpg-error Buildroot package was updated to that
> version in commit [3].
> 
> When Buildroot configuration has no MMU support (e.g. BR2_USE_MMU is
> not set), libgpg-error fails to build with error:
> 
>     /build/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: ./.libs/libgpg-error.a(libgpg_error_la-spawn-posix.o): in function '_gpgrt_process_spawn':
>     spawn-posix.c:(.text+0x630): undefined reference to 'fork'
> 
> This issue can be observed with the command:
> 
>     utils/test-pkg -a -p libgpg-error
> 
> It will show few build failures:
> 
>     ...
>        bootlin-armv7m-uclibc [ 6/41]: FAILED
>     ...
>     bootlin-m68k-5208-uclibc [ 8/41]: FAILED
>     ...
> 
> This commit fixes the issue by adding the package dependency on
> BR2_USE_MMU.
> 
> This commit also propagates this dependency on the libgcrypt and
> libksba packages. They are requiring libgpg-error but had no
> dependency on MMU.
> 
> Finally, for completeness, for all other packages requiring
> libgpg-error which already had the dependency on BR2_USE_MMU, the
> corresponding comment is updated to reflect that change. Namely: gcr,
> gnupg2, libassuan, libgpgme, libostree, netatalk, pinentry, vpnc, and
> wireshark.

Thanks for doing this, but it seems to me that you forgot a number of
packages. Basically all packages that "select BR2_PACKAGE_LIBGPG_ERROR"
need to be fixed. And then once you have this list of packages, you
need check all packages that "select" those packages, and so on
recursively. For example, you forgot package/crda, or package/libbdplus.

But in fact. BR2_USE_MMU is an architecture dependency, so simply
update:

config BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS

to add a "depends on BR2_USE_MMU". This will magically propagate it.

> Note: for simplifity, few packages already depending on
> BR2_USE_MMU but having libgpg-error as an optional dependency are not
> updated (libjcat, mutt and opkg).

Using "optional dependency" here confused me. When I hear "optional
dependency", I usually think about:

ifeq ($(BR2_PACKAGE_LIBGPG_ERROR),y)
FOOBAR_CONF_OPTS += --enable-bla
FOOBAR_DEPENDENCIES += libgpg-error
else
FOOBAR_CONF_OPTS += --disable-bla
endif

So indeed, for libjcat, it's an optional dependency and in such a case,
we really don't care as BR2_PACKAGE_LIBGPG_ERROR will only be "y" if it
can be enabled.

However, for opkg there's a suboption that selects
BR2_PACKAGE_LIBGPG_ERROR, but the main BR2_PACKAGE_OPKG option already
depends on BR2_USE_MMU. I think you should distinguish the two cases,
but the first one really isn't relevant at all in the discussion, while
the second case matters.

Could you rework your patch to simply put the dep into
BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
