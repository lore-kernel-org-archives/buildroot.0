Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDB5C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7270080B3E;
	Wed,  1 May 2024 19:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajRFyIE3-sV8; Wed,  1 May 2024 19:55:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8640480BB6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8640480BB6;
	Wed,  1 May 2024 19:55:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FB9D1BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C41180BB6
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5eZpqJffQcQV for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:55:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 326D980B3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 326D980B3E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 326D980B3E
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:55:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AE4140006;
 Wed,  1 May 2024 19:55:24 +0000 (UTC)
Date: Wed, 1 May 2024 21:55:23 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240501215523.5bc7ce23@windsurf>
In-Reply-To: <20240420132251.1349622-1-ju.o@free.fr>
References: <20240420132251.1349622-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714593324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G/XL6Z3OFNV2qaiZLJK/mTLyr+aGDNFosorIlp1aebo=;
 b=lA/cPUe3PMUuEY27IcjxnILGYl1vsbcQohrCoKKLwKXc4+ONhn1ibaTWtlimP03efqIb5D
 /Bj1Jm9ktWxRxTvJ/DEl9jIQ+7G1S+Nuap4JhAhkhPlxWNlxKVzSCrpsOH/4BOeu0wdMty
 hb9pg5rZvgJbZVD0MEH6K8tLT+fTUdwoY7zMhm9AF6nR91k+aO+RpmT+DHZlr7YNYY92dR
 FEntgYg1YAVdfzDxyouruvyRlrfgDWr8AAo3S/VATjq4N0b/w9kOFpdcz0TUPyTgax1oKv
 sALCZSyoTZPeEUHTBvYCfLMwBqoW3VEKYci4ZEetVyVrd0H0gzRSoHSQzbxjng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lA/cPUe3
Subject: Re: [Buildroot] [PATCH 1/1] package/fwts: disable parallel build
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

On Sat, 20 Apr 2024 15:22:51 +0200
Julien Olivain <ju.o@free.fr> wrote:

> fwts randomly fail to build in parallel with error:
> 
>     mv: cannot stat 'dtcompilerparser.tab.c': No such file or directory
>     mv: cannot stat 'prparser.tab.c': No such file or directory
> 
> This is a known upstream issue. See:
> https://github.com/fwts/fwts/issues/7
> 
> This commit workaround this issue by disabling parallel builds.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/fwts/fwts.mk | 3 +++
>  1 file changed, 3 insertions(+)

Hm, I don't see any failures in the autobuilders. Did you encounter
this issue personally? Why don't we see it in the autobuilders?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
