Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D98BEEB57B
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 16:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA32560BF0;
	Sun, 10 Sep 2023 16:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA32560BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJn9TdUR_MV6; Sun, 10 Sep 2023 16:36:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 169B660F14;
	Sun, 10 Sep 2023 16:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 169B660F14
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44E311BF263
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E3E460BF0
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E3E460BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2fZi5TAAYv5J for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 16:36:18 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B137960BE8
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 16:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B137960BE8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A9B41BF206;
 Sun, 10 Sep 2023 16:36:14 +0000 (UTC)
Date: Sun, 10 Sep 2023 18:36:13 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230910183613.02a16300@windsurf>
In-Reply-To: <20230910142739.555507-1-ju.o@free.fr>
References: <20230910142739.555507-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694363774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=05H6zRn/qwe5biyAF/lrEl56HvbAgzCq3qhlsPIN8bc=;
 b=giO05UKadD9/0lnaw+FP5ePky47XaH/dEg4fVbqAljCyr7v0ntLmypko1MoqK6y6GnWXU4
 nWEv8BgUJnJjpkVwJfjx3ADqX8TNOX+xUplpK/n9DZ2vElmuK6xNgDtQpXF7F26tWCoFIY
 VuUvXLxkYTqM0jRGaNEtyUOhImT3oQ9Yl8JvsYoY116qYjpCuzI9a6Dd/cLLfPqcnw6FWp
 SO1MMUMwngMqilfJQaP65zUgRKdWNUdY4BLPd4dOSmGmPFATyad9e3JYRWUEAZ+WPu6PyH
 +0GTwq1BoDdx+ZIM1H6PXMiWOfAtY1DV7qLTb3lex6u0+8pa7XSpfB+mrs4Ljg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=giO05UKa
Subject: Re: [Buildroot] [PATCH v2 1/1] package/zynaddsubfx: fix build with
 gcc 13
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 10 Sep 2023 16:27:39 +0200
Julien Olivain <ju.o@free.fr> wrote:

> When compiling with gcc 13, build fails with errors, such as:
> 
>     In file included from /build/zynaddsubfx-3.0.6/src/Nio/NulEngine.h:21,
>                      from /build/zynaddsubfx-3.0.6/src/Nio/NulEngine.cpp:14:
>     /build/zynaddsubfx-3.0.6/src/Nio/MidiIn.h:37:9: error: 'uint8_t' does not name a type
>        37 |         uint8_t midiSysEx(unsigned char data);
>           |         ^~~~~~~
> 
> Those gcc 13 changes were announced at:
> https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
> 
> This commit fixes the issue by adding upstream patches, not yet
> included in a release.
> 
> Fixes:
> http://autobuild.buildroot.net/results/97b5a30c7be820ac91e745cf60f9b759e962aa5c
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Changes v1 -> v2:
> - Reworded the commit log to correct the root cause of the issue
>   (v1 was mentioning uclibc. it is in fact gcc-13)
> ---
>  ...1-MidiIn-Add-stdint.h-header-include.patch | 26 +++++++++++++++++
>  ...002-Bank-Add-stdint.h-header-include.patch | 28 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 package/zynaddsubfx/0001-MidiIn-Add-stdint.h-header-include.patch
>  create mode 100644 package/zynaddsubfx/0002-Bank-Add-stdint.h-header-include.patch

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
