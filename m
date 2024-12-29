Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6364FE7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 22:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21BF3808AF;
	Sun, 29 Dec 2024 22:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMTiqOYgh7an; Sun, 29 Dec 2024 22:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33E8D80A72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33E8D80A72;
	Sun, 29 Dec 2024 22:48:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B44E6C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2279808AF
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ojVksVVBOnw for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 22:48:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A3948056F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A3948056F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A3948056F
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:48:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D04DC60002;
 Sun, 29 Dec 2024 22:48:40 +0000 (UTC)
Date: Sun, 29 Dec 2024 23:48:40 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241229234840.774ddd96@windsurf>
In-Reply-To: <20241216220541.1074832-1-ju.o@free.fr>
References: <20241216220541.1074832-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735512521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nMKWetQG6wQbnOWuzq/R/7xwhDS3ColmBLiykGLFaQ0=;
 b=ANTvk58yM9vtqXwSGjlfoAsIsFe428qsLWO6/8MbKYB7ZaFzTVs5CC4CdbuyfpeGiClOx7
 +9NiZbcuVD1f0dZxDeTXH/K9F37zljCix/NFY38XWUzZKN9UM8LGstQPiIo+2uMA8rA2Vm
 zlPyEuXsPUX/devwi6y7SX49XpL5e1leYCtDFbCiSjn2v6Y2JWfvnKASedaJ8+H3RTyzoq
 1+EO+ypvv1hS6FFNBMXdljzxWcz+ZnNegcT6bwTTZ6FcRnNCK+q4g0QTywDKgxiASuc1hI
 Utbz21NyZ/vZTPaoh+5fn6Bv+rgOIX80xGQHr8pmce13aPLb7yq9H2EkcvBd2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ANTvk58y
Subject: Re: [Buildroot] [PATCH 1/1] package/octave: bump to version 9.3.0
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

On Mon, 16 Dec 2024 23:05:41 +0100
Julien Olivain <ju.o@free.fr> wrote:

> See release announce:
> https://octave.org/news/release/2024/12/15/octave-9.3.0-released.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8657897631
> ---
>  package/octave/octave.hash | 4 ++--
>  package/octave/octave.mk   | 2 +-
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
