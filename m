Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6B6D6B6DF
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 12:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3CD080C65;
	Thu, 31 Oct 2024 12:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYt6p3JZOYFH; Thu, 31 Oct 2024 12:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DA078156D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DA078156D;
	Thu, 31 Oct 2024 12:49:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ED16494E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDD2D60AE4
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWjLl2aWkdf9 for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 12:49:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB1D960A8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB1D960A8C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB1D960A8C
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:49:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAA981C0009;
 Thu, 31 Oct 2024 12:49:34 +0000 (UTC)
Date: Thu, 31 Oct 2024 13:49:33 +0100
To: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>, Alistair Francis
 <alistair@alistair23.me>
Message-ID: <20241031134933.074f0195@windsurf>
In-Reply-To: <20241030234636.1990180-2-wilfred.mallawa@wdc.com>
References: <20241030234636.1990180-2-wilfred.mallawa@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730378975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K4xCG4795I4uwDqyVT2bjM/rOl2uts4cEGHB4Eu+/T4=;
 b=jTqzhtrB9EE2AgyFK2vVffwKcEuw1B2y00P5fp+OJs6HMv+134Hb9r2dGshSz/DOQdevaR
 guEYVD8/9tmsWxhK57HoH2s9rI98dI0x068VSv/juZ1+yuQW/p3qmH6ORefc0LZ2SBLZqo
 dJsBQJRN8KrFAzUNxqDcHUC8IDRcJ1bVWFPbac/V1c0IphhbXFjznM/fACILq+Tz9YpADg
 i7YuAkQn8JBmfHFc3WHw18nVRA70Pnjf6kSp8NZUg9ePPE5nwMlJ2iR7RsoIqdmbJFNghi
 whjc0GFIQWHSRn88JW1bDXOTU6ZtAwodIRSaxt8JGrxqnGc2HOwNYmtk99Gsaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jTqzhtrB
Subject: Re: [Buildroot] [PATCH 1/1] package/libspdm: bump version to 3.5.0
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

On Thu, 31 Oct 2024 09:46:37 +1000
Wilfred Mallawa via buildroot <buildroot@buildroot.org> wrote:

> Bumps to the latest `libspdm 3.5.0` release, this release introduces the
> optional SPDM 1.3 `GET/SET_KEY_PAIR` support. Which requires an integrator
> to support additional functionality implemented at link time. Leave this
> disabled by default as it is optional and so that it does not break build
> compatibility with integrators.
> 
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
>  package/libspdm/libspdm.hash | 2 +-
>  package/libspdm/libspdm.mk   | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)

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
