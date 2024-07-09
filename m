Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AADC3DA42
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 20:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C16F4012B;
	Tue,  9 Jul 2024 20:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mFEq61sLn76K; Tue,  9 Jul 2024 20:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3584E40EF1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3584E40EF1;
	Tue,  9 Jul 2024 20:25:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3A401BF5DD
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FA3781E8C
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EI2rVInCVHZH for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 20:25:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7CA7C81E8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CA7C81E8B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CA7C81E8B
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 20:25:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7933B240002;
 Tue,  9 Jul 2024 20:25:19 +0000 (UTC)
Date: Tue, 9 Jul 2024 22:25:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240709222518.17dd0361@windsurf>
In-Reply-To: <20240627210014.1458512-1-bernd@kuhls.net>
References: <20240627210014.1458512-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720556719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZNOqBKub0a+557WQCBNtTAmowQLvWcK/6HATwCaxT/4=;
 b=IJFXXifO73/5Vw3yqYk0YlWeBQBZWzUzyJplat9ihZZq/EVEVinFycGApMBu1k4J7sTCwd
 S8v/DRgAoSSbZ/FzatiJ5Aevxw2TLryxOy8NQp+QaxZpiWGE6suZat8Nv1DlQj4H6ijzAD
 Nj3ydRrqrX+xo+sDtlAo/YJGOiEjyeExQFKbtYAmsic7a02q+zpPjaqRrmWGkWpvaS/G0f
 afEos+WTmCo/nt0E3oUw1fOcUDpzNFT9i4V7wx+zwN+/SP4XyhHiN1HyoHCAq0H2vbT1e8
 sQQcg6oqSu+1kUEhFn0Mr544D+1i399aiBKj6X4Y/hQ0IHm4rufQvNOVRat+Uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IJFXXifO
Subject: Re: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.122
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

On Thu, 27 Jun 2024 23:00:14 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.x.org/archives/xorg-announce/2024-June/003518.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libdrm/libdrm.hash | 6 +++---
>  package/libdrm/libdrm.mk   | 2 +-
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
