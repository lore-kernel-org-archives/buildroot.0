Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20370C001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 20:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9E6981E15;
	Mon,  7 Aug 2023 20:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9E6981E15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oiwhEoGkVZYy; Mon,  7 Aug 2023 20:15:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E538981E6B;
	Mon,  7 Aug 2023 20:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E538981E6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA29C1BF287
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF5FB408FB
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF5FB408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ib9YKHyljwqD for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 20:14:59 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E50CF408D1
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 20:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E50CF408D1
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBA0B1BF205;
 Mon,  7 Aug 2023 20:14:55 +0000 (UTC)
Date: Mon, 7 Aug 2023 22:14:54 +0200
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Message-ID: <20230807221454.0e0eb258@windsurf>
In-Reply-To: <20230604163535.1102239-1-alexander.sverdlin@gmail.com>
References: <20230604163535.1102239-1-alexander.sverdlin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691439296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orahX74ipSrnCIbETzlFWT0/WYu8b9+ZlnMcXbNO5ds=;
 b=kuAerTWXgBVGWGmiP6Gld5jefvYizrH4aZppURELo1cOxKubJCgu3nZGwFCbL7/8wobJKg
 1svu1LjD6OGZCw75piJLQmq+TagyVDjWKj//Y9+Ce7x3bSS8rxGqaDHXwKuN6P/KzMxUvN
 /KLVJBtMSedNYOwKItixdTC3sVEnsRkDPh0mWPhcwIsaq+4mOxqJ3PBR19cCY1QSF2BBsM
 j2DPUAOa2khhlEPVm+VTdnJsRBjDCDNpKRJyZIxv0X7eABIZvZnkak4m1g6zz79RmKV9ef
 UQzAY/3RFTk/T3NAvkcR8GzV4ylvM3seOrIQMAQbH5PeUhVRH5YQpI/VqjWEVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kuAerTWX
Subject: Re: [Buildroot] [PATCH] package/gcc: Disable libsanitizer on
 arm920t/thumb
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

On Sun,  4 Jun 2023 18:35:35 +0200
Alexander Sverdlin <alexander.sverdlin@gmail.com> wrote:

> libsanitizer is broken for Thumb1, sanitizer_linux.cc contains
> unconditional "ldr ip, [sp], #8", which causes:
> 
> ....s: Assembler messages:
> ....s:4190: Error: lo register required -- `ldr ip,[sp],#8'
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  package/gcc/gcc.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Sorry for the long delay, this is absolutely correct. I've only added a
reference to an autobuilder issue fixed by this commit in the commit
log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
