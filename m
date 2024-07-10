Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68807C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 22:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26F84415CF;
	Wed, 10 Jul 2024 22:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0yoJS7syyVz; Wed, 10 Jul 2024 22:02:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D69BE415FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D69BE415FA;
	Wed, 10 Jul 2024 22:02:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D43CD1BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0E8F415CF
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skSW-xy_Rg8S for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 22:02:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D569341607
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D569341607
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D569341607
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 22:01:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFB9020004;
 Wed, 10 Jul 2024 22:01:56 +0000 (UTC)
Date: Thu, 11 Jul 2024 00:01:55 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240711000155.62e892f3@windsurf>
In-Reply-To: <20240624180519.434061-1-ju.o@free.fr>
References: <20240624180519.434061-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720648917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MGO6+Kk3Y5bQDku+Edl2vrXluoOQ/i3JmeEwlmtTT44=;
 b=cYbqJdWP7pGKRSdPYzlsxLUH17zuXI2s4Di5NbFpTS+h4En8q7JSt4FPXvy9NDCK83FOCv
 UQo9E0AzcjKVHr/n+WJFt1UpUWSyZ3ObfyKKF08uw8adARlsWhl+0NE/oRrNg2b6M3LDOx
 fuAfq5YdE2CvupdsbgfFR9N8dJJMectbzrM0QCKcurTfcBu6H4RVMJtoy4YORfKWbMbe4v
 I99V2m8z+1umfcvTr0Uz8xorAErKu2376aBBU+NboHiluUzdRn8pcNuut+nf63SkJI+OfT
 9Gshm3jP+Nv2zQ5CfrLAzRMBZE6hMKqEchICHl2pbCGFZMcTHcJSTqCBdiX+4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cYbqJdWP
Subject: Re: [Buildroot] [PATCH 1/1] configs/spike_riscv64: remove the no
 longer needed kernel fragment
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

On Mon, 24 Jun 2024 20:05:19 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Buildroot commit [1] updated riscv-isa-sim (Spike), which now includes
> a NS16550 uart emulation. The Kernel config fragment was introduced to
> work with older HTIF interface from Spike.
> 
> For more information about the HTIF/NS16550 in Spike, see the commit
> log [2].
> 
> This commit removes this Kernel config fragment, since it is no longer
> needed.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/853b7661bf5ddca5d4b81964ef1a19a133beac85
> [2] https://gitlab.com/buildroot.org/buildroot/-/commit/38c581b05cd8e7967783410b36c14b9b561acd12
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit 3f464c2 with commands:

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
