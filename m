Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F86CEE34F
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 21:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A512781351;
	Wed,  9 Oct 2024 21:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xeCYFNS8dGxB; Wed,  9 Oct 2024 21:26:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1AB881371
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1AB881371;
	Wed,  9 Oct 2024 21:26:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED3E61BF3D4
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 21:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBAAD407E4
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 21:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnHIT9EcYPwc for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 21:26:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 67C69407E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67C69407E2
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67C69407E2
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 21:26:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69A00FF802;
 Wed,  9 Oct 2024 21:26:36 +0000 (UTC)
Date: Wed, 9 Oct 2024 23:26:35 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20241009232635.5d812022@windsurf>
In-Reply-To: <20241009041852.75988-1-christian@aperture.us>
References: <20241009041852.75988-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728509196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HHf9TWvMDSlKnG0WAKRuWZNXVi1fK+5Oc3Hoy2r7oqs=;
 b=eGdOf04lJIDSsTIHuWGBYgmWGyrf0JXE5LxQcUAlC2FzYF+23azeS0y9OTusHIzAyywe4q
 zqh9HHWa8hAM932AJsnE/ZIb8mmpdcGTwGnZh6cyS54Ymb4fVYc/Qr+3OdyDc/lc5V8yN3
 k095oncL1f1nx43/JAC12uWUYHYvrOUMdhmIWdcKRv5Lu7q5qXG23yIWKbk/8Lf4wDjqOY
 k5Wb64u0JaGEvQ0rwbiZlWvECCumGibvXMmPnXGDPwZiyjv+faaLz+4S6jjMyjy3vwvMDa
 zfBAHfdMLKg9KnbwdjG+CJbGYnpjTN7cbciuO0J6siO98sL8JuxM5yYaiuaGvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eGdOf04l
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: bump version to go1.22.8
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  8 Oct 2024 21:18:52 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> go1.22.8 (released 2024-10-01) includes fixes to cgo, maps, and syscall.
> 
> https://go.dev/doc/devel/release#go1.22.8
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/go/go-bin/go-bin.hash | 14 +++++++-------
>  package/go/go-src/go-src.hash |  2 +-
>  package/go/go.mk              |  2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)

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
