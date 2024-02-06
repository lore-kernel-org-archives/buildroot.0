Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE11C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 834D040237;
	Tue,  6 Feb 2024 10:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 834D040237
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id znn-Ky66FTlm; Tue,  6 Feb 2024 10:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C706F41F1C;
	Tue,  6 Feb 2024 10:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C706F41F1C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B09CD1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB77B8216C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vts8ZK0gDCUc for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:35:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7448A82161
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7448A82161
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7448A82161
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:35:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EF0840006;
 Tue,  6 Feb 2024 10:35:49 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:35:48 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206113548.2b602528@windsurf>
In-Reply-To: <20240109081115.4065619-1-james.hilliard1@gmail.com>
References: <20240109081115.4065619-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707215749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1iCxpmZ8F1rXKwu5P8plIKCzaYm/59od0urSQj9xtg4=;
 b=oDpfU/n0tah6dx2JIivNxexrtztBvlIXNC+4U83z5/dKTb6tp8tcf1WcSMzTODG+2zC09y
 XGCaLxixeUepfCR3+0s4bjjsLosAsZQTcZDu+ayeOPJjwMWYHePHoWFaJXQ4jhsMInEoqT
 aPfmREuYd2TSw0iofukzCdbjqNsGuvfj/eI019f770vdC6BilJ281CMViqatTr/jBdYbWl
 ceM5YgvPDaVigxmTZFSfUE3LXrO+MF1qRfcl214dM8iYIdRWWHh9250w8Qbe3ZzAHzL4Sf
 FlhRwU0KLfEMJqD3hWqGGPfVt5gbDIChCiyjKFwz6pf+DAQ5zz+9SOiHRDJ0sA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oDpfU/n0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-hiredis: bump to version
 2.3.2
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 01:11:15 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Hash for LICENSE file changed due to license change to MIT:
> https://github.com/redis/hiredis-py/commit/1e29dd4719a44092e8317d6cddb8075a4a143e0e
> 
> The vendor/hiredis/COPYING file remains BSD-3-Clause.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-hiredis/python-hiredis.hash | 6 +++---
>  package/python-hiredis/python-hiredis.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
