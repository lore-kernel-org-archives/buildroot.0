Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54C4D24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A71C4412DE;
	Thu, 10 Oct 2024 21:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BNF9Ag_8MOr; Thu, 10 Oct 2024 21:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAA7141610
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAA7141610;
	Thu, 10 Oct 2024 21:37:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D5F21BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1D5F4136F
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUHM4QGxRbKz for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF09D4139F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF09D4139F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF09D4139F
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB9E140005;
 Thu, 10 Oct 2024 21:36:31 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:36:07 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233607.12fc6add@windsurf>
In-Reply-To: <20241009183417.3885725-1-james.hilliard1@gmail.com>
References: <20241009183417.3885725-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1i3t5oacGv9RwzAhFPvWxQAmfzYz8CZKFSO5yNDv92I=;
 b=ELfOsVss/WBWlVbOmoKaFGfHERLYFng+MHxN07ZVNY3dqixLw0DEljmHFu+M/Zy8L7Qc5d
 J0PP4dt4+apdfwhwxEQv94+F0/MURHXDj29E66kgYncqClFQQxfYdX83B0+UGWT6YHn85h
 gQ5dQ3LDy4ID8LMjKH4MdGdf0TDBHo4+ump0x83nM9/nAFT+WqdR7U3vAVyrrvZl3p1XAy
 Po27k+EKQRAbmzYiLUJNaiL6r/iesbSYAls0KOUuxKm1V4jAuRL5Dh8sZuKsZg94VkD0WS
 V2o3Tj/eMdGaCgEmvTPbsdYv6kTtX2bxeQSrI0y/TpXAHXzIMzKwSANRb6jGXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ELfOsVss
Subject: Re: [Buildroot] [PATCH 1/1] package/python-webob: bump to version
 1.8.8
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

On Wed,  9 Oct 2024 12:34:17 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-webob/python-webob.hash | 4 ++--
>  package/python-webob/python-webob.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
