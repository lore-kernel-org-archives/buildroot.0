Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE8DC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B83980B5E;
	Wed,  1 May 2024 19:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIp9_tC2cfNL; Wed,  1 May 2024 19:23:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BA4080B25
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BA4080B25;
	Wed,  1 May 2024 19:23:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A7641BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 580AC40323
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rgTLa6nECU8 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:23:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1529D4031D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1529D4031D
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1529D4031D
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:23:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3734C20008;
 Wed,  1 May 2024 19:23:39 +0000 (UTC)
Date: Wed, 1 May 2024 21:23:38 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240501212338.6680bb2e@windsurf>
In-Reply-To: <20240401191720.141576-1-ju.o@free.fr>
References: <20240401191720.141576-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714591419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2eY1vr8UQYSIw5YWWspi1Dfx0dbciEh162WTPzNP/4=;
 b=AzH+H50HveKgGt1v4kOvMYT3AaxP16FT6Ujnz9N7LPH6nwfG8N81G5oRAJbulkBvV/Fy9T
 dG3Ky59zTrNj14Rpn4oIUc6TxysNaaZFihDqNLXLAlvXXJwxqcCRpz5JpjZ0eQ1FIWwUAI
 pTHki57RA9fNtk5r7b4aR6VohDIEuLexWqiNizcTo3TU7GnQ98Y32hs3kMvgzaj0l63pHQ
 z+IhHv1kntZP+MQpmBTN3eO/nmhvqlZIFjeUZ6C2qv8lMtrqefK6R+Kg9O6YwmUb1avHhn
 YkHRFARmU3yPdwTYz9kR2GZv3zPfzjbyhOYG8nQ2e1U39wWK7AgMxImz0pmsIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AzH+H50H
Subject: Re: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version
 2.3.5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  1 Apr 2024 21:17:20 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since v2.3.4, see:
> - https://github.com/FluidSynth/fluidsynth/releases/tag/v2.3.5
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/fluidsynth/fluidsynth.hash | 2 +-
>  package/fluidsynth/fluidsynth.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
