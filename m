Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D8CC25B74
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D67C42536;
	Fri, 10 May 2024 20:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLcs0npDO_tR; Fri, 10 May 2024 20:30:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28B3F42571
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28B3F42571;
	Fri, 10 May 2024 20:30:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6AE9D1BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59685424B3
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJWuoPdXW1ID for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:30:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13F6042596
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13F6042596
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13F6042596
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:30:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6F0F40003;
 Fri, 10 May 2024 20:30:34 +0000 (UTC)
Date: Fri, 10 May 2024 22:30:33 +0200
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20240510223033.137543e6@windsurf>
In-Reply-To: <20240310055807.442035-1-fido_max@inbox.ru>
References: <20240310055807.442035-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715373035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p0bVfDNhgn4kFG3lU5eQzbdv9+ZIAG/QuAOFen/zUpA=;
 b=aAjkCqt8tUtBjfOI4Z5R9HFc5Lhj+IzNrnDf479DHGH+6twHFLeS6uz+3kOe+g9EvxH0lo
 aP0uOU3Md/WSyuRzRi6IcD6BHmEC7MjlwaJN67yWK436rRs989XqK/oOI8jECRbqzIv/0F
 5BSHV6I0fO7Ylj16YrZLfPGODmgPmE9AFVnPqrzOL8qJwwHMK3UCdeIotqBkpUdFg6Ae1H
 WO7M4o99vfxusNHmw09wCzu1Rghz6WgW6qJH/C4Imf9utAmsiOHn5bw+pEXnJVwdEUy38I
 35GpM6oGgrklhBRADsDUN2/Wg4JnO1zaHGFJXkS33bUMSl8CW5f3eZcU359jLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aAjkCqt8
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: bump version to 16.2
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

On Sun, 10 Mar 2024 08:58:06 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> Release notes: https://www.postgresql.org/docs/release/16.2/
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/postgresql/postgresql.hash | 4 ++--
>  package/postgresql/postgresql.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

You had forgotten to update the hash of the license file, which changed
due to a copyright year update. I fixed this minor issue, when applying
to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
