Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D318EC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A13E781206;
	Wed,  1 May 2024 19:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7o8HF-YWuA2; Wed,  1 May 2024 19:53:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B79C78128A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B79C78128A;
	Wed,  1 May 2024 19:53:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9520C1BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FA1E600CC
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ah7ytSHQPqbr for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:53:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 65226600CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65226600CA
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65226600CA
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:53:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CD8260004;
 Wed,  1 May 2024 19:53:34 +0000 (UTC)
Date: Wed, 1 May 2024 21:53:33 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240501215333.22c0c30e@windsurf>
In-Reply-To: <20240420105230.34710-1-ju.o@free.fr>
References: <20240420105230.34710-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714593214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v+J4dNBpQpL8TcQ5XU9NdWwJ2mOdiQznUqcpNNHYBhI=;
 b=aRBa8UBcGUfoQbdLGiLlsPk9epaEyacyfJGeAeJxUiq513d79/qHrojqsLAvju9IwDQwL2
 3KxD4RZjPU1AZcDK4UHZ484JEtDGIitjfiSKcE1lr16fkkDZ0mrvpx8EJeZBsVODlDNTHz
 DiFyniBclyLJQMPSglMMvSBJi+rkUZtJqA+p6Kewdhq/QIaZMzmrEH3DAiJTmvP5iziuAH
 xLsVHk0JK1nm7xnqkn/MuNS26WQKPjFdQo3mAeq0j4dY18Tvqm6rPyGtCI99OKvGUK5FNR
 yjUseiylsWb0pZjjU/rCbMwh2aG/gT96DTZEC1Z2k5aDi4Zk5fwKOTAl7rVrPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aRBa8UBc
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf: bump to version 2.2.0
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

On Sat, 20 Apr 2024 12:52:30 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For release note, see after the file list at:
> https://sourceforge.net/projects/iperf2/files/
> 
> Note: the md5 file hash is also added, because it is published on
> download page.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/iperf/iperf.hash | 5 +++--
>  package/iperf/iperf.mk   | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)

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
