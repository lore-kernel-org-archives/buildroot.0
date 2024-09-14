Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F622C02186
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D60D8453D;
	Sat, 14 Sep 2024 09:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSIUJ1pVMt6w; Sat, 14 Sep 2024 09:02:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36E0384534
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36E0384534;
	Sat, 14 Sep 2024 09:02:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85BD41BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 810A54023E
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVd07ltc4ySa for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:02:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5353C40179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5353C40179
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5353C40179
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:02:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65AE9FF802;
 Sat, 14 Sep 2024 09:02:45 +0000 (UTC)
Date: Sat, 14 Sep 2024 11:02:44 +0200
To: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
Message-ID: <20240914110244.1f3130b3@windsurf>
In-Reply-To: <20240911130407.2925548-1-guillaume.chaye@zeetim.com>
References: <20240911130407.2925548-1-guillaume.chaye@zeetim.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726304565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aisuYkPE3qV63FN9TJZlE5BQyYx86yjDpme5E9E+y5A=;
 b=MpEbx65gdTVvYnLwaa2fPnN1me8fZjGJfCZD1obIbX+KDcYs9YWSe+Efs7gBe6BGZdLgMN
 5qbu1TMNRF+rzNY7jO7efTykAO/chA6PTAURr7P0mKBLIZrdqoUrSnRqJURgr4/1B/PTux
 zOnxi7lUErDF6voGukEz+EUtW36vPxa2TOHzevl2PMXZl8YyWvQGl6Zt9l9u5naQxe6n9o
 bdEC6th36zXDvKOifJQq2j1rCLHaLWiCoXn2YwtrGTWr72V9IBkaTREOK2lRr2k76hDCyx
 bl05+kiytNGwjEen9W8mZ0F4VI0fL7+q1rYNLEfijYVw+XTX/cRX38+pRgrIsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MpEbx65g
Subject: Re: [Buildroot] [PATCHv2 1/2] package/gdk-pixbuf: fix update cache
 hook
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Guillaume,

On Wed, 11 Sep 2024 15:04:06 +0200
"Guillaume GC. Chaye" <guillaume.chaye@zeetim.com> wrote:

> Move hook at the rootfs generation so all dependencies are
> correctly added in loaders.cache.

Thanks for the new iteration, but this commit log is unfortunately
still insufficient. What is the problem? What are those "all
dependencies"? How is this fixing your problem? All of that needs to be
explained in your commit message so that when we go back to this in 5
years we remember the reason why we did this change.

Could you submit a v3 with a much more detailed commit log?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
