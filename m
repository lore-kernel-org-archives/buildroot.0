Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EB5C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 12:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A651340BD1;
	Tue, 16 Jul 2024 12:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_I_I_T3wNT1; Tue, 16 Jul 2024 12:43:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D60240C01
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D60240C01;
	Tue, 16 Jul 2024 12:43:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D2051BF97D
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADC18403B2
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78z-j6AhwZiO for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 12:43:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77700402DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77700402DA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77700402DA
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:43:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27C744000D;
 Tue, 16 Jul 2024 12:43:06 +0000 (UTC)
Date: Tue, 16 Jul 2024 14:43:05 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240716144305.19eb7c88@windsurf>
In-Reply-To: <20240716102809.1704624-1-buildroot@bubu1.eu>
References: <20240716102809.1704624-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721133786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+WgdsnzZMtdrpLWK0nXkWx8nWCcPLfOOb9vEucnVRo=;
 b=EE76UxJpt3O9RULko6MOOkuOsnZRxZvJ3/a2zcL74IyKddaHvzIsQcAAJLUHfUJeN8I3GZ
 8gXP8LXn8MpxPIonWesUHm8VQ6qtJNRg0UfQXSDTrxKiqeZAM5RwtodVaBRFXzlbyemX9u
 /y2xZPk5MDnt5HVtJkn5iUQrgDtQlLs6owOKXN7OiGzuOQTPvoSy9nRdLmbtJgGjzqfWzD
 Ka83agoeqRwSYjtYWloHLA8OJoXWI87H1zSgCgTDG56iIkfqIx3NeqDy9FM8Xg74LFhdEG
 Qnur+19ad44u7loC0uN99dgeXzPa8+q7Q+ciuOdYmEfkjsWeGEbwW/pcewvuSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EE76UxJp
Subject: Re: [Buildroot] [PATCH] package/c-ares: bump to 1.32.2
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 16 Jul 2024 12:28:08 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Changelog: https://c-ares.org/changelog.html#1_32_2
> 
> License hash changed due to whitespace changes:
> https://github.com/c-ares/c-ares/commit/ce4c20afcbf9a05d36d02893e8ebb66726d8396c
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/c-ares/c-ares.hash | 4 ++--
>  package/c-ares/c-ares.mk   | 4 ++--
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
