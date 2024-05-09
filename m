Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B23C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BFFF40560;
	Thu,  9 May 2024 16:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZeONTtwv5m5v; Thu,  9 May 2024 16:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCF814168B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCF814168B;
	Thu,  9 May 2024 16:20:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63FBA1BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 514E44039D
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AF4D6adJtIvb for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:20:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A45541D79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A45541D79
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A45541D79
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:20:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68AD21BF205;
 Thu,  9 May 2024 16:20:04 +0000 (UTC)
Date: Thu, 9 May 2024 18:20:03 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240509182003.3160bc88@windsurf>
In-Reply-To: <20240422183930.2330715-1-james.hilliard1@gmail.com>
References: <20240422183930.2330715-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715271604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GV1wugzIZ05+XsdTrth8A1vzqWblgVi2Vpiexfzix6o=;
 b=mp+pCI7qKZ8Vhth+UE8/fhdTWa29+zONhqarOXT3xLq9QFEQzadsNl52tQSlrFjg7coVFZ
 D6VC2aC4Ch6f8Gyie8xnIfDtGdDrjI1z98mHm/cYWaVZrrVKDa79E5MciXaiU1b8RTzbE2
 zry3pBv5TSilgBix8rIBw4LvoaQzT1jdPQESo/uRW66drPAWm3n5NDHn1kXQZUFROdtm46
 KqNvu2sDY73b1QNl7yl8MdZRZMvlgI4XukYSLdMEYpb+Yqi3hem2zpixHcfwkqhR60+S+u
 z+SydsVfZ5pzgqFaDVhcLaG17wn02rG+1DIkJ/FTpH3oLlpUBg8343XIwLGTzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mp+pCI7q
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to
 version 3.6.8
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
Cc: Falco Hyfing <hyfinglists@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Apr 2024 12:39:30 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to year range update:
> https://github.com/pymodbus-dev/pymodbus/commit/131d30391efd9c64f1fec857ae0372746374e6d2
> 
> Drop no longer required python-six runtime dependency.
> 
> Drop no longer required python-serial runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pymodbus/Config.in            | 6 ++----
>  package/python-pymodbus/python-pymodbus.hash | 6 +++---
>  package/python-pymodbus/python-pymodbus.mk   | 4 ++--
>  3 files changed, 7 insertions(+), 9 deletions(-)

Applied to master, thanks. It would be good to have runtime tests for
packages like this, to verify their runtime dependencies.

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
