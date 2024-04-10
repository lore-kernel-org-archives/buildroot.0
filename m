Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D07CCD1284
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F17EE60A7F;
	Wed, 10 Apr 2024 21:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1huTv2k1FzEn; Wed, 10 Apr 2024 21:46:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EA9B60EA9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EA9B60EA9;
	Wed, 10 Apr 2024 21:46:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D9F41BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B3D04036A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLmccj6YTDvD for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:46:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F02F040359
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F02F040359
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F02F040359
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:45:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 256F3FF802;
 Wed, 10 Apr 2024 21:45:57 +0000 (UTC)
Date: Wed, 10 Apr 2024 23:45:56 +0200
To: Saeed Kazemi <kazemi.ms@gmail.com>
Message-ID: <20240410234556.438f627d@windsurf>
In-Reply-To: <20240326190538.3708590-1-kazemi.ms@gmail.com>
References: <20240326190538.3708590-1-kazemi.ms@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712785557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yI0Yy7rsfabTc8Yd3/kLciVktG+nJn2oEgNN4aVVEIA=;
 b=YJExonZfTQ0fLFK7b5LIQ3Cwxps1xcWyq9Sx27Lzltkrfe8jjKB5sdI8pCGwkohsYiqy4m
 omIDh1OZo3oQK2vFq3gHYfhXQ7qSEfTzh0PZ4TRa9huxsOt6z6Gdv8MFR2tm/2G1idJz+X
 IpB4BYAK6xowctcWbaq+xscnSGiVWHzhIntM/8VoGftKncOrskiP2QcVtbgPRC6sPIOMwV
 KxmHZF7br/HygA2JVegV3EhYT6l9hYAAJ9p1EHNCFIQMZ7hZpTfup93t3zM4mj1vqGFu05
 R7Pq7JTIdr61D5ufU7ZYMNw4wM18ySBDzE2osfmVO2XvwFsCxgTo2yyu8nTgIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YJExonZf
Subject: Re: [Buildroot] [PATCH 1/1] package/procs: bump to version 0.14.5
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

On Tue, 26 Mar 2024 20:05:38 +0100
Saeed Kazemi <kazemi.ms@gmail.com> wrote:

> Release notes:
> https://github.com/dalance/procs/releases/tag/v0.14.5
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
> ---
>  package/procs/procs.hash | 2 +-
>  package/procs/procs.mk   | 2 +-
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
