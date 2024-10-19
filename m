Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA58D3C926
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 17:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB24680C45;
	Sat, 19 Oct 2024 17:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTVYLE-D35Z0; Sat, 19 Oct 2024 17:55:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D911180CFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D911180CFC;
	Sat, 19 Oct 2024 17:55:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DBDD27D7
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 17:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6022680CFF
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 17:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zg0NGSRZF5IH for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 17:55:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A42A80C45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A42A80C45
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A42A80C45
 for <buildroot@busybox.net>; Sat, 19 Oct 2024 17:55:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD1421C0007;
 Sat, 19 Oct 2024 17:55:25 +0000 (UTC)
Date: Sat, 19 Oct 2024 19:55:24 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
Message-ID: <20241019195524.6db225c7@windsurf>
In-Reply-To: <20241019081504.289566-1-francois.perrad@gadz.org>
References: <20241019081504.289566-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729360526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zY6+VwzrN4nwE4j7S+Ei9PuKyENO5vzV5pKqZzq76A8=;
 b=OEvv630q9CXKuMzjpTramLYtP4TUWSnL7kmfPNdO4lgp8ta0bd+7X3xLC1AmMG2bMhRUzt
 H559UCPy++FE4m1UCrcROn+gxgVbqh6e2IWZYndcajKLDCwbQ7uGdI00ZYx0BVLVfLhCHE
 jMIXy6GswAR2SancTXj26BQFvjR+hXfQevJcVgEGblDjupW36w1t8u5NOYKFOEOusRyj89
 hNSUjDS/pBJvfqD/WYcgzYGT0eaxkxFsBolr3aLX1w8ClA0evNSwQ3b84VrC0tx3F6pMqT
 rxt/TF1Rf04AU/rrmIYaIlXLvEuZlxv/moa+ctmLEMSabKoV3chSRGF/lhs+2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OEvv630q
Subject: Re: [Buildroot] [PATCH] package/luajit: bump to version
 97813fb924edf822455f91a5fbbdfdb349e5984f
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

On Sat, 19 Oct 2024 10:15:03 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luajit/0002-install-inc.patch | 2 +-
>  package/luajit/luajit.hash            | 2 +-
>  package/luajit/luajit.mk              | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

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
