Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700DDC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 10:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 199944097A;
	Sun,  3 Mar 2024 10:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P-Hlo-13Rlob; Sun,  3 Mar 2024 10:25:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BF7B409D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BF7B409D0;
	Sun,  3 Mar 2024 10:25:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E54231BF5AE
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 10:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E030181584
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 10:25:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OnO4q6uVG0Cx for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 10:25:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A1AE9814B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1AE9814B7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1AE9814B7
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 10:25:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BC63FF804;
 Sun,  3 Mar 2024 10:25:18 +0000 (UTC)
Date: Sun, 3 Mar 2024 11:25:14 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240303112514.3ee1d3e8@windsurf>
In-Reply-To: <ZeRJFqxy-YtrzYBI@landeda>
References: <20240303084122.157151-1-thomas.petazzoni@bootlin.com>
 <ZeRJFqxy-YtrzYBI@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709461518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=erg91DNpCC8IjZ0ZGCrDdyTEY9BULxDBOZK6UnournA=;
 b=WFfgRqgjpKaMD45GbM6EHx6/oM0mWNouEJDMRv0mAGMLh/B2bAqci0lA4jbg2shpQNbFxD
 SrCEKIR57en4j04jHC7uj8ckUgNOstgK486rg4l2fNh1IF44cuSmYANUTekunoiVDr38+V
 CH2TpYXUdNFQ9jsTCh9lzV7JypaNznuGG1SeAqsgDsD1al4cFu4AnvSFmcO6ceBWqCQhb/
 CRipTetvusJ/uKZdvqx/5jXnB+3ClA9kYyYt6bPfBesVZ1ZqjUSdI/1uvcP/AYb/GZU54o
 Engx0+gQVBsPEWFUPCc0iiW0QYIE1FVSg5IP131+yuYfOuRPeaB1QVsXofGptQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WFfgRqgj
Subject: Re: [Buildroot] [PATCH next] package/musl: bump to version 1.2.5
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

On Sun, 3 Mar 2024 10:55:34 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I did a simple arm build, it worked. Let's see what autobuilders will
> have to say about this, now.
> 
> Applied to master, thanks.

To master? This was intended for next.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
