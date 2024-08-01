Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6913C3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0F0581EE2;
	Thu,  1 Aug 2024 21:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAJ680u7oe6y; Thu,  1 Aug 2024 21:48:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B36598454F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B36598454F;
	Thu,  1 Aug 2024 21:48:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 315B41BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F73B81E1A
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVo-dIYhW500 for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:48:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FD2884523
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FD2884523
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FD2884523
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:48:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97B6EC0005;
 Thu,  1 Aug 2024 21:48:46 +0000 (UTC)
Date: Thu, 1 Aug 2024 23:48:45 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20240801234845.772a1eb8@windsurf>
In-Reply-To: <20240731110429.245927-1-troglobit@gmail.com>
References: <20240731110429.245927-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722548926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1En30FlsVkRMWqYIRZDQLpb9Jq80BSh91Ua/Fh762o0=;
 b=UZVTXvU4wheL2k74nsybN4n5onaZB46yhyCXDZmvF5AJNUOo4213hM32L5vA2GkJnPOAXk
 LhbCU+StFajO4Rw+SGl6EQ1CV5GkokplSQttp3VN2Hrx4G0nc/Y5hsh4KIamec8XH2m93Y
 oHYzgxTuAj7YCmmjbYkWV3ptYfyR3Hjqu2UEOh56JqeGoyTvWXA5XHPivQ12CGuem6X/Rr
 xgHHXqSO+6S5irgAB6q6Et0LYTieLi8RyjNsVfhSbOV1GYvaMJp0fMW1OZor6fbMm2E4Ay
 9TP5mYZo/jc9jY0gJt4wVz7KSJ4yt/rGZtCGz6J7bbB0fLx3SIwl8FzMnDWZSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UZVTXvU4
Subject: Re: [Buildroot] [PATCH 1/1] package/netcalc: bump to v2.1.7
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

On Wed, 31 Jul 2024 13:04:29 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> Upstream now provides sha256sum for tarball.  License hash updated
> because of copyright year and maintainer surname changes.
> 
> Changes from https://github.com/troglobit/netcalc/releases/tag/v2.1.7:
> 
>  - Allow colorized output over pipes, use -n to disable.
>    This reverts the auto-disable in pipes, introduced in v2.1
>  - Misc. build issues on macOS and *BSD
>  - Various minor GCC 13 and Clang 18 warnings
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/netcalc/netcalc.hash | 10 +++++-----
>  package/netcalc/netcalc.mk   |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
