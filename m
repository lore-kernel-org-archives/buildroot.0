Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D854D6EBE2
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 07:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8140F60730;
	Fri, 29 Nov 2024 07:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2Gmf0XMCqui; Fri, 29 Nov 2024 07:57:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88D1260690
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88D1260690;
	Fri, 29 Nov 2024 07:57:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B7A8A6A
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 07:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EC7340180
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 07:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tv_wSea9fCp2 for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 07:57:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D5AB0400D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5AB0400D2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5AB0400D2
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 07:57:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0A766000B;
 Fri, 29 Nov 2024 07:57:34 +0000 (UTC)
Date: Fri, 29 Nov 2024 08:57:33 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241129085733.757371c3@windsurf>
In-Reply-To: <18522091953e830b634abf3bbe776b17@free.fr>
References: <20241126182855.38704-1-ju.o@free.fr>
 <20241128211817.6c68520d@windsurf>
 <18522091953e830b634abf3bbe776b17@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1732867055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KTJJoSj9qI98Cuj92lAM334vhJlhuShwJypiU92t8Y=;
 b=Ob/qjvFZQzG23Etsp/yl9ePRMRPrnNtZ8vuLiZylvqRgMSJlLLkhhHQy0EIjdV79KgJjyV
 +rVffZHXs4lVfNe/vixg1vrs5LcclSmqpjkvAXZi4mOs8G/T0wAcWtJPmjCxZL/IkzOslX
 vIsCNR621I5Iq6akXULX/Wg10k0B7IoitwkNguvvdP+bvaTuRKQtOdA54TZIiTFwLgTiut
 QKVcya94rV5F6r3+v7Om3XgMKywVhhproOiJDaj70KEUifEXVREVGkKL+1v2ieeFMAuzej
 ICHvkAqtRNKb74HAwCCD1RWOJBHvoClWsFV6RRrYf6bSU/tL2nKX3CMa40Eckg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ob/qjvFZ
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: improve mosquitto test
 reliability
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 28 Nov 2024 21:35:49 +0100
Julien Olivain <ju.o@free.fr> wrote:

> > Thanks a lot, I've applied to master. However, I'm not a huge fan of
> > those hardcoded "sleep 5": it makes the test longer even on fast
> > machines, and it doesn't necessarily resolve the problem in all
> > situations. But I think you had yourself mentioned in some other thread
> > that it would be nicer to have some kind of retry loop instead?  
> 
> I am not a fan either...  This will help for the time being.

Absolutely, that's why I applied even though it isn't the "perfect"
solution.

> I have few patches about a retry loop I need polish before proposing.
> I also don't want to include retry logic everywhere like this one:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11-rc2/support/testing/tests/package/test_mdadm.py#L125
> 
> I currently add new functions in support/testing/infra/basetest.py for
> those situations.

Good idea!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
