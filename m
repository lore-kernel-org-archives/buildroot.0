Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80279C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 10:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 482F280AFC;
	Mon, 19 Aug 2024 10:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNsuuUd6n20B; Mon, 19 Aug 2024 10:53:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E04C80F33
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E04C80F33;
	Mon, 19 Aug 2024 10:53:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85C3C1BF39D
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 10:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7593F80AFC
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 10:53:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5abxvJjOsow for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 10:53:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5617F80F3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5617F80F3A
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5617F80F3A
 for <buildroot@busybox.net>; Mon, 19 Aug 2024 10:53:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41978C0002;
 Mon, 19 Aug 2024 10:53:32 +0000 (UTC)
Date: Mon, 19 Aug 2024 12:53:31 +0200
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20240819125331.61f14eac@windsurf>
In-Reply-To: <20240819071158.1425-1-mf@go-sys.de>
References: <20240819071158.1425-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724064812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QbXOhS0aYJGColvnvJL7zgdFxZ2K0DfWBblFe86h9XA=;
 b=Sjbi/hvjFQyZT2RNUK1ee+HzldflovJRrnsE6juoxbCL6j2bgPciJ+k8062F0vswL6IUvF
 V4bxpz+TCjU6E1Z3YYzC+lk5yJqvt97PJ019/iZGMfPwAgTINnpUXKY0MTLOCOLNhtSJeT
 L655sPennfmF1tbG+3UGRC55eUqON4sWwblKRVqMzMhSZtUDQjytSDLSh8W7bWim+ULKFH
 T+jmzzq+C1rVjuhb+aIKH54cHgDjwhk1HKoPdKaROIxt+HVSG9b7QSm9QNkmi5keg7AokG
 hUYW/Wa3MjXu1DuuhT3dItquiiYINYD8PjASkwHjti6mKWPcDTwaxURC4RiVYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Sjbi/hvj
Subject: Re: [Buildroot] [PATCH] package/sdl2: bump version to 2.30.6
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 19 Aug 2024 09:11:58 +0200
Michael Fischer <mf@go-sys.de> wrote:

> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/sdl2/sdl2.hash | 4 ++--
>  package/sdl2/sdl2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
