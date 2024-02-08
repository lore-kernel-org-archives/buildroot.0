Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198A2C4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 10:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EFEA41BED;
	Thu,  8 Feb 2024 10:29:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ae8rgV2KSr7I; Thu,  8 Feb 2024 10:29:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F98141C05
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F98141C05;
	Thu,  8 Feb 2024 10:29:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD8F61BF982
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 10:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B73F741BA3
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 10:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LiGs2jSCFdvv for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 10:29:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 115E341B01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 115E341B01
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 115E341B01
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 10:29:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF60CE0002;
 Thu,  8 Feb 2024 10:29:41 +0000 (UTC)
Date: Thu, 8 Feb 2024 11:29:40 +0100
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240208112940.6fa6e89b@windsurf>
In-Reply-To: <20240208095531.99049-1-aperez@igalia.com>
References: <20240208095531.99049-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707388182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jhUo98Wkiq+3vA/AdQWUncNrTV2Xf4/i9E/IcAAkUZY=;
 b=DkYEBwMo54MH1GBbcqWvzy+KXpnX+3i0lcvvW9NYyC5DA4aTTVjd3bHpzLG1q/qVl1QwyK
 7LcqzkUz0lLQrkXdbX05p1c5yoqi2i/HE95KxnXOb9KbrPO5a0N+d86bcgR9KbAGzxJmau
 zxHGN5fkTqJTPqcWjBy5wov1fIxSMgnurjX8iVYdPz7kNBwdJAsQ/LjSC68lfeTNNXjfE/
 jmP5pJs9w1OMUQ+WoqH4FQy1vkGD4FP4Ngg21yWFDTtRW7anw1mBsjEvDvthz625haVMKo
 vgLu9xPnATOd6ztmGRVnHiVGMkX+2R4cmzI6MEztl9kF+62zWiZ3xx8qD7JzEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DkYEBwMo
Subject: Re: [Buildroot] [PATCH 0/3] Add support for the WPE WebKit RDK
 backend
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adrian,

On Thu,  8 Feb 2024 11:55:27 +0200
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This patch series allows using the RDK backend for WPE WebKit. Currently the
> main use case is to run WPEWebKit on RaspberryPi boards using on Dispmanx via
> the rpi-userland EGL/GLES libraries.

Thanks for this patch series!

We have some other patches in patchwork related to webkit:

Some from you:

https://patchwork.ozlabs.org/project/buildroot/patch/20230423213001.2961215-1-aperez@igalia.com/
https://patchwork.ozlabs.org/project/buildroot/patch/20230423213233.2961770-1-aperez@igalia.com/

Are they still valid/application?

We also have twice the same (?) patch from Giulio:

https://patchwork.ozlabs.org/project/buildroot/patch/20230221161522.3749804-1-giulio.benetti@benettiengineering.com/
https://patchwork.ozlabs.org/project/buildroot/patch/20230221161522.3749804-2-giulio.benetti@benettiengineering.com/

is it relevant?

Could you have a look so we can hopefully clear up the backlog?

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
