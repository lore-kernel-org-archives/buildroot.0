Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A95DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:27:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7E6960F5C
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7E6960F5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D17F60758;
	Sat,  9 Oct 2021 20:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xR-E5vTaICnO; Sat,  9 Oct 2021 20:27:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBF6D60732;
	Sat,  9 Oct 2021 20:27:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F19C1BF3C6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5707B82B49
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IdXWq_0PHNnV for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:27:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A95A82B34
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:27:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 494F8FF804;
 Sat,  9 Oct 2021 20:27:45 +0000 (UTC)
Date: Sat, 9 Oct 2021 22:27:44 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20211009222744.365c0233@windsurf>
In-Reply-To: <20211006204133.465875-1-arnout@mind.be>
References: <20211006204133.465875-1-arnout@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC 1/2] toolchain: invert glibc <-> !static
 dependency
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
Cc: Raul Cabello <raul.cabello@suse.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed,  6 Oct 2021 22:41:32 +0200
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> Currently, glibc depends on !BR2_STATIC_LIBS in all the toolchain
> variants.
> 
> However, for some architectures, glibc is the only supported libc.
> Therefore, for these, it's possible to select static libs, at which
> point no libc is selectable any more.
> 
> To overcome this situation, invert the dependency between glibc and
> static libs: BR2_STATIC_LIBS depends on !BR2_TOOLCHAIN_USES_GLIBC, and
> all the dependencies on !BR2_STATIC_LIBS are removed from the glibc
> variants of all toolchains.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=14256
> 
> An alternative (simpler) fix would be to let BR2_STATIC_LIBS depend on
> !BR2_s390x. However, that doesn't solve the problem for the myriad of
> other architectures that only support glibc. In addition, there are some
> architecture variants that only support glibc, etc. etc., which really
> complicates stuff.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

The reason why it was done this way is because the static/shared
decision appears in menuconfig before the toolchain selection. It would
be odd for a user to select "static libs" (which would be possible in
most configurations as we default to uClibc), then to select "glibc"
for the toolchain, do a build, and end up with a non static build.

Obviously, you can tell me that the user could also set glibc as a
toolchain, then go back to the build option, decide to do a static
build, and without notification the toolchain will be changed to uclibc.

So there's no ideal solution.

But then I see your PATCH 2/2, which indeed kind of "resolves" this
questioning.

The only alternative that I could think of is having a hidden boolean
BR2_ARCH_SUPPORTS_STATIC_LIBS, which would be selected by architectures
that support at least one C library that allows static linking. I don't
know if that's better, though.

What you did in this patch + inverting toolchain/build options in PATCH
2 is probably simpler/better.

I have not reviewed the patches carefully, but I'm fine with the
principle.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
