Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE5EC3DA64
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 21:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 905D08101A;
	Sun,  4 Aug 2024 21:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIWH8HWEIqwS; Sun,  4 Aug 2024 21:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B48B8101F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B48B8101F;
	Sun,  4 Aug 2024 21:13:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC22A1BF35E
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 21:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA17F8101F
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 21:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2QmCIIdbnD54 for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 21:12:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 98D6A8101A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98D6A8101A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98D6A8101A
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 21:12:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD40D20002;
 Sun,  4 Aug 2024 21:12:55 +0000 (UTC)
Date: Sun, 4 Aug 2024 23:12:54 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240804231254.6301c5df@windsurf>
In-Reply-To: <Zq9j8m3YPt0Xh0gY@waldemar-brodkorb.de>
References: <Zq9j8m3YPt0Xh0gY@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722805975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwNTc0uAKxraQ7eF72XLrXC19StNrqBvKrtrvS6wh3U=;
 b=JIZk6xK3s4j5A2JVEdIohPVwcw8qIInpA4mOma1e2C2f9OXzDnuh65cBIczM+2URMAUf+L
 MFqafsaZZTMm9jl2fOegKQ734qNLVx+50bkdWZAT1Vx5Nyv2JF7IwEONazRfPULJ2gM7Ge
 kCbE2kSkh1SZrbfqKChjcjh9cCJpmswphbe9OdMz9q/ckFjhBkbYYYg8GbWTmzTlbjpiCe
 fCRD1MqEwtx3nskcBWtHSBGl6hogVX6j+UY1aev7apqdkEu7+RLl0VKcDWEJMJ9dTxRDv7
 qH12qLB4JQ9q2gDDjFVdwaxYZ13txu/TZ713AMxm7EukCXofoK3i7f0yA6vEFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JIZk6xK3
Subject: Re: [Buildroot] [PATCH] package/nginx: fix sparc compile
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

On Sun, 4 Aug 2024 13:20:18 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> When libatomic_ops are enabled the shared library is using symbols
> from libatomic.
> 
> In output/build/nginx-1.24.0/objs/autoconf.err
> You get:
> checking for atomic_ops library
> 
> /home/wbx/buildroot/output/host/lib/gcc/sparc-buildroot-linux-uclibc/13.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
> /tmp/ccx4rHjO.o: in function `main':
> autotest.c:(.text.startup+0x30): undefined reference to
> `__atomic_fetch_add_4'
> collect2: error: ld returned 1 exit status
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/5de/5de45530bbc615b1c44cc73a0ae7bf4cff5f1a56/

Do you have a minimal reproducer for this issue?

>  NGINX_CONF_ENV += ngx_force_have_libatomic=yes
>  ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
>  NGINX_CFLAGS += "-DAO_NO_SPARC_V9"
> +NGINX_LDFLAGS += -latomic
>  endif

Basically, I am wondering if this is the correct condition to put this.
Other architecture than SPARC may need to link against libatomic. So
perhaps it should instead be:

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
NGINX_LDFLAGS += -latomic
endif

but as I am not 100% sure, I wanted to first reproduce the issue.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
