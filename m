Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7338ED0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 15:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4169081238;
	Sat, 26 Oct 2024 15:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5s-MJW_WExeX; Sat, 26 Oct 2024 15:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B9A481275
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B9A481275;
	Sat, 26 Oct 2024 15:40:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89EDA5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AD2040357
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGMd6y6VVfcn for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 15:40:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F27B940356
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F27B940356
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F27B940356
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:40:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1014AFF802;
 Sat, 26 Oct 2024 15:40:02 +0000 (UTC)
Date: Sat, 26 Oct 2024 17:40:02 +0200
To: <yann.morin@orange.com>
Cc: <buildroot@buildroot.org>
Message-ID: <20241026174002.1e94bd5e@windsurf>
In-Reply-To: <34dfbb5898332cf5e1c9788938a85004a9b771a9.1726557959.git.yann.morin@orange.com>
References: <34dfbb5898332cf5e1c9788938a85004a9b771a9.1726557959.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729957203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m+Pz1XREPlfsB/EQOqXnyyt1nq1330yw9ry/+z4Xh5w=;
 b=egyHXKULNqlthebZ33pV/DaMuXMEuQJEVuvSIINnfr/I1AthHtZtRFwBn/jAzk8TXRIvcz
 slio1VOSokaiSKiz0ErRKsDMaYcfYQXPIK/NUqzhbwTtFeQ/wC4KQEmnCtYKCZsf7tXIsd
 8WW/p6O/1V0EUvmiJXY6voSpS1b60M3or+7RAg/0Cko6n+Gk0cxMIAEqJidSnB8DnXdJKZ
 zbORgPVm6h46OEKWO1TOWzkBBhBBiXcz1eFFOQabYuKLuGzPW9ZCJzTmoUaLKDxhbAKJ2q
 dk2XpA0DoON6neYsWC1aR/ZNhG7Ng9axVYF2AlWkE52G2T/sEPv26RUwO1gqPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=egyHXKUL
Subject: Re: [Buildroot] [PATCH] package/skopeo: bump version
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

On Tue, 17 Sep 2024 09:25:59 +0200
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Update of the vendored dependencies.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> ---
>  package/skopeo/skopeo.hash | 2 +-
>  package/skopeo/skopeo.mk   | 2 +-
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
