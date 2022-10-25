Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A213C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 20:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE30760B51;
	Tue, 25 Oct 2022 20:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE30760B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t-HQ7qnn_vZa; Tue, 25 Oct 2022 20:57:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E073F60ACD;
	Tue, 25 Oct 2022 20:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E073F60ACD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CEA941BF33A
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C864400D1
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C864400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZSfY9yx-PLcN for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 20:57:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B71C4000B
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B71C4000B
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 20:57:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 480A1100004;
 Tue, 25 Oct 2022 20:57:06 +0000 (UTC)
Date: Tue, 25 Oct 2022 22:57:05 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221025225705.31a1975c@windsurf>
In-Reply-To: <20221025190236.1190494-1-james.hilliard1@gmail.com>
References: <20221025190236.1190494-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666731429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ItNkdt4+DOqxooVvbGVpJriHAg6AJ2OGXuGpmaADW5Y=;
 b=PXgaD/+FGgW1n8Z/ukuV/+RghewlNBIcv8/+APagYnCpSkIrHtZSXPf2586N8ol9cpGq/k
 IeQdnSEu5m8CaAMXiTypngq/yYKkrbq2HM8pcWCHQ9m1Ybb30DJAHAiAfjWmwZ/2sjdc5C
 ZWOK35layVw9eFWDXOfNxS6J/6/M6Zo1NIBIrC3PuvpxFv6aZZbwi3Scp+el/N90atsZS3
 p7Rj+BJgjrEP/ENparbi2L6c707uVKgJbAkUBOO8bYXtB1x/pIPk5HEY2vK+9kjiPezLvn
 UHUbul0j9AYuQVf/HlPXMr/lf77IkE4VEfcwDCp/r8wytJgVkxma+LYVVQg0aw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PXgaD/+F
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: bypass configure shell
 wrapper
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
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 25 Oct 2022 13:02:36 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> The configure file is a shell script which searches for a predefined
> python binary and then calls configure.py with that.
> 
> As we already call configure with the desired python binary we should
> call configure.py directly so that the expected python binary is used
> and so that the shell wrapper doesn't throw spurious interpreter
> validation errors.
> 
> This also avoid spurious errors due to the configure shell wrapper
> missing supported python versions, for example this fixes:
> Node.js configure: Found Python 3.11.0...
> Please use python3.10 or python3.9 or python3.8 or python3.7 or python3.6.
> 	/usr/bin/python3.10 ./configure
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/nodejs/nodejs.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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
