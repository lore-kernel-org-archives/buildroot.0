Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C19DC3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 20:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E1B5811C2;
	Mon,  5 Aug 2024 20:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPRS_NgI7B7S; Mon,  5 Aug 2024 20:42:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3A4D80B93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3A4D80B93;
	Mon,  5 Aug 2024 20:42:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15F3C1BF335
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0268C81189
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KY837YLqczb9 for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 20:42:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8E848119D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8E848119D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8E848119D
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 20:42:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8235D240002;
 Mon,  5 Aug 2024 20:42:39 +0000 (UTC)
Date: Mon, 5 Aug 2024 22:42:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240805224238.67ec7d5c@windsurf>
In-Reply-To: <20240805190813.3410961-1-bernd@kuhls.net>
References: <20240805190813.3410961-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722890559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2mP0vAoDLkGUABdcOnDc3FaRSzrzmZf0Xsrn9jQhPzk=;
 b=T3KlXN6cqet2CG5dcJhgs7Cl2YKejW8PtljhvdZDe/RZd+xT9HYGJAvSpaJzPe3Ymm0YDJ
 6lp08aAxNAZ5u85VB3CfZlI6Zh5u7DQBO8SxWpUT/M35q8RSIS07JuHvtflsdl+CJBGHrR
 pkKta57z7czNe8YWoNF41wNOM97NBlLHLbaYGUMiE/Lzb+v6PP98abkOMc1kqoPfcmy+Vj
 YUn1LZiEs15pVluiF0+OjQEUpZe5YwOn92ZVJn0ktwwfwimzkv6fHTUbOWBHvT6qoKzCbe
 jw1um+UPZsdZz2kbcNaoCqeU8JgEsojzLtEvd/ylnV/NRw4l8Qh84a00n/rOPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T3KlXN6c
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 6.1.2
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  5 Aug 2024 21:08:13 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Rebased patch 0003.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/ffmpeg/0003-libavutil-Fix-mips-build.patch | 5 +++--
>  package/ffmpeg/ffmpeg.hash                         | 2 +-
>  package/ffmpeg/ffmpeg.mk                           | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)

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
