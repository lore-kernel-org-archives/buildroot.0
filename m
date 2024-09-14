Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644ACC021A9
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 18:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2871480A89;
	Sat, 14 Sep 2024 18:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORNeTirnWzfv; Sat, 14 Sep 2024 18:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39CD980A9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39CD980A9A;
	Sat, 14 Sep 2024 18:26:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 615251BF31D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D2D580A46
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBxxDq_msZoL for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 18:26:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 65224805AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65224805AD
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65224805AD
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 18:26:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 679E0FF802;
 Sat, 14 Sep 2024 18:26:22 +0000 (UTC)
Date: Sat, 14 Sep 2024 20:26:20 +0200
To: Vincent Jardin <vjardin@free.fr>
Message-ID: <20240914202620.07b949df@windsurf>
In-Reply-To: <20240828163342.62819-1-vjardin@free.fr>
References: <20240828163342.62819-1-vjardin@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726338382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjzrCFoSitZfqOS9n4vKyLHNw4ojgpbVDuNXfHu5ROo=;
 b=CXgVbp1kM5dnHCTTliLkyNx4anb8km+GMyi9wwOgsQM3EwLoQUnswpURWYt6ddaKVzy0uj
 aRkaK2/ThOrnNc3P1T7WnoOiTVeKRs6aZV58N+KbsYQIvA90x/7kq8smfz9OtTIiGbSz6M
 w8u4t+GS0OoAqWawxxt7ULLxop9AtvXHhjUV19WoVsGbxt2v+Wsf/CTxKky8wgGN8FH0+3
 EimT0Ov8YnRqJWkP7SGeeLCy5i43VkMfY07K9+TdREzP0uYUDxhTibKaUz5WIdH/DF5Nr2
 1/u8UHyIouSKGMUHHa7q64l66K6eN2F5qGl4HMx4dRzQAT8vBMcP8Xxx5syz2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CXgVbp1k
Subject: Re: [Buildroot] [PATCH v1 1/1] package/lldpd: update to 1.0.18
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
Cc: Vincent Bernat <vincent@bernat.ch>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 28 Aug 2024 18:33:42 +0200
Vincent Jardin <vjardin@free.fr> wrote:

> GPG, hash key checked
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  package/lldpd/lldpd.hash | 5 +++--
>  package/lldpd/lldpd.mk   | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)

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
