Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DB0CD1292
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 21:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BCA0414B5;
	Mon,  8 Apr 2024 21:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qayWD9lROUy1; Mon,  8 Apr 2024 21:04:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7F6241494
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7F6241494;
	Mon,  8 Apr 2024 21:04:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3A11BF2A7
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F05F560BA9
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJxiYiOAcyxU for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 21:04:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ACA4860B94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACA4860B94
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACA4860B94
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 21:04:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A5461BF203;
 Mon,  8 Apr 2024 21:04:04 +0000 (UTC)
Date: Mon, 8 Apr 2024 23:04:01 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240408230401.101f2292@windsurf>
In-Reply-To: <20240404183707.83611-1-bernd@kuhls.net>
References: <20240404183707.83611-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712610244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s2+XW1szf++Bx/BkrFc5IKNuGQMEZRGmlau6p7GpVW4=;
 b=YOjk70qk62x7wUhq47xqotZvaerVJrBhsmMLwy60FskJC4ehFsuNjrygAVdcIS99gtFH+e
 I8ZvTEsuD8LNZX0o0gP8p2R/hKR4xrzo8Vfq2AN4bpzhGkcKEugiZ5KNwVgqgvxOpSa/4W
 Hlcx/arWePbjOGhhFi+NioB9appPsxTkCe2TNuXk3BunWGQFuPZ/tAI5yJPiW/Ntfk8iJV
 jS4T0ncNw8/m0dztjq7sIjrvt2vIyRAVFTN99ulq7YoYZuBq03uPs+ebb0J8Pf14cpHgDy
 lOc27ejUB4tBv+aDti2fVQObx69ztDWfCcCEs0ohJPz58stbgk+nfHm1fMuQQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YOjk70qk
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.21.2
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

On Thu,  4 Apr 2024 20:37:07 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/xmrig/xmrig.hash | 2 +-
>  package/xmrig/xmrig.mk   | 2 +-
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
