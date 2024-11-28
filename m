Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D579D70DED
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 20:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 637CF40761;
	Thu, 28 Nov 2024 20:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TsOji1ANO4ei; Thu, 28 Nov 2024 20:20:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3729B40756
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3729B40756;
	Thu, 28 Nov 2024 20:20:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B928D712
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9926A40751
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dF-QkNC-sIDg for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 20:20:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6C77340728
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C77340728
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C77340728
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:20:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D50AE0007;
 Thu, 28 Nov 2024 20:20:22 +0000 (UTC)
Date: Thu, 28 Nov 2024 21:20:20 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Bogdan Radulescu <bogdan@nimblex.net>
Message-ID: <20241128212020.1c423bbd@windsurf>
In-Reply-To: <20241124220912.2773290-1-ju.o@free.fr>
References: <20241124220912.2773290-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1732825222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7/QP6BnICOPUqInptTogC2s4ahWw1xfRjUNduNaDuA=;
 b=dspMcscLFGX/rh9UPfK9jE9KomLdsSMLQTfEqnJOHxMsozUNW8cbYOrr8oGhcThdWvUNHK
 ubbSHwLR5hi6Wc2eIE02BFsk5lcudTH9qDlncjN5/Cqgx5MFwWGcREtZUGD51cs07nhGhD
 maN2VR7hpFy1bTpePEnMufak210ASSVu6MGxFaBsMG0mzeUDchehBN82dLPQQ2wYOxoq2N
 qHQuivJfAvEdRXSGUnQ3AE5gV8Mr7zPWBSM7MkYvx92rDLwbcKf6n4TBeex+/WFUKbvx25
 uJeIr6H7f8aIgiHthZwp9irS2IuTnqDZuETg/U0pXB3dkpF1jamC30Wr1s5Lnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dspMcscL
Subject: Re: [Buildroot] [PATCH next 1/1] package/ncdu: bump to version 1.21
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

On Sun, 24 Nov 2024 23:09:12 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 1.20, see:
> https://dev.yorhel.nl/ncdu/changes
> 
> This commit also update the _SITE URL to use https.
> 
> The autoconf configure script of this new version (generated with
> autoconf 2.72) now requires pkg-config. Therefore, this commit also
> adds host-pkgconf in _DEPENDENCIES.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8457342890
> https://gitlab.com/jolivain/buildroot/-/pipelines/1558320155
> ---
>  package/ncdu/ncdu.hash | 8 ++++----
>  package/ncdu/ncdu.mk   | 6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
