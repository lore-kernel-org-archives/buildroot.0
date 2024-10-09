Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E811CEE350
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 21:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DE0E813A2;
	Wed,  9 Oct 2024 21:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 47-IszRMAJHd; Wed,  9 Oct 2024 21:27:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3253A8136A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3253A8136A;
	Wed,  9 Oct 2024 21:27:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 606371BF3D4
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 21:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 490FE81370
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 21:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKwAj23hf6zL for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 21:27:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1548C8136A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1548C8136A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1548C8136A
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 21:27:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EFF4540005;
 Wed,  9 Oct 2024 21:27:42 +0000 (UTC)
Date: Wed, 9 Oct 2024 23:27:41 +0200
To: Bagas Sanjaya <bagasdotme@gmail.com>
Message-ID: <20241009232741.0f46d311@windsurf>
In-Reply-To: <20241009043001.925924-2-bagasdotme@gmail.com>
References: <20241009043001.925924-2-bagasdotme@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728509263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TeR/5OqyZrKOgL9bmb3vbpanTaJ/e+zqyuUyOsUBVJA=;
 b=RwIDEKoBe665eu5KETsFBkI9NZPWJSBYFq1QXGuukC1EsZcKZ0RMEBMKu2a4d0KdxDKdTV
 xJmPVH7bldUOa8xJRRwDeY0O/OOtOtbc+hwxJmm4+3hbVrzleE7CsnlR7SSbb2Rg5ESQaU
 vKztcF1Hj52V3YUgRvs6r93D2216IanJS2U5uzeS5/QCxz75vLlL3taGJUjlsX2H8AZWqg
 oNeowQR7lAyXMW0/Ln6BMqMoG798RfsUv2tNb//y5Rd942PfCgw0kpJXBiiANpLAtlpiNS
 W7f6CGoKwYLJ60Pd6bz+WLui6P446fmYuoz1B6pNfbyTSP7orCIEfOw2qboueA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RwIDEKoB
Subject: Re: [Buildroot] [PATCH] package/git: bump to version 2.47.0
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
Cc: Buildroot Development <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  9 Oct 2024 11:30:02 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> Bump the package version to v2.47.0.
> 
> Release announcement and notes:
> https://lore.kernel.org/git/xmqqa5fg9bsz.fsf@gitster.g/
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  package/git/git.hash | 2 +-
>  package/git/git.mk   | 2 +-
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
