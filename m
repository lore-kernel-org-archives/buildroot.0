Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711C6CF34C1
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 20:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17D9C606A5;
	Thu,  3 Oct 2024 20:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wh_RsV1MmaTx; Thu,  3 Oct 2024 20:06:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19F9C60787
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19F9C60787;
	Thu,  3 Oct 2024 20:06:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E14BA1BF41D
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCE0060787
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZJXMi-NBJNP for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 20:06:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A0D33606A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0D33606A5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0D33606A5
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 20:06:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFA091C0003;
 Thu,  3 Oct 2024 20:06:09 +0000 (UTC)
Date: Thu, 3 Oct 2024 22:06:08 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241003220608.4d106029@windsurf>
In-Reply-To: <20241003165926.849456-1-james.hilliard1@gmail.com>
References: <20241003165926.849456-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727985970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QEtZyqPK/r4vzSWboCKknzMaBrTtKnBRIaMx51ztLVo=;
 b=es7xD9UWzs7ZgmX1eVjn+arnPULN8Jla5vo0I7bkuNHimzz7+Siz0jz/g3zUYl+QB18Rca
 vZxr+5J6eZyS2vq1T9w306BIyLPnb5igK7VelIGP59G+NyewwA6+CINT9pIDOlYCSbPi30
 TO2oBISlTZ+HyF6iVpZJXALF7jLB7XUIx5j1zDyWQ18QeqE7qpO1TxQxKdQoiia4Q/vOSq
 auiSWufCPlrqZYXtXq6AhYmyXkQ7exgnl48DAKY1vqqUElHo6EHVsF7rLAt4YZHsy/OJsx
 FiUcZGnnMRBMphfzYlD8xVbwd3mvsprdQ5hMV2jiOaz38Pr1XhDmdpRLrNuKvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=es7xD9UW
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: enable asha when
 building audio plugins
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
Cc: Marcin Bis <marcin@bis.org.pl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Thu,  3 Oct 2024 10:59:26 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Symbols from the asha plugin are required when building a2dp
> support as part of the audio plugins, so always enable asha
> when audio plugins are selected.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/5a3/5a306356f5f190a14a0a2294a4428544b1a018bb
>  - http://autobuild.buildroot.net/results/353/3539c83deaa45a3548bcd488659148c62af3fc73
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Could you please indicate since when this problem is occurring. It
seems to be appearing since the recent bump, but is it really the case?

A bug fix submitted to Buildroot should *always* carry an explanation
of since when the problem started occurring.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
