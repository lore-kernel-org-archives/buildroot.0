Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968D6C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CC5160D71;
	Sat,  4 Nov 2023 21:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CC5160D71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id POxLZ4JHEj8N; Sat,  4 Nov 2023 21:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7B4C60D78;
	Sat,  4 Nov 2023 21:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7B4C60D78
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 869E61BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B33D418A9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B33D418A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KKD0dLz5DYEl for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:31:43 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 419674180D
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 419674180D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 558F2E0004;
 Sat,  4 Nov 2023 21:31:40 +0000 (UTC)
Date: Sat, 4 Nov 2023 22:31:39 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231104223139.473d6479@windsurf>
In-Reply-To: <20231001143708.964342-1-fontaine.fabrice@gmail.com>
References: <20231001143708.964342-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699133500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KeLaGM3ucw8Vzs8yJ1MrKuhGOMwzsDNWL6ksbXoACu4=;
 b=gpQk+sObNAXncScoaSG9/BG8YaAzlyHHw+ivFxCV4/N8L0SqJc1wIM0u7Ug5I3H+gxgm94
 3Tz3MNyVGw1m1jgO6rb9O1UnnFMrCb+CaNi0NsYYkrClvxloi4dJhLc3ZeHC/2O0SkaACx
 z0cTEYoY90fMStKvOMguIOiPkqdmcmv3SV+IGauTLMmCnXM4u6rEneAjEq7ofZgvfr/Xw+
 VplB5Hk7VmhGmLY+FjwI/pcCIsPbhFcaySMKjyoqRnfNc0dgj0VOz3xo9FK3A3vaTRMI3r
 FcKDFgQlc/HgwKKzLaT1mU9LUjrzUpblPM1+L0ygqVGtKl5g1+cn20AZ88hscA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gpQk+sOb
Subject: Re: [Buildroot] [PATCH 1/1] package/rwmem: fix build with gcc 13
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

On Sun,  1 Oct 2023 16:37:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc 13:
> 
> In file included from ../librwmem/itarget.h:3,
>                  from ../librwmem/i2ctarget.h:4,
>                  from ../librwmem/i2ctarget.cpp:1:
> ../librwmem/helpers.h:51:39: error: 'uint64_t' has not been declared
>    51 | int parse_u64(const std::string& str, uint64_t* value);
>       |                                       ^~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/38f6d0fb007c3dc3c21243721395f85649442407
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../rwmem/0001-include-missing-cstdint.patch  | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/rwmem/0001-include-missing-cstdint.patch

Thanks, but in the mean time, rwmem was bumped to a version that
already includes this fix.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
