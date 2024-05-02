Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2309EC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8E22404A5;
	Thu,  2 May 2024 07:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5lV5t6dyV6t; Thu,  2 May 2024 07:56:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FBB240535
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FBB240535;
	Thu,  2 May 2024 07:56:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9336C1BF83C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BBEA822AE
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdNxtNKkvjU5 for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:56:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A768822AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A768822AA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A768822AA
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:56:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8958BFF805;
 Thu,  2 May 2024 07:56:06 +0000 (UTC)
Date: Thu, 2 May 2024 09:56:05 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20240502095605.32987057@windsurf>
In-Reply-To: <20240420185853.4134260-1-thomas@devoogdt.com>
References: <20240420185853.4134260-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714636566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+gQyFs0em54vNoZhEAyJhW1QVxwqbZWne09t0YnbY9Q=;
 b=HUR51gmzqHtyCXdLsnpARf7Bma7l7W3vJcTGgW24U9cSxBT7nQl6Om3Zn91e7LmWIIR7LP
 1vzTMbXYbAxLHBEjU9j4/fsO+EfnjWW0RW+QxQCRCfX9zpv4mjscCu/qBVDNzrYsu8XBTX
 wZitdar8ChtG0Y7ibP8aIJ02q3+BV/aWBnNpxFGvTcXJ1opEfuBFzkVmg2tFX5XeMyM+Rr
 JgGpR6FwMTiPCP3jrLp6O1ssXm0BF0TWnMqGLRbA9QnMZpPT57XwwLzu7NlQw9ddB4Ml19
 x4eazBHk8AvCSlFjl3xoKFz8pvuA3QZpf4D81ybCeVF08W+Byr1HK9XmTGvjSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HUR51gmz
Subject: Re: [Buildroot] [PATCH v1 1/8] package/libsoup3: fix reference to
 atomic
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 20 Apr 2024 20:58:46 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> gthread-posix.c:(.text+0x137c): undefined reference to `__atomic_compare_exchange_4'
> collect2: error: ld returned 1 exit status
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/4fb9f4c49777dde3abc30bb9f324816d3ed87567
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

I think this whole patch series is not the right way to fix the
problem. Indeed, what's using libatomic here is libglib2, and with your
solution, you have to chase down *all* reverse dependencies of libglib2.

Instead, what I'd like to see is that the glib-2.0.pc (pkg-config) file
gets updated to include -latomic in the Libs.private flags, so that it
gets automatically picked up by all reverse dependencies of libglib2
when they are static linking.

This also brings the advantage that you're not linking say libsoup3
directly with libatomic, like you're doing with your patch. Instead, in
a dynamic linking case, we keep on having libsoup3 linked just with
libglib2, and libglib2 linked with libatomic. It's only in the static
linking case that when we're building a final executable that uses
libsoup3, we need to also bring libatomic.a into the mix.

Could you have a look at fixing glib-2.0.pc instead?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
