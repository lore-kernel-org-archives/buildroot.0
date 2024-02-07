Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9890C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 14:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7461983AA4;
	Wed,  7 Feb 2024 14:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uqZMvYiuaemE; Wed,  7 Feb 2024 14:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C9B483AAC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C9B483AAC;
	Wed,  7 Feb 2024 14:57:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59AF41BF276
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4718E613C6
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a5bawR6xSnvH for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 14:57:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 43A9C60EEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43A9C60EEF
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43A9C60EEF
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 14:57:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F9C91BF204;
 Wed,  7 Feb 2024 14:57:43 +0000 (UTC)
Date: Wed, 7 Feb 2024 15:57:42 +0100
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240207155742.1d6e70a2@windsurf>
In-Reply-To: <20240207092111.236577-1-romain.naour@smile.fr>
References: <20240207092111.236577-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707317863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lcapzkOnoOuvn5oK35BePVxPamAJrJM73nWn89nliOM=;
 b=R6KBcGzOSlAyaSdm78gRhGSBbmC4WIDi3xGziC62O7+tO8Su4MdMb3KU/2/0OCBSRFxE3p
 H7//vSKDHrDNQnGiut66f0/jf9mEF7gpUPowXy6+qGeuD3ud8Qm6K7uHktnYTsaw4AZkn/
 welMOCEzYt66/YSkAyPFgmB/fY56b3wAthCRqNlWABaPzoVzPBqYucfStgwLg0rDw52/fN
 h6CoDsW4WtTaAC+jyMc4hHF6i7R0Yv03UDvGuAv1SKKr8/Fo2Ws0QKNNUNk5DKfUNDdqGf
 iWDgwWgVDUYdJwgW9WpIEfRHbawP8UCEHETOBFbRxni12m1z32K7A3UcOmKB0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R6KBcGzO
Subject: Re: [Buildroot] [PATCH 1/2] configs/ti_am64x_sk_defconfig:
 explicitly set the kernel version
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

On Wed,  7 Feb 2024 10:21:10 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> Commit 6b2329bb80 ("configs/ti_am64x_sk: new defconfig") forgot to
> specify the Linux kernel version, so do that now.
> 
> When the defconfig was added, the default version was 6.4.x, so use
> version 6.4.16.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  configs/ti_am64x_sk_defconfig | 3 +++
>  1 file changed, 3 insertions(+)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
