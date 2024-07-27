Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96488C3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 14:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55E2D40C67;
	Sat, 27 Jul 2024 14:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mz_4zQfZhkzu; Sat, 27 Jul 2024 14:15:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28AA940C8F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28AA940C8F;
	Sat, 27 Jul 2024 14:15:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5DD271BF84C
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A5AC80DEB
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5g27h4Yb_WGk for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 14:15:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 434BC80DDE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 434BC80DDE
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 434BC80DDE
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 14:15:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9B11FF802;
 Sat, 27 Jul 2024 14:15:48 +0000 (UTC)
Date: Sat, 27 Jul 2024 16:15:47 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240727161547.3c7afc77@windsurf>
In-Reply-To: <20240727135252.389739-1-fontaine.fabrice@gmail.com>
References: <20240727135252.389739-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722089749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fAeRdqTheSiT/ZBExqpmBdTRFbsGNo5noMdjzIsT8EI=;
 b=AIg+qHFqmqveKW0rbArKa1YMhUnXEY0k32rlPCXLZuG8xt89rUlkfodL08LYDB+9/chpvP
 /n7fnPFyJglYOIyw/Z4ZgHVxlFWyRgyYwi/vVe8MivdP4KosE07w7OnDlgMZpRyKTdOUJv
 laGG+V7aSAEghT/tC5Yjksc5ooa72RVj7muBxemleEx6goM+VNK6y6Nq3NoQs49Mj4ZHIN
 J4mhlVWe3ZI67H1hMHF9Ao+nkae8x9AYwqVDGkKfaznNR0pcB7X9LeS/jm/b+lQ4OjT55z
 VJi0gdNQlsuci58L2J4tdQDfoUFpNjt+DIss0ju4qET8aMzfeDd4j6D81NjJvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AIg+qHFq
Subject: Re: [Buildroot] [PATCH 1/1] package/avahi: security bump to version
 0.9-rc1
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

Hello Fabrice,

On Sat, 27 Jul 2024 15:52:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Fix CVE-2021-3468 and CVE-2023-38469 to CVE-2023-38473
> - --{en,dis}able-libsystemd must be passed since
>   https://github.com/avahi/avahi/commit/bc116c05b15f1f478a40e47fe9fc68011cef1e50
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I'm a bit uneasy with moving to a release candidate version. How much
effort is it to backport the CVE fixes onto version 0.8 ?

Alternatively, do we have some visibility on when the final 0.9 will be
released? Knowing that 0.8 dates back from 2020, it seems like the
project is not particularly quick at making new releases :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
