Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B87BC3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 16:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 349B980D95;
	Sun, 28 Jul 2024 16:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqBvZoL4BEgr; Sun, 28 Jul 2024 16:00:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EE6E80DB4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EE6E80DB4;
	Sun, 28 Jul 2024 16:00:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B27C1BF4DB
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 16:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2689C80D9D
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 16:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wc13GMrY2Cec for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 16:00:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2F4D80DB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2F4D80DB3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2F4D80DB3
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 16:00:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A574E1BF203;
 Sun, 28 Jul 2024 16:00:48 +0000 (UTC)
Date: Sun, 28 Jul 2024 18:00:47 +0200
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <20240728180047.38c594f2@windsurf>
In-Reply-To: <20240728115817.743185-1-dm.chestnykh@gmail.com>
References: <20240728115817.743185-1-dm.chestnykh@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722182448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZD/DQXMPOdtzC8em9MRKsVzqhXvHaW805U20hB3+hb8=;
 b=S81UFDQ4cGHKO6wENvO9H6HdPRm4fyJDuM2ItqkMkpo78MzyFL2j8mx0XgkTz2GoAx3Uwi
 VBTmHV8QpkpwCXgD+G8lmrzuOZg1kollpc6ZD3L1fJhgfozWz0Oj2zQcWul5+c8BbKa0cu
 igu1t/SZ1QdXS/dWriQVsG/AnBhr5wCg3CtkN+2wi89NwIeRgGJsyLRq2U1A95QIJ+dQGE
 gzMi3znMCKQlMVwCREeAyVMZ+gYdSgZxUX/Qt5vXZ1HnMhZPAdcv7uDVcJ/2Lj8LAqF4+E
 kwc6GVLZahoqQsmEDXctvVyiUN+GX/oT+hxf6/k4TB1euU2yUJlesuMmrSZBNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S81UFDQ4
Subject: Re: [Buildroot] [PATCH] package/uclibc: Fix ARC build with 4.x
 kernel headers
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

Hello Dmitry,

On Sun, 28 Jul 2024 14:58:17 +0300
Dmitry Chestnykh <dm.chestnykh@gmail.com> wrote:

> Provide correct grouping for preprocessor
> conditions to avoid building ld.so with
> undefined macroses which are in use
> 
> Fixes
>   package/uclibc/0003-Fix-arc-build-with-4.x-kernel-headers.patch
> Upstream:
>   https://patchwork.ozlabs.org/project/uclibc-ng/patch/20240728115224.725666-1-dm.chestnykh@gmail.com/
> 
> Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>

Thanks for this patch!

I also encountered a SuperH 4 build issue with uClibc-ng:

/builds/buildroot.org/toolchains-builder/build/sh-sh4--uclibc--stable-2024.05-1/lib/gcc/sh4-buildroot-linux-uclibc/13.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: ldso/ldso/ld-uClibc_so.a(ldso.oS): in function `add_ldso.isra.0':
ldso.c:(.text+0x1f28): undefined reference to `_dl_stat'

More details at:

https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7378437145

Could this be fixed by your patch?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
