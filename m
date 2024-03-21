Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D31C54E68
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 16:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77F7260ED3;
	Thu, 21 Mar 2024 16:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32YwYGZE2896; Thu, 21 Mar 2024 16:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6679B60ED2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6679B60ED2;
	Thu, 21 Mar 2024 16:05:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EAEFC1BF2A7
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 16:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D703340544
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 16:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhXoVAwtZqHX for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 16:05:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0523D41518
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0523D41518
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0523D41518
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 16:05:06 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 50788CCE98
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 16:05:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07C611BF20C;
 Thu, 21 Mar 2024 16:04:56 +0000 (UTC)
Date: Thu, 21 Mar 2024 17:04:49 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240321170449.54d91681@booty>
In-Reply-To: <20240318140258.1083375-4-neal.frager@amd.com>
References: <20240318140258.1083375-1-neal.frager@amd.com>
 <20240318140258.1083375-4-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1711037098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GtMdqLD+YKcNS2AGAgFo3wHU6sYk5sCABT7akuze8Ws=;
 b=FcsyKP98HrYIHA/YxQosbqqKDwEbWDfr3mNaj9FVBKZVj8L/ZvC57BJs7jm6CbUE6Tkwv4
 JF5u71ODzLJ2ZGhXFmPOlWv7MIFte0LlyF8vUBlkC+dsvNjJFQ24VSlUr35bffW57I1TBl
 ZhD0yFCcal0eJFo4eTu1Xjp5bv1amBUFSii00zCHMew2RKlVRV4uusEOH/yaHXIPEJcRVg
 5DbJyqj1Le4pXw2KiQSurusixoz76qc9k5TsB+FPE5hDEja5QkjSz2YMMl9pEBrSUMj946
 tb5pAVtQCwk316OpgcLcMsgfKocoQXAKRhJKcIRCap5ldQVK6JJzN/1pZL8HMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FcsyKP98
Subject: Re: [Buildroot] [PATCH v1 4/4] configs/zynq_microzed_defconfig:
 bump to 6.1.70
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: michal.simek@amd.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 18 Mar 2024 14:02:58 +0000
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the zynq_microzed_defconfig to Linux kernel 6.1.70.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
