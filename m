Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24AFD74958
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 12:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC73080BFC;
	Thu, 31 Oct 2024 12:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8f6gxeuFFCcM; Thu, 31 Oct 2024 12:50:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B06CF80C65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B06CF80C65;
	Thu, 31 Oct 2024 12:50:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B62935E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2F8440838
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LB6tjnP3Et9t for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 12:50:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1CB20405BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CB20405BD
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CB20405BD
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:50:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBAEC40005;
 Thu, 31 Oct 2024 12:50:03 +0000 (UTC)
Date: Thu, 31 Oct 2024 13:50:02 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
Message-ID: <20241031135002.07b3b4ec@windsurf>
In-Reply-To: <20241031084852.634238-1-dario.binacchi@amarulasolutions.com>
References: <20241031084852.634238-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730379004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyIQ8WA+VK5KCEsUL16skXEIsvXu1sxNvBwVhtCtz0Y=;
 b=XxHbY3BWSS1Ypmyu91ooCA4OuHEIyMCPFhEcu4UlwidEjSIcPi973iGgXfmA+BSMi+WHo2
 M41IfrWZtlduLYFFbfVgmU6RNBoitvGVCwU7aqbIwGi+3qazhnVxt1Eh3s+YBoCdHBn6aw
 oEuc0RwFsnoEncO91P68+SWiSm34oonUvGCJ/vqwtnbpSl5cgk+3NxCRXG/dioz2TdyTTL
 elzf1Xnjq12gynEGJkOXDKzMwZw7gam99KZ0Rj0swZFa/5bmZY9HojN3L7pSQMRD2MmItR
 iU6mLwg4u3dzI+yIV4kehsQqpL8OWHD5ng62+71pNtBQrupQIZe+4xvSTt375A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XxHbY3BW
Subject: Re: [Buildroot] [PATCH 1/1] package/bsdiff: drop package
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

On Thu, 31 Oct 2024 09:48:40 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> As advocated by Thomas Petazzoni [1], drop bsdiff as it is not maintained
> anymore.
> 
> Meanwhile, autobuild also detected that the package was no longer
> downloadable from the URL, and indeed, Colin Percival, the maintainer,
> confirmed that he intentionally disabled the package download due to the
> presence of some security bugs that he doesn't have time to fix.
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/patch/20241004215451.1198861-2-dario.binacchi@amarulasolutions.com/
> 
> Fixes:
> - http://autobuild.buildroot.org/results/21bb827d3dbf553c79f49d7c184099c75df3d45d
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .checkpackageignore                           |  1 -
>  Config.in.legacy                              |  7 +++++
>  package/Config.in                             |  1 -
>  .../0001-Add-missing-header-for-u_char.patch  | 17 ------------
>  package/bsdiff/Config.in                      |  8 ------
>  package/bsdiff/bsdiff.hash                    |  4 ---
>  package/bsdiff/bsdiff.mk                      | 26 -------------------
>  7 files changed, 7 insertions(+), 57 deletions(-)
>  delete mode 100644 package/bsdiff/0001-Add-missing-header-for-u_char.patch
>  delete mode 100644 package/bsdiff/Config.in
>  delete mode 100644 package/bsdiff/bsdiff.hash
>  delete mode 100644 package/bsdiff/bsdiff.mk

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
