Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500ACC3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 08:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15D66607AD;
	Mon, 29 Jul 2024 08:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K570MkP93WwK; Mon, 29 Jul 2024 08:17:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22C59607FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22C59607FB;
	Mon, 29 Jul 2024 08:17:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B93C71BF591
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 08:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A62A380DD3
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 08:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMPdJge4Ja1R for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 08:17:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51E8480CFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51E8480CFA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51E8480CFA
 for <buildroot@busybox.net>; Mon, 29 Jul 2024 08:17:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57DA340008;
 Mon, 29 Jul 2024 08:17:43 +0000 (UTC)
Date: Mon, 29 Jul 2024 10:17:42 +0200
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20240729101742.69ddc74f@windsurf>
In-Reply-To: <20240729072843.31455-1-mf@go-sys.de>
References: <20240729072843.31455-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722241063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sJpgFkH8r2fWx4VzdJq7c6gzswMxq65/8b9RazVvEf8=;
 b=ejhfZpCX6AMfSHdRJ7H/LcCpucyszZD0/FXnkTap+3nb5aZxWy4MPIe4Y+sCYWd+4zfCy3
 y2gwg6z1DNUly0UlJIX9Wn4W3T5MDDTUmlW69Eey4AfqV9kZ1bNsC+mb8rHSxCdiaXJJmg
 eypT9asuHMLMgnkteOrYBxr4k8WAO80U5cLpKX3GLeIvgdhZA1y03Ub6fQUqLlpv4PZTLq
 E9l00NLvY+rJFeLCoDQKRoLkXr1iC9KmG1wKnhjwVBmxKibHRowmOv0o9F6P1v0Sj7voDs
 9sKnkq0aCY9GnryskPSgXDdU1UqgelGkWFD7EfafssFtiGRbpIuIbyfTM5iO9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ejhfZpCX
Subject: Re: [Buildroot] [PATCH] package/sdl2: bump version to 2.30.5
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

On Mon, 29 Jul 2024 09:28:43 +0200
Michael Fischer <mf@go-sys.de> wrote:

> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/sdl2/sdl2.hash | 4 ++--
>  package/sdl2/sdl2.mk   | 2 +-
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
