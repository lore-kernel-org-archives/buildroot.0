Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ED8C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 955E040354;
	Sun, 12 May 2024 10:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ou3higOBdpOw; Sun, 12 May 2024 10:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BF5B4044A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BF5B4044A;
	Sun, 12 May 2024 10:16:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B33511BF232
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD11340516
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wnvs-9T3MYR6 for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:16:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 90A0A40354
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90A0A40354
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90A0A40354
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:16:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D13320002;
 Sun, 12 May 2024 10:16:16 +0000 (UTC)
Date: Sun, 12 May 2024 12:16:15 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240512121615.35c7e1f9@windsurf>
In-Reply-To: <20240512100524.15346-1-fontaine.fabrice@gmail.com>
References: <20240512100524.15346-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715508976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cwKEPuVtgIf42IE3WLVjXcMByIlE0o6o/8oWM3/jgk8=;
 b=DdKSNMCAcCrIxqBv0nw+riJBZVPuBO2AFDeHBQ5Aeb6fqdjs1t3Ltc/z5OL9MMb3y/dOXO
 KqkglObDSpPj5X0Oe87r75NZrK7WLBIZc/iw0BSCZmakoniSuPPohPI6j4Moi0XiL19rFL
 iHsR0FKJ1B3ALxmq/alSj5CN3USHqcJyB+Qfl8P0ZXPl3eK/IMXjex0Jfkg3sqtQj646GK
 kalUjx4KQ8YeGge7hiEiJPbOa7VoSwrG45j29QzWOD9NcA/z7Sd31p7f05ABZ/FrdEDQ3C
 1XOHg45zxSPpLJx2omLzoIpG2nUsGDFg1YcJwdJ719uHsGCK4mBsxxaWwOHy1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DdKSNMCA
Subject: Re: [Buildroot] [PATCH v2,
 1/1] toolchain/Config.in: update BR2_TOOLCHAIN_HAS_LIBATOMIC
 dependencies
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 12 May 2024 12:05:24 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update BR2_TOOLCHAIN_HAS_LIBATOMIC dependencies to avoid the following
> build failure with libopenssl and
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE:
> 
> /home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: ./libcrypto.a(libcrypto-lib-threads_pthread.o): in function `CRYPTO_atomic_or':
> threads_pthread.c:(.text+0xfa): undefined reference to `__atomic_is_lock_free'

Thanks, I have applied because the patch makes sense. However, what
about other noMMU architectures that use BR2_BINFMT_FLAT, but don't
produce a libatomic? For example m68k noMMU? Won't they still be broken
with this undefined reference to `__atomic_is_lock_free' ?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
