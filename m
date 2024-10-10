Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA568D2444F
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87EB1415DD;
	Thu, 10 Oct 2024 21:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3EQxSDacdbD; Thu, 10 Oct 2024 21:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4D0E41566
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4D0E41566;
	Thu, 10 Oct 2024 21:37:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 530731BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31F9640592
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1voI7PJw9lp for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2EA0E40594
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EA0E40594
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EA0E40594
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7762740004;
 Thu, 10 Oct 2024 21:36:35 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:35:44 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233544.63479dd2@windsurf>
In-Reply-To: <20241009181612.3877587-1-james.hilliard1@gmail.com>
References: <20241009181612.3877587-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gltBiK5fnRAR5sFGiDCQUIJ1fHG3huYpkgEiX0r5bgE=;
 b=RDer5lGUdvNsv5zKrXPaQUZUPlt0/7LmEBlYBHkAKCcJMZTHD8cKU0vKGeO+S6v1LlO7w7
 CGUXiGRTEHKVDeJ7ONp7YPxoGxKsV5sfcN5F8hGnKpmBG+FaWk4tk/VjtpY8zs84pKRft0
 i8YX22pS7lp8ZGr5RwtpgZjsMSD5hIaucsXiojiIfaxK15Odmsd4ILhCE5AlJTjhm27Ut2
 YBgeS/Pvh6TB61EsbeDlTeXYM53qNKeNffUNugGwZL0oTxxyQqlbXMQMf5zFTd8ZSwADqg
 /apE0jACccnrMqQisZJ7CCCbqnn/+I9ZJryGvrnAVedHrMGKWYqTguH6n8W3Ow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RDer5lGU
Subject: Re: [Buildroot] [PATCH 1/1] package/python-types-python-dateutil:
 bump to version 2.9.0.20241003
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

On Wed,  9 Oct 2024 12:16:12 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-types-python-dateutil.hash                         | 4 ++--
>  .../python-types-python-dateutil.mk                           | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
