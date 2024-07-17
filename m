Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F79C3DA60
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 20:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 410FB40C0E;
	Wed, 17 Jul 2024 20:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3nDygohpB0rv; Wed, 17 Jul 2024 20:41:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31AD2400C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31AD2400C1;
	Wed, 17 Jul 2024 20:41:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 574061BF846
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 20:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43A6B80BC3
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 20:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvaepF3CCjg1 for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 20:41:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2896380B59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2896380B59
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2896380B59
 for <buildroot@busybox.net>; Wed, 17 Jul 2024 20:41:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4004B40005;
 Wed, 17 Jul 2024 20:41:52 +0000 (UTC)
Date: Wed, 17 Jul 2024 22:41:51 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240717224151.3a80c587@windsurf>
In-Reply-To: <20240403084807.512825-1-francois.perrad@gadz.org>
References: <20240403084807.512825-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721248912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BkNTlb2N4erh4A3BpKTpkCgOFYTbpaeh7Q6K9wKxXa8=;
 b=YujSNFxsnBdow2SfKLK5hXrIQbaB+qVe++isQNmQR8UOmjOTJ5MjwVjj5miyjSHPd5rdZE
 yJfz9RABV0msKLF8FsPcMP1TjV0W9lNQg3B7s4jIhCvHf1u4WJ94UOQd8SmwUl9YdKtgdd
 Ksmn+LCR2lHco2lYIJTTmvO01VkRlhR1aedQU41d31QrenzTOlVxd101klA7fDuRUM4FiN
 mAUuyraA9LpR9Jo+A9EqqrGiFbEZyqPt6dlIBbTyW576AVgoJ4otw5fNBRhv2xUx8NAM0Q
 cQNOaB+/TA6TYuHgpSl7J74/RtjHHhXYoPqSVUIgGbIW7zrdkjVOMOaLBdmIzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YujSNFxs
Subject: Re: [Buildroot] [PATCH 1/2] package/graphene: new package
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Apr 2024 10:48:06 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> a dependency for gtk4
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  DEVELOPERS                     |  1 +
>  package/Config.in              |  1 +
>  package/graphene/Config.in     |  6 +++++
>  package/graphene/graphene.hash |  3 +++
>  package/graphene/graphene.mk   | 44 ++++++++++++++++++++++++++++++++++
>  5 files changed, 55 insertions(+)
>  create mode 100644 package/graphene/Config.in
>  create mode 100644 package/graphene/graphene.hash
>  create mode 100644 package/graphene/graphene.mk

Applied to master, thanks. Sorry for the long delay!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
