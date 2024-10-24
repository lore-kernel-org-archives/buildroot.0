Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF27D0E415
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4144260AEE;
	Thu, 24 Oct 2024 20:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0uUtn6MkE5IT; Thu, 24 Oct 2024 20:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CDAA60AFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CDAA60AFF;
	Thu, 24 Oct 2024 20:33:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29A4059BD
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E0074012A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GkjD01ruOxPV for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:33:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33FE040AB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33FE040AB8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33FE040AB8
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:33:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C320DC0005;
 Thu, 24 Oct 2024 20:33:45 +0000 (UTC)
Date: Thu, 24 Oct 2024 22:33:44 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20241024223344.1f3fe8b2@windsurf>
In-Reply-To: <20241002193648.2910408-1-thomas.petazzoni@bootlin.com>
References: <20241002193648.2910408-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729802026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bMHQR2suidADMpISfn/whDUYqRieOeBMPNEJLzh3Eig=;
 b=fUxnnOHeFewZuPNpfTBFckj5WshUONIcKTe7N01B67DsnxQXLPzc3jtxF1sXKVT87fX3Yy
 OhaZgxvUZOcRHpuj/xtzaZwAFCLCdhtMt6r1YW+8lsnc+uTOztEPwFhBqy/vfBJQtMWNha
 SVVR6kYIZai5aCIdX5RBkiHEf2Obp43iG3C2TOQXFWSHZeIrjLIKcbYuYIl/vswL67JnX7
 laHjc72Y5ATUYMnliVHhT23+SBD/XOVdhRJ0n1zrGpiL31zuPjcKenLdAQD8kX1pl0DR8f
 UClKeWzm2Xmm0gfBvdmwAD5baw01bm/eau1NirhZKYjJcVKcn551zLNOst1k3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fUxnnOHe
Subject: Re: [Buildroot] [PATCH 1/2] docs/website/sponsors.html: fix page
 layout
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

On Wed,  2 Oct 2024 21:36:46 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> The LTS block was glued with the next block, add missing </div>.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  docs/website/sponsors.html | 1 +
>  1 file changed, 1 insertion(+)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
