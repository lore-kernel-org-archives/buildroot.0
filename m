Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4742C25B74
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D37142566;
	Fri, 10 May 2024 20:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pE9s96_W6Xna; Fri, 10 May 2024 20:31:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D68C7426AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D68C7426AD;
	Fri, 10 May 2024 20:31:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA78B1BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A39F042E95
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLxSU4i1rPeQ for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:31:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA78A42E48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA78A42E48
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA78A42E48
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:31:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00E13FF802;
 Fri, 10 May 2024 20:30:49 +0000 (UTC)
Date: Fri, 10 May 2024 22:30:48 +0200
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20240510223048.026984f4@windsurf>
In-Reply-To: <20240310062333.642265-1-fido_max@inbox.ru>
References: <20240310062333.642265-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715373050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wpqqIu/PYHPNwk2o8IpfHfTiktJxVtysmQfQITLD8Mo=;
 b=e57oywE8q7BV2O3xUA/lnYX9yklQuLaLygUtW4rzul37HpumG2RyaRz8Q/EeaPQegOY7ri
 p5HGDSyXBVaaRsocWGSiQDiHWAvWZaOVhgNM1EA8eyqPKkCpmGusGHurDurAV+QGtKnE0/
 x+ffsq60OcbKCTmLWYzZeUZBYq5+SyWBa8xxFYReFu/C8N+M6ObZxiV+ckjAsDgAjS6uw3
 rPAbX9kgkPZU8QUJkCF6Gp26dCIUHrTDZ79AxOelmuoCvdjgs2iYURZgremIz/bkwUo5lu
 5Wj9Zo8ZgvqhpSclLG9AdjcQJr2f/cWS+EyoRIdUkolUXwAEBiuecNQSLLRvqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e57oywE8
Subject: Re: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to
 1.11.0
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

On Sun, 10 Mar 2024 09:23:33 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/1.11.0
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/osm2pgsql/osm2pgsql.hash | 2 +-
>  package/osm2pgsql/osm2pgsql.mk   | 2 +-
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
