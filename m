Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683E2C021BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AF9940258;
	Sat, 14 Sep 2024 21:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-MGNgmxUul9; Sat, 14 Sep 2024 21:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 196DA40B3C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 196DA40B3C;
	Sat, 14 Sep 2024 21:54:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 288771BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 761EE412B8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2oPuHHYVuFP for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:53:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 503294187B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 503294187B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 503294187B
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:53:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 681561C0002;
 Sat, 14 Sep 2024 21:53:50 +0000 (UTC)
Date: Sat, 14 Sep 2024 23:53:49 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240914235349.14b45482@windsurf>
In-Reply-To: <20240914212745.1274531-1-james.hilliard1@gmail.com>
References: <20240914212745.1274531-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726350830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8z71ir6pM5e+jqboMbz8ZaiF32HYkLHLH7kyD3JQ1so=;
 b=B+gHEOpRyNMZOF4CCyt4K/xSMtGX1s0S6r+FzKAiVJFIswIPlcJ+QH8JbwkNhXMKheYWzV
 7tlEqFTFfI82FkeSM3MY5atx1UiDIBXhFo7qRhvuB9UmAii1ya19CodYCs2U2rQb6ebeGm
 QFIUHG29rHk2fPuv7qSNHsRFkh+jns4jJSB3SEfJw6jqOZZ4wC8k6QugN+UAjga1xfXmR5
 9uUEP0WW0oQHMHx6/l0pZViMwmJtO/rN9atKvu5J2K5VGF4itZvVkUm2r7l5aUFg6GeWH4
 g3pV0Owb4lETHzESqUbHKtpmiQO/mhBBfM4phIoO8ADyRdEN9iS0zTeQTsvUEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B+gHEOpR
Subject: Re: [Buildroot] [PATCH 1/1] package/python-argh: bump to version
 0.31.3
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

On Sat, 14 Sep 2024 15:27:45 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-argh/python-argh.hash | 4 ++--
>  package/python-argh/python-argh.mk   | 4 ++--
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
