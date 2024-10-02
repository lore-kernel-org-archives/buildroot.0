Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0D1CF8542
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E34741C90;
	Wed,  2 Oct 2024 21:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VNva0REIIRvD; Wed,  2 Oct 2024 21:03:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47ACF43056
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47ACF43056;
	Wed,  2 Oct 2024 21:03:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB0741BF30E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A320A40653
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXYMLM6O9SRq for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:03:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 558DA41167
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 558DA41167
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 558DA41167
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:03:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B8DB240002;
 Wed,  2 Oct 2024 21:03:13 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:03:12 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241002230312.642de13c@windsurf>
In-Reply-To: <20240926215600.203167-1-james.hilliard1@gmail.com>
References: <20240926215600.203167-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727902993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bkZNG6gq9U1h3Gj95h8SBGDvGz/MTW8nKnFhVwXWyLQ=;
 b=Tenb499XuZsKK4a8QcHnxonelGE6EdJCJjlTecFTZ424y+0QrwsJGetTphCueuoIepFyrt
 sCjLPfQg6Md0gw5JYg0T9GsJi9N9oWdZJmx0vF0iQe6H/UMcBWO9SpSFuO6hFPlKkOZUO7
 g9l0gejnWCfi/iDKww19BS10qW27hhamfmITbyznE+DDCT4Vglp/dwrvLuJF6XjF9s4UAe
 FYB+FNUb3VGrOH1DH1p6X/Rj5rygWTPPZ5FUOVGlAzq6Jn+ijCrY0zatRaOfKEKTrYkNJx
 c1X6JEan7+aCh8MZc2iyKlIyZss4Y80z3PW7SlkGfESma0yMjEWWuRnJxmHpPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Tenb499X
Subject: Re: [Buildroot] [PATCH 1/1] package/python-slob: bump to version
 c21d695707db7d2fe4ec7ec27a018bb7b0fcc209
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 26 Sep 2024 15:56:00 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-slob/python-slob.hash | 2 +-
>  package/python-slob/python-slob.mk   | 2 +-
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
