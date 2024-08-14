Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E749C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 21:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF997608C3;
	Wed, 14 Aug 2024 21:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ft_m8MNNw2Zw; Wed, 14 Aug 2024 21:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9D92608F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9D92608F0;
	Wed, 14 Aug 2024 21:44:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F8E91BF4DB
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CAED40DCE
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNHnYMacyMjU for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 21:44:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E913540DE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E913540DE3
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E913540DE3
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 21:44:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 361FEFF804;
 Wed, 14 Aug 2024 21:44:45 +0000 (UTC)
Date: Wed, 14 Aug 2024 23:44:44 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240814234444.4e7703ca@windsurf>
In-Reply-To: <ZrrlPuFEPebZuTsn@waldemar-brodkorb.de>
References: <ZrrlPuFEPebZuTsn@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723671885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/mF2zYW3yOIeK/fFSiRfM474PXWcHLfVjnpwUwU4H4=;
 b=M0xdNN0bPBqP8d0QCWbUO8nli2ozXSH6VEe8z53k0v+TtRHozNFYgDhUhUEL0nbO2h1f1K
 Dkwd5gEld6ZyHxr1FQR0t4+UofcWNbvT2fMUfGbTwpwy4kuZOeR9l0Zi0UG5GCHT2QriEV
 RbJfao5BWHeixjGodLM0ujxu2L8T5myYkpLC7ntHI2mRXNO+uh5VoT58IBsg0ZIkhOpcac
 hRD0uon1A6qDh+hupjPkIrGP/b2o0It3TH03tViT2p8mSOTg85YEbWLkGCDbzteOKdyq1c
 KnwjM+8ekib3fzA0nQ6oRdE7oBLixvoxJnJ+exMYqi903wdf006He2YTJSmNNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M0xdNN0b
Subject: Re: [Buildroot] [PATCH v2] package/unbound: add missing unbound user
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

On Tue, 13 Aug 2024 06:46:54 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Without the unbound user the daemon does not start on bootup.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2:
>  - split patches, missing user goes to master, suggested by Thomas P.
> ---
>  package/unbound/unbound.mk | 4 ++++
>  1 file changed, 4 insertions(+)

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
