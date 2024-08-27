Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45A4C5472F
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E1F84062C;
	Tue, 27 Aug 2024 16:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4i5Doac0t2p; Tue, 27 Aug 2024 16:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AF3C4061C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AF3C4061C;
	Tue, 27 Aug 2024 16:58:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E919A1BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E412A608B1
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kpqslgD4pXnD for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:58:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D6709608AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6709608AD
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6709608AD
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:58:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDDE6C0003;
 Tue, 27 Aug 2024 16:58:53 +0000 (UTC)
Date: Tue, 27 Aug 2024 18:58:53 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240827185853.069fd4f7@windsurf>
In-Reply-To: <ZsmaBGJNjd4x9ymM@waldemar-brodkorb.de>
References: <ZsmaBGJNjd4x9ymM@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724777934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7WOwUW5NK5IRda3NBK5TPXRD/NF81S+HKH413tz4vVg=;
 b=RNDtMtniJe4n89EvoFiQ/bO/VyuVOdPoyQtErXxVO9hHBJtkC5kY2Gf8wXXRAeBI1hfIdE
 osZIYewXLQIn+Y79RFORTIOzlaJ4aFOTwP3iWEFmgffjzJD/O6/d9h+X8y9yqTtsJhKI8i
 AZWBMeYWsoHhlItjZPaIyv111d2DOdYsBWCThM0Vzvv0dsdaBUPEE28cu8XNaS7xguoT3x
 rt3sIrmjtAGYVlI9dTkRnWZyCguOvVeiBQpEjItvz+sb1YuQRhG22aoOBKex2mzysvMlyQ
 qQqUl22SBKM7XpuzcB9An+eg9PvorPg738tqw2RxuKQhyEi/0RxspYaCDapTpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RNDtMtni
Subject: Re: [Buildroot] [PATCH] package/comix-cursors: update
 COMIX_CURSORS_SITE
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

On Sat, 24 Aug 2024 10:29:56 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

>  COMIX_CURSORS_VERSION = 0.9.1
> -COMIX_CURSORS_SITE = https://limitland.gitlab.io/comixcursors
> -COMIX_CURSORS_SOURCE = ComixCursors-$(COMIX_CURSORS_VERSION).tar.bz2
> +COMIX_CURSORS_SITE = https://gitlab.com/limitland/comixcursors/-/archive/$(COMIX_CURSORS_VERSION)

I've use the $(gilab,...) helper macro instead, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
