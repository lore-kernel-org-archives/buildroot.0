Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED48EC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 929DE4032E;
	Sun,  6 Feb 2022 10:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kwxMC6VAswdV; Sun,  6 Feb 2022 10:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97642401ED;
	Sun,  6 Feb 2022 10:26:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85B491BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 741A760C22
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4tK2B9O0yppx for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:26:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E57360B6A
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:26:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 25F84240002;
 Sun,  6 Feb 2022 10:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644143174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9SQXEuamhwj8LjtMGMlM7CCuKOjjFcb2gApKtNtXNw8=;
 b=N16ss3n0Av8Bu4zgRw6z7Y9oWViVy9/rn7qJqpJqglX0zHCaHK61JJwXW8//HM63gC9kn4
 M/TQRFsEgZcrpILYh6Xn1x0wRg7fpYV9Ch2shjMuCvUaXxwTGBYW4D18UeP/J44JTAeiu8
 fcdzlXkmfcgAvMfmR0dKGw6sx8ZP0/sZv3PtVyMXvr7LEHT+D1cuCwJ6Is5U+u77iGx7+j
 UNvmt3LuF+RhEvu7qm0s4D5d96I+IgGmouwSx+rhSXOtswO3vfMSsHXEHqcxGjjILiu3C6
 Kle51hXLC16VXkZSrcRYlFsMeuygcGOWQG4x7j2DgrZ42u7QBhnr8imlySvZHg==
Date: Sun, 6 Feb 2022 11:26:13 +0100
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220206112613.2df5a08b@windsurf>
In-Reply-To: <20220203232321.26733-1-ps.report@gmx.net>
References: <20220203232321.26733-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: fix uclibc/musl
 compile with libexecinfo enabled
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  4 Feb 2022 00:23:21 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - depend and link against libexecinfo if enabled to fix linking failure
>   in case execinfo.h is detected, see
>   libcamera-40f5fddca7f774944a53f58eeaebc4db79c373d8/meson.build:
> 
>    32 if cc.has_header_symbol('execinfo.h', 'backtrace')
>    33     config_h.set('HAVE_BACKTRACE', 1)
>    34 endif
> 
> - libexecinfo already depends on !BR2_TOOLCHAIN_USES_GLIBC
> 
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/a1077815895ab847c5ca82ec17c7d13fe97cff53
> 
>   .../powerpc-buildroot-linux-uclibc/bin/ld: src/libcamera/base/libcamera-base.so.p/log.cpp.o: in function `libcamera::Logger::backtrace()':
>   log.cpp:(.text+0x34b0): undefined reference to `backtrace'
>   .../powerpc-buildroot-linux-uclibc/bin/ld: log.cpp:(.text+0x34c0): undefined reference to `backtrace_symbols'
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - preserver original TARGET_LDFLAGS while setting LIBCAMERA_LDFLAGS
> ---
>  package/libcamera/libcamera.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
