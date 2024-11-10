Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055F9D12D4A
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 16:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C621680F64;
	Sun, 10 Nov 2024 16:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00TSnKZ-4HDE; Sun, 10 Nov 2024 16:47:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCD8380F68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCD8380F68;
	Sun, 10 Nov 2024 16:47:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF92F6C
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0F9B40361
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94vki1RC30kS for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 16:47:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ACDF7402E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACDF7402E4
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACDF7402E4
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:47:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA92BFF806;
 Sun, 10 Nov 2024 16:47:44 +0000 (UTC)
Date: Sun, 10 Nov 2024 17:46:51 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Peter Seiderer <ps.report@gmx.net>, Asaf Kahlon
 <asafka7@gmail.com>
Message-ID: <20241110174651.5c69f523@windsurf>
In-Reply-To: <20241109165851.563761-1-james.hilliard1@gmail.com>
References: <20241109165851.563761-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731257265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKsbdJPuRR+Tc17Y8E2wV6kMCKBrVn+pKAuhRyE66cs=;
 b=eiFYdvsFoyn3nBuCAMua8OjjKnR7g7NG/lwdrGyquUAFSfbx/57uT1A7ZKG1vZBIByByJQ
 UFaj7Xx8bw1oF+Z3Olti1a0yncCOZ5L/UDSp00jJ4amXFDiWNzWqcnJuRiEAgkKNbOXxBF
 PiOkfpFxpPs8R4zmXzdRN12dCOumEG0gRMJG0i3AO8L182e0A3esT8pe3++KZsWVqNjHBm
 lY8LY1RT7P9Io+aSHoRloqZbG0W5mgt6PW/rJyj9a5xdYahwGQwQKChEIPTBMalpt6ysY5
 80l9BRQnS2dY/jW/wYyryo6aZmo3PmR+QXLDw2oSe24rchffsY70uy/ATQypfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eiFYdvsF
Subject: Re: [Buildroot] [PATCH 1/1] package/python-blinker: bump to version
 1.9.0
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

On Sat,  9 Nov 2024 09:58:51 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-blinker/python-blinker.hash | 4 ++--
>  package/python-blinker/python-blinker.mk   | 4 ++--
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
