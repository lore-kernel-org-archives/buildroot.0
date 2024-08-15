Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED893C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 12:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFB4F40711;
	Thu, 15 Aug 2024 12:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4E2S5Mm7kMD; Thu, 15 Aug 2024 12:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A9344083F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A9344083F;
	Thu, 15 Aug 2024 12:54:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0224D1BF574
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E38B34083F
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLP7VxxPzf4t for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 12:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1B8F40711
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1B8F40711
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1B8F40711
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 12:53:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7AAB20002;
 Thu, 15 Aug 2024 12:53:56 +0000 (UTC)
Date: Thu, 15 Aug 2024 14:53:55 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240815145355.718e6265@windsurf>
In-Reply-To: <20240731181334.3717996-1-fiona.klute@gmx.de>
References: <20240731181334.3717996-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723726437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jwc/8DVnq4Lu1P7LGSMrB1HI0Md/oRbqHm1oZ3TsxOM=;
 b=i903yzDuZHkVQ1hXnKNyRYmJOZso6Rov4QfiW+KfXLCKlDLefysoA11M+w4BiSGZl3rknd
 6Z1u1I3LO+9e1c1OT4eVgg+OZ5P4154ZQpo0R+T45r9hwzfEpyRyu7EEeYtAiYcqER9biW
 2ImkdCccD3xaYEeHZy3xydhlGf7Qn4ac1ZceHZDkCTeZKzW79kNupDiOT58a2KfTCatG9d
 v9dVR2q7T8cSuH1WKy99VRCJGRUO7v4PAoobvYlM6OAzEODrVoS6hcS85DtHwlG066Q8tF
 kF5P+XE3CgKrEE7/sI/phnVfHfUTCo9t0GETNMVleCGqvaNVVtxW3ycg6TCFlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i903yzDu
Subject: Re: [Buildroot] [PATCH v2 1/2] package/docker-engine: rewrite
 dockerd init script
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
Cc: Fiona Klute <fiona.klute@gmx.de>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 31 Jul 2024 20:13:33 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> This brings the dockerd init script in line with the standard
> Buildroot init script pattern.
> 
> Reload using SIGHUP is also supported now, note that the Docker
> documentation cautions that not all parameters can be changed at
> runtime (without a full restart).
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> Changes v1 -> v2:
> * drop wait loop for startup

Thanks, both patches applied to the next branch!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
