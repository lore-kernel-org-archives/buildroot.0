Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F9AC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E16D40265;
	Mon, 22 Jul 2024 16:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OR8u5aqMTwpy; Mon, 22 Jul 2024 16:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D5D94027E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D5D94027E;
	Mon, 22 Jul 2024 16:24:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F75C1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D0D540320
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RodcXGcWBHrj for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:24:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F6D34023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F6D34023C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F6D34023C
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:24:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28BA2E0002;
 Mon, 22 Jul 2024 16:24:01 +0000 (UTC)
Date: Mon, 22 Jul 2024 18:24:00 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240722182400.683fd1dc@windsurf>
In-Reply-To: <20240719043739.3241372-1-james.hilliard1@gmail.com>
References: <20240719043739.3241372-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721665441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KIW9w7JySnWSG5LmoJQgZNmgh8XAvhS0uxgsj3jylQ0=;
 b=HL7G5Y9AeDFPJ+8wjYIDg8wPXfnQhQqs5+x2ablAPjYSpWPPgs0kxHb154E6CyQbkLZwnC
 4VdeIxKrprQSgFHMkKOLCoko+IXnjHmhwhImWd+CG/dtWri51Rbe1NvFhkftsrL+QlD29e
 vo0zQsTQOJ2QuuAXDsnYWDFIPp/BXABy9JF2dcdG1mIg2rpe1WIRFH+1uduRbnp3QY3zUc
 8cQnzStWVxUpBc/JsD9z2I5niRHtotgAMbsrf0rrM+um4njh8uWNNde68A+wPi5inyByWB
 rBR+1mcci3HARiAf+IE9D6kFsXTVS2A4THUoFHyWrECOTbEX5l10++r9/RmrOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HL7G5Y9A
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.20.1
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

On Thu, 18 Jul 2024 22:37:39 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pydantic-core/python-pydantic-core.hash | 2 +-
>  package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
