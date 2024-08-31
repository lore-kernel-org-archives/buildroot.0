Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30159CD13DD
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 16:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFEB380DE2;
	Sat, 31 Aug 2024 16:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TP9GalC_w2Z6; Sat, 31 Aug 2024 16:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBA6A80E93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBA6A80E93;
	Sat, 31 Aug 2024 16:25:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE5941BF2C3
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B977580DE2
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrFeGjct6v_T for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 16:25:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 826F980D0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 826F980D0C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 826F980D0C
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 16:25:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D5DAFF803;
 Sat, 31 Aug 2024 16:25:46 +0000 (UTC)
Date: Sat, 31 Aug 2024 18:25:45 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240831182545.6d9897ab@windsurf>
In-Reply-To: <20240831145450.3162934-1-dario.binacchi@amarulasolutions.com>
References: <20240831145450.3162934-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725121546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vj6ncK6y9oF/1SIYcYK0hnLR+POf8ePw5HYcCCPIUUM=;
 b=epqYFyjunXuMv+vYN0M6ifOwPKqZuECWBEUzQouE/w+/v411HvJl5+a92cNmERV/Y7t9Xw
 EhfoNmoOqBDuB1ge49bp2Ma8uTjpdO2dKX+Np3U196660Y+ZPBA5/ksj4uj9Ah1XqqMESg
 vnrLoMZnRggOIoBDkh3UUMz+bxOxZSKziGGz67SmczNZKWqmtrsz5mwxh6vAHAlYeCjuzQ
 X/Ujs4ghP4+hC5VO+cXO3A1nyX6JvaFomRIkDSOkZE/Kd3l0pxDjyK4E/s+ndbhhy9WIOU
 FU5LpE19vNGuEkutw+jT1XDjWVvcNasitmsBSej025zY8orruEwqI/dicX/upg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=epqYFyju
Subject: Re: [Buildroot] [PATCH v2 1/2] package/babeld: update URL site
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 31 Aug 2024 16:54:49 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> As reported in [1], version 1.9.2 has been moved to another archive, and
> it is recommended to use https://github.com/jech/babeld as the official
> repository.
> 
> It was also necessary to change the sha of the downloaded tar.gz.
> 
> Fixes:
> - http://autobuild.buildroot.org/results/2447060c86acf1bd8d6ee0bcf8f9b6adcdfc50c9
> 
> [1] https://alioth-lists.debian.net/pipermail/babel-users/2024-August/004187.html
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> Changes v1 -> v2:
>   - Don't bump to 1.10.0 but update the URL site.
> 
>  package/babeld/babeld.hash | 2 +-
>  package/babeld/babeld.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/babeld/babeld.hash b/package/babeld/babeld.hash
> index 2e0513efa010..e725b1fe310c 100644
> --- a/package/babeld/babeld.hash
> +++ b/package/babeld/babeld.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  154f00e0a8bf35d6ea9028886c3dc5c3c342dd1a367df55ef29a547b75867f07  babeld-1.9.2.tar.gz
> +sha256  c8c8c3698afb00caa5a5c9bbbb0a22b56d79ad3f9775382915ba979ac88c4e8f  babeld-1.9.2.tar.gz
>  sha256  b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
> diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
> index 785fa2bce9f1..67d66da24f17 100644
> --- a/package/babeld/babeld.mk
> +++ b/package/babeld/babeld.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  BABELD_VERSION = 1.9.2
> -BABELD_SITE = http://www.pps.univ-paris-diderot.fr/~jch/software/files
> +BABELD_SITE = $(call github,jech,babeld,refs/tags)

This looks odd. Isn't the version needed somewhere?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
