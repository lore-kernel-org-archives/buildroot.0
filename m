Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35B3C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 21:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C64D9605C8;
	Tue, 23 Jul 2024 21:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVtuIMd_yZfl; Tue, 23 Jul 2024 21:06:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7A8160645
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7A8160645;
	Tue, 23 Jul 2024 21:06:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7095A1BF2F9
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DC3381217
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOD1YyEs6omr for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 21:06:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24BC9810C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24BC9810C7
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24BC9810C7
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 21:06:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E50D3E0002;
 Tue, 23 Jul 2024 21:06:09 +0000 (UTC)
Date: Tue, 23 Jul 2024 23:06:08 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240723230608.7d22d8c2@windsurf>
In-Reply-To: <20240723203737.643733-1-fontaine.fabrice@gmail.com>
References: <20240723203737.643733-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721768772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aEYwZ8LZnEjkg856bhWBqTDWRm/5AT3L1iVI/gE0F5U=;
 b=XTyzmgwktjtkSMZ9lqgwFVBC6N2co0nf3Oy86vv8uSO/gfKuwA15XPrFBr4vkUAv5+ZTmr
 8RmDclh5cgZgI//ST9+czfl2R4CSC4q5SZv0c6ATxhTokR/8D4+LOoY1/u8Rd3ISzYyKfd
 bl0LI6DE8H5y2bfUsQ5CWO6EkqAxAfy6zafC12+PQVlMcEulFPqCbRcHq7g/akUW99v35E
 p+MTNKnq8Wz8EoBLEwL3TLlnSa2DvDylNgN0r7Ni5p5ulI1xdk+5bW8xO34NdjygxrzMRO
 lssX1YMzWCXZCrqqBwIMyvSAVswNBxXDa9spxQhZRN3dWnqvxEi3qSmK3B6CaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XTyzmgwk
Subject: Re: [Buildroot] [PATCH v2,1/1] package/libdex: needs ucontext
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Jul 2024 22:37:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libdex needs ucontext since its addition in commit
> 70319b47f646f74f407ed3355baf5b581a10518a:
> 
> /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: src/libdex-1.a.p/dex-fiber.c.o: in function `dex_fiber_context_init':
> /home/autobuild/autobuild/instance-11/output-1/build/libdex-0.6.1/build/../src/dex-fiber-context-private.h:131:(.text+0x30c): undefined reference to `getcontext'
> 
> [...]
> 
> In file included from ../src/dex-fiber-private.h:34,
>                  from ../src/dex-scheduler.c:25:
> ../src/dex-fiber-context-private.h: In function '_dex_fiber_context_makecontext':
> ../src/dex-fiber-context-private.h:108:3: error: implicit declaration of function 'makecontext' [-Werror=implicit-function-declaration]
>   108 |   makecontext (ucontext,
>       |   ^~~~~~~~~~~
> 
> Fixes: 70319b47f646f74f407ed3355baf5b581a10518a
>  - http://autobuild.buildroot.org/results/5f23b0e41f2957b0562c5d168f35e42f13bdad0b
>  - http://autobuild.buildroot.org/results/67d958e9a8e1dfb147ac7be4fcb74fcafbbce987
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Fix libucontext select

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
