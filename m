Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AB7C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDE6760C01;
	Wed,  8 May 2024 16:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAZIn0WQn6A6; Wed,  8 May 2024 16:32:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFA7060D54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFA7060D54;
	Wed,  8 May 2024 16:32:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AD601BF2B0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CCB14088A
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 070lsOfF1fYY for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:32:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ACD9340882
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACD9340882
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACD9340882
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:32:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D3FB60007;
 Wed,  8 May 2024 16:32:47 +0000 (UTC)
Date: Wed, 8 May 2024 18:32:46 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240508183246.6e6b23da@windsurf>
In-Reply-To: <20240508084918.472419-1-fontaine.fabrice@gmail.com>
References: <20240508084918.472419-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715185967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5fcd0B2gGwTUms5aaYB7UPymqZa//YDW/AoEW/WD5l8=;
 b=YBQQDedC5TuF3rMf+Ouw9XRtYI0flf5dgP/sfYvnvbvTDQhHfJkj2lohc+Z/VAw76GjEGJ
 W/gAjcCHKFholkl6bXO3E8/CQRKxDtiBS+KYsDShJediH7Q2KLpFEKzie2ZFWLM601Eudp
 H/P20eLhLpY9Ndph8t+Q47w39Jg2usjVBBaFDp5d7or1fa2X1RmZrXzBJZrmPjFRzbkIal
 XNawC5hCloLxuJkvXSmCjP0vPw1mAqbU9NmYGvr5Ehpq0cl2WWDUMbca4G6Px3Rnwi0B3k
 KSmNbO8spqBCJTD+/9U7ddzg3UeqroEfGweYXmFBKVs38vnJqAE4ZGRvInbB2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YBQQDedC
Subject: Re: [Buildroot] [PATCH 1/1] package/igt-gpu-tools: disable chamelium
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 May 2024 10:49:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable chamelium to avoid the following build failure if gsl is found
> but not alsa-lib raised since the addition of the package in commit
> d8a729d1731339da141612be33c5e59bc9928748:
> 
> In file included from ../lib/igt_audio.c:35:
> ../lib/igt_audio.h:35:10: fatal error: alsa/asoundlib.h: No such file or directory
>    35 | #include <alsa/asoundlib.h>
>       |          ^~~~~~~~~~~~~~~~~~
> 
> Fixes: d8a729d1731339da141612be33c5e59bc9928748
>  - http://autobuild.buildroot.org/results/a7818af881d9aafa9a36f87dc7c882a6880554e8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/igt-gpu-tools/igt-gpu-tools.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

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
