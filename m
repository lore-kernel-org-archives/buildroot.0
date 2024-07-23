Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4C4C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 21:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D3BA605C8;
	Tue, 23 Jul 2024 21:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id st9LRUATWQaU; Tue, 23 Jul 2024 21:04:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D49A360869
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D49A360869;
	Tue, 23 Jul 2024 21:04:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2B861BF280
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC9A440477
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c557MHICxCEW for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 21:04:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6EF9040319
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EF9040319
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EF9040319
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 21:04:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD95B240005;
 Tue, 23 Jul 2024 21:04:32 +0000 (UTC)
Date: Tue, 23 Jul 2024 23:04:31 +0200
To: Lance Fredrickson <lancethepants@gmail.com>
Message-ID: <20240723230431.040ecd41@windsurf>
In-Reply-To: <20240723202423.955779-1-lancethepants@gmail.com>
References: <20240723202423.955779-1-lancethepants@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721768673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zm3QnCCJeTAuxJVUr1f/haDfEo/oUiMym0LSpEa5YRU=;
 b=pwpT+oIpz7DOc/dXbtAS12HWgEISAg7yTs+rX3KA8fCnw3c27sAXD3z3zs5t9qzq4Ltd51
 j+xpBaL07GsNcsoU46rwI7wPW3bxVCxhh90jMhyJjk1UBSvJQ3ocy3UJXxEuP6RMdvTY9C
 bwfXwXpq8xuLTJ7Z0iekJQfT1g3UBi4v6cueUnWyhaLJTmo3TJWC45gZKUgKFoLxDHrrEq
 THjAdMH3/D+F4t+blS2Xx993GPaHvyVh6LKGs1kQxdooKuv/j7qBHBE/NHx1f4O5Hi4kIi
 VNMa64qri3HZZJz5lv9Q8wMIroniflwh6M3yJPXXG4kYZQ/OEtuCmDmCC9x9Jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pwpT+oIp
Subject: Re: [Buildroot] [PATCH 1/1] package/wireless-regdb: bump version to
 2024.07.04
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
Cc: Dimitrios Siganos <dimitris@siganos.org>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Jul 2024 14:24:23 -0600
Lance Fredrickson <lancethepants@gmail.com> wrote:

> From: Lance Fredrickson <lancethepants@gmail.com>
> 
> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
> ---
>  package/wireless-regdb/wireless-regdb.hash | 2 +-
>  package/wireless-regdb/wireless-regdb.mk   | 2 +-
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
