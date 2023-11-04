Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FBEC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C60D760DCB;
	Sat,  4 Nov 2023 21:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C60D760DCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJp1KCbZg-8k; Sat,  4 Nov 2023 21:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F30560D71;
	Sat,  4 Nov 2023 21:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F30560D71
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBF331BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C458782171
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C458782171
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eq5P-MhpDoGq for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:13:12 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 259F282149
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 259F282149
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BF16E0003;
 Sat,  4 Nov 2023 21:13:10 +0000 (UTC)
Date: Sat, 4 Nov 2023 22:13:09 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231104221309.051281c5@windsurf>
In-Reply-To: <20231002195159.3053254-1-bernd@kuhls.net>
References: <20231002195159.3053254-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699132390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w578Pgkg7vgOK9gIAS/W+cDlzQ/Ndo2SgHtaptediug=;
 b=AFgevRCGYzPHrZQKYyDlF6of63DwqiA+ynvmg9LdOdepLp9vx/ecaeDLTgUZkzhH0/7E+8
 jMq/NLSUPsd5FZzkJfToLCrsJOODEkE9+rJylYeGyj3whKj2orRt6shJQI6yeBORa+9xOH
 0776gtpi+M7vBUaGJV7A7DbddZ9CZaBXgNjR5lzx7rfyo2/gUQpJgnpo4quP9OKfoK4ZBB
 oaaN6zltWnSRePtqdohA3oaXTmWWg1lddQKHkTz5YAcrLbH8x/JVgeoghdC/xogLbae2um
 /AX1XbLPOQ4hN8Aj6U7oHUQ0wcXvlh2Vou+4SS4TqjNav8NvSsWvJsW3l8HHeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AFgevRCG
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: fix cross build
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

On Mon,  2 Oct 2023 21:51:59 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes build error
> 
> Building dns library in /home/bernd/buildroot/br4/output/build/dhcp-4.4.3-
> P1/bind/bind-9.11.36/lib/dns
> ./gen: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found 
> (required by ./gen)
> make[4]: *** [Makefile:601: include/dns/enumtype.h] Error 1
> make[3]: *** [Makefile:595: include] Error 2
> 
> with this defconfig
> 
> BR2_x86_64=y
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_DHCP=y
> 
> Please note that this build error only occurs when the target and the
> host system have the same arch. For example this defconfig builds fine:
> 
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_DHCP=y
> 
> on a Debian 12 x86_64 host using glibc-2.36:
> 
> $ /lib/ld-linux.so.2  --version
> ld.so (Debian GLIBC 2.36-9+deb12u1) stable release version 2.36.
> 
> The error occurs since buildroot commit 34f8d874ee which bumped glibc
> from 2.37 to 2.38.
> 
> This patch is inspired by the Yocto Project:
> https://patchwork.yoctoproject.org/project/oe/patch/20230715212159.3265080-1-raj.khem@gmail.com/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/dhcp/dhcp.mk | 3 +++
>  1 file changed, 3 insertions(+)

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
