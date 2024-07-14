Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F02AC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAA63405D9;
	Sun, 14 Jul 2024 20:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29Hknlkosc2V; Sun, 14 Jul 2024 20:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8BEA403C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8BEA403C4;
	Sun, 14 Jul 2024 20:30:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2478D1BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1111F403C4
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zg1HBSMZekyy for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:29:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A9054035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A9054035D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A9054035D
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:29:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E321C0003;
 Sun, 14 Jul 2024 20:29:55 +0000 (UTC)
Date: Sun, 14 Jul 2024 22:29:54 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240714222954.663708c0@windsurf>
In-Reply-To: <20240712124956.3925574-5-fiona.klute@gmx.de>
References: <20240712124956.3925574-1-fiona.klute@gmx.de>
 <20240712124956.3925574-5-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720988995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EeEVlRbegnXJhGsj4HwSN5hj17ehgCeHtIU0/A+KxkQ=;
 b=FsXHEgvj1JdQLMfOihM3PN0tjWn+XfmOFg5JJdbTCZSywVfBEw4uyISGuKT1hMobr+ZzyI
 6eAFMsY1b47LEO+1qmDpOB5hDC3ekvDVmaX7vJC/mXckD2S1uefVp3e7YDQ16/H+frPQcw
 3xU9hamsfjGGiy7W1DhcZbSCXJhKgb9z5NU9Es05Us97ICPXibnzWbdukg5tn2jNFNExMy
 Ii5MIdZNPVj6/30S2idOUUyKOhb294M30NyQbOAe7yQ5FgPs9yjBpvcPsYR2GNaBF0GJgD
 FhLVugFyN9IlDImNXYN5Ln2oONP/yW/4xqQc0YlzwqmkefWtH7z9zUJlJjMJrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FsXHEgvj
Subject: Re: [Buildroot] [PATCH v2 4/6] package/openssh: tidy up init script
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Jul 2024 14:49:54 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> * Use long options for start-stop-daemon
> 
> * Avoid --quiet, except for reload where the "stopping" message could
>   be confusing
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>  package/openssh/S50sshd | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

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
