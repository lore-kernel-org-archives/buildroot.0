Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724C6D70DED
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 20:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DC656079C;
	Thu, 28 Nov 2024 20:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IekxDKuXJu3W; Thu, 28 Nov 2024 20:19:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EA03607A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EA03607A4;
	Thu, 28 Nov 2024 20:19:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EC44A6A
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0CA6607A4
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYJa-FXBhqeT for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 20:19:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D3CFC6079C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3CFC6079C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3CFC6079C
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:19:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8764D40006;
 Thu, 28 Nov 2024 20:19:19 +0000 (UTC)
Date: Thu, 28 Nov 2024 21:19:18 +0100
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <20241128211918.1f0e478f@windsurf>
In-Reply-To: <20241128115618.387042-1-fancp2007@gmail.com>
References: <20241128115618.387042-1-fancp2007@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1732825159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=amIQL5dd1uNsh5aeC5srNpwK0DPLdqz1pcWZWYmhLws=;
 b=QJ+F/GB644/63nGPKYx6easnwlk0mCDX5wezPYvimPLcu5hXad2gBjHryU5AyJ4Zs5P6nl
 TEvBMmRrme0IEnW3c/zGwP/8/wp21sK+PdbvZQznBDDNnzwTg2mdM4AEq+vrQuaqjrsuqZ
 V/dDLQeeYnKXC81ewOuVgNowX0s0HarVH072H5ckSa/BYNN8MV2juLZjR0yzJH4m/zB3TC
 YNuGmqApvozMVmrZXm+yOUkbCL7/ikY5JEyUa4OGXycTCFPem85oeOjrHC/rtyyZ3kI6OZ
 ZtHDewq94AZCMj9wzrIKJ5UD1EVvfp9vCTuUyPUq7bJA87bVIZwKWeJ9NFUKFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QJ+F/GB6
Subject: Re: [Buildroot] [PATCH] package/libiec61850: bump to version 1.6.0
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

On Thu, 28 Nov 2024 19:56:15 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> Release notes: https://github.com/mz-automation/libiec61850/blob/v1.6.0/CHANGELOG
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
>  package/libiec61850/libiec61850.hash | 2 +-
>  package/libiec61850/libiec61850.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
