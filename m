Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EF1D2444F
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9D1E413D6;
	Thu, 10 Oct 2024 21:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4rKuYiOsLnB2; Thu, 10 Oct 2024 21:36:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FDAD413DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FDAD413DB;
	Thu, 10 Oct 2024 21:36:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5659D1BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 505BD412CC
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZwIL5tpJyQu for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F500412C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F500412C4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F500412C4
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60BC940006;
 Thu, 10 Oct 2024 21:36:20 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:35:16 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233516.305f74fd@windsurf>
In-Reply-To: <20241009174323.3850346-1-james.hilliard1@gmail.com>
References: <20241009174323.3850346-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g1m82JkiOZ0PbfDZoUsRVUZFAzEDLiDj9gZoz0kOP3I=;
 b=G9YCgszKCfQV9l2TD+5UlUOsDoLNOft47cXH/amLT05TWw6WyRkMATRamt8INouZXdsWoc
 /o9hSqhHzMXztc534PEVL8+/YCXX9iDX1MdIfsxm5xI2jDJvVeNczyP/H2FtNtYNW03iY6
 azAueWVCS7mf5ATpU4wZeYRp2Ybw1fiVV5Nb4eecvedC/JRgajKLMB9aOo6pXlG3M8fYMg
 aixqWQoxcQ6V2JO3ZBhzg55DQIjxqUaUh/DweXVcFpa5H8Ycivi3ePS8QsBwu9uFhBSxL0
 05zuuIue+o3Kpfz2HOQfvOuIh1i3Wl3XhqRhsBY2RXKotdX6697xCSjSbTowng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G9YCgszK
Subject: Re: [Buildroot] [PATCH 1/1] package/python-qrcode: bump to version
 8.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  9 Oct 2024 11:43:23 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate from setuptools to poetry build backend.
> 
> Drop no longer required python-pypng runtime dependency.
> 
> Drop no longer required python-typing-extensions runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-qrcode/Config.in          | 2 --
>  package/python-qrcode/python-qrcode.hash | 4 ++--
>  package/python-qrcode/python-qrcode.mk   | 7 ++++---
>  3 files changed, 6 insertions(+), 7 deletions(-)

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
