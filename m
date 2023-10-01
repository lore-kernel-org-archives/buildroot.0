Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1C3E78482
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 19:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5181781BC2;
	Sun,  1 Oct 2023 19:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5181781BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rjYAsSl29_td; Sun,  1 Oct 2023 19:16:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5878D820FA;
	Sun,  1 Oct 2023 19:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5878D820FA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3AE571BF588
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 19:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0030660BCB
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 19:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0030660BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PDXLVwKVCqoz for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 19:16:00 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5821260BC7
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 19:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5821260BC7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 094F220003;
 Sun,  1 Oct 2023 19:15:56 +0000 (UTC)
Date: Sun, 1 Oct 2023 21:15:56 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20231001211556.214bf14f@windsurf>
In-Reply-To: <20221012215008.2918444-1-thomas.petazzoni@bootlin.com>
References: <20221012215008.2918444-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696187757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swLtDAFjg56g91XrpNOLmXaHstvwGuoHOJPdie5THek=;
 b=HEpoxf7UsngnVIm+eLLSXywx1beFzOY/ZzOM2sCTcl8vIDrfKzg6AXycPuDSgyOIrSUeu5
 CWO/lvlhgGEHLiSvSyETFPIyGVT4JMk0Qu5278qLITz6LwBwLkq4db/ZVNlCZaMIMV98xo
 NvEHcUPcR57JsoclJpaG2P5hoCNFI0XPbkTO+tTHn0GyAqYYhSrhmXhADsXhpwJUBf/dCa
 9Sh09559gtyJZrxXrh5yajY8YnROXfG2rZDWGAimIAEBJTEHfgVepdPFl90tH953kui9qW
 z0RuObb9Wiy584fbgxgAmXjKUrDCKbMIJCkpsE9wvzK+5MdhvW4uWlJmJlaKwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HEpoxf7U
Subject: Re: [Buildroot] [PATCH] Config.in: introduce BR2_TIME_BITS_64
 option for Y2038 compatibility
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 12 Oct 2022 23:50:08 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Y2038 is now almost only 15 years away, and embedded systems built
> today are potentially going to still be operational in 15 years, and
> even though they are supposed to receive updates by then, we all know
> how things go, and potentially some of these embedded systems will not
> receive any update.
> 
> In 2038, the signed 32-bit representation of time_t used on 32-bit
> architectures will overflow, causing all time-related functions to go
> back in time in a surprising way.
> 
> The Linux kernel has already been modified to support a 64-bit
> representation of time_t on 32-bit architectures, but from a C library
> perspective, the situation varies:
> 
>  - glibc uses this 64-bit time_t representation on 32-bit systems
>    since glibc 2.34, but only if -D_TIME_BITS=64 is
>    specified. Therefore, this commit adds an option to add this flag
>    globally to the build, when glibc is the C library and the
>    architecture is not 64-bit.
> 
>  - musl uses unconditionally a 64-bit time_t representation on 32-bit
>    systems since musl 1.2.0. So there is nothing to do here since
>    Buildroot has been using a musl >= 1.2.0, used since Buildroot
>    2020.05. No Buildroot option is needed here.
> 
>  - uClibc-ng does not support a 64-bit time_t representation on 32-bit
>    systems, so systems using uClibc-ng will not be Y2038 compliant, at
>    least for now. No Buildroot option is needed here.
> 
> It should be noted that being Y2038-compliant will only work if all
> application/library code is correct. For example if an
> application/library stores a timestamp in an "int" instead of using
> the proper time_t type, then the mechanisms described above will not
> fix this, and the application/library will continue to be broken in
> terms of Y2038 support.
> 
> Possible discussions points about this patch:
> 
>  - Should we have an option at all, or should we unconditionally pass
>    -D_TIME_BITS=64, like we have been doing for _FILE_OFFSET_BITS=64
>    for quite some time. The reasoning for having an option is that
>    the mechanism is itself opt-in in glibc, and generally relatively
>    new, so it seemed logical for now to make it optional as well in
>    Buildroot.
> 
>  - Should we show something (a Config.in comment?) in the musl and
>    uClibc-ng case to let the user know that the code is Y2038
>    compliant (musl) or not Y2038 compliant (uClibc-ng). Or should this
>    discussion be part of the Buildroot documentation?
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Config.in           | 16 ++++++++++++++++
>  package/Makefile.in |  3 +++
>  2 files changed, 19 insertions(+)

This was discussed/review during the current hackathon, and in the end
we decided to apply it, so it was pushed to master.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
