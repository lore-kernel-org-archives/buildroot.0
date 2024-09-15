Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E133C35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 08:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5100D81EFE;
	Sun, 15 Sep 2024 08:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atbkOc21KZ7l; Sun, 15 Sep 2024 08:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5481981E1F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5481981E1F;
	Sun, 15 Sep 2024 08:07:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95D721BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8212781EEC
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DD53BpbqyYqD for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 08:07:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6133881B7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6133881B7B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6133881B7B
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 08:07:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 904DF40003;
 Sun, 15 Sep 2024 08:07:43 +0000 (UTC)
Date: Sun, 15 Sep 2024 10:07:42 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240915100742.5f341bd6@windsurf>
In-Reply-To: <20240914215727.1332306-1-james.hilliard1@gmail.com>
References: <20240914215727.1332306-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726387664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z0JbBrBxYRa2w9iJc4+fqR2FkdDDeBOX5C+OUvrLjk8=;
 b=P8UIoxZwlGgpphvQx6MHLZho0GMw1vts6nMZCg/pYIErHx+Mg2USBuXgW/FEZgv0vtomBQ
 DvG9pnZIDs5x/UEeD0bej+1MIGTaicBm0vLNPVzVI8NKRas+pFCRDHbGWSG+dy3aWF5dlZ
 3N2jYNE6cEf5fylrGhGfONFtx+dPEsUc39IKMKkfhj1UpzMnxvnNZx2t6kp2YDCbs5rOAp
 vLIs+p3YLDBRK9JqYIpTl2XerGRX856AKzvwfTrYwulzZXv6pDhMzbQzRQl5mCO+idYV8h
 HlcvufvdNvpjrL23wjOAC9zDmrfuEARxj5zXQnYqbjEiEUuHNgeHYFQxS6Wu4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P8UIoxZw
Subject: Re: [Buildroot] [PATCH 1/1] package/python-babel: bump to version
 2.16.0
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
Cc: Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Sep 2024 15:57:27 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop no longer required python-pytz dependency.
> 
> License hash changed due to date update:
> https://github.com/python-babel/babel/commit/40b194f4777366e95cc2dfb680fd696b86ef1c04
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-babel/Config.in         | 1 -
>  package/python-babel/python-babel.hash | 6 +++---
>  package/python-babel/python-babel.mk   | 7 +++----
>  3 files changed, 6 insertions(+), 8 deletions(-)

I've applied all up to package/python-googleapis-common-protos, but a
few had issues, most minor, some more important. I'll reply only to the
ones that required changes.

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
