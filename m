Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440FFC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 21:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD9F68121C;
	Mon, 29 Jul 2024 21:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LrRsrZDZw31T; Mon, 29 Jul 2024 21:18:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 853A780D7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 853A780D7B;
	Mon, 29 Jul 2024 21:17:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 381681BF426
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 21:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19B546085C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 21:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OqaQon0hoxi8 for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 21:17:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94ED560760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94ED560760
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94ED560760
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 21:17:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 249BAE0002;
 Mon, 29 Jul 2024 21:17:45 +0000 (UTC)
Date: Mon, 29 Jul 2024 23:17:43 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240729231650.16ad7e98@windsurf>
In-Reply-To: <20240726082754.891552-1-fontaine.fabrice@gmail.com>
References: <20240726082754.891552-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722287868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D0JCcyrycvyHRw3H7a6sJyu+n722Mwk0mN4DKHeUYM4=;
 b=o+1uuk+Nb6mKz39SsEJhFmlesLDBy9a2OvjfH7XK9ogg4oimZPkGtB33DvUfZBx1uauS0H
 HQaMDvBpfcsemP3BEmNhmqFgt9rOgBpCPDAtio2UZhjX2NBQ6cLCVs5NnBlfglHNmPoZaz
 crFwsF+jG7Ym8s89zf45kfKmI050VI8eVgrDBK5Pa7EZBTqQyPRk/R/+nNmd2VY+9ZCKt7
 xNGiZl2f+7dbnz9Bb3lfsuTTiEgqeO8T3Nq92HfhLkn9HULDAZvo6nleiPiqKrXtfPQIYj
 Wrf6z9pPY5YJ4SDE/onv+ZkY6ryG+hdocaceCC0lvw6iKU9yHs0sc0/S5/7vxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o+1uuk+N
Subject: Re: [Buildroot] [PATCH 1/1] package/libdex: needs dynamic library
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Will Newton <will.newton@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Fri, 26 Jul 2024 10:27:54 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following static build failure raised since the addition of the
> package in commit 70319b47f646f74f407ed3355baf5b581a10518a:
> 
> FAILED: src/libdex-1.so.1.0.0
> /home/autobuild/autobuild/instance-11/output-1/host/bin/mips-buildroot-linux-musl-gcc  -o src/libdex-1.so.1.0.0  -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -shared -fPIC -Wl,--start-group -Wl,-soname,libdex-1.so.1 -Wl,--whole-archive src/libdex-1.a -Wl,--no-whole-archive -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack -Wl,-Bsymbolic -fno-plt -static -lucontext -latomic /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libgio-2.0.a /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libgobject-2.0.a /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libffi.a /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libgmodule-2.0.a /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libglib-2.0.a /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/mips-buildroot-linux-musl/13.
 3.
>  0/../../../../mips-buildroot-linux-musl/lib/libatomic.a -lm -pthread /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libpcre2-8.a /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libz.a -latomic -Wl,--end-group
> /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/mips-buildroot-linux-musl/13.3.0/crtbeginT.o: in function `deregister_tm_clones':
> crtstuff.c:(.text+0x10): relocation R_MIPS_HI16 against `__gnu_local_gp' cannot be used when making a shared object; recompile with -fPIC
> 
> Fixes: 70319b47f646f74f407ed3355baf5b581a10518a
>  - http://autobuild.buildroot.org/results/f527cab99141ecbbbd13c12177a2cc8903bed3a4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libdex/Config.in  | 4 +++-
>  package/sysprof/Config.in | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)

I've applied, but considering that this is a meson-based package, it
should not be that difficult for upstream to properly support shared or
static build. Perhaps a bug report to submit upstream?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
