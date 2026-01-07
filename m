Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CB7CFD637
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79A7882237;
	Wed,  7 Jan 2026 14:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TK0bWGUO23w0; Wed,  7 Jan 2026 14:09:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26DD482016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767794982;
	bh=S8S2tjHZworpWV05szqzSh0HaUMFHIEClOQNc5Un6xY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BOwjeHTgaQF84Yqfbu42tD6ofPeflYafO/cf2gqUl2JkbfeSW0lO5yv66B/nfH7hH
	 NkDNA5DiyikMR3GaKsO+UAOJLOmlcHFBOoshullkmWXthKotBIzLIrmyFgwSXhSufz
	 mZRmUg9/SuFT1R4eLIRW9/GOx/z23VCY96KJblxAvyfEgoIv1qQ7SuDMxru5+kXmg3
	 XLYTF+whiXudNCswx5ufbzUQanO+8XrgWGoIH9bt+41LU75L6lEBs9Y6v63sg8VCOY
	 TZuTVOWnEloqQvojoLFk+Jko5+VzCTTenyk+SJcX5xKy2NLnaA3CQ3xwFiE7cTb9e6
	 XbQc05L7BQi9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26DD482016;
	Wed,  7 Jan 2026 14:09:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9A2BA3E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABD994007C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wy2XfkRt0k1 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:09:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 96321400A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96321400A5
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96321400A5
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 72FA3C1EC90;
 Wed,  7 Jan 2026 14:09:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9115A606F8;
 Wed,  7 Jan 2026 14:09:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8612F103C8748; Wed,  7 Jan 2026 15:09:32 +0100 (CET)
Date: Wed, 7 Jan 2026 15:09:31 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Cc: Neal Frager <neal.frager@amd.com>, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com,
 brandon.maier@collins.com, ju.o@free.fr, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Message-ID: <20260107150931.735d1b69@windsurf>
In-Reply-To: <20260107082446.3326062-1-neal.frager@amd.com>
References: <20260107082446.3326062-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767794975; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ABJu1KUCDRTWTWnzZgSQGnhwVqjFn6RBd4M9oWt4g5I=;
 b=URratzjG9De9+YOPPKSmDIRu62vobv24J7MWO5Cot5kgqMwfUb+tQ6TeHKQgUK7174LF+/
 GgJITQ+abcC7ByZZrLpzYj3ttAkLwKRTG2i38ozty5pX5hljxYFCL/lHpdGs6Z7qI0I1wo
 BBwzHpewnUmhOirhs6u0FFkgQGNck2KVxnZ/5c6LWuFS6piBkeIlmrbeIF0ogEKUguSwb8
 nAXeXgv+Nvz83RIbWcOHLgf1YwjE/5Pwxf3hGahOX+MCdw0i5B9/lOqV5ZPUe0t1fwQvAw
 +8hRmF+sqI2sumHvox8HD7FZjFbrHiAtORn8UaB2beK/uqCcfGNncYEq2BnoRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=URratzjG
Subject: Re: [Buildroot] [PATCH v1 1/1] package/binutils-bare-metal: bump to
 binutils 2.45.1
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

On Wed, 7 Jan 2026 08:24:46 +0000
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> Bump the binutils-bare-metal package to version 2.45.1.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  package/binutils-bare-metal/binutils-bare-metal.hash | 2 +-
>  package/binutils-bare-metal/binutils-bare-metal.mk   | 2 +-
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
