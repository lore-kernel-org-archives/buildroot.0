Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D2CCF8542
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F28B141411;
	Wed,  2 Oct 2024 21:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBWOH0I7-Mbv; Wed,  2 Oct 2024 21:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A469F4140A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A469F4140A;
	Wed,  2 Oct 2024 21:41:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F14D1BF97E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D8F24140A
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kavDeBUTRiHI for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:41:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E22141405
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E22141405
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E22141405
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:41:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB18BFF803;
 Wed,  2 Oct 2024 21:40:59 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:40:59 +0200
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <20241002234059.73b433f3@windsurf>
In-Reply-To: <20240922165153.3086149-1-nemaakhilesh@gmail.com>
References: <20240922165153.3086149-1-nemaakhilesh@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727905259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pVVeEQDQy7B2uXa4pi+a2fuobdZCD49W8o847Jc8sP8=;
 b=g73pqr1AzvnNduIf0OtNNlnkWnuK9NOC3VeizjppsV0ZiiL0j4G63DXDxOTup1zeXlff+a
 PVLI/p1cTtDMb7ebJUAK9gwM+1V0F/wZtT1wnLF8auanYqZEWuU0fStXZQ99fafw2ZelDZ
 0V4Qbrkqox84Ghxbh2a70ct7MWIJxrPE42k2IElGBrajipMgto3r13RB8K/stzvtzSy4mi
 fm2oAgzmqxltgBW4uPUDFZ7TgYBmNpswCo9yKv6h0WFqinRc2zAuu2QPB7MbcPk782isZ2
 nWEnmo9C0fdpb7+Pfymgrao5EY9ennNLJ2jGiuB9voEAIeUQ2rMOpwEw4fqN3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g73pqr1A
Subject: Re: [Buildroot] [PATCH 1/1] package/tcl: bump version to 8.6.15
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

On Sun, 22 Sep 2024 09:51:53 -0700
Akhilesh Nema <nemaakhilesh@gmail.com> wrote:

> Release announcement (with changelog) - https://sourceforge.net/p/tcl/mailman/message/58817026/
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
>  package/tcl/tcl.hash | 2 +-
>  package/tcl/tcl.mk   | 2 +-
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
