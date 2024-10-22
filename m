Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4679DCDD0EA
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1545780F68;
	Tue, 22 Oct 2024 20:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIfJ557cIwR9; Tue, 22 Oct 2024 20:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D2E480F6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D2E480F6B;
	Tue, 22 Oct 2024 20:29:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8ED72072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A7CE405DB
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Og49I_7PFF-w for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:29:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 41389405D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41389405D6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41389405D6
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:29:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30CB740003
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:29:43 +0000 (UTC)
Date: Tue, 22 Oct 2024 22:29:41 +0200
To: buildroot@buildroot.org
Message-ID: <20241022222941.3720b546@windsurf>
In-Reply-To: <AS1P250MB06084A83D030B95E26EF7746A94C2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <AS1P250MB06084A83D030B95E26EF7746A94C2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729628983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3XBDOdK4fwPv+TX9P057t0z+Lb8Wo86/O3ndEmS7ANw=;
 b=b9Ely/QTqm6gLy+6r7uPW21yQekGh9gqhi46wWqs21kqbmf/FLB1VPiQNJpYn3v3TTECKt
 ZEEiI6euNW9g8Ym2UDWZ7cYnwHwVS1r8ZpmG695xdHxRiYyl9tqQTJ6eU1KW6/rJRqCf5H
 LrLG6b4/fCnmTwBvIPo9CfHyu8wRkYHWW5Exirdh5Sq66HDWCXNPBAyr5rrVbfLW2ZuxlB
 VOlFax7wnl8DdoE4jnMDsbvUFWa8GdPxXnBJMtHe5AECxVwqXkM000uWpzLg2V3dMfUERS
 0tJsuvhg4QefjVy2DtL4xVkcgSk1h54qozffzyRZptV+9JpVirbcWARH59Fq8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b9Ely/QT
Subject: Re: [Buildroot] [PATCH 1/2] package/libzenoh-pico: bump version to
 1.0.0
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

On Tue, 22 Oct 2024 06:39:30 +0000
Michel Alex <Alex.Michel@wiedemann-group.com> wrote:

> https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/1.0.0
> Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
> ---
>  package/libzenoh-pico/libzenoh-pico.hash | 2 +-
>  package/libzenoh-pico/libzenoh-pico.mk   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
