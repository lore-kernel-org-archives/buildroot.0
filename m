Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ECBD2444F
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A783D41388;
	Thu, 10 Oct 2024 21:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrUtq2eON5hX; Thu, 10 Oct 2024 21:36:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DFA14130F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DFA14130F;
	Thu, 10 Oct 2024 21:36:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA31F1BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9973A81F75
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwb1lRoI1A7T for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A130681F71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A130681F71
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A130681F71
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE7C440006;
 Thu, 10 Oct 2024 21:36:16 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:35:32 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233532.2018e84c@windsurf>
In-Reply-To: <20241009180901.3872894-1-james.hilliard1@gmail.com>
References: <20241009180901.3872894-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iZSDGtd6FlQKYfNpZKoJi/jZMC9BHWecufsI6+jdDCA=;
 b=hjDaQ7B96w9090aog+NiGbW2Jd0+yaSY5uBJwYWOdZWNiQ0+9VUWrx5nHUNExWU8ZZcQAc
 fZ4P3RueB9Y1c8IH6C2AGCT1MkIWEvwCU1vN9bawwuRPaWqi0XEJp3jkIveg+oCTOG35LV
 rTN/o6nEInUt4dHVg6B1ejHz9hdibndc+CSiceNjiUpszVIrK29W0qxiGfrWhEzl40lrhs
 6QO0yhqa4ysm2HGSvQCvGnmKKVcMRfZCvZHsySNwwSqKWX98ptioFmIpxw82ux9P8SpGi8
 V/E/NRYQLQnYFkT0mnpmRtBClmnFDQp9zPWuOCk5sTA4uaf4ZIwvfpnnSSysow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hjDaQ7B9
Subject: Re: [Buildroot] [PATCH 1/1] package/python-termcolor: bump to
 version 2.5.0
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

On Wed,  9 Oct 2024 12:09:01 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-termcolor/python-termcolor.hash | 4 ++--
>  package/python-termcolor/python-termcolor.mk   | 4 ++--
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
