Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9165BD24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B554412F0;
	Thu, 10 Oct 2024 21:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n1Bx7gkracRF; Thu, 10 Oct 2024 21:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D854413E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D854413E4;
	Thu, 10 Oct 2024 21:36:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22FA61BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1338381F75
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBxY5RYWPFnd for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E02D381F71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E02D381F71
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E02D381F71
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F3AC40004;
 Thu, 10 Oct 2024 21:36:21 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:34:34 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233434.73cd4c36@windsurf>
In-Reply-To: <20241009162539.3820226-1-james.hilliard1@gmail.com>
References: <20241009162539.3820226-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T5SlM7H+xAyk1IFLyv13oeixFUlgPjb9oB/0PwAFhTA=;
 b=QqYY9GS2ECdL6qvfLhET35KS6xBJgGWphi6YM8KSjb0VURsFbdkvJrG/YMcVM26bv8k0wJ
 RUZwQsbZqBx2cM7HPE+0LE6W+o40TolwOQW/7pSuLmbo14pHMGyMmX81x/Bk7daBb9h0+H
 P1QdaJwHGFr+lIUBnUlePoGHLLuA9XE5dLXp4aG7MqC94pf0i2HsH0m3IGXbumPsJLquMS
 MEFVzkczVTHDhvDJZt6G1DWuaqi2ErsTKC66Up9xG1vdDTJ1wNYOHZ5KUNjQS6jzRc4His
 XjIMtmmzzMACrjTx1UFBi3CBgy9q/K4wdu5iAsJHEneh1TYhrJB+XK5j/1dYvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QqYY9GS2
Subject: Re: [Buildroot] [PATCH 1/1] package/python-grpcio: bump to version
 1.66.2
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

On Wed,  9 Oct 2024 10:25:39 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-grpcio/python-grpcio.hash | 4 ++--
>  package/python-grpcio/python-grpcio.mk   | 4 ++--
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
